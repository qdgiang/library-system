use mylib;

CREATE OR REPLACE VIEW all_copies_on_loan AS 
SELECT r.readID as "ReaderID", r.reader_name as "ReaderName", copy.copyID, 
b.title as "BookName", due_date as "DueDate", datediff(due_date, now()) as 'RemainingDuration'
from reader as r, reservation as re
JOIN copy on copy.copyID = re.copyID and copy.isbn = re.ISBN
join book as b on b.isbn = copy.isbn
where returned = False and re.readID = r.readID
order by RemainingDuration asc;

-- Create a view of all copies that are late
CREATE OR REPLACE VIEW copies_on_loan_late AS 
SELECT r.readID as "ReaderID", r.reader_name as "ReaderName", copy.copyID as "CopyID", 
b.title as "BookName", due_date as "DueDate", datediff(due_date, now()) as 'RemainingDuration'
from reader as r, reservation as re
JOIN copy on copy.copyID = re.copyID and copy.isbn = re.ISBN
join book as b on b.isbn = copy.isbn
where returned = False and due_date < NOW() and re.readID = r.readID
order by RemainingDuration asc;

-- select * from all_copies_on_loan where ReaderName LIKE '%Data%' OR BookName LIKE '%Data%' OR DueDate LIKE '%Data%' OR RemainingDuration LIKE '%Data%';