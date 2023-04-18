import os
import socket
import time
import json
import yaml

PATH = os.path.join(os.path.dirname(__file__), "data", "") 

service_addr = {
    'drive.google.com': '0',
    'mail.google.com': '0',
    'google.com': '0'
}

def write_data (name_service, data):
    # json
    with open (os.path.join(PATH, name_service + ".json"), "w") as f:
        payload = json.dumps({name_service: data})
        f.write(payload)
    
    # yaml
    with open (os.path.join(PATH, name_service + ".yaml"), "w") as f:
        payload = yaml.dump({name_service: data}, explicit_start=True, explicit_end=True)
        f.write(payload)

for item in service_addr:
    initial_addr = socket.gethostbyname(item)
    service_addr[item] = initial_addr
    print(item)
    write_data(item, service_addr[item])


while True:
    for item in service_addr:
        old_addr = service_addr[item]
        new_addr = socket.gethostbyname(item)
        if new_addr != old_addr:
            service_addr[item] = new_addr

            print("[ERROR] "+item+" IP mismatch: old IP "+old_addr+", new IP "+new_addr)
        print(item + " - " + service_addr[item])
        write_data(item, service_addr[item])
    print("######################################")
    time.sleep(10)