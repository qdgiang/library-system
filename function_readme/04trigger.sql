use mylib;
DROP TRIGGER IF exists borrow_copy;
DELIMITER $$
CREATE TRIGGER borrow_copy
AFTER insert
ON reservation FOR EACH ROW
UPDATE copy
SET copy.availability = False 
WHERE copy.isbn = New.isbn and copy.copyID = new.copyID;
$$
DELIMITER ;

DROP TRIGGER IF exists return_copy;
DELIMITER $$
CREATE TRIGGER return_copy
AFTER UPDATE
ON reservation FOR EACH ROW
begin
if NEW.returned  = true
then
UPDATE copy
SET copy.availability = True
WHERE copy.isbn = New.isbn and copy.copyID = NEW.copyID;
end if ;
end ;
$$
DELIMITER ;

DROP TRIGGER IF exists update_correct_due_date;
DELIMITER $$
CREATE TRIGGER update_correct_due_date
BEFORE UPDATE
ON reservation FOR EACH ROW
BEGIN
    DECLARE errorMessage VARCHAR(255);
    SET errorMessage = CONCAT('You are inputting an error! The due date ',
                        NEW.due_date,
                        ' cannot be earlier than the issue date ',
                        NEW.issue_date);
                        
    IF NEW.due_date < NEW.issue_date THEN
        SIGNAL SQLSTATE '11111' 
            SET MESSAGE_TEXT = errorMessage;
    END IF;
END ;
$$
DELIMITER ;

-- DROP TRIGGER IF EXISTS gimme_back_my_books;
-- DELIMITER $$
-- CREATE TRIGGER gimme_back_my_books
-- BEFORE INSERT
-- ON reservation FOR EACH ROW
-- BEGIN
	-- DECLARE errorMessage VARCHAR(255);
    -- SET errorMessage = 'Not cool man. Gimme back my previous book first';
	-- if new.readID in ( 
		-- SELECT ReaderID FROM all_copies_on_loan
        -- ) then SIGNAL SQLSTATE '45001' 
           -- SET MESSAGE_TEXT = errorMessage;
	-- end if;
-- END ;
-- $$
-- DELIMITER ;

DROP TRIGGER IF EXISTS gimme_back_my_books_UPDATE;
DELIMITER $$
CREATE TRIGGER gimme_back_my_books_UPDATE
BEFORE INSERT
ON reservation FOR EACH ROW
BEGIN
	DECLARE errorMessage VARCHAR(255);
    SET errorMessage = concat('Yo ', get_name_from_readID(NEW.readID),
    ", you have ", keep_how_many_copies_late(new.readID), 
    " copies that are past due date. Give them back pls, if you would :)");
	if keep_how_many_copies_late(new.readID) >= 3
    then SIGNAL SQLSTATE '45001' 
            SET MESSAGE_TEXT = errorMessage;
	end if;
END ;
$$
DELIMITER ;



