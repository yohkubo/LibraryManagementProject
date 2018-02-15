USE library_mgmt

-- Stored Procedure 1 & 2 --
-- Checking which branch has what and how many books 

CREATE PROCEDURE uspGetBookLibrary
	@Title nvarchar(50) = NULL, @BranchName nvarchar(50) = NULL

AS

SELECT tbl_book.Title, tbl_library_branch.BranchName, No_Of_Copies
FROM tbl_book_copies
	INNER JOIN tbl_book ON tbl_book.Bookid = tbl_book_copies.Bookid
	INNER JOIN tbl_library_branch ON tbl_library_branch.Branchid = tbl_book_copies.Branchid
WHERE tbl_book.Title LIKE '%' + ISNULL(@Title, tbl_book.Title) + '%' 
	AND tbl_library_branch.BranchName LIKE '%' + ISNULL(@BranchName, tbl_library_branch.BranchName) + '%'


[dbo].[uspGetBookLibrary]

@BranchName = 'Sharpstown'

-- Stored Procedure 3 --

CREATE PROCEDURE uspGetPersonNoBorrow
-- Checking which borrower is not borrowing --

AS

SELECT a1.CardNo, a1.name, COUNT(a2.CardNo) AS Number
FROM tbl_borrower a1
	LEFT JOIN tbl_book_loans a2 ON a2.CardNo = a1.CardNo
	GROUP BY a1.CardNo, a1.name
HAVING COUNT(a2.CardNo) = 0;


-- Stored Procedure 4 --
CREATE PROCEDURE uspGetBookSharpstownDueToday
-- Checking if there is any book loaned from "Sharpstown" branch and whose duedate is today.

AS

SELECT a4.BranchName, a1.Bookid, a3.Title, a1.DateOut, a1.DueDate, a2.Name, a2.Address
FROM tbl_book_loans a1
	INNER JOIN tbl_borrower a2 ON a2.CardNo = a1.CardNo
	INNER JOIN tbl_book a3 ON a3.Bookid = a1.Bookid
	INNER JOIN tbl_library_branch a4 ON a4.Branchid = a1.Branchid
WHERE a1.DueDate = (SELECT CONVERT(date,GETDATE())) AND a1.Branchid = 1001

-- Stored Procedure 5 --
CREATE PROCEDURE uspGetNumberLoans
--Counting how many books loaned from each branch

AS

SELECT a2.BranchName, COUNT(*) AS NumberOfLoans 
FROM tbl_book_loans a1
	INNER JOIN tbl_library_branch a2 ON a2.Branchid = a1.Branchid
GROUP BY a1.Branchid, a2.BranchName

-- Stored Procedure 6 --
CREATE PROCEDURE uspGetInfoBorrowerLoans
--Checking who loans more than 5 books, and get their personal info

AS

SELECT a1.CardNo, a2.Name, COUNT(*) AS Number
FROM tbl_book_loans a1
	INNER JOIN tbl_borrower a2 ON a2.CardNo = a1.CardNo
GROUP BY a1.CardNo, a2.Name
HAVING COUNT(*) > 5

-- Stored Procedure 7 --
CREATE PROCEDURE uspGetAutherBranchCopy
	@AuthorName nvarchar(50) = NULL, @BranchName nvarchar(30) = NULL
-- Checking if which branch has which author's book, and how many copies they have.
-- Searching by Author's name and branch name

AS

SELECT a2.Bookid, a2.Title, a4.AuthorName, a3.BranchName, a1.No_Of_Copies  
FROM tbl_book_copies a1
	INNER JOIN tbl_book a2 ON a2.Bookid = a1.Bookid
	INNER JOIN tbl_library_branch a3 ON a3.Branchid = a1.Branchid
	LEFT JOIN tbl_book_author a4 ON a4.Bookid = a2.Bookid
WHERE a4.AuthorName LIKE '%' + ISNULL(@AuthorName, a4.AuthorName) + '%'
	AND a3.BranchName LIKE '%' + ISNULL(@BranchName, a3.BranchName) + '%'


[dbo].[uspGetInfoCentralStephenKing]
@AuthorName = 'King',
@BranchName = 'C'
