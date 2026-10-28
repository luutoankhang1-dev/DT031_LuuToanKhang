using Test
include(joinpath(@__DIR__, "..", "src", "DeTai.jl"))
using .DeTai

@testset "BO KIEM THU 12 CA DOC LAP - DT031 (Luu Toan Khang)" begin

    # A01: Vi du 1 tren phieu (n = 2)
    @testset "Ca A01: Vi du 1 (n = 2)" begin
        ds, tong, _ = liet_ke(2)
        @test ds == ["00", "01", "10", "11"]
        @test tong == 4
    end

    # A02: Vi du 2 tren phieu (n = 3)
    @testset "Ca A02: Vi du 2 (n = 3)" begin
        ds, tong, _ = liet_ke(3)
        @test ds == ["000", "001", "010", "011", "100", "101", "110", "111"]
        @test tong == 8
    end

    # A03: Tu thiet ke 1 (n = 4)
    @testset "Ca A03: Tu thiet ke 1 (n = 4)" begin
        ds, tong, _ = liet_ke(4)
        @test tong == 16
        @test ds[1] == "0000"
        @test ds[end] == "1111"
        @test all(length(s) == 4 for s in ds)
    end

    # A04: Tu thiet ke 2 - Doi chieu sinh ke tiep voi De quy quay lui (n = 5)
    @testset "Ca A04: Doi chieu Sinh ke tiep voi Quay lui (n = 5)" begin
        ds_sinh, tong, _ = liet_ke(5)
        ds_quaylui = liet_ke_quay_lui(5)
        @test ds_sinh == ds_quaylui
        @test tong == 32
    end

    # A05: Ca bien 1 - Gia tri nho nhat (n = 1)
    @testset "Ca A05: Ca bien nho nhat (n = 1)" begin
        ds, tong, _ = liet_ke(1)
        @test ds == ["0", "1"]
        @test tong == 2
    end

    # A06: Ca bien 2 tren phieu - Kiem tra buoc sinh trung gian [0, 1, 1] -> [1, 0, 0]
    @testset "Ca A06: Buoc sinh don [0, 1, 1]" begin
        x = [0, 1, 1]
        con, xet, pos = sinh_tiep!(x)
        @test con == true
        @test x == [1, 0, 0]
        @test pos == 1
    end

    # A07: Ca bien 3 tren phieu - Kiem tra cau hinh cuoi [1, 1, 1] bao het
    @testset "Ca A07: Cau hinh cuoi [1, 1, 1] bao het" begin
        x = [1, 1, 1]
        con, xet, pos = sinh_tiep!(x)
        @test con == false
        @test pos == 0
    end

    # A08: Input khong hop le - n nam ngoai [1, 16] hoac sai kieu
    @testset "Ca A08: Validator tu choi input khong hop le" begin
        @test_throws ArgumentError kiem_tra_dau_vao(0)
        @test_throws ArgumentError kiem_tra_dau_vao(-5)
        @test_throws ArgumentError kiem_tra_dau_vao(17)
    end

    # A09: Bat bien khong trung lap cac xau sinh ra
    @testset "Ca A09: Bat bien - Khong trung lap xau (n = 4)" begin
        ds, tong, _ = liet_ke(4)
        @test length(unique(ds)) == tong
    end

    # A10: Bat bien thu tu tu dien tang nghiem ngat
    @testset "Ca A10: Bat bien - Thu tu tu dien tang nghiem ngat (n = 4)" begin
        ds, _, _ = liet_ke(4)
        @test issorted(ds)
    end

    # A11: Bat bien bao toan so luong 2^n voi nhieu quy mo
    @testset "Ca A11: Bat bien - So luong luon bang 2^n (n tu 1 den 6)" begin
        for n_val in 1:6
            _, tong, _ = liet_ke(n_val)
            @test tong == 2^n_val
        end
    end

    # A12: Kiem tra ham in_xau khong lam mat so 0 dau
    @testset "Ca A12: Ham in_xau bao toan so 0 dau" begin
        @test in_xau([0, 0, 0, 1]) == "0001"
        @test in_xau([0, 1, 0, 0]) == "0100"
    end
end
