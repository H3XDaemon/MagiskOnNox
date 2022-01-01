# Magisk On Nox
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

Cài đặt Magisk vào system image

Khuyến nghị cho trình giả lập Android, vì bạn không có `ramdisk.img`.  Ngoài ra việc giải nén `ramdisk.img` thông qua môi trường giả lập Android cũng rất khó.

1. Đi tới cài đặt giả lập, bật Root tích hợp sẵn và khởi động lại

- **Bluestacks:** Vì trình giả lập Bluestacks không có tùy chọn root tích hợp, vì vậy bạn cần sử dụng ** Bluestacks Tweaker ** để cài đặt **SuperSU** cho root


 2. Tải xuống và cài đặt **Magisk On Nox**.  Mở và cấp quyền truy cập root cho ứng dụng **Magisk On Nox**
 3. Làm theo menu để cài đặt Magisk. Đây là 3 bản Magisk mà bạn có thể cài đặt: Canary, Alpha và Stable

 4. Vào cài đặt giả lập, vô hiệu hóa Root tích hợp và khởi động lại. Đối với Bluestacks, nhấn nút **UnPatch** trong **Bluestacks Tweaker** để xóa **SuperSU**.

### Vá đĩa ảnh ramdisk

 Được đề xuất cho dự án Android x86 (BlissOS, PhoenixOS)

Hướng dẫn này khá khó hiểu và có thể không dành cho người dùng thông thường

Bạn phải có bản sao của `ramdisk.img`.  Nó thường được đặt trong thư mục BlissOS / PhoenixOS trên HĐH Windows.  Lấy và chuyển nó vào **Bộ nhớ trong** của môi trường Android x86, hiện tại không thể giải nén trực tiếp từ môi trường Android x86.


 Bạn có thể vá `ramdisk.img` thông qua trình giả lập như ** NoxPlayer ** và sau đó lấy `ramdisk.img` mới

 Hoặc vá ramdisk thông qua môi trường Android x86:

  `data.img` sẽ được gắn vào `/data` khi bạn khởi động vào **BlissOS/PhoenixOS**.  Nếu không thể di chuyển tệp giữ Windows và BlissOS/PhoenixOS, bạn có thể sử dụng phần mềm **[AnyBurn](https://anyburn.com/download.php)** để đọc `data.img` (Hình ảnh bộ nhớ trong) và đặt vào hoặc lấy ra `ramdisk.img`

 1. Khởi động vào **BlissOS/PhoenixOS**.  Cài đặt **Magisk on Nox** và mở, cấp quyền truy cập root nếu bạn có!

 2. Nếu bạn không có quyền truy cập root, hãy nhấn *ALT + F1* để mở root shell, sau đó gõ lệnh này:

 ``
 /data/data/io.github.huskydg.magiskonnox/magisk/menu
 ``

 3. Một menu sẽ hiển thị, hãy làm theo *Cài đặt /cập nhật Magisk *> * Bản dựng Magisk* > *Vá hình ảnh đĩa ram* và nhập đường dẫn đến hình ảnh đĩa ram của bạn (ramdisk.img), nhấn Enter và nó sẽ vá `ramdisk.img`

 4. Bây giờ di chuyển `ramdisk.img` mới sang ổ đĩa Windows

 5. Khởi động vào **Hệ điều hành Windows**.  Mở **File Exploerer**, điều hướng đến thư mục BlissOS / PhoenixOS, đảm bảo rằng bạn đã sao lưu `ramdisk.img` cũ và thay thế no bằng `ramdisk.img` mới.

5. Khởi động vào **BlissOS/PhoenixOS** và thưởng t **Magisk**.

## Cập nhật Magisk

Vì Nox và các giả lập thường không có đĩa ảnh boot nên bạn không thể cập nhật trực tiếp, vui lòng cập nhật Magisk bằng **Magisk on Nox**

## Các câu hỏi thường gặp

[Vui lòng truy cập trang này](https://github.com/HuskyDG/MagiskOnNox/wiki)

## Credits
- [Magisk](https://github.com/topjohnwu/Magisk): The most famous root solution on Android
- [MagiskOnWSA](https://github.com/LSPosed/MagiskOnWSA): For Magisk on WSA script, how to integrate Magisk on Emulator
