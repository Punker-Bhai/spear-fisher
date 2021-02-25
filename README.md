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
