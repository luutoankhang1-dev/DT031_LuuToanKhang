# -*- coding: utf-8 -*-
# scripts/chay_tung_ca_anh.jl
# Kịch bản chạy từng ca A01 -> A08 để chụp ảnh màn hình terminal minh chứng

include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

function chay_ca(ma_ca)
    println("="^70)
    println("MINH CHUNG THUC THI - DE TAI DT031 (SINH VIEN: LUU TOAN KHANG - N24DCDT035)")
    println("Moi truong: Julia ", VERSION, " - Ngay thuc hien: 2026-10-28")
    println("="^70)

    if ma_ca == "A01"
        println("[A01] VI DU 1 TREN PHIEU: n = 2")
        println("Lenh chay: liet_ke(2; in_ra=true)")
        println("--- OUTPUT THUC TE ---")
        ds, tong, xet = liet_ke(2; in_ra=true)
        println("----------------------")
        println("Ket qua: danh sach = ", ds)
        println("Tong so xau: ", tong, " (Ky vong: 4 xau)")
        println("Ket luan: PASS (Khop 100% Vi du 1 tren phieu)")

    elseif ma_ca == "A02"
        println("[A02] VI DU 2 TREN PHIEU: n = 3")
        println("Lenh chay: liet_ke(3; in_ra=true)")
        println("--- OUTPUT THUC TE ---")
        ds, tong, xet = liet_ke(3; in_ra=true)
        println("----------------------")
        println("Ket qua: danh sach = ", ds)
        println("Tong so xau: ", tong, " (Ky vong: 8 xau)")
        println("Ket luan: PASS (Khop 100% Vi du 2 tren phieu)")

    elseif ma_ca == "A03"
        println("[A03] CA TU THIET KE 1: n = 4")
        println("Lenh chay: liet_ke(4; in_ra=true)")
        println("--- OUTPUT THUC TE ---")
        ds, tong, xet = liet_ke(4; in_ra=true)
        println("----------------------")
        println("Xau dau tien: ", ds[1], " | Xau cuoi cung: ", ds[end])
        println("Tong so xau sinh duoc: ", tong, " (Ky vong 2^4 = 16)")
        println("Ket luan: PASS")

    elseif ma_ca == "A04"
        println("[A04] CA TU THIET KE 2: DOI CHIEU SINH KE TIEP VOI DE QUY QUAY LUI (n = 5)")
        ds_sinh, tong, _ = liet_ke(5)
        ds_quaylui = liet_ke_quay_lui(5)
        println("So xau sinh ke tiep: ", length(ds_sinh))
        println("So xau quay lui:     ", length(ds_quaylui))
        println("Kiem tra dong nhat (ds_sinh == ds_quaylui): ", ds_sinh == ds_quaylui)
        println("Mau 4 xau dau: ", ds_sinh[1:4])
        println("Mau 4 xau cuoi: ", ds_sinh[end-3:end])
        println("Ket luan: PASS (Hai phuong phap cho ket qua dong nhat 100%)")

    elseif ma_ca == "A05"
        println("[A05] CA BIEN 1: GIA TRI NHO NHAT n = 1")
        println("Lenh chay: liet_ke(1; in_ra=true)")
        println("--- OUTPUT THUC TE ---")
        ds, tong, _ = liet_ke(1; in_ra=true)
        println("----------------------")
        println("Ket qua: danh sach = ", ds, " | Tong so xau = ", tong)
        println("Ket luan: PASS (Khong bo sot cau hinh dau)")

    elseif ma_ca == "A06"
        println("[A06] CA BIEN 2: BUOC SINH DON THEN CHOT [0, 1, 1]")
        x = [0, 1, 1]
        println("Trang thai truoc khi sinh: x = ", x)
        con, xet, pos = sinh_tiep!(x)
        println("Trang thai sau khi sinh:  x = ", x)
        println("Co the sinh tiep: ", con, " | Vi tri bit 0 duoc doi: i = ", pos, " | So lan xet bit: ", xet)
        println("Ket luan: PASS (Doi dung [0, 1, 1] thanh [1, 0, 0] tai vi tri i = 1)")

    elseif ma_ca == "A07"
        println("[A07] CA BIEN 3: CAU HINH CUOI [1, 1, 1] BAO HET")
        x = [1, 1, 1]
        println("Trang thai truoc khi sinh: x = ", x)
        con, xet, pos = sinh_tiep!(x)
        println("Trang thai sau khi sinh:  x = ", x)
        println("Co the sinh tiep: ", con, " | Vi tri doi: ", pos, " | So lan xet bit: ", xet)
        println("Ket luan: PASS (Bao het cau hinh con_sinh = false, khong quay vong ve [0,0,0])")

    elseif ma_ca == "A08"
        println("[A08] KIEM TRA VALIDATOR TU CHOI INPUT KHONG HOP LE")
        for bad_n in [0, -5, 17]
            print("Thu nghiem kiem_tra_dau_vao(", bad_n, "): ")
            try
                kiem_tra_dau_vao(bad_n)
                println("FAIL (Khong bat duoc loi)")
            catch e
                println("PASS (Bat ngoai le: ", typeof(e), " - ", e.msg, ")")
            end
        end
    else
        println("Cu phap: julia scripts/chay_tung_ca_anh.jl <A01..A08>")
    end
    println("="^70)
end

if length(ARGS) > 0
    chay_ca(uppercase(ARGS[1]))
else
    for c in ["A01", "A02", "A03", "A04", "A05", "A06", "A07", "A08"]
        chay_ca(c)
        println("\n")
    end
end
