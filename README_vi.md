# Magisk On Nox
## Giới thiệu
Triển khai root Magisk trên giả lập Nox

## Tính năng
- Đem các tính năng Magisk/Zygisk  lên giả lập Nox
- MagiskHide / MagiskDenyList để ẩn root
- Magisk/Zygisk mô-đun

## Các yêu cầu
- Giả lập Nox: Android 64-bit
- Các giả lập khác cũng có thể cài được

## Download
Tải về trong [tag **Releases**](https://github.com/HuskyDG/MagiskOnNox/releases/tag) 

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

Lưu ý: `/sdcard` có thể khó hiểu nhưng đó là đường dẫn đến bộ nhớ trong chứ không phải bộ nhớ ngoài (khe cắm thẻ nhớ microSD)

6. Mở cài đặt giả lập, tắt root có sẵn sau đó khởi động lại.

## Cập nhật Magisk

Vì Nox và các giả lập thường không có đĩa ảnh boot nên bạn không thể cập nhật trực tiếp, vui lòng thay thế `magisk.apk` bằng phiên bản mới hơn của` magisk.apk` rồi chạy tập lệnh trình cài đặt!

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
