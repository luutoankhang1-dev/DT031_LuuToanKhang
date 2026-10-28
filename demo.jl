include(joinpath(@__DIR__, "src", "DeTai.jl"))
using .DeTai

println("="^60)
println("DO AN CA NHAN - INT13185 (NHOM 03)")
println("Sinh vien: Luu Toan Khang - MSSV: N24DCDT035 - Lop: D24CQDT01-N")
println("De tai DT031: Liet ke xau nhi phan bang sinh ke tiep")
println("="^60)

println("\n--- [A01] CHAY VI DU 1 TREN PHIEU: n = 2 ---")
ds1, so_xau1, _ = liet_ke(2; in_ra=true)
println("Ket qua: danh sach = $ds1 | so_xau = $so_xau1 (Ky vong: 4 xau)")

println("\n--- [A02] CHAY VI DU 2 TREN PHIEU: n = 3 ---")
ds2, so_xau2, _ = liet_ke(3; in_ra=true)
println("Ket qua: danh sach = $ds2 | so_xau = $so_xau2 (Ky vong: 8 xau)")

println("\n--- CHAY THU NGHIEM NHAP TU BAN PHIM ---")
print("Nhap so nguyen n (1 <= n <= 16, khuyen nghi n <= 4 de quan sat): ")
input_str = readline()
try
    n_input = parse(Int, strip(input_str))
    println("\nLiet ke cac xau nhi phan do dai n = $n_input:")
    ds, tong_xau, tong_xet = liet_ke(n_input; in_ra=true)
    println("-"^40)
    println("Tong so xau sinh duoc: $tong_xau (cong thuc 2^$n_input = $(2^n_input))")
    println("Tong so lan kiem tra bit: $tong_xet")
catch e
    println("Loi: ", e)
end
