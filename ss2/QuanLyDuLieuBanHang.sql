create database OrderManagements;
use OrderManagements;

CREATE TABLE Customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(50) NOT NULL,
    cAge INT NOT NULL
);

CREATE TABLE Orders (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATETIME,
    oTotalPrice DOUBLE,
    FOREIGN KEY (cID)
        REFERENCES Customer (cID)
);

CREATE TABLE Product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(20),
    pPrice DOUBLE
);

CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (oID)
        REFERENCES Orders (oID),
    FOREIGN KEY (pID)
        REFERENCES Product (pID)
);