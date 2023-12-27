import sys
import time
import json
import logging
from dataclasses import dataclass

import factorio_rcon
import paho.mqtt.client as mqtt
import dotenv

ip = "127.0.0.1"
port = 25566
password = "rconProd"

@dataclass
class Config():
    rcon_server = "127.0.0.1"
    rcon_port = 25566
    rcon_password = ""
    mqtt_server: str = ""
    mqtt_port: int = 1883
    mqtt_user: str = ""
    mqtt_pass: str = ""
    qos: int = 0
    
    def __init__(self) -> None:
        self.rcon_ip = os.getenv("RCON_SERVER", self.rcon_server)
        self.rcon_port = int(os.getenv("RCON_PORT", self.rcon_port))
        self.rcon_password = os.getenv("RCON_USER", self.rcon_password)
        self.mqtt_server = os.getenv("MQTT_SERVER", self.mqtt_server)
        self.mqtt_port = int(os.getenv("MQTT_PORT", self.mqtt_port))
        self.mqtt_user = os.getenv("MQTT_USER", self.mqtt_user)
        self.mqtt_pass = os.getenv("MQTT_PASS", self.mqtt_pass)
    
def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))


def main():
    config = Config()
    
    client = factorio_rcon.RCONClient(config.rcon_ip, config.rcon_port, config.rcon_password)
    client.connect()


    mqttclient = mqtt.Client()
    mqttclient.on_connect = on_connect

    mqttclient.username_pw_set(username=config.mqtt_user, password=config.mqtt_pass)

    mqttclient.connect(config.mqtt_server, config.mqtt_port, 60)

    mqttclient.publish("factorio/status", "ready")

    
    mqttclient.loop_start()

    do_reconnect = False
    while True:
        time.sleep(1)
        try:
            if do_reconnect:
                do_reconnect = False
                client.connect()
            resp = client.send_command("/scis_logging.get")

            cleanresp = resp.split("> ",1)[1]
            respdict = json.loads(cleanresp)
            for json_dict in respdict:
                mqttclient.publish("factorio/" + json_dict["name"], json.dumps(json_dict), qos=config.qos)
                logging.debug(json.dumps(json_dict)) 

            if not respdict:
                time.sleep(50) # 50 sec sleep timer
            
        except factorio_rcon.RCONClosed as ex:
            logging.warning(ex)
            time.sleep(5)
            do_reconnect = True
        except factorio_rcon.RCONNotConnected as ex:
            logging.warning(ex)
            time.sleep(5)
            do_reconnect = True
        except factorio_rcon.RCONConnectError as ex:
            logging.warning(ex)
            time.sleep(10)
            do_reconnect = True
        except Exception as ex:
            logging.warning(ex)
    return

def getPlayerCount():

    return
if __name__ == "__main__":
    logging.basicConfig(format="%(asctime)s [%(levelname)s] %(name)s: %(message)s", level=logging.INFO)
    dotenv.load_dotenv()
    main()