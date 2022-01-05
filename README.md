# Magisk On Emulator, Android x86 project

## About
Integrate Magisk root into Nox Player and other Android x86, emulators

**Magisk on NoxPlayer Android 9 emulator**

<img src="https://i.imgur.com/dkuKfDt.png" />

**Magisk on BlissOS 11 - Android 9**

<img src="https://i.imgur.com/udNrMx2.jpg"/>

## Features

- Bring Magisk / Zygisk to Android x86
- MagiskHide / MagiskDenyList for hiding root
- Magisk / Zygisk modules work properly!

Note: Some features might not work on some emulator, Please read [Emulator that Magisk can work properly](https://github.com/HuskyDG/MagiskOnNox/wiki/Emulator-that-Magisk-can-work-properly) to know which Magisk features doesn't work.

## Requirements
- Android x86 project: BlissOS 11 - Android 9
- Phoenix OS is not supported yet
- Android Emulator (NoxPlayer, LDPlayer, ...): [Emulator that Magisk can work properly](https://github.com/HuskyDG/MagiskOnNox/wiki/Emulator-that-Magisk-can-work-properly).
- Android version: 7.1 ~ 9.0 (legacy rootfs)

## Download
Download from [**Releases** tag](https://github.com/HuskyDG/MagiskOnNox/releases/) 


## Installation

### Install Magisk into system partition

[Video: How to install Magisk and LSPosed on Nox Player emulator]( https://youtu.be/ZtZQPfZjFuU)


Install Magisk into system image, so your system must be able to be mounted as read-write

It's recommended for Android emulator, as you don't have `ramdisk.img`. Also extract `ramdisk.img` through Android emulator environment is very difficult.


1. Go to emulator settings, enable built-in Root and reboot.
-    **Bluestacks:**
    Because Bluestacks emulator doesn't have built-in root option, so you need to use **Bluestacks Tweaker** to install **SuperSU** for root


2. Download and install **Magisk On Nox**. Open and grant root access to **Magisk on Nox** app
3. Do follow the menu to install Magisk. Here are 3 versions of Magisk that you can install: Canary, Alpha and Stable.

4. Go to emulator settings, disable built-in Root and reboot. For Bluestacks, press **UnPatch** button in **Bluestacks Tweaker** to remove **SuperSU**.


### Install Magisk into ramdisk (systemless)

Recommended if you have `ramdisk.img` or you are using **Android x86** project (BlissOS)

This guide is quite confusing and may not be for the average user

You must have copy of `ramdisk.img`

#### Patch ramdisk through Android emulator

- You can use **Magisk on Nox** to patch `ramdisk.img` of **Android x86** through emulator such as **NoxPlayer, MEmu** and then take new `ramdisk.img`. Replace current `ramdisk.img` with magisk patched `ramdisk.img`.

#### Direct install into Android x86


1. Boot to **Android x86**

2. Press *ALT+F1* to open root shell and pay attention to this text (it may look like):
```
Detecting Android-x86... found at /dev/<blockname>
```
<img src="https://i.imgur.com/AmcrOyX.png" /> 

 -  That's mean **Android x86** was installed at `/dev/<blockname>`


3. Press *ALT+F7* to close root shell.

4. Install and open **Magisk on Nox**.
- Grant root access if you have
- If you don't have root access, press *ALT+F1* and type this command:
```
/data/data/io.github.huskydg.magiskonnox/magisk/menu
```

5. The menu will be displayed, go *Install/update Magisk* > Select Magisk build > *Install Magisk into ramdisk* > *Direct install*
- You will need to select a from partition where you have this **Android x86** installed, usually it will be `/dev/block/<blockname>`.
- After select the partition, now you will need to select `ramdisk.img` correctly!
- Then **Magisk on Nox** will patch `ramdisk.img` install it into ramdisk.

6. Reboot **Android x86** and enjoy **Magisk**.

## Uninstall

- **Magisk on Nox** has option to uninstall Magisk. If you install Magisk into `ramdisk.img`, you cannot uninstall directly, please just replace it with original `ramdisk.img`

## Update

- Since Nox/Emulator doesn't have boot image, you cannot update directly through **Magisk** app, please use **Magisk On Nox** to update it.
- If you install Magisk into `ramdisk.img`, you can use **Update binary** option to update **Magisk** without having to patch `ramdisk.img` again!


## Frequently asked Questions

[Please access this page](https://github.com/HuskyDG/MagiskOnNox/wiki)


## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
