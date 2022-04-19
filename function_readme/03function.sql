use mylib;
DELIMITER $$
DROP FUNCTION IF EXISTS keep_how_many_copies_late $$
CREATE FUNCTION keep_how_many_copies_late (ReaderID int)
RETURNS INTEGER DETERMINISTIC
BEGIN
	DECLARE res INTEGER;
	IF ((
		SELECT COUNT(*) 
		FROM copies_on_loan_late as coll
		WHERE coll.ReaderID = ReaderID) = 0) 
	THEN
		RETURN 0;
	ELSE
		SELECT COUNT(*) INTO res 
        FROM copies_on_loan_late as coll 
        WHERE coll.ReaderID = ReaderID;
		RETURN res;
	END IF;
END
$$
DELIMITER ;

DELIMITER $$
drop function if exists get_readID_from_name $$
create function get_readID_from_name(ReaderName Varchar(50)) 
returns integer deterministic
begin
	declare res integer;
    if ((
		select count(*)
        from reader as r
        where r.reader_name = ReaderName) = 0)
    then return -1;
    else
		select readID into res from reader where reader.reader_name = ReaderName;
        return res;
    end if;
end;
$$
DELIMITER ;

DELIMITER $$
drop function if exists get_name_from_readID $$
create function get_name_from_readID(ReaderID INT) 
returns varchar(50) deterministic
begin
	declare res varchar(50);
    if ((
		select count(*)
        from reader as r
        where r.readID = ReaderID) = 0)
    then return "No reader matched!";
    else
		select reader_name into res from reader where reader.readID = ReaderID;
        return res;
    end if;
end
$$
DELIMITER ;

-- select get_name_from_readID(10) from reader;

-- select get_readID_from_name("Emmanuel Macron") from reader;

-- select distinct ReaderID, ReaderName, keep_how_many_copies_late(ReaderID) as "HowManyCurrentlyLate"
-- from copies_on_loan_late;