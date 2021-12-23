# Magisk On Nox

Nếu không hiểu Tiếng Anh: [ **Tiếng Việt** ](https://github.com/HuskyDG/MagiskOnNox/blob/main/README_vi.md) 

## About
Integrate Magisk root into Nox emulator (based on [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA))

<img src="https://github.com/HuskyDG/MagiskOnNox/raw/main/Screenshot%20(3).png" />

## Features

- Bring Magisk / Zygisk to Nox
- MagiskHide / MagiskDenyList for hiding root
- Magisk / Zygisk modules work properly!

*Note: Android 7.1 Nox/LDPlayer cannot use Zygisk and modules due to unstable environment*

## Requirements
- Recommended: Nox Emulator with Android 9 64-bit
- Any emulator with Android 7.1+ 64bit

## Download
Download from [**Releases** tag](https://github.com/HuskyDG/MagiskOnNox/releases/) 

• Just created a new app **Magisk On Nox** that makes installation simpler!

• For Android 9.0 64-bit Nox, download `magisk-on-nox.zip` 

• For Android 7.1 64-bit Nox/LDPlayer, download `magisk-on-nox_android_7_64.zip`


## Installation

There are two method to install Magisk into Nox:

### Simple method

1. Go to emulator settings, enable built-in Root and reboot
2. Download and install **Magisk On Nox**. Grant root access to **Magisk on Nox** app
3. Do follow the menu to install Magisk
4. Go to emulator settings, disable built-in Root and reboot

### Manual installation

1. Go to emulator settings, enable built-in Root and reboot
2. Install **Terminal Emulator** if you don't have it installed
3. Download magisk-on-nox.zip to your emulator
4. Extract it to:

 `[Internal Storage]/Download/magisk-on-nox`

*Make sure you have extracted all files from zip*

*You can replace `magisk.apk` with another `magisk.apk`*

5. Open **Terminal Emulator**, run these command:
```
su
sh /sdcard/Download/magisk-on-nox/install.sh
```

<img src="https://github.com/HuskyDG/MagiskOnNox/raw/main/Screenshot%20(5).png"/> 

Note: `/sdcard` might be confusing but it is path to your internal storage, not your secondary external storage (microSD card slot)

6. Go to emulator settings, disable built-in Root and reboot

## Update

Since Nox/Emulator doesn't have boot image, you cannot update directly through **Magisk** app, please use **Magisk On Nox** to update it.


## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
