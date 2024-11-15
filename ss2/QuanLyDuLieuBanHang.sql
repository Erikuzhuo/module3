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

INSERT INTO Customer(cName,cAge)
VALUES ('Minh Quan',10),('Ngoac Oanh',20),('Hong Ha',50);

INSERT INTO Orders(cID,oDate,oTotalPrice)
VALUES (1,'2006-03-21',null),(2,'2006-03-23',null),(1,'2006-03-16',null);

INSERT INTO Product(pName,pPrice)
VALUES ('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);

INSERT INTO OrderDetail(oID,pID,odQty)
VALUES (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

SELECT 
    o.oID, o.oDate, SUM(p.pPrice * od.odQty) AS oPrice
FROM
    Orders o
        JOIN
    OrderDetail od ON o.oID = od.oID
        JOIN
    Product p ON od.pID = p.pID
GROUP BY o.oID;
