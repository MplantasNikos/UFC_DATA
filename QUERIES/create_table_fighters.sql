DROP TABLE IF EXISTS fighters;

CREATE TABLE fighters (

    url VARCHAR(255),

    name VARCHAR(100) NOT NULL,

    nickname VARCHAR(100),

    record VARCHAR(20),

    wins INT,
    losses INT,
    draws FLOAT,

    Height VARCHAR(20),
    Weight VARCHAR(20),
    Reach VARCHAR(20),

    STANCE VARCHAR(50),

    DOB VARCHAR(30),

    SLpM VARCHAR(20),

    [Str. Acc.] VARCHAR(10),

    SApM VARCHAR(20),

    [Str. Def] VARCHAR(10),

    [TD Avg.] VARCHAR(20),

    [TD Acc.] VARCHAR(10),

    [TD Def.] VARCHAR(10),

    [Sub. Avg.] VARCHAR(20),

     ID INT NOT NULL PRIMARY KEY

);


BULK INSERT fighters
FROM 'C:\for_sql\fighters.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);