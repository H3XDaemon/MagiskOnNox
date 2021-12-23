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

*Note: Android 7.1 Nox/LDPlayer cannot use Zygisk and modules due to unstable environment*

## Requirements
- Recommended: Nox/Bluestacks Emulator with Android 9 64-bit
- Any emulator with Android 7.1 and above, 64bit, confirmed working Emulator: Bluestacks, Nox, LDPlayer


## Download
Download from [**Releases** tag](https://github.com/HuskyDG/MagiskOnNox/releases/) 


## Installation


1. Go to emulator settings, enable built-in Root and reboot.
-    **Bluestacks:**
    Because Bluestacks emulator doesn't have built-in root option, so you need to use **Bluestacks Tweaker** to install **SuperSU** for root


2. Download and install **Magisk On Nox**. Open and grant root access to **Magisk on Nox** app
3. Do follow the menu to install Magisk. Here are 3 versions of Magisk that you can install: Canary, Alpha and Stable.

- Android 9: It's recommended to install Magisk Canary / Alpha if you want modules

- Android 7: Install Magisk Canary / Alpha on Android 7.1 may cause Magisk not to work, in that case please install Magisk Stable v23, however you might not able to install Magisk modules due to some bugs.

4. Go to emulator settings, disable built-in Root and reboot. For Bluestacks, press **UnPatch** button in **Bluestacks Tweaker** to remove **SuperSU**.



## Update

Since Nox/Emulator doesn't have boot image, you cannot update directly through **Magisk** app, please use **Magisk On Nox** to update it.


## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
