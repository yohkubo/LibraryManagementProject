CREATE DATABASE library_mgmt

USE library_mgmt

CREATE TABLE tbl_book (
	Bookid INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title NVARCHAR(100) NOT NULL,
	PublisherName NVARCHAR(50) NOT NULL CONSTRAINT fk_Name FOREIGN KEY REFERENCES tbl_publisher(Name) ON UPDATE CASCADE ON DELETE CASCADE
);	

SELECT * FROM tbl_book

CREATE TABLE tbl_publisher (
	Name NVARCHAR(50) PRIMARY KEY NOT NULL,
	Address NVARCHAR(100) NOT NULL,
	Phone NVARCHAR(30) NOT NULL
);

SELECT * FROM tbl_publisher

CREATE TABLE tbl_book_author (
	Bookid INT NOT NULL CONSTRAINT fk_Bookid FOREIGN KEY REFERENCES tbl_book(Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName NVARCHAR(50) NOT NULL 
);


SELECT * FROM tbl_book_author

CREATE TABLE tbl_library_branch (
	Branchid INT PRIMARY KEY NOT NULL IDENTITY(1001,1),
	BranchName NVARCHAR(50) NOT NULL,
	Address NVARCHAR(100) NOT NULL
);

SELECT * FROM tbl_library_branch

CREATE TABLE tbl_book_copies (
	Bookid INT NOT NULL CONSTRAINT fk_Bookid_1 FOREIGN KEY REFERENCES tbl_book(Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
	Branchid INT NOT NULL CONSTRAINT fk_Branchid FOREIGN KEY REFERENCES tbl_library_branch(Branchid) ON UPDATE CASCADE ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);

SELECT * FROM tbl_book_copies

CREATE TABLE tbl_borrower(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(10001,1),
	Name NVARCHAR(50) NOT NULL,
	Address NVARCHAR(100) NOT NULL,
	Phone NVARCHAR(30) NOT NULL
);

SELECT * FROM tbl_book_copies

CREATE TABLE tbl_book_loans (
	Bookid INT NOT NULL CONSTRAINT fk_Bookid_2 FOREIGN KEY REFERENCES tbl_book(Bookid) ON UPDATE CASCADE ON DELETE CASCADE,
	Branchid INT NOT NULL CONSTRAINT fk_Branchid_1 FOREIGN KEY REFERENCES tbl_library_branch(Branchid) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);

SELECT * FROM tbl_book_loans

INSERT INTO tbl_publisher
	(Name, Address, Phone)
VALUES
	('Picador USA','16365 James Madison Highway, Gordonsville, VA 22942','888-330-8477'),
	('Penguin Books','80 Strand, London, WC2R 0RL','44 0(20) 7139 3000'),
	('Bantam','1745 Broadway, New York, NY 10019','212-782-9000'),
	('Vintage','1745 Broadway, New York, NY 10019','212-940-7390'),
	('Sarah Crichton Books','18 W 18th St, New York, NY 10011','212 206 5324'),
	('Simon & Schuster','1230 Avenue of the Americas, New York, NY 10020','212-698-7000'),
	('Scribner','1230 Avenue of the Americas, New York New York 10020','212-698-7000'),
	('Delacorte Books','1745 Broadway, New York, NY 10019','212-782-9000'),
	('Knopf Books','1745 Broadway, New York, NY 10019','212-940-7390'),
	('HarperCollins','195 Broadway, New York, NY 10007','212-207-7000'),
	('Amulet Books','115 West 18th Street , New York New York 10011 ','212-206-7715'),
	('Ace','375 Hudson Street, NY NY 10014','212-366-2385'),
	('W. W. Norton & Company','500 Fifth Avenue, New York NY 10110','212-354-5500'),
	('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
	('Doubleday','1745 Broadway, New York, NY 10019','212-940-7390')
;

INSERT INTO tbl_book
	(Title, PublisherName)
VALUES
	('The Lost Tribe', 'Picador USA'),
	('1984 (Signet Classics)', 'Penguin Books'),
	('A Brief History of Time', 'Bantam'),
	('A Heartbreaking Work of Staggering Genius', 'Vintage'),
	('A Long Way Gone: Memoirs of a Boy Soldier', 'Sarah Crichton Books'),
	('Alice''s Adventures in Wonderland & Through the...', 'Bantam'),
	('All the President''s Men', 'Simon & Schuster'),
	('Angela''s Ashes: A Memoir', 'Scribner'),
	('Are You There God? It''s Me, Margaret.', 'Delacorte Books'),
	('Breath, Eyes, Memory (Oprah''s Book Club)', 'Vintage'),
	('Catch-22: 50th Anniversary Edition', 'Simon & Schuster'),
	('Charlie and the Chocolate Factory', 'Knopf Books'),
	('Charlotte''s Web', 'HarperCollins'),
	('Diary of a Wimpy Kid, Book 1', 'Amulet Books'),
	('Dune (Dune Chronicles, Book 1)', 'Ace'),
	('Fahrenheit 451', 'Simon & Schuster'),
	('Fear and Loathing in Las Vegas: A Savage...', 'Vintage'),
	('Guns, Germs, and Steel: The Fates of Human...', 'W. W. Norton & Company'),
	('Harry Potter and the Sorcerer''s Stone', 'Scholastic'),
	('In Cold Blood', 'Vintage'),
	('Cujo', 'Simon & Schuster'),
	('The Shining', 'Doubleday')
;

TRUNCATE TABLE tbl_book;

INSERT INTO tbl_book_author
	(Bookid,AuthorName)
VALUES
	(1,'Mark Lee'),
	(2,'George Orwell, Erich Fromm'),
	(3,'Stephen Hawking'),
	(4,'Dave Eggers'),
	(5,'Ishmael Beah'),
	(6,'Lewis Carroll'),
	(7,'Bob Woodward, Carl Bernstein'),
	(8,'Frank McCourt, Brooke Zimmer...'),
	(9,'Judy Blume'),
	(10,'Edwidge Danticat'),
	(11,'Joseph Heller, Christopher Buckley'),
	(12,'Roald Dahl, Quentin Blake'),
	(13,'E. B White, Garth Williams'),
	(14,'Jeff Kinney'),
	(15,'Frank Herbert'),
	(16,'Ray Bradbury'),
	(17,'Hunter S. Thompson, Ralph Steadman'),
	(18,'Jared Diamond Ph.D.'),
	(19,'J.K. Rowling, Mary GrandPré'),
	(20,'Truman Capote'),
	(21,'Stephen King'),
	(22,'Stephen King')
;

INSERT INTO tbl_library_branch
	(BranchName,Address)
VALUES
	('Sharpstown','7660 Clarewood Dr, Houston, TX 77036'),
	('Central','2300 E Yesler Way, Seattle, WA 98122'),
	('Beaverton','12375 SW 5th St, Beaverton, OR 97005'),
	('HillsBoro','775 SE 10th Ave, Hillsboro, OR 97123')
;

INSERT INTO tbl_borrower
	(Name, Address, Phone)
VALUES
	('Rachal Green','680 Vine Drive, Massillon, OH 44646','(251) 546-9442'),
	('Monica Geller','628 Willow Dr. Cookeville, TN 38501','(125) 546-4478'),
	('Phoebe Buffay','277 Ohio Ave. Saint Louis, MO 63109','(949) 569-4371'),
	('Joey Tribbiani','8964 Tallwood Dr. Manahawkin, NJ 08050','(630) 446-8851'),
	('Chandler Bing','9740 Valley View St. Norfolk, VA 23503','(226) 906-2721'),
	('Ross Geller','8690 Inverness Ave. Kent, OH 44240','(671) 925-1352'),
	('Clark Kent','407 West Fairground St. Winter Springs, FL 32708','(860) 569-1035'),
	('Bruce Wayne','904 Pine Drive Lancaster, NY 14086','(781) 261-3109'),
	('Barry Allen','20 Mayfield Avenue Columbia, MD 21044','(995) 556-0806'),
	('Oliver Queen','597 Foster Lane, Marysville, OH 43040','(235) 145-4479')
;

INSERT INTO tbl_borrower
	(Name, Address, Phone)
VALUES
	('Kara Danvers','356 Randall Mill St. Streamwood, IL 60107','(517)647-1851'),
	('James Gordon','391 East Anchor Avenue Webster, NY 14580','(478)275-1269')
;

INSERT INTO tbl_book_copies
	(Bookid,Branchid,No_Of_Copies)
VALUES
	(1,1001,2),
	(2,1001,3),
	(3,1001,5),
	(4,1001,3),
	(5,1001,5),
	(6,1001,4),
	(7,1001,3),
	(8,1001,2),
	(9,1001,5),
	(10,1001,3),
	(11,1001,3),
	(12,1001,2),
	(13,1002,4),
	(14,1002,3),
	(15,1002,2),
	(16,1002,4),
	(17,1002,5),
	(18,1002,4),
	(19,1002,2),
	(20,1002,2),
	(21,1002,4),
	(22,1002,5),
	(1,1002,3),
	(2,1002,4),
	(3,1003,2),
	(4,1003,4),
	(5,1003,3),
	(6,1003,3),
	(7,1003,5),
	(8,1003,2),
	(9,1003,5),
	(10,1003,2),
	(11,1003,3),
	(12,1003,5),
	(13,1003,4),
	(1,1004,3),
	(2,1004,5),
	(3,1004,3),
	(4,1004,3),
	(5,1004,3),
	(6,1004,2),
	(7,1004,2),
	(8,1004,4),
	(9,1004,5),
	(10,1004,5)
;

INSERT INTO tbl_book_loans
	(Bookid,Branchid,CardNo,DateOut,DueDate)
VALUES
(8,1001,10004,'2018/01/29','2018/02/19'),
(8,1001,10008,'2018/02/06','2018/02/27'),
(10,1001,10008,'2018/02/01','2018/02/22'),
(6,1001,10005,'2018/02/09','2018/03/02'),
(11,1001,10008,'2018/02/08','2018/03/01'),
(7,1001,10005,'2018/01/30','2018/02/20'),
(3,1001,10005,'2018/02/07','2018/02/28'),
(2,1001,10006,'2018/02/05','2018/02/26'),
(4,1001,10001,'2018/01/31','2018/02/21'),
(3,1001,10004,'2018/02/02','2018/02/23'),
(1,1001,10003,'2018/01/20','2018/02/10'),
(6,1001,10004,'2018/02/07','2018/02/28'),
(10,1001,10010,'2018/02/02','2018/02/23'),
(7,1001,10009,'2018/02/06','2018/02/27'),
(9,1001,10001,'2018/01/31','2018/02/21'),
(11,1001,10009,'2018/01/30','2018/02/20'),
(9,1001,10009,'2018/02/05','2018/02/26'),
(5,1001,10008,'2018/01/29','2018/02/19'),
(6,1001,10008,'2018/02/01','2018/02/22'),
(2,1001,10008,'2018/02/09','2018/03/02'),
(16,1002,10003,'2018/02/01','2018/02/22'),
(1,1002,10005,'2018/01/29','2018/02/19'),
(17,1002,10004,'2018/02/02','2018/02/23'),
(15,1002,10006,'2018/02/08','2018/03/01'),
(17,1002,10001,'2018/02/06','2018/02/27'),
(15,1002,10010,'2018/02/01','2018/02/22'),
(14,1002,10003,'2018/01/23','2018/02/13'),
(2,1002,10001,'2018/02/05','2018/02/26'),
(16,1002,10009,'2018/02/07','2018/02/14'),
(14,1002,10005,'2018/01/31','2018/02/21'),
(17,1002,10005,'2018/01/22','2018/02/12'),
(16,1002,10001,'2018/02/08','2018/03/01'),
(21,1002,10009,'2018/02/07','2018/02/28'),
(2,1002,10005,'2018/02/05','2018/02/26'),
(22,1002,10001,'2018/02/09','2018/03/02'),
(13,1002,10003,'2018/02/02','2018/02/14'),
(16,1002,10006,'2018/01/30','2018/02/20'),
(20,1002,10003,'2018/02/01','2018/02/22'),
(14,1002,10004,'2018/02/06','2018/02/15'),
(22,1002,10004,'2018/01/31','2018/02/21'),
(12,1003,10010,'2018/02/08','2018/03/01'),
(6,1003,10003,'2018/02/02','2018/02/23'),
(7,1003,10004,'2018/02/01','2018/02/22'),
(6,1003,10010,'2018/01/30','2018/02/20'),
(7,1003,10010,'2018/01/29','2018/02/19'),
(7,1003,10003,'2018/02/06','2018/02/15'),
(5,1003,10008,'2018/02/07','2018/02/15'),
(7,1003,10008,'2018/01/31','2018/02/21'),
(13,1003,10006,'2018/02/05','2018/02/16'),
(10,1003,10001,'2018/02/09','2018/03/02'),
(9,1003,10004,'2018/01/10','2018/01/31'),
(11,1003,10003,'2018/02/09','2018/03/02'),
(3,1003,10001,'2018/02/05','2018/02/16'),
(8,1003,10010,'2018/02/08','2018/03/01'),
(12,1003,10006,'2018/02/06','2018/02/17'),
(9,1003,10003,'2018/01/29','2018/02/19'),
(8,1004,10005,'2018/02/02','2018/02/23'),
(6,1004,10005,'2018/02/07','2018/02/18'),
(5,1004,10009,'2018/02/01','2018/02/22'),
(8,1004,10008,'2018/01/31','2018/02/21'),
(8,1004,10005,'2018/01/31','2018/02/21'),
(3,1004,10010,'2018/02/09','2018/03/02'),
(5,1004,10008,'2018/01/30','2018/02/20'),
(1,1004,10009,'2018/01/15','2018/02/05'),
(1,1004,10005,'2018/02/01','2018/02/22'),
(2,1004,10006,'2018/02/02','2018/02/23'),
(9,1004,10009,'2018/01/29','2018/02/19'),
(8,1004,10006,'2018/02/08','2018/03/01'),
(5,1004,10009,'2018/02/06','2018/02/27'),
(3,1004,10010,'2018/02/07','2018/02/28'),
(4,1004,10009,'2018/01/30','2018/02/20'),
(4,1004,10003,'2018/02/07','2018/02/28'),
(7,1004,10005,'2018/02/09','2018/03/02')
;

INSERT INTO tbl_book_loans
	(Bookid, Branchid, CardNo, DateOut, DueDate)
VALUES
	(3,1004,11002,'2018/01/30','2018/02/20'),
	(6,1004,11002,'2018/02/07','2018/02/28'),
	(3,1004,11002,'2018/02/09','2018/03/02'),
	(8,1004,11002,'2018/01/30','2018/02/20'),
	(5,1004,11003,'2018/02/07','2018/02/28'),
	(2,1004,11003,'2018/02/09','2018/03/02'),
	(4,1004,11003,'2018/01/30','2018/02/20'),
	(9,1004,11003,'2018/02/07','2018/02/28')
;

SELECT * FROM tbl_book
SELECT * FROM tbl_publisher
SELECT * FROM tbl_book_author
SELECT * FROM tbl_library_branch
SELECT * FROM tbl_borrower
SELECT * FROM tbl_book_copies
SELECT * FROM tbl_book_loans
