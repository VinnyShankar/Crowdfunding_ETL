-- DROP TABLES IF THEY EXIST
DROP TABLE IF EXISTS contacts CASCADE;
DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS subcategory CASCADE;
DROP TABLE IF EXISTS campaigns CASCADE;

-- CREATE TABLES

CREATE TABLE contacts (
    contact_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	email VARCHAR NOT NULL
);

CREATE TABLE category (
    category_id VARCHAR PRIMARY KEY NOT NULL,
    category VARCHAR NOT NULL
);

CREATE TABLE subcategory (
    subcategory_id VARCHAR PRIMARY KEY NOT NULL,
    subcategory VARCHAR NOT NULL
);

CREATE TABLE campaigns (
    cf_id INT NOT NULL,
    contact_id INT NOT NULL,
    company_name VARCHAR NOT NULL,
    description VARCHAR NOT NULL,
    goal float NOT NULL,
    pledged float NOT NULL,
    outcome VARCHAR NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR NOT NULL,
    currency VARCHAR NOT NULL,
    launched_date VARCHAR NOT NULL,
    end_date VARCHAR NOT NULL,
    category_id VARCHAR NOT NULL,
    subcategory_id VARCHAR NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (category_id) REFERENCES category(category_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

-- COPY CSV DATA INTO TABLES

-- Contacts
COPY contacts (
	contact_id,
	first_name,
	last_name,
	email
)
FROM 'D:\data\contacts_pandas.csv'
DELIMITER ','
CSV HEADER;

-- Category
COPY category (
	category_id,
	category
)
FROM 'D:\data\category.csv'
DELIMITER ','
CSV HEADER;

-- Subcategory
COPY subcategory (
	subcategory_id,
	subcategory
)
FROM 'D:\data\subcategory.csv'
DELIMITER ','
CSV HEADER;

-- Campaigns
COPY campaigns (
	cf_id,
	contact_id,
	company_name,
	description,
	goal,
	pledged,
	outcome,
	backers_count,
	country,
	currency,
	launched_date,
	end_date,
	category_id,
	subcategory_id
)
FROM 'D:\data\campaign.csv'
DELIMITER ','
CSV HEADER;

-- Test Queries
SELECT * FROM contacts LIMIT 10;
SELECT * FROM category;
SELECT * FROM subcategory;
SELECT * FROM campaigns LIMIT 10;
