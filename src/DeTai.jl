module DeTai

export kiem_tra_dau_vao, in_xau, sinh_tiep!, liet_ke, liet_ke_quay_lui

"""
    kiem_tra_dau_vao(n)

Hợp đồng kiểm tra đầu vào:
- n phải là số nguyên (Integer).
- 1 <= n <= 16 theo đúng giới hạn trên phiếu giao đề tài.
Trả về true nếu hợp lệ, ném ngoại lệ ArgumentError nếu vi phạm.
"""
function kiem_tra_dau_vao(n)
    if !(n isa Integer)
        throw(ArgumentError("Gia tri n phai la so nguyen."))
    end
    if n < 1 || n > 16
        throw(ArgumentError("Gia tri n = $n nam ngoai mien hop le [1, 16]."))
    end
    return true
end

"""
    in_xau(x::Vector{Int}) -> String

Chuyển đổi mảng bit x thành chuỗi ký tự '0' và '1', bảo toàn đủ n bit (kể cả số 0 ở đầu).
"""
function in_xau(x::Vector{Int})
    return join(string.(x))
end

"""
    sinh_tiep!(x::Vector{Int}) -> (co_the_sinh::Bool, so_lan_xet_bit::Int, vi_tri_doi::Int)

Thực hiện phép tăng nhị phân trên mảng x:
- Duyệt từ phải sang trái (từ n về 1) tìm bit 0 đầu tiên.
- Các bit 1 đi qua được lật thành 0.
- Lật bit 0 tìm thấy thành 1.
- Nếu không còn bit 0 (toàn bit 1), trả về false (hết cấu hình).
"""
function sinh_tiep!(x::Vector{Int})
    n = length(x)
    i = n
    so_lan_xet = 0

    while i >= 1 && x[i] == 1
        so_lan_xet += 1
        x[i] = 0
        i -= 1
    end

    if i >= 1
        so_lan_xet += 1
        x[i] = 1
        return (true, so_lan_xet, i)
    else
        # Toàn bit 1: đã duyệt hết cấu hình
        return (false, so_lan_xet, 0)
    end
end

"""
    liet_ke(n; in_ra::Bool=false) -> (danh_sach_xau, tong_so_xau, tong_so_lan_xet)

Liệt kê toàn bộ 2^n xâu nhị phân theo thứ tự từ điển bằng phương pháp sinh kế tiếp.
"""
function liet_ke(n::Integer; in_ra::Bool=false)
    kiem_tra_dau_vao(n)
    
    x = zeros(Int, n) # Cấu hình ban đầu: toàn số 0
    danh_sach = String[]
    tong_so_xau = 0
    tong_so_lan_xet = 0

    # Xử lý cấu hình đầu tiên
    tong_so_xau += 1
    xau = in_xau(x)
    push!(danh_sach, xau)
    if in_ra
        println(xau)
    end

    # Vòng lặp sinh các cấu hình tiếp theo
    while true
        con_sinh, so_lan_xet, _ = sinh_tiep!(x)
        tong_so_lan_xet += so_lan_xet
        if !con_sinh
            break
        end
        tong_so_xau += 1
        xau = in_xau(x)
        push!(danh_sach, xau)
        if in_ra
            println(xau)
        end
    end

    return (danh_sach, tong_so_xau, tong_so_lan_xet)
end

"""
    liet_ke_quay_lui(n) -> Vector{String}

(Thuật toán bổ sung theo yêu cầu mục 3.3.3 giáo trình)
Liệt kê xâu nhị phân bằng đệ quy quay lui để đối chiếu tính đúng và thứ tự từ điển.
"""
function liet_ke_quay_lui(n::Integer)
    kiem_tra_dau_vao(n)
    danh_sach = String[]
    x = zeros(Int, n)

    function quay_lui(i)
        for val in 0:1
            x[i] = val
            if i == n
                push!(danh_sach, in_xau(x))
            else
                quay_lui(i + 1)
            end
        end
    end

    quay_lui(1)
    return danh_sach
end

end # module DeTai
