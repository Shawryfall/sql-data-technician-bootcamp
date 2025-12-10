# SQL Portfolio - Data Technician Training

SQL queries and database design projects from my Data Technician bootcamp.

## Projects

### 1. Corner Shop Database
**File:** `corner_shop_database.sql`

Designed a retail database system for inventory, sales, and customer loyalty tracking.

- 4 normalized tables with proper relationships
- Foreign key constraints
- Sample data and business queries

### 2. World Database Analysis
**File:** `world_database_queries.sql`

19 SQL queries analyzing global cities and countries data:
- Population statistics
- Geographic filtering
- Multi-table joins
- Aggregate functions

## Skills Demonstrated

- Database design and normalization
- Complex SQL queries (JOIN, GROUP BY, subqueries)
- Aggregate functions (COUNT, AVG, MIN, MAX)
- Data analysis and reporting

## Setup

**Prerequisites:** MySQL 5.7+ or 8.0+

### Corner Shop Database (Ready to Use)
```bash
mysql -u root -p < corner_shop_database.sql
```

### World Database Queries
1. Download the World Database: [world_db.sql](https://justit831-my.sharepoint.com/:u:/g/personal/danpe_justit_co_uk/Ef6vAaaYVi5FhHqKGxqnn60B9g2khoYekEIO3Y7J00UcJQ?e=pv9NNE)
2. Import it:
```bash
mysql -u root -p < world_db.sql
```
3. Run the queries:
```bash
mysql -u root -p world < world_database_queries.sql
```
