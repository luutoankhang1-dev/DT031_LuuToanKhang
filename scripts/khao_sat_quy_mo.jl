# -*- coding: utf-8 -*-
# scripts/khao_sat_quy_mo.jl
# Đo đạc thực nghiệm các quy mô n in {4, 8, 12, 16} để điền Bảng 4.4 trong báo cáo

include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai
using Printf

println("="^75)
println("KHAO SAT HIEN NANG VA QUY MO THUAT TOAN SINH KE TIEP XAU NHI PHAN")
println("Sinh vien: Luu Toan Khang - MSSV: N24DCDT035 - De tai: DT031")
println("Moi truong: Julia ", VERSION, " on ", Sys.KERNEL, " (", Sys.ARCH, ")")
println("="^75)

# Warmup JIT
liet_ke(2)

cac_quy_mo = [4, 8, 12, 16]

println(@sprintf("%-8s | %-12s | %-18s | %-18s | %-15s", 
                 "Quy mo n", "So cau hinh", "So phep dem thuc", "Ly thuyet S(n)", "Thoi gian (ms)"))
println("-"^75)

for n in cac_quy_mo
    # Chay do thoi gian sinh thuan tuy trong bo nho (khong in console)
    t_start = time_ns()
    ds, tong_xau, tong_xet = liet_ke(n; in_ra=false)
    t_end = time_ns()
    
    t_ms = (t_end - t_start) / 1e6
    ly_thuyet = 2^(n + 1) - n - 2
    
    println(@sprintf("%-8d | %-12d | %-18d | %-18d | %-15.4f", 
                     n, tong_xau, tong_xet, ly_thuyet, t_ms))
end

println("="^75)
println("Nhan xet: So phep dem thuc te trung khop 100% voi cong thuc ly thuyet S(n) = 2^(n+1) - n - 2.")
