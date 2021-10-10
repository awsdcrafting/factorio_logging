import threading
import factorio_rcon


def read(client):
    try:
        while True:
            packets = client.receive_packets()
            print(f"read: {packets}")
    except Exception as ex:
        print(ex)

def main():
    client = factorio_rcon.RCONClient("127.0.0.1", 25566, "rconTest")
    client.connect()
    print("connected")
    t1 = threading.Thread(target=read, args=(client,))
    t1.setDaemon(True)
    #t1.start()

    while True:
        msg = input()
        if msg == "exit":
            break
        try:
            print(f"sending: {msg}")
            resp = client.send_command(msg)
            print(f"response: {resp}")
        except Exception as ex:
            print(ex)
        
    return

if __name__ == "__main__":
    main()
