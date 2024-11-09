create database QuanLyDiemThi;
use QuanLyDiemThi;

CREATE TABLE HocSinh (
    MaHS VARCHAR(20) PRIMARY KEY,
    TenHS VARCHAR(50),
    NgaySinh DATETIME,
    Lop VARCHAR(20),
    GT VARCHAR(20)
);
    
CREATE TABLE GiaoVien (
    MaGV VARCHAR(20) PRIMARY KEY,
    TenGV VARCHAR(50),
    SDT VARCHAR(10)
);

CREATE TABLE MonHoc (
    MaMH VARCHAR(20) PRIMARY KEY,
    TenMH VARCHAR(50),
    MaGV VARCHAR(20),
    FOREIGN KEY (MaGV)
        REFERENCES GiaoVien (MaGV)
);

CREATE TABLE BangDiem (
    MaHS VARCHAR(20),
    MaMH VARCHAR(50),
    DiemThi INT,
    NgayKT DATETIME,
    PRIMARY KEY (MaHS , MaMH),
    FOREIGN KEY (MaHS)
        REFERENCES HocSinh (MaHS),
    FOREIGN KEY (MaMH)
        REFERENCES MonHoc (MaMH)
);

Alter Table MonHoc Add CONSTRAINT FK_MaGV foreign key (MaGV) references GiaoVien(MaGV);
