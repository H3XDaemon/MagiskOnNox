# Magisk On Nox
## Giới thiệu
Triển khai root Magisk trên giả lập Nox (dựa trên [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA))


<img src="https://github.com/HuskyDG/MagiskOnNox/raw/main/Screenshot%20(3).png"/>

## Tính năng
- Đem các tính năng Magisk/Zygisk  lên giả lập Nox
- MagiskHide / MagiskDenyList để ẩn root
- Magisk/Zygisk mô-đun hoạt động chính xác.

*Lưu ý: Android 7.1 trên Nox/LDPlayer không dùng được Zygisk và mô-đun vì môi trường không ổn định*

## Các yêu cầu
- Khuyến nghị: Giả lập Nox Android 9 64-bit
- Các giả lập Android 7.1+ 64-bit khác cũng có thể cài được
(based on [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA))


## Download
Tải về trong [tag **Releases**](https://github.com/HuskyDG/MagiskOnNox/releases) 

Đối với Android 9.0 64-bit Nox, tải `magisk-on-nox.zip` 

Đối với Android 7.1 64-bit Nox/LDPlayer, tải `magisk-on-nox_android_7_64.zip`
## Cài đặt

1. Mở cài đặt giả lập, bật root có sẵn sau đó khởi động lại
2. Cài đặt ứng dụng **Terminal Emulator** nếu chưa có
3. Tải magisk-on-nox.zip vào giả lập
4. Giải nén nó vào:

 `[Bộ nhớ trong]/Download/magisk-on-nox`

*Chắc chắn là bạn đã giải nén hết tất cả tệp*

*Bạn có thể thay thế `magisk.apk` với các phiên bản khác của `magisk.apk`*

5. Mở **Terminal Emulator**, và chạy những dòng lệnh sau:
```
su
sh /sdcard/Download/magisk-on-nox/install.sh
```

<img src="https://github.com/HuskyDG/MagiskOnNox/raw/main/Screenshot%20(5).png"/> 

Lưu ý: `/sdcard` có thể khó hiểu nhưng đó là đường dẫn đến bộ nhớ trong chứ không phải bộ nhớ ngoài (khe cắm thẻ nhớ microSD)

6. Mở cài đặt giả lập, tắt root có sẵn sau đó khởi động lại.

## Cập nhật Magisk

Vì Nox và các giả lập thường không có đĩa ảnh boot nên bạn không thể cập nhật trực tiếp, vui lòng thay thế `magisk.apk` bằng phiên bản mới hơn của` magisk.apk` rồi chạy tập lệnh trình cài đặt!

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
