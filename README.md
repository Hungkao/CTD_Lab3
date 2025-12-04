# KPL Parser: Mở rộng Cấu trúc Lệnh

Dự án này bổ sung các tính năng lập trình sau vào KPL Parser, tập trung sửa đổi các file **`parser.c`**, **`scanner.c`** và **`charcode.c`**.

##  Tính năng Mới

1.  **Cấu trúc Lặp `REPEAT...UNTIL`**
    * **Cú pháp:** `REPEAT <statement> UNTIL <condition>`
    * **File bị ảnh hưởng:** `parser.c` (thêm `compileRepeatSt`), `token.h`, `scanner.c`.

2.  **Lệnh Gán Nhiều Biến (Multiple Assignment)**
    * **Cú pháp:** `x, y, arr[i] := exp1, exp2, exp3;`
    * **File bị ảnh hưởng:** `parser.c` (sửa `compileAssignSt`).

##  Khắc phục Lỗi Cú pháp

* **Lỗi VAR List:** Sửa `parser.c` (hàm `compileVarDecl`) để xử lý danh sách biến (`i, j, k : TYPE;`).
* **Lỗi ARRAY Index:** Sửa `parser.c` (hàm `compileType`), `scanner.c` và `charcode.c` để chấp nhận hằng số (`MAX`) và ký hiệu `[` / `]` trong khai báo mảng.
