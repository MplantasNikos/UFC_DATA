
CREATE TABLE fights (

    fight_id INT PRIMARY KEY,

    fight_url VARCHAR(255),

    fighter_1 VARCHAR(100),
    fighter_2 VARCHAR(100),

    winner VARCHAR(100),

    weight_class VARCHAR(100),

    method VARCHAR(100),

    round_num INT,

    fight_time VARCHAR(10),

    event_name VARCHAR(255),

    event_id INT,

    fighter1_kd FLOAT,
    fighter2_kd FLOAT,

    fighter1_strikes FLOAT,
    fighter2_strikes FLOAT,

    fighter1_td FLOAT,
    fighter2_td FLOAT,

    fighter1_sub FLOAT,
    fighter2_sub FLOAT,

    fighter1_id INT,
    fighter2_id INT,

    CONSTRAINT FK_fights_events
        FOREIGN KEY (event_id)
        REFERENCES events(ID),

    CONSTRAINT FK_fights_fighter1
        FOREIGN KEY (fighter1_id)
        REFERENCES fighters(ID),

    CONSTRAINT FK_fights_fighter2
        FOREIGN KEY (fighter2_id)
        REFERENCES fighters(ID)
);


BULK INSERT fights
FROM 'C:\for_sql\fights.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001'
);