
CREATE PROCEDURE deactived_unpaid_account()
LANGUAGE SQL
as $$
    UPDATE accounts SET account = false WHERE balance = 0;
$$;
CALL  deactived_unpaid_account();

CREATE FUNCTION account_type_count(acount_type text) RETURNS INTEGER
LANGUAGE plpgsql
as $$
    DECLARE account_count INT
    BEGIN
        SELECT (*) INTO account_count FROM accounts WHERE accounts.account_type = $1;
        RETURN  account_count;
    END;
$$;
