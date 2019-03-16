# Learning in Communities: How Do Outstanding Users Differ From Other Users?

## Summary
This project is part of a scientific research. We are interested in knowing the influence of experts in discussions.
You can find here the analysis of the paper "Learning in Communities: How Do Outstanding Users Differ From Other Users?" published at the 17th IEEE International Conference on Advanced Learning Technologies - ICALT 2018.
In other words, you will find here everything you need to reproduce this research.
First, read the paper and then follow the instructions below.

## Environment
- R version 3.4.2 (available at https://www.r-project.org/)
- PostgresSQL database version 9.5 (available at http://dev.mysql.com/downloads/)
- Ubuntu version 16.04.4 LTS

### Inserting data into PostgresSQL
- Follow the instructions provided here (https://github.com/thiagoprocaci/qa-communities-analysis/tree/postgres-migration/)

### How did you generate the csv files used in R scripts?

We execute several SQL commands in PostgresQL in order to extract the csv contents.
Each analysis provided in this GitHub repository contains the SQLs which we used to generate the csv and the R Script as well.

