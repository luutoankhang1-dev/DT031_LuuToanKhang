# DT031 — Liệt kê xâu nhị phân bằng sinh kế tiếp

Dự án đồ án học phần **Cấu trúc dữ liệu và giải thuật (INT13185)** — Nhóm 03.

## Thông tin sinh viên và đề tài

- **Họ và tên:** Lưu Toàn Khang
- **Mã số sinh viên (MSSV):** N24DCDT035
- **Lớp:** D24CQDT01-N
- **Mã đề tài:** DT031
- **Tên đề tài:** Liệt kê xâu nhị phân bằng sinh kế tiếp
- **Giảng viên hướng dẫn:** Hồ Nhựt Minh
- **Giáo trình tham chiếu:** *Cấu trúc dữ liệu và giải thuật (INT1306)*, Học viện Công nghệ Bưu chính Viễn thông.
- **Căn cứ giáo trình:** Chương 3, Mục 3.2.2 Sinh xâu nhị phân; Ví dụ 3.1; Bài tập chương 3, câu 13 và 20; trang in 64–65, 85–86; trang PDF 76–77, 97–98.
- **Phiên bản Julia:** `1.12.6`

## Cấu trúc mã nguồn

```text
DT031_LuuToanKhang/
├── README.md             # Tài liệu hướng dẫn và thông tin đồ án
├── .gitignore            # Cấu hình bỏ qua tệp tạm
├── demo.jl               # Kịch bản chạy demo (A01, A02) và nhập từ bàn phím
├── src/
│   └── DeTai.jl          # Module thuật toán: kiem_tra_dau_vao, in_xau, sinh_tiep!, liet_ke, liet_ke_quay_lui
├── test/
│   └── runtests.jl       # Bộ 12 ca kiểm thử tự động độc lập (30 asserts)
└── docs/
    └── anh_ket_qua/      # Thư mục chứa ảnh minh chứng thực nghiệm
```

## Hướng dẫn cài đặt và chạy chương trình

Yêu cầu hệ thống: Máy tính đã cài đặt **Julia** (khuyến nghị phiên bản 1.10 trở lên).

Mở terminal (PowerShell hoặc Command Prompt) tại thư mục `DT031_LuuToanKhang`:

### 1. Kiểm tra phiên bản Julia
```powershell
julia --version
```

### 2. Chạy kịch bản minh họa (Demo)
```powershell
julia --startup-file=no demo.jl
```
- Tự động chạy Ví dụ 1 trên phiếu: $n = 2$ (sinh 4 xâu nhị phân).
- Tự động chạy Ví dụ 2 trên phiếu: $n = 3$ (sinh 8 xâu nhị phân).
- Cho phép người dùng nhập $n$ tùy ý ($1 \le n \le 16$) từ bàn phím để quan sát kết quả sinh, tổng số xâu và tổng số lần kiểm tra bit.

### 3. Chạy bộ kiểm thử tự động (Unit Tests)
```powershell
julia --startup-file=no test/runtests.jl
```

## Kết quả kiểm thử thực tế

Chương trình đã được kiểm thử toàn diện với **12 ca kiểm thử độc lập** (A01 đến A12) gồm **30 phép kiểm tra (asserts)** bằng thư viện chuẩn `Test` của Julia:
- **A01 & A02:** Hai ví dụ trên phiếu ($n = 2$ sinh 4 xâu, $n = 3$ sinh 8 xâu).
- **A03:** Ca tự thiết kế ($n = 4$ sinh 16 xâu, đầu `"0000"`, cuối `"1111"`).
- **A04:** Đối chiếu tính đúng và thứ tự từ điển giữa phương pháp Sinh kế tiếp và Đệ quy quay lui ($n = 5$).
- **A05:** Ca biên nhỏ nhất ($n = 1$ sinh 2 xâu `"0"` và `"1"`).
- **A06:** Ca biên bước sinh trung gian then chốt $[0, 1, 1] \rightarrow [1, 0, 0]$ (vị trí đổi bit $i = 1$).
- **A07:** Ca biên cấu hình cuối $[1, 1, 1]$ kích hoạt điều kiện dừng, trả về `false`, không quay vòng.
- **A08:** Kiểm tra validator từ chối dữ liệu không hợp lệ ($n = 0, n = -5, n = 17$).
- **A09:** Kiểm tra bất biến không trùng lặp các xâu sinh ra (`unique(ds) == 2^n`).
- **A10:** Kiểm tra bất biến thứ tự từ điển tăng nghiêm ngặt (`issorted(ds)`).
- **A11:** Kiểm tra bất biến số lượng cấu hình luôn bằng $2^n$ với $n \in [1, 6]$.
- **A12:** Kiểm tra hàm `in_xau` bảo toàn đủ các chữ số 0 ở đầu.

**Kết quả:** `100% Pass` (30/30 asserts đạt tuyệt đối).
