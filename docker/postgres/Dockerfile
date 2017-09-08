FROM postgres

COPY initdb.sql /docker-entrypoint-initdb.d/initdb.sql
COPY data/categories.csv /docker-entrypoint-initdb.d/categories.csv
COPY data/pages.csv /docker-entrypoint-initdb.d/pages.csv
COPY data/categories_pages.csv /docker-entrypoint-initdb.d/categories_pages.csv