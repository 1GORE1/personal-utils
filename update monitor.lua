import urllib3
import threading
import time
import json
import datetime
from os import path

def version():
    http = urllib3.PoolManager()
    response = http.request('GET', 'http://setup.roblox.com/version')
    if response.status == 200:
        return response.data.decode('utf-8')

current_version = version()
logs = r'C:\Users\slime\OneDrive\Desktop\project\logs.json'

def monitor_version():
    global current_version
    while True:
        if version() != current_version:
            if not path.isfile(logs):
                with open(logs, 'w') as jsonf:
                    json.dump([], jsonf, indent=4, separators=(',', ': '))

            with open(logs) as info:
                object = json.load(info)
            
            object.append({"Roblox": version(), "Date": str(datetime.datetime.now())})
            with open(logs, 'w') as jsonf:
                json.dump(
                    object,
                    jsonf,
                    indent=4,
                    separators=(',', ': ')
                )
            current_version = version()
        else:
            time.sleep(1800)

version_thread = threading.Thread(target=monitor_version)
version_thread.start()

print('listening for any roblox updates')
