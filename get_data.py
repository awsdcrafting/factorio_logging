import factorio_rcon
import time

ip = "127.0.0.1"
port = 25566
password = "rconTest"


def main():
    client = factorio_rcon.RCONClient(ip, port, password)
    client.connect()
    print("connected")

    while True:
        try:
            print(f"reading")
            resp = client.send_command("/scis_logging.get")
            print(f"{resp}")
        except Exception as ex:
            print(ex)
        time.sleep(10)
    return


if __name__ == "__main__":
    main()
