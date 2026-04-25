-- 2
-- Write a Postgres trigger to block an INSERT on Orders if the
-- requested qty is greater than the stock_qty in the Products table.
CREATE OR REPLACE FUNCTION check_stock_qty() RETURNS TRIGGER AS
$$
BEGIN
    DECLARE
        available_qty INT;
    BEGIN
        SELECT stock_qty INTO available_qty FROM Tbl_Products WHERE prod_id = NEW.prod_id;
        IF NEW.qty > available_qty THEN
            RAISE EXCEPTION 'Requested quantity exceeds available stock.';
        END IF;
        RETURN NEW;
    END;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER trg
BEFORE INSERT ON Tbl_Orders
FOR EACH ROW
EXECUTE FUNCTION check_stock_qty();

INSERT INTO Tbl_Orders VALUES
(9002, 501, 101, '2026-04-20', 100);