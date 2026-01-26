# hidden-handshake

> A small PowerShell utility that enumerates saved Windows Wi-Fi profiles and reveals their stored keys (passwords) when available.

## Overview

`hidden-handshake` uses Windows' built-in `netsh wlan` to:

1. Enumerate saved Wi-Fi profiles on the local machine.
2. Query each profile and display the stored key (the `Key Content`) in clear text.

This is intended for **legitimate recovery of your own Wi-Fi credentials** and for learning/administration tasks.

## Installation

1. Clone the repository:

For windows using powershell:
```bash  
curl -o hidden-handshake.zip  https://github.com/cyb2rS2c/hidden-handshake/archive/refs/heads/main.zip
Expand-Archive -Force  .\hidden-handshake.zip
cd hidden-handshake/hidden-handshake-main
```

## Usage

1. Open **PowerShell** **as Administrator** (required to view keys for some profiles).

```powershell
.\Get-WiFiPasswords.ps1
```

2. The console will list each profile followed by the `Key Content` line (if the password is stored).

---

## Security & Legal Notice

* **Only run this on machines you own or administer.**
* **Do not** use this tool to access networks or systems you are not authorized to access.
* Exposing Wi-Fi keys in clear text is sensitive - treat outputs as confidential.
* Use caution when storing or sharing results.

---

## Example output

```
Wi-Fi Profile: HomeNetwork
Key Content: MyHomePassword123
---------------------------
Wi-Fi Profile: CoffeeShopWiFi
Key Content: freewifi
---------------------------
```

---

## 🛠️ Compatibility & Requirements

* Windows 7 / 8 / 10 / 11 (any system with `netsh` and PowerShell).
* PowerShell (Windows-built-in); no external modules required.
* Run elevated (Admin) for full visibility in some environments.

---

## Author
cyb2rS2c - [GitHub Profile](https://github.com/cyb2rS2c)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer!

This code is provided "as-is" without any warranty. The author is not responsible for any misuse or damage caused by the use of this software. Always practice responsible security testing.
