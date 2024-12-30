CREATE DATABASE Organic;
GO
USE Organic;
GO
CREATE TABLE Department(
    DepartmentId SMALLINT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    DepartmentName NVARCHAR(64) NOT NULL
);
GO
CREATE TABLE Category(
    CategoryId SMALLINT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    CategoryName NVARCHAR(64) NOT NULL,
    ImageUrl VARCHAR(16) NOT NULL
);
GO
--DROP TABLE Product;
GO
CREATE TABLE Product(
    ProductId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	CategoryId SMALLINT NOT NULL,
    ProductName NVARCHAR(64) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    ImageUrl VARCHAR(32) NOT NULL,
    Explain NVARCHAR(512) NOT NULL,
    Availability NVARCHAR(16) NOT NULL,
    Shipping VARCHAR(64) NOT NULL,
    Weight DECIMAL(10, 2) NOT NULL,
    Unit VARCHAR(8) NOT NULL,
    Description NVARCHAR(MAX) NOT NULL,
    Information NVARCHAR(MAX) NOT NULL,
    Reviews NVARCHAR(MAX) NOT NULL
);
CREATE TABLE Banner(
    BannerId TINYINT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    BannerName NVARCHAR(32) NOT NULL,
    ImageUrl VARCHAR(16) NOT NULL,
    Description NVARCHAR(64) NOT NULL
);
GO
CREATE TABLE Role(
    RoleId INT NOT NULL PRIMARY KEY,
    RoleName VARCHAR(16) NOT NULL UNIQUE
);
GO
CREATE TABLE Member(
    MemberId VARCHAR(32) NOT NULL PRIMARY KEY,
    Email VARCHAR(64) NOT NULL,
    Password VARCHAR(128) NOT NULL,
    Name NVARCHAR(64) NOT NULL,
    GivenName NVARCHAR(16) NOT NULL,
    Surname NVARCHAR(32),
    LoginDate DATETIME NOT NULL DEFAULT GETDATE(),
    RegisterDate DATETIME NOT NULL DEFAULT GETDATE(),
    RoleId INT NOT NULL
);
GO

CREATE TABLE Cart(
    CartId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    MemberId VARCHAR(32) NOT NULL REFERENCES Member(MemberId),
    ProductId INT NOT NULL REFERENCES Product(ProductId),
    Quantity SMALLINT NOT NULL DEFAULT 1,
    CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO
--DROP TABLE Invoice;
GO
CREATE TABLE Invoice(
	InvoiceId INT NOT NULL PRIMARY KEY,
	MemberId VARCHAR(32) NOT NULL REFERENCES Member(MemberId),
	InvoiceDate DATETIME NOT NULL DEFAULT GETDATE(),
	GivenName NVARCHAR(16) NOT NULL,
	Surname NVARCHAR(32),
	Phone VARCHAR(16) NOT NULL,
	Address NVARCHAR(64) NOT NULL
);
GO
CREATE TABLE InvoiceDetail(
	InvoiceId INT NOT NULL,
	ProductId INT NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
	Quantity SMALLINT NOT NULL
);
GO
--Lưu trữ thông tin VnPayment

--SELECT * FROM Invoice;
--SELECT * FROM InvoiceDetail;


--SELECT * FROM Cart;


--SELECT * FROM Member;
CREATE TABLE Blog(
	BlogId INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Title NVARCHAR(128) NOT NULL,
    MemberId VARCHAR(32) NOT NULL,
    CategoryId SMALLINT NOT NULL,
    Tags NVARCHAR(64) NOT NULL,
    ImageUrl VARCHAR(32) NOT NULL,
    Description NVARCHAR(256) NOT NULL,
    Content NVARCHAR(MAX),
    BlogDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO
SET IDENTITY_INSERT Department ON;
INSERT INTO Department (DepartmentId, DepartmentName) VALUES
    (1, 'Fresh Meat'),
    (2, 'Vegetables'),
    (3, 'Fruit & Nut Gifts'),
    (4, 'Fresh Berries'),
    (5, 'Ocean Foods'),
    (6, 'Butter & Eggs'),
    (7, 'Fastfood'),
    (8, 'Fresh Onion'),
    (9, 'Papayaya & Crisps'),
    (10, 'Oatmeal'),
    (11, 'Fresh Bananas');
SET IDENTITY_INSERT Department OFF;
GO

ALTER TABLE Member
ADD ResetToken NVARCHAR(255),
    ResetTokenExpiry DATETIME;

--TRUNCATE TABLE Category;
GO
SET IDENTITY_INSERT Category ON;
INSERT INTO Category (CategoryId, CategoryName, ImageUrl) VALUES
    (1, 'Fresh Fruit', 'cat-1.jpg'),
    (2, 'Dried Fruit', 'cat-2.jpg'),
    (3, 'Vegetables', 'cat-3.jpg'),
    (4, 'drink fruits', 'cat-4.jpg'),
    (5, 'drink fruits', 'cat-5.jpg');
SET IDENTITY_INSERT Category OFF;
GO


SET IDENTITY_INSERT Banner ON;
INSERT INTO Banner (BannerId, BannerName, ImageUrl, Description) VALUES
    (1, 'Summer Fruit', 'banner-1.jpg', '100% Pure Natural Fruit Juice'),
    (2, 'Dried & Drink Fruits', 'banner-2.jpg', 'With 25% Off All Teas');
SET IDENTITY_INSERT Banner OFF;
GO

INSERT INTO Role (RoleId, RoleName) VALUES
    (234023470, 'Admin'),
    (234102922, 'Member');
GO

--TRUNCATE TABLE Member;
GO
INSERT INTO Member(MemberId, Email, Password, Name, GivenName, Surname, RoleId) VALUES
    (
		'134812438123479128471243', 
		'npcthanh@hcmunre.edu.vn', 
		CONVERT(VARCHAR(128), HASHBYTES('SHA2_512', '123'), 2),
		N'Chí Thành',
		N'Thành', 
		N'Nguyễn Phan Chí', 
		234102922),
	(
		'11231231231312312231234', 
		'tnminh@hcmunre.edu.vn', 
		CONVERT(VARCHAR(128), HASHBYTES('SHA2_512', '123'), 2),
		N'Nhật Minh',
		N'Minh', 
		N'Trần Nhật', 
		234023470);
GO

--SELECT LEN(CONVERT(VARCHAR(128), HASHBYTES('SHA2_512', '123'), 2));



INSERT INTO Blog (Title, ImageUrl, MemberId, CategoryId, Tags, BlogDate, Description, Content) VALUES
    ('6 ways to prepare breakfast for 30', 
        'blog-1.jpg',
		'11231231231312312231234',
		1,
		N'All, Trending, Cooking, Healthy Food, Life Style',
		'2024-3-5',
        N'Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat',
		N'<p>Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
                            dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit
                            aliquet elit, eget tincidunt nibh pulvinar a. Vivamus magna justo, lacinia eget consectetur
                            sed, convallis at tellus. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
                            Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
                            Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis
                            quis ac lectus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada
                            feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p>
                        <h3>The corner window forms a place within a place that is a resting point within the large
                            space.</h3>
                        <p>The study area is located at the back with a view of the vast nature. Together with the other
                            buildings, a congruent story has been managed in which the whole has a reinforcing effect on
                            the components. The use of materials seeks connection to the main house, the adjacent
                            stables</p>'
    ),
	('Visit the clean farm in the US', 
        'blog-2.jpg',
		'11231231231312312231234',
		1,
		N'All, Trending, Cooking, Healthy Food, Life Style',
		'2024-3-5',
        N'Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat',
		N'<p>Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
                            dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit
                            aliquet elit, eget tincidunt nibh pulvinar a. Vivamus magna justo, lacinia eget consectetur
                            sed, convallis at tellus. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
                            Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
                            Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis
                            quis ac lectus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada
                            feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p>
                        <h3>The corner window forms a place within a place that is a resting point within the large
                            space.</h3>
                        <p>The study area is located at the back with a view of the vast nature. Together with the other
                            buildings, a congruent story has been managed in which the whole has a reinforcing effect on
                            the components. The use of materials seeks connection to the main house, the adjacent
                            stables</p>'
    ),
	('Cooking tips make cooking simple', 
        'blog-3.jpg',
		'11231231231312312231234',
		1,
		N'All, Trending, Cooking, Healthy Food, Life Style',
		'2024-3-5',
        N'Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat',
		N'<p>Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
                            dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit
                            aliquet elit, eget tincidunt nibh pulvinar a. Vivamus magna justo, lacinia eget consectetur
                            sed, convallis at tellus. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
                            Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
                            Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis
                            quis ac lectus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada
                            feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p>
                        <h3>The corner window forms a place within a place that is a resting point within the large
                            space.</h3>
                        <p>The study area is located at the back with a view of the vast nature. Together with the other
                            buildings, a congruent story has been managed in which the whole has a reinforcing effect on
                            the components. The use of materials seeks connection to the main house, the adjacent
                            stables</p>'
    ),
	('Cooking tips make cooking simple', 
        'blog-4.jpg',
		'11231231231312312231234',
		1,
		N'All, Trending, Cooking, Healthy Food, Life Style',
		'2024-3-5',
        N'Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat',
		N'<p>Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
                            dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit
                            aliquet elit, eget tincidunt nibh pulvinar a. Vivamus magna justo, lacinia eget consectetur
                            sed, convallis at tellus. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
                            Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
                            Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis
                            quis ac lectus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada
                            feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p>
                        <h3>The corner window forms a place within a place that is a resting point within the large
                            space.</h3>
                        <p>The study area is located at the back with a view of the vast nature. Together with the other
                            buildings, a congruent story has been managed in which the whole has a reinforcing effect on
                            the components. The use of materials seeks connection to the main house, the adjacent
                            stables</p>'
    ),
	('The Moment You Need To Remove Garlic From The Menu', 
        'blog-5.jpg',
		'11231231231312312231234',
		1,
		N'All, Trending, Cooking, Healthy Food, Life Style',
		'2024-3-5',
        N'Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat',
		N'<p>Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
                            dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit
                            aliquet elit, eget tincidunt nibh pulvinar a. Vivamus magna justo, lacinia eget consectetur
                            sed, convallis at tellus. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
                            Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
                            Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis
                            quis ac lectus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada
                            feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p>
                        <h3>The corner window forms a place within a place that is a resting point within the large
                            space.</h3>
                        <p>The study area is located at the back with a view of the vast nature. Together with the other
                            buildings, a congruent story has been managed in which the whole has a reinforcing effect on
                            the components. The use of materials seeks connection to the main house, the adjacent
                            stables</p>'
    ),
	('Cooking tips make cooking simple', 
        'blog-6.jpg',
		'11231231231312312231234',
		1,
		N'All, Trending, Cooking, Healthy Food, Life Style',
		'2024-3-5',
        N'Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat',
		N'<p>Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet
                            dui. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit
                            aliquet elit, eget tincidunt nibh pulvinar a. Vivamus magna justo, lacinia eget consectetur
                            sed, convallis at tellus. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada.
                            Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.
                            Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis
                            quis ac lectus. Donec sollicitudin molestie malesuada. Nulla quis lorem ut libero malesuada
                            feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.</p>
                        <h3>The corner window forms a place within a place that is a resting point within the large
                            space.</h3>
                        <p>The study area is located at the back with a view of the vast nature. Together with the other
                            buildings, a congruent story has been managed in which the whole has a reinforcing effect on
                            the components. The use of materials seeks connection to the main house, the adjacent
                            stables</p>'
    );
GO

--TRUNCATE TABLE Product;
GO
SET IDENTITY_INSERT Product ON;
INSERT INTO Product(ProductId, CategoryId, ProductName, Price, ImageUrl, Availability, Shipping, Weight, Unit, Explain, Description, Information, Reviews) VALUES    
    (1, 1, 'Pork meat', 50, 'product-1.jpg', 'In Stock', '01 day shipping. <b>Free pickup today</b>', 0.5, 'kg',
        'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.',
    '<h6>Products Content</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
        sed sit amet dui. Proin eget tortor risus.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>
    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>'
        ),
    (2, 1, 'Banana', 31, 'product-2.jpg', 'In Stock', '01 day shipping. <b>Free pickup today</b>', 0.5, 'kg',
        'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.',
    '<h6>Products Content</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
        sed sit amet dui. Proin eget tortor risus.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>
    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>'
        ),
    (3, 2, 'Guava', 25, 'product-3.jpg', 'In Stock', '01 day shipping. <b>Free pickup today</b>', 0.5, 'kg',
        'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.',
    '<h6>Products Content</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
        sed sit amet dui. Proin eget tortor risus.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>
    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>'
        ),
    (4, 2, 'Grape', 62, 'product-4.jpg', 'In Stock', '01 day shipping. <b>Free pickup today</b>', 0.5, 'kg',
        'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.',
    '<h6>Products Content</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
        sed sit amet dui. Proin eget tortor risus.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>
    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>'
        ),
    (5, 3, 'hamburger', 19, 'product-5.jpg', 'In Stock', '01 day shipping. <b>Free pickup today</b>', 0.5, 'kg',
        'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.',
    '<h6>Products Content</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
        sed sit amet dui. Proin eget tortor risus.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>
    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>'
        ),
    (6, 3, 'Mango', 27, 'product-6.jpg', 'In Stock', '01 day shipping. <b>Free pickup today</b>', 0.5, 'kg',
        'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.',
    '<h6>Products Content</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
        sed sit amet dui. Proin eget tortor risus.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>
    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>'
        ),
    (7, 4, 'Watermelon', 45, 'product-7.jpg', 'In Stock', '01 day shipping. <b>Free pickup today</b>', 0.5, 'kg',
        'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.',
    '<h6>Products Content</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
        sed sit amet dui. Proin eget tortor risus.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>
    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>'
        ),
    (8, 4, 'Apple', 39, 'product-8.jpg', 'In Stock', '01 day shipping. <b>Free pickup today</b>', 0.5, 'kg',
        'Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.',
    '<h6>Products Content</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus
        suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam
        vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada.
        Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat,
        accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a
        pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula
        elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus
        et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam
        vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p>
        <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.
        Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed
        porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum
        sed sit amet dui. Proin eget tortor risus.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>
    <p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem
        ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet
        elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum
        porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus
        nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>',
    '<h6>Products Infomation</h6>
    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
        Proin eget tortor risus.</p>'
        );
SET IDENTITY_INSERT Product OFF;
GO


--SELECT TOP 6 * FROM Product ORDER BY NEWID()