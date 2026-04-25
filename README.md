# Managed to Monitor
A set of simple scripts to change your Wi-Fi card from managed to monitor mode, vice-versa. There are 2 different types of scripts you can use:
1. Simple scripts, you will have to go into the file and enter the WiFi adapter and the WiFi adapter + the mon abbreviation (see guide on how to do so)
2. More user-friendly script, you can choose from detected wifi modules, all you have to do is make them executable

## The following scripts rely on these packages:
1. aircrack-ng suite, CLI
2. ifconfig
4. iwconfig
5. systemctl

## Installation
Simply download the script bundle you want (simple or user-friendly) from the releases page. Then decompress and extract the scripts from the .tar archive, and then follow the how-to run instructions, and the instructions to edit the simple script, if you chose to download that.

## How-to edit simple script and add necessary info
1. Open the script and look in the first 1-5 lines.
2. You will see 2 variables called INTERFACE and INTERFACEMON.
3. Find the name of your wifi adapter, then enter it in the INTERFACE variable in the quotes. Example: `INTERFACE="wlp4s60"`
4. Next you will have to edit the INTERFACEMON variable, to do so, go into the quotes and type in your wifi adapter name, adding on the "mon" abbreviation, an example would be: `INTERFACEMON="wlp4s60mon"`
5. After that save the changes to the document and follow the how-to run commands below.

## How-to run
1. cd into the directory you downloaded the scripts into.
2. Then run `sudo chmod 777 (MONITOR or MONITOR_SIMPLE.sh)` this makes the MONITOR.sh script executable
3. Next run `sudo chmod 777 (MANAGED or MANAGED_SIMPLE.sh)` this also makes the script executable
4. After that you can execute them by running `sudo ./(MANAGED OR MONITOR OR MANAGED_SIMPLE OR MONITOR_SIMPLE).sh`
5. It will ask for your password because the script requires sudo permissions

# Disclaimer:
I am not responsible for how these scripts are used or the effect they have on your hardware. The user is responsible for understanding the limits and capabilities of their equipment. These scripts are for educational purposes. These scripts utilize preexisting free and open source software, all credit is due to the creators of the software.
