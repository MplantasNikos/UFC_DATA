DROP TABLE IF EXISTS fight_details;

CREATE TABLE fight_details (

    url VARCHAR(255),

    fighter1 VARCHAR(100),
    fighter2 VARCHAR(100),

    fighter1_sig_str VARCHAR(30),
    fighter2_sig_str VARCHAR(30),

    fighter1_sig_pct VARCHAR(10),
    fighter2_sig_pct VARCHAR(10),

    fighter1_head VARCHAR(30),
    fighter2_head VARCHAR(30),

    fighter1_body VARCHAR(30),
    fighter2_body VARCHAR(30),

    fighter1_leg VARCHAR(30),
    fighter2_leg VARCHAR(30),

    fighter1_distance VARCHAR(30),
    fighter2_distance VARCHAR(30),

    fighter1_clinch VARCHAR(30),
    fighter2_clinch VARCHAR(30),

    fighter1_ground VARCHAR(30),
    fighter2_ground VARCHAR(30),

    fight_id INT NOT NULL PRIMARY KEY,

    fighter1_id INT NULL,
    fighter2_id INT NULL,

    CONSTRAINT FK_fight_details_fight
        FOREIGN KEY (fight_id)
        REFERENCES fights(fight_id),

    CONSTRAINT FK_fight_details_fighter1
        FOREIGN KEY (fighter1_id)
        REFERENCES fighters(ID),

    CONSTRAINT FK_fight_details_fighter2
        FOREIGN KEY (fighter2_id)
        REFERENCES fighters(ID)
);

BULK INSERT fight_details
FROM 'C:\for_sql\fight_details.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    CODEPAGE = '65001',
    TABLOCK
);