# SES-NRF-GC 

The original solution is taken from the [source](https://github.com/Borchevkin/docker-ses-nrf-unity-aws/blob/main/Dockerfile)

## Core components

### Google Cloud CLI

The Google Cloud CLI is a set of tools to create and manage Google Cloud resources.

The installation process on Debian/Ubuntu is described [here](https://www.educative.io/answers/how-to-install-google-cloud-cli-on-debian-ubuntu)

### Segger Embedded Studio 7.10a

Embedded Studio is the all-in-one integrated development environment (IDE) for embedded systems. [Release notes](https://studio.segger.com/index.htm?https://studio.segger.com/arm_segger_studio_release_notes.htm)

Possible error during project assembly and [its solution ](https://devzone.nordicsemi.com/f/nordic-q-a/89236/build-error/374975)

> error: .text is larger than specified size
>
> error: .rodata is larger than specified size


### nRF Command Line Tools 10.18.1

The nRF Command Line Tools is used for development, programming and debugging of Nordic Semiconductor's **nRF51**, **nRF52**, **nRF53** and **nRF91** Series devices.

[Download](https://www.nordicsemi.com/Products/Development-tools/nrf-command-line-tools/download) Cross-platform desktop software



### pip3 nrfutil

[nRF Utiliza](https://github.com/NordicSemiconductor/pc-nrfutil) Python package and command-line utility that supports Device Firmware Update (DFU) and cryptographic functionality.

The original source [nRF Util for nRF5 SDK](https://infocenter.nordicsemi.com/pdf/nrfutil_v6.1.0.pdf)


## Required packages for installation
### Google Cloud CLI
* apt-transport-https 
* ca-certificates 
* gnupg
* add-apt-key

### Segger Embedded Studio
* libfreetype6
* libxrender1
* libfontconfig1

### nRF Command Line Tools
* libusb-1.0-0

### pip3 nrfutil
* python3-pip

## Additional packages
* make
* git
* wget
* curl