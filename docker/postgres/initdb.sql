CREATE DATABASE wikipedia;
\c wikipedia;

CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT,
    category_summary TEXT,
    url TEXT);

\copy categories from '/docker-entrypoint-initdb.d/categories.csv' with DELIMITER ',' CSV HEADER;

CREATE TABLE pages (
    links TEXT,
    page_categories TEXT,
    page_id INTEGER PRIMARY KEY,
    summary TEXT,
    title TEXT,
    url TEXT);

\copy pages from '/docker-entrypoint-initdb.d/pages.csv' with DELIMITER ',' CSV HEADER;

CREATE TABLE categories_pages (
    page_id INTEGER REFERENCES pages,
    time_stamp TIMESTAMP,
    title TEXT,
    type TEXT,
    category_id INTEGER REFERENCES categories,
    category_name TEXT);

\copy categories_pages from '/docker-entrypoint-initdb.d/categories_pages.csv' with DELIMITER ',' CSV HEADER;
