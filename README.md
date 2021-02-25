<p align="center">
<a href="https://punkers.business.site"><img title="HACKERSPUNK" src="https://img.shields.io/badge/MADE%20IN-INDIA-SCRIPT?colorA=%23ff8100&colorB=%23017e40&colorC=%23ff0000&style=for-the-badge"></a>
</p>
<p align="center">
<a href="https://punkers.business.site"><img title="HACKERSPUNK" src="https://img.shields.io/badge/HACKERS-PUNK-green?style=for-the-badge&logo=appveyor"></a>
</p>

# SPEAR-FISHER
* Find phishing kits which use your brand/organization's files and image

* *****SPEAR-FISHER***** (or FISHER) is a tool made for identifying phishing kits URLs used in phishing campains targeting your customers and using some of your own website files (as CSS, JS, ...). This tool - write in Python 3 - is based on the analysis of referer's URL which GET particular files on the legitimate website (as some style content) or redirect user after the phishing session. Log files (should) contains the referer URL where the user come from and where the phishing kit is deployed. *****SPEAR-FISHER***** parse your logs file to identify particular and non-legitimate referers trying to get legitimate pages based on regular expressions you put into spear-fisher config file.

## FEATURES
* find URL where a phishing kit is deployed
* find if the phishing kit is still up and running
* generate a CSV report useful for external usage
* use a hash of the phishing kit's page to identify the kit
* use a timestamp for history
* can use HTTP or SOCKS5 proxy
* WHOIS enrichment to console and CSV reports
## Installation Commands
```
cd $HOME
apt update
apt upgrade -y
apt install git -y
apt install python -y
apt install python2 -y
pip install --upgrade pip
git clone https://github.com/Punker-Bhai/spear-fisher.git
cd spear-fisher
```
## Requirements
* Python 3
* tqdm
* csv
* python-whois
## Install
Install the requirements

`pip3 install -r requirements.txt`
## Configure
Please read the conf/default.conf file to learn how to configure spear-fisher.
## Docker
You can use the Dockerfile to create a Docker container which automaticaly git clone this repository. This is based on the latest light Phusion distrib, get packages needed to get and execute spear-fisher.

Build the container:

`docker build tad/fisher .`

Start the container with some options (as your local log files repository):

`docker run -d -P --name fisher --volume /var/log:/opt/logfiles tad/fisher`

You can now execute shell and start your analysis:

`docker exec -ti tad/fisher /bin/bash`
## USAGE
```
./fisher.py -i LogFile2021.log -o fisher-report-2021ooo2-013307.csv -c conf/test.conf
  ______ _     _               
 |  ____(_)   | |              
 | |__   _ ___| |__   ___ _ __ 
 |  __| | / __| '_ \ / _ \ '__|
 | |    | \__ \ | | |  __/ |   
 |_|    |_|___/_| |_|\___|_|

[+] http://badscam.org/includes/ap/?a=2
		|   Timestamp: 01/May/2021:13:00:03
		| HTTP status: can't connect (HTTP Error 404: Not Found)
[+] http://scamme.com/aple/985884e5b60732b1245fdfaf2a49cdfe/
		|   Timestamp: 01/May/2021:13:00:49
		| HTTP status: can't connect (<urlopen error [Errno -2] Name or service not known>)
[+] http://badscam-er.com/eb/?e=4
		|   Timestamp: 01/May/2021:13:01:06
		| HTTP status: can't connect (<urlopen error [Errno -2] Name or service not known>)
[+] http://assur.cam.tech/scam/brand/new/2bd5a55bc5e768e530d8bda80a9b8593/
		|   Timestamp: 01/May/2021:13:01:14
		| HTTP status: UP
		| HTTP shash : 0032588b8d93a807cf0f48a806ccf125677503a6fabe4105a6dc69e81ace6091
                | DOMAIN registrar: ASCIO TECHNOLOGIES, INC. DANMARK - FILIAL AF ASCIO TECHNOLOGIES, INC. USA
                | DOMAIN creation date: 2008-07-10 00:00:00
                | DOMAIN expiration date: 2021-07-10 00:00:00
[+] http://phish-other.eu/assur/big/phish/2be1c6afdbfc065c410d36ba88e7e4c9/
		|   Timestamp: 01/May/2021:13:01:15
		| HTTP status: UP
		| HTTP shash : 2a545c4d321e3b3cbb34af62e6e6fbfbdbc00a400bf70280cb00f4f6bb0eac44
                | DOMAIN registrar: Hostmaster Strato Rechenzentrum
                | DOMAIN creation date: None found
                | DOMAIN expiration date: None found
697475it [06:41, 1208.14it/s]
```
## HELP
```
./fisher.py --help
  ______ _     _               
 |  ____(_)   | |              
 | |__   _ ___| |__   ___ _ __ 
 |  __| | / __| '_ \ / _ \ '__|
 | |    | \__ \ | | |  __/ |   
 |_|    |_|___/_| |_|\___|_| 

			-h --help   Prints this
			-i --ifile    Input logfile to analyse
			-o --ofile    Output CSV report file (default: ./fisher-report-'date'-'hour'.csv)
			-c --config   Configuration file to use (default: ./conf/defaults.conf)
```
## CSV report example
```
cat ./fisher-report-2021ooo2-013307.csv
PK_URL;Domain;HTTP_sha256;HTTP_status;date;domain registrar;domain creation date;domain creation date;domain expiration date
http://badscam.org/includes/ap/?a=2;badscam.org;;can't connect (HTTP Error 404: Not Found);01/May/2021:13:00:03;;;
http://assur.cam.tech/scam/brand/new/2bd5a55bc5e768e530d8bda80a9b8593/;assur.cam.tech;0032588b8d93a807cf0f48a806ccf125677503a6fabe4105a6dc69e81ace6091;UP;01/May/2021:13:01:14;None found;None found;Hostmaster Strato Rechenzentrum
[...]
```
### THANK YOU ! 
