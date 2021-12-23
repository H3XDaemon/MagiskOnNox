# Magisk On Nox
## Giới thiệu
Triển khai root Magisk trên giả lập Nox (dựa trên [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA))


<img src="https://github.com/HuskyDG/MagiskOnNox/raw/main/Screenshot%20(3).png"/>

[Video: Hướng dẫn cài đặt Magisk và LSPosed lên giả lập Nox Player]( https://youtu.be/ZtZQPfZjFuU)

## Tính năng
- Đem các tính năng Magisk/Zygisk  lên giả lập Nox
- MagiskHide / MagiskDenyList để ẩn root
- Magisk/Zygisk mô-đun hoạt động chính xác.


## Các yêu cầu
- Khuyến nghị: NoxPlayer với Android 9 64-bit
- Bất kỳ trình giả lập nào chạy Android 7.1 trở lên, 64bit, Trình giả lập được xác nhận: Bluestacks, Nox, LDPlayer

## Một vài hạn chế

- Lưu ý: Android 7.1 trên Nox/LDPlayer không dùng được Magisk Alpha / Canary và mô-đun không thể cài đặt vì môi trường không ổn định
- Bluestacks Android 9 không thể tải Zygisk và các mô-đun ngay cả khi bạn có thể cài đặt nó

## Download
Tải về trong [tag **Releases**](https://github.com/HuskyDG/MagiskOnNox/releases) 

## Cài đặt

1. Đi tới cài đặt giả lập, bật Root tích hợp sẵn và khởi động lại

- **Bluestacks:** Vì trình giả lập Bluestacks không có tùy chọn root tích hợp, vì vậy bạn cần sử dụng ** Bluestacks Tweaker ** để cài đặt **SuperSU** cho root


 2. Tải xuống và cài đặt **Magisk On Nox**.  Mở và cấp quyền truy cập root cho ứng dụng **Magisk On Nox**
 3. Làm theo menu để cài đặt Magisk. Đây là 3 bản Magisk mà bạn có thể cài đặt: Canary, Alpha và Stable

 - Android 9: Bạn nên cài đặt Magisk Canary / Alpha nếu bạn muốn có mô-đun

 - Android 7: Cài đặt Magisk Canary / Alpha trên Android 7.1 sẽ khiến Magisk không hoạt động, vui lòng cài đặt Magisk Stable v23, tuy nhiên bạn sẽ không thể cài đặt mô-đun Magisk

 4. Vào cài đặt giả lập, vô hiệu hóa Root tích hợp và khởi động lại. Đối với Bluestacks, nhấn nút **UnPatch** trong **Bluestacks Tweaker** để xóa **SuperSU**.

## Cập nhật Magisk

Vì Nox và các giả lập thường không có đĩa ảnh boot nên bạn không thể cập nhật trực tiếp, vui lòng cập nhật Magisk bằng **Magisk on Nox**

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
