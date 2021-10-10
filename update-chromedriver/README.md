# Chrome Driver Update

This is simple python script made to update chromedriver. This script will download or update chromedriver in the same directory, python script is present at.

> For now it's only available for windows user.

Source of Script Idea:\
While using chromedriver with selenium, chrome updates sometime and doesn't update chromedriver so, this script made using python helps update or download the chromedriver according to the version of Google Chrome on your device.

## How to use it
> Note: Every commands are for powershell.\
> Tip: Make new directory and add the directory to the path

```Powershell
cd C:
mkdir automation-scripts
[Environment]::SetEnvironmentVariable("AutomatedPath", $env:AutomatedPath + ";C:\new_directory", "User")
cd automation-scripts
```

- Download python script and requirements.txt
```Powershell
wget https://raw.githubusercontent.com/h3cksamrat/automation-scripts/master/update-chromedriver/update_chrome_driver.py

wget https://raw.githubusercontent.com/h3cksamrat/automation-scripts/master/update-chromedriver/requirements.txt
```
- Install python, if not have already
- Install all the requirements in the virtual environment

`python -m venv venv`

`pip install -r requirements.txt`

- Activate virtual environment
`./venv/Scripts/Activate.ps1`

> Note: If powershell gives error message, paste this into your powershell\
`Set-Executionpolicy -Scope CurrentUser -ExecutionPolicy UnRestricted`\
and activate virtual environment

- run python program\
`python update_chrome_driver.py`\
 or\
 If you have added `automation-scripts` directory to PATH, you can run the script from anywhere using command:\
 `update_chrome_driver`




