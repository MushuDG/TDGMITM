# TDG MITM
The aim of this project is to create a MITM demonstrator using a Raspberry Pi and kali linux.

:warning: **Please, use it for education and not hacking!!!** 


The program will analyze the probe request messages and extract the SSID to make a copy of the access point.

## Minimum Requirements
* Raspberry Pi with 2 wlan interfaces (I am using a PI4 with an AirPcap NX card)
* kali linux version >= 2020.2


## Installation

Clone the project with the git command:

```bash
git clone https://github.com/TheoDiGiacomo/TDGMITM.git
```
Then, assign right with chmod command and run setup.sh

```bash
sudo ./setup.sh
```
## Usage

```bash
sudo ./start.sh
```
