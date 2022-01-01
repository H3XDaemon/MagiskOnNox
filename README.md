# Magisk On Nox/Emulator

Nếu không hiểu Tiếng Anh: [ **Tiếng Việt** ](https://github.com/HuskyDG/MagiskOnNox/blob/main/README_vi.md) 

## About
Integrate Magisk root into Nox Player and other emulators (based on [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA))

<img src="https://github.com/HuskyDG/MagiskOnNox/raw/main/Screenshot%20(3).png" />

[Video: How to install Magisk and LSPosed on Nox Player emulator]( https://youtu.be/ZtZQPfZjFuU)

## Features

- Bring Magisk / Zygisk to Nox
- MagiskHide / MagiskDenyList for hiding root
- Magisk / Zygisk modules work properly!

Note: Some features might not work on some emulator, Please read [Emulator that Magisk can work properly](https://github.com/HuskyDG/MagiskOnNox/wiki/Emulator-that-Magisk-can-work-properly) to know which Magisk features doesn't work.

## Requirements
- Recommended: Nox Emulator with Android 9 64-bit
- Any emulator with Android 7.1 and above, 32bit and 64bit.
- Please read [Emulator that Magisk can work properly](https://github.com/HuskyDG/MagiskOnNox/wiki/Emulator-that-Magisk-can-work-properly).


## Download
Download from [**Releases** tag](https://github.com/HuskyDG/MagiskOnNox/releases/) 


## Installation

### Direct Install

Install Magisk into system image.

It's recommended for Android emulator, as you don't have `ramdisk.img`. Also extract `ramdisk.img` through Android emulator environment is very difficult.


1. Go to emulator settings, enable built-in Root and reboot.
-    **Bluestacks:**
    Because Bluestacks emulator doesn't have built-in root option, so you need to use **Bluestacks Tweaker** to install **SuperSU** for root


2. Download and install **Magisk On Nox**. Open and grant root access to **Magisk on Nox** app
3. Do follow the menu to install Magisk. Here are 3 versions of Magisk that you can install: Canary, Alpha and Stable.

4. Go to emulator settings, disable built-in Root and reboot. For Bluestacks, press **UnPatch** button in **Bluestacks Tweaker** to remove **SuperSU**.


### Patch ramdisk image

Recommended for Android x86 project (BlissOS, PhoenixOS)

This guide is quite confusing and may not be for the average user

You must have copy of `ramdisk.img`. It is usually placed in BlissOS/PhoenixOS folder on Windows OS. Take and transfer it to **Internal Storage** of Android x86 environment, currently cannot extract it directly from Android x86 environment.

You can patch `ramdisk.img` through emulator like **NoxPlayer** and then take new `ramdisk.img`

Or patch ramdisk image through Android x86 environment:

`data.img` will be mounted to `/data` when you boot into **BlissOS/PhoenixOS**. If you cannot transfer files between Windows and BlissOS/PhoenixOS, you can use **[AnyBurn](https://anyburn.com/download.php)** software to read `data.img` (Internal Storage image) to put in or take `ramdisk.img` out

1. Boot to **BlissOS/PhoenixOS**. Install **Magisk on Nox** and open, grant root access if you have!

2. If you doesn't have root access, press *ALT+F1* to open root shell, then type this command:
```
/data/data/io.github.huskydg.magiskonnox/magisk/menu
```

3. A menu will be visible, follow *Install/update Magisk* > *Magisk build* > *Patch ramdisk image* and enter path to your ramdisk image (ramdisk.img), press Enter and it will patch your **ramdisk.img**

4. Now transfer new `ramdisk.img` to Windows disk

5. Boot into **Windows OS**. Open **File Exploerer**, navigate to BlissOS/PhoenixOS folder, make sure you back up old `ramdisk.img` and replace with new patched `ramdisk.img`.

6. Boot to **BlissOS/PhoenixOS** and enjoy **Magisk**.

## Update

Since Nox/Emulator doesn't have boot image, you cannot update directly through **Magisk** app, please use **Magisk On Nox** to update it.


## Frequently asked Questions

[Please access this page](https://github.com/HuskyDG/MagiskOnNox/wiki)


## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
