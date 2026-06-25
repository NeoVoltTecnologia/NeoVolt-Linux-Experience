# NeoVolt Network Discovery v0.4

## Objective

Extend the Network Discovery tool to identify common services used in security systems, networking and remote access.

## Port Scan

The tool should scan active hosts discovered during the network sweep.

## Ports

### Web Management

* TCP 80 (HTTP)
* TCP 443 (HTTPS)

### CCTV

* TCP 554 (RTSP)
* TCP 8000 (Hikvision)
* TCP 37777 (Dahua)

### Remote Access

* TCP 22 (SSH)
* TCP 3389 (RDP)

## Device Identification

### Possible IP Camera

Conditions:

* Port 554 open
* Port 80 or 443 open

### Possible Hikvision Device

Conditions:

* Port 8000 open
* Port 554 open

### Possible Dahua Device

Conditions:

* Port 37777 open
* Port 554 open

## Benefits

* Faster diagnostics
* Camera discovery
* DVR/NVR identification
* Network inventory
* Technical support

## Release Target

NeoVolt Technical Toolkit v0.4
