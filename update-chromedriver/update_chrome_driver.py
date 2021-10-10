#!C:\automation-scripts\venv\Scripts\python.exe
import os
from bs4 import BeautifulSoup
from pathlib import Path
from io import BytesIO
from zipfile import ZipFile
import subprocess
import requests

def download_chrome_driver(file_path):
    try:
        version = subprocess.check_output('wmic datafile where name="C:\\\\Program Files (x86)\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe" get Version /value', shell=False)
        version = version.decode("utf-8").strip()
        version_number = version.split("=")[1].split(".")[0]
    except IndexError:
        version = subprocess.check_output('wmic datafile where name="C:\\\\Program Files\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe" get Version /value', shell=False)
        version = version.decode("utf-8").strip()
        version_number = version.split("=")[1].split(".")[0]
    response = requests.get("https://chromedriver.storage.googleapis.com/?delimiter=/&prefix=" + version_number)
    soup = BeautifulSoup(response.content, "html.parser")
    version = soup.find("commonprefixes").find("prefix").text
    chrome_link = f"https://chromedriver.storage.googleapis.com/{version}chromedriver_win32.zip"
    print("downloading chromedriver")
    response = requests.get(chrome_link).content
    zipfile = ZipFile(BytesIO(response))
    f = open(file_path, "wb")
    for line in zipfile.open("chromedriver.exe").readlines():
        f.write(line)
    f.close()
    print("download completed")



print("Running", __file__, "\n")
print("Welcome to utility software by Samrat Neupane\n")
if os.name == 'nt':
    file_dir = "\\".join(__file__.split("\\")[:-1]) + "\\"
    file_path = file_dir + "chromedriver.exe"
    if not Path(file_path).exists():
        download_chrome_driver(file_path)
    else:
        ans = input("Do you want to update chromedriver?\nIf yes, enter y or press any key to cancel >>> ")
        if ans.strip().lower() == "y":
            download_chrome_driver(file_path)
else:
    print("Sorry not valid for your os")
