use mylib;

drop procedure if exists book_where;
DELIMITER //
CREATE Definer = 'root'@'localhost' PROCEDURE book_where
(IN bookname VARCHAR(100))
BEGIN
	-- DECLARE search varchar(102); set search = concat('%',bookname,'%');
  SELECT distinct b.title, br.b_name, br.address
  FROM branch as br, copy as c, book as b
  WHERE b.title like concat('%',bookname,'%') and c.isbn = b.isbn and c.availability = True and br.branchID = c.branchID
  order by title, b_name;
END //
DELIMITER ;

-- call book_where('harry');

drop procedure if exists choose_category;
DELIMITER //
CREATE Definer = 'root'@'localhost' PROCEDURE choose_category
(IN category VARCHAR(100), location VARCHAR(100))
BEGIN
IF location IS NULL THEN
  SELECT b.title, group_concat(distinct br.b_name) as "BranchName"
  FROM branch as br, copy as c, book as b, category as cate, book_has_categories as bhc
  WHERE cate.cate_name like concat('%',category,'%') and bhc.cateID = cate.cateID and b.isbn = bhc.isbn
  and c.isbn = b.isbn and c.availability = True and br.branchID = c.branchID
  group by b.title
  order by title, b_name;
ELSE
  SELECT b.title, group_concat(distinct br.b_name) as "Branch Name"
  FROM branch as br, copy as c, book as b, category as cate, book_has_categories as bhc
  WHERE cate.cate_name like concat('%',category,'%') and bhc.cateID = cate.cateID and b.isbn = bhc.isbn
  and c.isbn = b.isbn and c.availability = True and br.branchID = c.branchID 
  and (br.address like concat('%',location,'%') or br.b_name like concat('%',location,'%')) 
  group by b.title
  order by title, b_name;
  END IF;
END //
DELIMITER ;
-- call choose_category('text',NULL);
-- call choose_category('text','Ho Ch');


drop procedure if exists add_new_reservation;
DELIMITER //
CREATE Definer = 'root'@'localhost' PROCEDURE add_new_reservation
(IN isbn VARCHAR(20), IN copyID INT, IN readerName VARCHAR(50), in libID INT)
BEGIN
INSERT INTO reservation(`issue_date`, `due_date`, `readID`, `copyID`, `isbn`, `returned`, `libID`)
VALUES(curdate(), DATE_ADD(curdate(), INTERVAL 1 MONTH), get_readID_from_name(readerName), copyID, isbn, False, libID) ; 
END //
DELIMITER ;


-- select * from copies_on_loan_late;
-- call add_new_reservation(17, 2, "Boris Johnson", 6);
-- call add_new_reservation(17, 2, "Angela Merkel", 6);
-- call add_new_reservation(15, 2, "Joe Biden", 4);




