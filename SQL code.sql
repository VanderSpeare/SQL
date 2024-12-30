﻿--BEGIN /** PHONGBAN **/
--ALTER TABLE PHONGBAN
--NOCHECK CONSTRAINT ALL
--INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
--VALUES (N'Nghiên cứu', 5, '005', '05/22/1978')
--INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
--VALUES (N'Điều hành', 4, '008', '01/01/1985')
--INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
--VALUES (N'Quản lý', 1, '006', '06/19/1971')
--ALTER TABLE PHONGBAN
--CHECK CONSTRAINT ALL
--END
--BEGIN /** DEAN **/
--ALTER TABLE DEAN
--NOCHECK CONSTRAINT ALL
--INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
--VALUES (N'Sản phẩm X', 1, N'Vũng Tàu', 5)
--INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
--VALUES (N'Sản phẩm Y', 2, N'Nha Trang', 5)
--INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
--VALUES (N'Sản phẩm Z', 3, N'TP.HCM', 5)
--INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
--VALUES (N'Tin học hóa', 10, N'Hà Nội', 4)
--INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
--VALUES (N'Cáp quang', 20, N'TP.HCM', 1)
--INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
--VALUES (N'Đào tạo', 30, N'Hà Nội', 4)
--ALTER TABLE DEAN
--CHECK CONSTRAINT ALL
--END
--create table THANNHAN(
--MA_NVIEN NVARCHAR(50),
--TENTN NVARCHAR(50),
--PHAI NVARCHAR(10),
--NGSINH DATETIME,
--QUANHE NVARCHAR(20),
--)

--BEGIN /** THANNHAN **/
--ALTER TABLE THANNHAN
--NOCHECK CONSTRAINT ALL
--INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
--VALUES ('005', N'Trinh', N'Nữ', '04/05/1976', N'Con gái')
--INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
--VALUES ('005', N'Khang', N'Nam', '10/25/1973', N'Con trai')
--INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
--VALUES ('005', N'Phương', N'Nữ', '05/03/1948', N'Vợ chồng')
--INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
--VALUES ('001', N'Minh', N'Nam', '02/29/1932', N'Vợ chồng')
--INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
--VALUES ('009', N'Tiến', N'Nam', '01/01/1978', N'Con trai')
--INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
--VALUES ('009', N'Châu', N'Nữ', '12/30/1978', N'Con gái')
--INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
--VALUES ('009', N'Phương', N'Nữ', '05/05/1957', N'Vợ chồng')
--ALTER TABLE THANNHAN
--CHECK CONSTRAINT ALL
--END
--BEGIN /** DIADIEM_PHG **/
--ALTER TABLE DIADIEM_PHG
--NOCHECK CONSTRAINT ALL
--INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
--VALUES (1, N'TP.HCM')
--INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
--VALUES (4, N'Hà Nội')
--INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
--VALUES (5, N'Vũng Tàu')
--INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
--VALUES (5, N'Nha Trang')
--INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
--VALUES (5, N'TP.HCM')
--ALTER TABLE DIADIEM_PHG
--CHECK CONSTRAINT ALL
--END
--CREATE TABLE PHANCONG(
--MA_NVIEN NVARCHAR(50),
--SODA INT,
--STT INT,
--THOIGIAN DATETIME,
--)
--BEGIN /** PHANCONG **/
--ALTER TABLE PHANCONG
--NOCHECK CONSTRAINT ALL
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('009', 1, 1, 32)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('009', 2, 2, 8)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('004', 3, 1, 40)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('003', 1, 2, 20.0)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('003', 2, 1, 20.0)
--BEGIN /** NHANVIEN **/
--ALTER TABLE NHANVIEN
--NOCHECK CONSTRAINT ALL

--INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
--VALUES (N'HOÀNG', N'VĂN', N'HỢI', '006', '02/11/1960', N'119, cong hoa, TP.HCM', N'Nam', 660000, '005', 1)
--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
--VALUES (N'Nguyễn', N'Bá', N'Hùng', '009', '02/11/1960', N'119, Cống Quỳnh, TP.HCM', N'Nam', 830000, '005', 2)
--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
--VALUES (N'Trần', N'Văn', N'Vân', '009', '02/11/1960', N'119, quận 1 , TP.HCM', N'Nam', 770000, '005', 1)
--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
--VALUES (N'Đinh', N'Bá', N'Tiến', '009', '02/11/1960', N'119, hoàng thúc kháng, TP.HCM', N'Nam', 540000, '005', 2)




--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)

--VALUES (N'HOÀNG', N'VĂN', N'HỢI', '006', '12/10/1999', N'119, cong hoa, TP.HCM', N'Nam', 660000, '005', 1)

--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)

--VALUES (N'Nguyễn', N'Bá', N'Hùng', '015', '11/11/1990', N'119, Cống Quỳnh, TP.HCM', N'Nam', 830000, '007', 2)

--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)

--VALUES (N'Đinh', N'Bá', N'Tiến', '074', '02/11/1960', N'119, hoàng thúc kháng, TP.HCM', N'Nam', 540000, '005', 2)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('008', 10, 1, 35)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('008', 30, 2, 5)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('001', 30, 1, 20)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('001', 20, 1, 15)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('006', 20, 1, 30)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('005', 3, 1, 10)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('005', 10, 2, 10)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('005', 20, 1, 10)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('007', 30, 2, 30)
--INSERT INTO PHANCONG (MA_NVIEN, SODA, STT, THOIGIAN)
--VALUES ('007', 10, 2, 10)
--ALTER TABLE PHANCONG
--CHECK CONSTRAINT ALL
--END

--UPDATE NHANVIEN
--SET DCHI = 'TP.HCM'
--WHERE DCHI IS NULL;

--BEGIN /** NHANVIEN **/
--ALTER TABLE NHANVIEN
--NOCHECK CONSTRAINT ALL
--INSERT INTO NHANVIEN(HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
--VALUES (N'HOÀNG', N'VĂN', N'HỢI', '011', '02/11/1960', N'119, cong hoa, TP.HCM', N'Nam', 660000, '005', 1)

--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
--VALUES (N'Nguyễn', N'Bá', N'Hùng', '009', '02/11/1960', N'119, Cống Quỳnh, TP.HCM', N'Nam', 830000, '005', 2)
--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
--VALUES (N'Trần', N'Văn', N'Vân', '009', '02/11/1960', N'119, quận 1 , TP.HCM', N'Nam', 770000, '005', 1)
--INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
--VALUES (N'Đinh', N'Bá', N'Tiến', '009', '02/11/1960', N'119, hoàng thúc kháng, TP.HCM', N'Nam', 540000, '005', 2)



--SELECT * FROM PHONGBAN
--SELECT * FROM NHANVIEN

--Câu 2. Hiệu chỉnh kiểu dữ liệu cho cột TENPHG thành nvarchar(20). Thêm vào bảng
--PhongBan dòng sau:
--'2 Nhân sự 10 2003/12/12'


ALTER TABLE PHONGBAN ALTER COLUMN TENPHG nvarchar(20)

ALTER TABLE PHONGBAN
NOCHECK CONSTRAINT ALL
INSERT INTO PHONGBAN(MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
VALUES ('2', N'Nhân sự', '10', '2003/12/12')
ALTER TABLE PHONGBAN
CHECK CONSTRAINT ALL

--Câu 3. 
ALTER TABLE PHONGBAN
NOCHECK CONSTRAINT ALL
INSERT INTO PHONGBAN(MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
VALUES ('6', N'Kế toán', '20', '2005/10/23')
INSERT INTO PHONGBAN(MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
VALUES ('7', N'Kỹ thuật', '30', '2006/12/05')
ALTER TABLE PHONGBAN
CHECK CONSTRAINT ALL

--Câu 4. 
SELECT * FROM DEAN
BEGIN 
	ALTER TABLE DEAN
	NOCHECK CONSTRAINT ALL
	INSERT INTO DEAN (MADA, TENDA, DDIEMDA, PHONG)
	VALUES (8, NN'Nghiên cứu cây', NN'Lâm Đồng', 5)
	INSERT INTO DEAN (MADA, TENDA, DDIEMDA, PHONG)
	VALUES (9, NN'Thống kê', NN'TP.HCM', 6)
	INSERT INTO DEAN (MADA, TENDA, DDIEMDA, PHONG)
	VALUES (11, NN'Thống kê doanh thu', N'Hà Nội', 6)
	INSERT INTO DEAN (MADA, TENDA, DDIEMDA, PHONG)
	VALUES (12, N'Quản lý nhân sự', NN'TP.HCM', 2)
	INSERT INTO DEAN (MADA, TENDA, DDIEMDA, PHONG)
	VALUES (13, NN'Thiết kế xây dựng', NN'TP.HCM', 7)
	INSERT INTO DEAN (MADA, TENDA, DDIEMDA, PHONG)
	VALUES (14, N'Kỹ thuật máy tính', NN'TP.HCM', 7)
	INSERT INTO DEAN (MADA, TENDA, DDIEMDA, PHONG)
	VALUES (15, NN'Nghiên cứu thuốc trừ sâu', NN'Lâm Đồng', 5)
	ALTER TABLE DEAN
	CHECK CONSTRAINT ALL
END

--Câu 5. Thêm vào bảng phân công (PHANCONG) 50 dòng cho các nhân viên có mã số từ
--10->50 tương ứng với các đề án 8,9,11,12,13,14,15 (nhập bằng cửa sổ Edit top
--200 rows, không cần dùng lệnh).v


--Câu 6. Thêm dữ liệu vào các cột manv, honv, tenlot, tennv của bảng nhanvien với dữ
--liệu lấy từ các cột customerID,firstname, middlename, lastname của các nhân
--viên có mã số từ 102 đến 200 lấy từ bảng Customer của CSDL AdventureWorks.
DELETE FROM NHANVIEN
WHERE MANV BETWEEN 10 AND 50;

USE QuanLyDeAn_Loc;
INSERT INTO NHANVIEN (MANV, HONV, TENLOT, TENNV)
SELECT 
    CustomerID AS MANV,
    FirstName AS HONV,
    NULLIF(NULLIF(MiddleName, ''), '') AS TENLOT,
    LastName AS TENNV
FROM 
    AdventureWorksLT2016.SalesLT.Customer
WHERE 
    CustomerID BETWEEN 102 AND 200;

--Phần 2: câu lệnh UPDATE
--1. Cập nhật địa chỉ cho các nhân viên có địa chỉ = null là Tp.Hồ Chí Minh trong table Nhanvien
UPDATE NHANVIEN
SET DCHI = N'Tp.Hồ Chí Minh'
WHERE DCHI IS NULL;



--2.Cập nhật PHG = 2 cho những nhân viên có mã số từ 1 đến 10; 
--PHG=6 cho các nhân viên có mã số từ 11 đến 40, 
--PHG=7 cho các nhân viên có mã số từ 41 đến 80, 
--PHG =5 cho các nhân viên có mã số từ 102->200.

UPDATE NHANVIEN
SET PHG = 2
WHERE MANV BETWEEN 1 AND 10;
UPDATE NHANVIEN
SET PHG = 6
WHERE MANV BETWEEN 11 AND 40;
UPDATE NHANVIEN
SET PHG = 7
WHERE MANV BETWEEN 41 AND 80;
UPDATE NHANVIEN
SET PHG = 5
WHERE MANV BETWEEN 102 AND 200;
SELECT MANV, PHG FROM NHANVIEN
ORDER BY MANV DESC
--3. Cập nhật ngày sinh cho những nhân viên có ngày sinh = null (is null) là ngày
--01/01/1985 trong table Nhanvien
UPDATE NHANVIEN
SET NGSINH = '01/01/1985'
WHERE NGSINH IS NULL;

--4. Cập nhật LUONG =100000 cho các nhân viên ở phòng NghienCuu, 
--LUONG =65000 cho các nhân viên ở phòng Kế toán, 
--LUONG=85000 cho các nhân viên ở phòng Kỹ thuật, 
--LUONG = 70000 cho các nhân viên ở phòng nhân sự.
SELECT * FROM PHONGBAN

UPDATE NHANVIEN
SET LUONG = 100000
WHERE PHG = 5
UPDATE NHANVIEN
SET LUONG = 65000
WHERE PHG = 6
UPDATE NHANVIEN
SET LUONG = 85000
WHERE PHG = 7
UPDATE NHANVIEN
SET LUONG = 70000
WHERE PHG = 2

--5. Cập nhật mã người quản lý (MA_NQL) trong bảng nhân viên tương ứng với
--phòng ban mà nhân viên đó thuộc về.
--VD: nhân viên có mã nv =8, thuộc phòng ban 2 thì mã người quản lý là 10.




--Phần 3: câu lệnh SELECT
--3.1 TRUY VẤN CƠ BẢN
--3.1.1 Truy vấn đơn giản
--1. Tìm các nhân viên làm việc ở phòng số 5
SELECT * FROM NHANVIEN
WHERE PHG = 5
--2. Tìm các nhân viên có mức lương trên 25000
SELECT * FROM NHANVIEN
WHERE LUONG > 25000
--3. Tìm các nhân viên có mức lương trên 65,000 ở phòng 1 hoặc các nhân viên có
--mức lương trên 70,000 ở phòng 2
SELECT * FROM NHANVIEN
WHERE (LUONG > 65000  AND PHG = 1) OR (LUONG > 70000 AND PHG = 2)
--4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
SELECT HONV, TENLOT, TENNV, DCHI FROM NHANVIEN
WHERE DCHI = N'Tp.Hồ Chí Minh'
--5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
SELECT HONV, TENLOT, TENNV, DCHI FROM NHANVIEN
WHERE HONV LIKE 'N%'
--6. Cho biết ngày sinh và địa chỉ của nhân viên Lê Minh Tính
SELECT NGSINH, DCHI FROM NHANVIEN
WHERE HONV = N'Lê' AND TENLOT = N'Minh' AND TENNV = N'Tính'
--7. Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975
SELECT * FROM NHANVIEN
WHERE  YEAR(NGSINH) BETWEEN 1955 AND 1975
SELECT * FROM NHANVIEN

--8. Cho biết các nhân viên và năm sinh của nhân viên
SELECT HONV, TENLOT, TENNV, YEAR(NGSINH) AS NAMSINH FROM NHANVIEN

--9. Cho biết các nhân viên và tuổi của nhân viên
SELECT HONV, TENLOT, TENNV, DATEDIFF(YEAR, NGSINH, GETDATE()) AS NAMSINH FROM NHANVIEN
SELECT HONV, TENLOT, TENNV, YEAR(NGSINH) AS TUỔI FROM NHANVIEN

--3.1.2 Truy vấn có sử dụng phép kết
--10. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
SELECT PHONGBAN.MAPHG, TENPHG, DIADIEM FROM PHONGBAN
INNER JOIN DIADIEM_PHG ON PHONGBAN.MAPHG = DIADIEM_PHG.MAPHG


--11. Tìm tên những người trưởng phòng của từng phòng ban
SELECT * FROM PHONGBAN
SELECT * FROM NHANVIEN
SELECT NHANVIEN.MANV, NHANVIEN.TENNV, PHONGBAN.TENPHG
FROM NHANVIEN 
INNER JOIN PHONGBAN  ON NHANVIEN.MANV = PHONGBAN.TRPHG;

--12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Điều hành".
SELECT NHANVIEN.MANV, NHANVIEN.TENNV, NHANVIEN.DCHI, PHONGBAN.MAPHG, PHONGBAN.TENPHG
FROM NHANVIEN 
INNER JOIN PHONGBAN  ON NHANVIEN.MANV = PHONGBAN.MAPHG
WHERE MAPHG = 4

--13. Với mỗi đề án ở Nha TRang, cho biết tên đề án, tên phòng ban, họ tên và ngày
--nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
SELECT * FROM DEAN
SELECT * FROM PHONGBAN
SELECT * FROM NHANVIEN
SELECT DA.TENDA, PB.TENPHG AS TENPHONGBAN, NV.TENNV AS TENTRUONGPHONG, PB.NG_NHANCHUC
FROM DEAN DA
INNER JOIN PHONGBAN PB ON DA.PHONG = PB.MAPHG
INNER JOIN NHANVIEN NV ON PB.TRPHG = NV.MANV
WHERE DA.DDIEMDA = N'Nha Trang';

--14. Tìm tên những nữ nhân viên và tên người thân của họ
SELECT TENNV, NHANVIEN.PHAI, TENTN AS TENNGUOITHAN FROM NHANVIEN
LEFT JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
WHERE NHANVIEN.PHAI = N'Nữ';

--15. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp
--của nhân viên đó
SELECT NV.HONV, NV.TENNV, QL.HONV AS HOQL, QL.TENNV AS TENQL
FROM NHANVIEN NV
LEFT JOIN NHANVIEN QL ON NV.MA_NQL = QL.MANV;

--16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng phòng
--và họ tên người quản lý trực tiếp của nhân viên đó.
SELECT * FROM PHONGBAN
SELECT NV.HONV, NV.TENNV, TP.HONV AS HOTRPHONG, TP.TENNV AS TENTRPHONG, QL.HONV AS HOQLY, QL.TENNV AS TENQLY
FROM NHANVIEN NV
LEFT JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
LEFT JOIN NHANVIEN TP ON PB.TRPHG = TP.MANV
LEFT JOIN NHANVIEN QL ON NV.MA_NQL = QL.MANV;

--17. Tên những nhân viên phòng số 5 có tham gia vào đề án "Xây dựng nhà máy chế
--biến thủy sản" và tên người quản lý trực tiếp.
SELECT NV.TENNV , QL.TENNV AS TENQL
FROM NHANVIEN NV
LEFT JOIN DEAN DA ON NV.MANV = DA.MADA
LEFT JOIN NHANVIEN QL ON NV.MA_NQL = QL.MANV
WHERE NV.PHG = 5 AND DA.TENDA = N'Xây dựng nhà máy chế biến thủy sản';

--18. Cho biết tên các đề án mà nhân viên Trần Anh Tuấn đã tham gia.
SELECT DA.TENDA FROM DEAN DA
INNER JOIN PHANCONG PC ON DA.MADA = PC.SODA
INNER JOIN NHANVIEN NV ON PC.MA_NVIEN = NV.MANV
WHERE NV.HONV = N'Trần' AND NV.TENLOT = N'Anh' AND NV.TENNV = N'Tuấn'; 

--3.2 GOM NHÓM

--19. Cho biết số lượng đề án của công ty
SELECT COUNT(*) AS SO_DEAN FROM DEAN;

--20. Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì
SELECT COUNT(*) AS SO_DEAN FROM DEAN DA
INNER JOIN PHONGBAN PB ON DA.PHONG = PB.MAPHG
WHERE PB.TENPHG = N'Nghiên Cứu';

--21. Cho biết lương trung bình của các nữ nhân viên
SELECT AVG(LUONG) AS LUONGTB FROM NHANVIEN 
WHERE PHAI = N'Nữ';

--22. Cho biết số thân nhân của nhân viên ‘Lê Thanh Sang'
SELECT COUNT(*) AS SO_THAN_NHAN FROM NHANVIEN 
LEFT JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
WHERE HONV = N'Lê' AND TENLOT = N'Thanh' AND TENNV = N'Sang';

--23. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên tham dự đề án đó.
SELECT DA.TENDA, SUM(PC.THOIGIAN) AS TONG_GIO_LAM_VIEC FROM DEAN DA
INNER JOIN PHANCONG PC ON DA.MADA = PC.SODA
GROUP BY DA.TENDA;

--24. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
SELECT DA.TENDA, COUNT(PC.MA_NVIEN) AS SO_NHANVIEN_THAMGIA
FROM DEAN DA
INNER JOIN PHANCONG PC ON DA.MADA = PC.SODA
GROUP BY DA.TENDA;

--25. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
SELECT NV.MANV, NV.TENNV, NV.HONV, COUNT(TN.MA_NVIEN) AS SO_THAN_NHAN
FROM NHANVIEN NV
LEFT JOIN THANNHAN TN ON NV.MANV = TN.MA_NVIEN
GROUP BY NV.MANV, NV.TENNV, NV.HONV;


--26. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
SELECT NV.MANV, NV.TENNV, NV.HONV, COUNT(PC.SODA) AS SO_DEAN_THAMGIA
FROM NHANVIEN NV
LEFT JOIN PHANCONG PC ON NV.MANV = PC.MA_NVIEN
GROUP BY NV.MANV, NV.TENNV, NV.HONV;


--27. Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản lý trực tiếp.
SELECT NV.MANV, NV.TENNV, NV.HONV, COUNT(NVQ.MANV) AS SO_NHANVIEN_QUANLY
FROM NHANVIEN NV
LEFT JOIN NHANVIEN NVQ ON NV.MANV = NVQ.MA_NQL
GROUP BY NV.MANV, NV.TENNV, NV.HONV;


--28. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc cho phòng ban đó.
SELECT PB.TENPHG, AVG(NV.LUONG) AS LUONG_TRUNG_BINH
FROM PHONGBAN PB
INNER JOIN NHANVIEN NV ON PB.MAPHG = NV.PHG
GROUP BY PB.TENPHG;

--29. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên phòng ban và số lượng nhân viên của phòng ban đó.
SELECT PB.TENPHG, COUNT(NV.MANV) AS SO_NHANVIEN
FROM PHONGBAN PB
INNER JOIN NHANVIEN NV ON PB.MAPHG = NV.PHG
GROUP BY PB.TENPHG
HAVING AVG(NV.LUONG) > 30000;

--30. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà phòng ban đó chủ trì
SELECT PB.TENPHG, COUNT(DA.MADA) AS SO_DEAN
FROM PHONGBAN PB
INNER JOIN DEAN DA ON PB.MAPHG = DA.PHONG
GROUP BY PB.TENPHG;

--31. Với mỗi phòng ban, cho biết tên phòng ban, họ tên người trưởng phòng và số lượng đề án mà phòng ban đó chủ trì
SELECT PB.TENPHG, NV.TENNV, NV.HONV , COUNT(DA.MADA) AS SO_DEAN_CHUTRI
FROM PHONGBAN PB
JOIN NHANVIEN NV ON PB.TRPHG = NV.MANV
LEFT JOIN DEAN DA ON PB.MAPHG = DA.PHONG
GROUP BY PB.TENPHG, NV.TENNV, NV.HONV;

--37CHỌN CÁC NHÂN VIÊN CÓ TỪ 2 NHÂN THÂN
SELECT HONV,TENLOT,TENNV
FROM NHANVIEN
LEFT JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MA_NVIEN
WHERE MA_NVIEN > 1	

--38 CHỌN CÁC NHÂN VIÊN KHÔNG CÓ NHÂN THÂN
SELECT HONV,TENLOT,TENNV
FROM NHANVIEN
LEFT JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN
GROUP BY MA_NVIEN
WHERE MA_NVIEN IS NULL
