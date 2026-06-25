# NeoVolt Technical Toolkit

## Overview

NeoVolt Technical Toolkit is a collection of field tools developed for:

* CCTV installations
* IP camera diagnostics
* Network troubleshooting
* Remote access validation
* Technical support operations

Part of the NeoVolt Linux Experience project.

---

## Available Modules

### Network Discovery

Current Version: v0.5

Features:

* Local network detection
* Active host discovery
* ARP neighbor analysis
* Gateway identification
* Port scanning
* Device classification

---

## Usage

Run:

```bash
./toolkit/network/neovolt-network-discovery.sh
```

---

## Device Detection

### Router / Web Interface

Detected when:

* HTTP (80)
* HTTPS (443)

### IP Camera

Detected when:

* RTSP (554)
* HTTP (80) or HTTPS (443)

### Hikvision

Detected when:

* Port 8000
* Port 554

### Dahua

Detected when:

* Port 37777
* Port 554

---

## Project Status

Development Version

Maintained by:

NeoVolt Tecnologia
