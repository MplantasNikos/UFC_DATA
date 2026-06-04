CREATE TABLE events (
    id INT PRIMARY KEY,
    event_name NVARCHAR(500),
    main_card BIT,
    event_year INT,
    country NVARCHAR(200),
    event_month NVARCHAR(50),
    event_day INT,
    city NVARCHAR(200),
    region NVARCHAR(200),
    event_url NVARCHAR(500)
);

--το πήγαμε σε άλλο φάκελο για δικαιώματα 
BULK INSERT dbo.events
FROM 'C:\for_sql\events.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);

CREATE TABLE fights (
    fight_id INT PRIMARY KEY,
    fight_url VARCHAR(255),
    fighter_1 VARCHAR(100),
    fighter_2 VARCHAR(100),
    winner VARCHAR(100),
    weight_class VARCHAR(50),
    method VARCHAR(100),
    round_num INT,
    fight_time VARCHAR(10),
    event_name VARCHAR(255),
    event_id INT,
    fighter1_kd INT,
    fighter2_kd INT,
    fighter1_strikes INT,
    fighter2_strikes INT,
    fighter1_td INT,
    fighter2_td INT,
    fighter1_sub INT,
    fighter2_sub INT,

    CONSTRAINT fk_event
        FOREIGN KEY (event_id)
        REFERENCES events(id)
);



BULK INSERT dbo.fights
FROM 'C:\for_sql\fights.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    CODEPAGE = '65001'
);