\c test;
CREATE TABLE test (
                      id serial PRIMARY KEY,
                      test_int INT NULL,
                      test_contents varchar(50) NULL,
                      created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                      updated_at TIMESTAMP NULL,
                      deleted_at TIMESTAMP NULL
);
INSERT INTO test (test_int, test_contents)
VALUES
    (12, '가나다'),
    (34, 'abc');