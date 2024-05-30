﻿------------------------------------------------------------------ -- Mã sinh viên:23T1080051 -- Họ và tên:Nguyễn Đình Khánh Nguyên -- -- Sử dụng CSDL Quản lý bán hàng, viết các câu lệnh SELECT thực hiện -- Các yêu cầu truy vấn dữ liệu dưới đây. -- Lưu ý: Viết lệnh ngay bên dưới mỗi câu. -------------------------------------------------------------------  --Hiển thị mã hàng, tên hàng, đơn vị tính, giá và tên nhà cung cấp --của các mặt hàng thuộc loại hàng 'Điện tử', sắp xếp theo thứ tự --nhà cung cấp và giảm dần của giá Select m.MaHang,m.TenHang,m.DonViTinh,m.Gia,n.TenNCC From MatHang AS m 	JOIN NhaCungCap AS n 		ON m.MaNCC=n.MaNCC 	JOIN LoaiHang AS l 		ON l.MaLoaiHang=m.MaLoaiHang Where l.TenLoaiHang=N'Điện tử' Order by n.TenNCC, m.Gia Desc --Hiển thị danh sách các mặt hàng thuộc loại hàng 'Điện tử' có giá từ  --10 triệu đến 20 triệu và các mặt hàng thuộc loại hàng 'Hàng gia dụng' --có giá từ 5 đến 10 triệu Select m.* From MatHang AS m 	JOIN LoaiHang AS l 		ON l.MaLoaiHang=m.MaLoaiHang Where (l.TenLoaiHang=N'Hàng gia dụng' 		and (m.Gia Between 10000000 and 20000000)) 	OR(l.TenLoaiHang=N'Điện tử' 		and (m.Gia Between 5000000 and 10000000))  --Hãy cho biết thông tin về mặt hàng và loại hàng của những mặt hàng --được cung cấp bởi nhà cung cấp 'Điện máy Xanh' Select m.*,l.* From MatHang AS m 	JOIN NhaCungCap AS n 		ON m.MaNCC=n.MaNCC 	JOIN LoaiHang AS l 		ON l.MaLoaiHang=m.MaLoaiHang Where n.TenNCC=N'Điện máy Xanh' --Cho biết thông tin về mặt hàng, loại hàng và nhà cung cấp của những --mặt hàng là áo nữ hoặc giày nam (dựa vào tên mặt hàng) Select m.*,l.*,n.* From MatHang AS m 	JOIN NhaCungCap AS n 		ON m.MaNCC=n.MaNCC 	JOIN LoaiHang AS l 		ON l.MaLoaiHang=m.MaLoaiHang Where (m.TenHang Like N'Áo%' 		And m.TenHang Like N'%nữ%' 	) or (m.TenHang Like N'Giày%' 		And m.TenHang Like N'%Nam%' 	) --Hãy cho biết địa chỉ, điện thoại và tỉnh của khách hàng Trương Thị Thu Thảo Select k.TenKhachHang,k.DiaChiLienHe,k.DienThoai,t.TenTinh From KhachHang AS k 	Join TinhThanh AS t 		ON k.MaTinh=t.MaTinh Where k.TenKhachHang = N'Trương Thị Thu Thảo'  --Hiển thị tên, địa chỉ, sinh nhật, điện thoại của những khách hàng --ở Thừa Thiên Huế có sinh nhật trong tháng hiện tại Select k.TenKhachHang,k.DiaChiLienHe,k.SinhNhat,k.DienThoai From KhachHang AS k 	Join TinhThanh AS t 		ON k.MaTinh=t.MaTinh Where t.TenTinh=N'Thừa Thiên Huế' AND  		MONTH(k.SinhNhat)=MONTH(Getdate())  --Hãy cho biết tên, địa chỉ, điện thoại và tỉnh của những khách hàng --ở Thừa Thiên Huế, Quảng Trị, Quảng Bình và Đà Nẵng sử dụng điện thoại --bắt đầu bởi số 098 và kết thúc bởi số 3 hoặc số 9, sắp xếp theo từng tỉnh. Select k.TenKhachHang,k.DiaChiLienHe,k.DienThoai,t.TenTinh From KhachHang AS k 	Join TinhThanh AS t 		ON k.MaTinh=t.MaTinh Where t.TenTinh in (N'Thừa Thiên Huế',N'Quảng Trị' 		,N'Đà Nẵng',N'Quảng Bình') AND  		k.DienThoai like N'098%[39]' Order by t.TenTinh --Cho biết tên, địa chỉ, điện thoại và tỉnh của những khách hàng --có đơn mua hàng trong ngày 17/7/2022 Select k.TenKhachHang,k.DiaChiLienHe,k.DienThoai,t.TenTinh From KhachHang AS k 	Join TinhThanh AS t 		ON k.MaTinh=t.MaTinh 	Join HoaDonBanHang AS h 		ON k.MaKhachHang=h.MaKhachHang Where	day(h.NgayLapHoaDon) =17 		and MONTH(h.NgayLapHoaDon)=7 		and YEAR(h.NgayLapHoaDon)=2022   --Cho biết số hóa đơn, ngày lập hóa đơn, ngày giao hàng, mã, tên, địa chỉ --và điện thoại khách hàng của những đơn hàng được lập trong khoảng --thời gian từ ngày 1/4/2022 đến ngày 30/4/2022. Select h.*,k.MaKhachHang,k.TenKhachHang,k.DiaChiLienHe,k.DienThoai From KhachHang AS k 	Join TinhThanh AS t 		ON k.MaTinh=t.MaTinh 	Join HoaDonBanHang AS h 		ON k.MaKhachHang=h.MaKhachHang Where	day(h.NgayLapHoaDon) between 1 and 30 		and MONTH(h.NgayLapHoaDon)=4 		and YEAR(h.NgayLapHoaDon)=2022   --Hãy cho biết trong khoảng thời gian từ ngày 1/5/2021 đến 15/5/2021 --đã lập phiếu thu tiền của những đơn hàng nào, ai là người thanh toán  --và số tiền thu ở mỗi lần là bao nhiêu (lưu ý: người thanh toán tiền --chính là người mua hàng) Select h.SoHoaDon,k.TenKhachHang,p.SoTien From KhachHang AS k 	Join TinhThanh AS t 		ON k.MaTinh=t.MaTinh 	Join HoaDonBanHang AS h 		ON k.MaKhachHang=h.MaKhachHang 	JOIN PhieuThuTien AS p 		On p.SoHoaDon=h.SoHoaDon Where day(p.NgayLap) between 1 and 15 		and MONTH(p.NgayLap)=5 		and YEAR(p.NgayLap)=2022  Order by k.TenKhachHang  --Trong tháng 11 năm 2022 đã lập hóa đơn bán hàng cho khách hàng ở --những tỉnh nào?  Select distinct t.TenTinh From KhachHang AS k 	Join TinhThanh AS t 		ON k.MaTinh=t.MaTinh 	Join HoaDonBanHang AS h 		ON k.MaKhachHang=h.MaKhachHang Where	MONTH(h.NgayLapHoaDon)=11 		and YEAR(h.NgayLapHoaDon)=2022  --Hãy cho biết danh sách các mặt hàng đã bán được trong tháng 11 năm 2022 Select m.TenHang From KhachHang AS k 	Join HoaDonBanHang AS h 		ON k.MaKhachHang=h.MaKhachHang 	Join ChiTietHoaDon AS c 		ON h.SoHoaDon=c.SoHoaDon 	Join MatHang AS m 		On m.MaHang=c.MaHang Where	MONTH(h.NgayLapHoaDon)=11 		and YEAR(h.NgayLapHoaDon)=2022   --Hãy cho biết danh sách các mặt hàng không bán được trong tháng 11 năm 2022 Select m.* From MatHang AS m 	Join ChiTietHoaDon AS c 		On m.MaHang=c.MaHang 	left Join HoaDonBanHang AS h 		ON h.SoHoaDon=c.SoHoaDon and (MONTH(h.NgayLapHoaDon)=11 		and YEAR(h.NgayLapHoaDon)=2022 ) Where h.SoHoaDon is NULL  --Hiển thị mã và tên của các tỉnh hiện chưa có khách hàng Select t.TenTinh From TinhThanh AS t 	Left join KhachHang AS k 		On t.MaTinh=k.MaTinh Where k.MaKhachHang is NULL --Hãy cho biết số hóa đơn, mã khách hàng, tên khách hàng, địa chỉ khách hàng, --ngày lập hóa đơn và ngày giao hàng của những đơn hàng đầu tiên --của tháng 9 năm 2021 (căn cứ vào ngày lập hóa đơn) Select top(10) h.SoHoaDon,k.TenKhachHang,k.MaKhachHang,k.DiaChiLienHe 		,h.NgayLapHoaDon,h.NgayGiaoHang From KhachHang AS k 	Join TinhThanh AS t 		ON k.MaTinh=t.MaTinh 	Join HoaDonBanHang AS h 		ON k.MaKhachHang=h.MaKhachHang Where day(h.NgayGiaoHang) between 1 and 15 		and MONTH(h.NgayGiaoHang)=9 		and YEAR(h.NgayGiaoHang)=2022  Order by day(h.NgayLapHoaDon)  --Hiển thị mã hàng, tên hàng, mã loại hàng, tên loại hàng, mã nhà cung cấp --tên nhà cung cấp và giá của những mặt hàng có giá cao nhất trong số --các mặt hàng cùng loại.  SELECT M.MaHang, M.TenHang, M.MaLoaiHang, L.TenLoaiHang, M.MaNCC, N.TenNCC, M.Gia FROM MatHang AS M JOIN LoaiHang AS L ON M.MaLoaiHang = L.MaLoaiHang JOIN NhaCungCap AS N ON M.MaNCC = N.MaNCC WHERE M.gia = (SELECT MAX(Gia) FROM MatHang AS M2 WHERE M2.MaLoaiHang = M.MaLoaiHang);  --Mỗi loại hàng hiện có bao nhiêu mặt hàng? Select l.MaLoaiHang,l.TenLoaiHang,COUNT(m.MaHang) as sl From LoaiHang as l 	Left join MatHang as m 		on m.MaLoaiHang=l.MaLoaiHang group by l.MaLoaiHang,l.TenLoaiHang  --Số lượng khách hàng hiện có của mỗi tỉnh thành là bao nhiêu? Select t.MaTinh,t.TenTinh, COUNT(k.MaKhachHang) as slkh From TinhThanh as t 	Left join KhachHang as k 	 On t.MaTinh=k.MaTinh group by t.MaTinh,t.TenTinh  --Hãy cho biết mỗi đơn hàng được lập trong quý 4 năm 2021 là của khách --hàng nào và tổng số tiền (mà khách hàng phải trả) của mỗi đơn hàng  --là bao nhiêu  SELECT KH.TenKhachHang, DH.SoHoaDon,     SUM(CT.SoLuong * CT.DonGia) AS TongTien FROM KhachHang AS KH 	JOIN HoaDonBanHang AS DH ON KH.MaKhachHang = DH.MaKhachHang 	JOIN ChiTietHoaDon AS CT ON DH.SoHoaDon = CT.SoHoaDon WHERE     YEAR(DH.NgayLapHoaDon) = 2021 AND (Month(DH.NgayLapHoaDon) Between 10 and 12) GROUP BY KH.TenKhachHang, DH.SoHoaDon  --Thống kê xem mỗi khách hàng đã mua hàng với tổng số tiền là bao nhiêu. Select k.TenKhachHang,ISNULL(SUM(c.DonGia), 0) From KhachHang as k 	left Join HoaDonBanHang AS h 		On k.MaKhachHang=h.MaKhachHang 	left Join ChiTietHoaDon as c 		on c.SoHoaDon=h.SoHoaDon Group by k.TenKhachHang  --Thống kê xem trong tháng 1 năm 2021, mỗi khách hàng đã mua hàng với --tổng số tiền là bao nhiêu. Select k.TenKhachHang,ISNULL(SUM(c.DonGia), 0) From KhachHang as k 	left Join HoaDonBanHang AS h 		On k.MaKhachHang=h.MaKhachHang and (MONTH(h.NgayGiaoHang)=1 		and YEAR(h.NgayGiaoHang)=2021 ) 	left Join ChiTietHoaDon as c 		on c.SoHoaDon=h.SoHoaDon  Group by k.TenKhachHang --Hãy cho biết tổng số lượng và doanh thu bán hàng của mỗi mặt hàng SELECT m.MaHang, m.TenHang, COUNT(c.SoHoaDon) as sl, SUM(ISNULL(c.DonGia, 0)) as tonggia FROM MatHang AS m 	LEFT JOIN ChiTietHoaDon AS c ON m.MaHang = c.MaHang GROUP BY m.MaHang, m.TenHang --Hãy cho biết tổng số lượng và doanh thu bán hàng của mỗi mặt hàng --trong năm 2021 SELECT m.MaHang, m.TenHang, COUNT(c.SoHoaDon) as sl, SUM(ISNULL(c.DonGia, 0)) as tonggia FROM MatHang AS m 	LEFT JOIN ChiTietHoaDon AS c  	ON m.MaHang = c.MaHang 	LEFT JOIN HoaDonBanHang as h 	ON h.SoHoaDon=c.SoHoaDon where year(h.NgayLapHoaDon)=2021 GROUP BY m.MaHang, m.TenHang  --Thống kê số lượng đơn hàng được lập trong mỗi tháng của năm 2021 select * from HoaDonBanHang as h group by  (select distinct MONTH(h.NgayLapHoaDon) as thang from HoaDonBanHang as h where Year(h.NgayLapHoaDon)=2021)  --Thống kê số lượng hàng bán được trong mỗi tháng của năm 2021 của từng --mặt hàng. Kết quả thống kê được hiển thị dưới dạng bảng có các cột --như sau: --     Mã hàng    Tên hàng     Tháng 1    Tháng 2   ..... Tháng 12 --      --Trong đó: các cột Tháng 1, Tháng 2,... cho biết tổng số lượng hàng bán --được trong tháng đó của mặt hàng  SELECT     M.MaHang,     M.TenHang,     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 1 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 1',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 2 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 2',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 3 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 3',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 4 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 4',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 5 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 5',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 6 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 6',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 7 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 7',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 8 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 8',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 9 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 9',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 10 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 10',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 11 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 11',     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 12 THEN CT.SoLuong ELSE 0 END) AS 'Tháng 12' FROM     MatHang AS M JOIN     ChiTietHoaDon AS CT ON M.MaHang = CT.MaHang JOIN     HoaDonBanHang AS HD ON CT.SoHoaDon=HD.SoHoaDon WHERE     YEAR(HD.NgayLapHoaDon) = 2021 GROUP BY     M.MaHang, M.TenHang;  --Hãy cho biết doanh thu bán hàng của những mặt hàng có doanh thu bán hàng --cao nhất  SELECT     M.MaHang,     M.TenHang,     SUM(CASE WHEN MONTH(HD.NgayLapHoaDon) = 1 THEN CT.SoLuong ELSE 0 END) AS 'Max' FROM MatHang AS M JOIN     ChiTietHoaDon AS CT ON M.MaHang = CT.MaHang JOIN     HoaDonBanHang AS HD ON CT.SoHoaDon=HD.SoHoaDon WHERE     YEAR(HD.NgayLapHoaDon) = 2021 GROUP BY     M.MaHang, M.TenHang;  --Hãy cho biết doanh thu bán hàng của những mặt hàng có doanh thu bán hàng --cao nhất trong năm 2021  SELECT M.MaHang, M.TenHang, SUM(CT.SoLuong * CT.DonGia) AS DoanhThu FROM MatHang AS M JOIN ChiTietHoaDon AS CT ON M.MaHang = CT.MaHang GROUP BY M.MaHang, M.TenHang HAVING Sum(CT.SoLuong * CT.DonGia) = (     SELECT TOP 1 sum(CT.SoLuong * CT.DonGia) AS DoanhThu     FROM MatHang AS M     JOIN ChiTietHoaDon AS CT ON M.MaHang = CT.MaHang     GROUP BY M.MaHang, M.TenHang     ORDER BY DoanhThu DESC )   --Hãy cho biết doanh thu bán hàng của những mặt hàng có doanh thu bán hàng --cao nhất trong mỗi tháng của năm 2021  SELECT M.MaHang, M.TenHang,T.thang,sum(T.DoanhThu) as Tong FROM     (         SELECT MONTH(HD.NgayLapHoaDon) AS thang, max(CT.SoLuong * CT.DonGia) AS DoanhThu         FROM HoaDonBanHang AS HD         JOIN ChiTietHoaDon AS CT  			ON HD.SoHoaDon = CT.SoHoaDon         WHERE YEAR(HD.NgayLapHoaDon) = 2021         GROUP BY MONTH(NgayLapHoaDon)     ) AS T JOIN HoaDonBanHang AS HD  	ON MONTH(HD.NgayLapHoaDon) = T.thang JOIN ChiTietHoaDon AS CT  	ON HD.SoHoaDon = CT.SoHoaDon AND CT.SoLuong * CT.DonGia = T.DoanhThu JOIN MatHang AS M  	ON CT.MaHang = M.MaHang group by M.MaHang, M.TenHang,T.thang order by thang