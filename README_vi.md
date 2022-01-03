# Magisk trên giả lập, Android x86
## Giới thiệu
Triển khai root Magisk trên giả lập Nox (dựa trên [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA))


<img src="https://github.com/HuskyDG/MagiskOnNox/raw/main/Screenshot%20(3).png"/>

[Video: Hướng dẫn cài đặt Magisk và LSPosed lên giả lập Nox Player]( https://youtu.be/ZtZQPfZjFuU)

## Tính năng
- Đem các tính năng Magisk/Zygisk  lên giả lập Nox
- MagiskHide / MagiskDenyList để ẩn root
- Magisk/Zygisk mô-đun hoạt động chính xác.

Lưu ý: Một vài tính năng có thể không hoạt động trên một số giả lập, vui lòng đọc [Giả lập mà Magisk có thể hoạt động chính xác](https://github.com/HuskyDG/MagiskOnNox/wiki/Emulator-that-Magisk-can-work-properly) để biết tính năng của Magisk không hoạt động

## Các yêu cầu
- Khuyến nghị: NoxPlayer với Android 9 64-bit
- Bất kỳ trình giả lập nào chạy Android 7.1 trở lên, 32bit và 64bit, Trình giả lập được xác nhận: Bluestacks, Nox, LDPlayer
- Vui lòng đọc [Giả lập mà Magisk có thể hoạt động chính xác](https://github.com/HuskyDG/MagiskOnNox/wiki/Emulator-that-Magisk-can-work-properly)

## Download
Tải về trong [tag **Releases**](https://github.com/HuskyDG/MagiskOnNox/releases) 

## Cài đặt

### Cài đặt Trực tiếp

Cài đặt Magisk vào phân vùng system

Khuyến nghị cho trình giả lập Android, vì bạn không có `ramdisk.img`.  Ngoài ra việc giải nén `ramdisk.img` thông qua môi trường giả lập Android cũng rất khó.

1. Đi tới cài đặt giả lập, bật Root tích hợp sẵn và khởi động lại

- **Bluestacks:** Vì trình giả lập Bluestacks không có tùy chọn root tích hợp, vì vậy bạn cần sử dụng ** Bluestacks Tweaker ** để cài đặt **SuperSU** cho root


 2. Tải xuống và cài đặt **Magisk On Nox**.  Mở và cấp quyền truy cập root cho ứng dụng **Magisk On Nox**
 3. Làm theo menu để cài đặt Magisk. Đây là 3 bản Magisk mà bạn có thể cài đặt: Canary, Alpha và Stable

 4. Vào cài đặt giả lập, vô hiệu hóa Root tích hợp và khởi động lại. Đối với Bluestacks, nhấn nút **UnPatch** trong **Bluestacks Tweaker** để xóa **SuperSU**.

### Vá đĩa ảnh ramdisk

 Được đề xuất nếu bạn có `ramdisk.img` hoặc bạn đang sử dụng dự án **Android x86** (BlissOS, PhoenixOS)

 Hướng dẫn này khá khó hiểu và có thể không dành cho người dùng bình thường

 Bạn phải có bản sao của `ramdisk.img`

 #### Vá ramdisk thông qua trình giả lập Android

 - Bạn có thể sử dụng **Magisk on Nox** để vá `ramdisk.img` của **Android x86** thông qua trình giả lập như **NoxPlayer, MEmu** và sau đó lấy `ramdisk.img` mới.  Thay thế `ramdisk.img` hiện tại bằng `ramdisk.img` đã vá với Magisk

 #### Cài đặt trực tiếp vào Android x86

 1. Khởi động vào **Android x86**

 2. Nhấn *ALT + F1* để mở root shell và chú ý đến văn bản này (nó có thể giống):
 ```
 Detecting Android x86... found at /dev/<blockname>
 ```
 <img src = "https://github.com/HuskyDG/MagiskOnNox/raw/main/IMG_20220103_074812.png" />

  - Điều đó có nghĩa là **Android x86** đã được cài đặt tại `/dev/<blockname>`


 3. Nhấn * ALT + F7 * để đóng root shell.

 4. Cài đặt và mở **Magisk on Nox**.
 - Cấp quyền truy cập root nếu bạn có
 - Nếu bạn không có quyền truy cập root, hãy nhấn *ALT + F1* và nhập lệnh này:
 ```
 /data/data/io.github.huskydg.magiskonnox/magisk/menu
 ```

 5. Menu sẽ được hiển thị, hãy vào *Cài đặt hoặc cập nhật Magisk* > Chọn bản dựng Magisk > *Cài đặt Magisk vào ramdisk* > *Cài đặt trực tiếp*
 - Bạn sẽ cần chọn một từ phân vùng mà bạn đã cài đặt **Android x86** này, thường nó sẽ là `/dev/block/<blockname>`.
 - Sau khi chọn phân vùng, bây giờ bạn cần chọn chính xác `ramdisk.img`!
 - Sau đó **Magisk on Nox** sẽ vá `ramdisk.img` cài đặt Magisk vào ramdisk.

 6. Khởi động lại **Android x86** và tận hưởng **Magisk**.

## Gỡ cài đặt

 - **Magisk on Nox** có tùy chọn gỡ cài đặt Magisk.  Nếu bạn cài đặt Magisk vào `ramdisk.img`, bạn không thể gỡ cài đặt trực tiếp, vui lòng thay thế nó bằng `ramdisk.img` ban đầu

## Cập nhật Magisk

- Vì Nox và các giả lập thường không có đĩa ảnh boot nên bạn không thể cập nhật trực tiếp, vui lòng cập nhật Magisk bằng **Magisk on Nox**

- Nếu bạn cài đặt Magisk vào `ramdisk.img`, bạn có thể sử dụng tùy chọn **Cập nhật nhị phân** để cập nhật **Magisk** mà không cần phải vá lại `ramdisk.img`!


## Các câu hỏi thường gặp

[Vui lòng truy cập trang này](https://github.com/HuskyDG/MagiskOnNox/wiki)

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
