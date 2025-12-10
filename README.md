# SQL Data Technician Workbook

This repository contains SQL work based on a training workbook.  
It includes:

- A small **retail / corner shop schema** with sample data
- A collection of **analysis queries** using the classic `world` sample database

The goal is to provide clear, self-contained SQL that can be cloned and reused by anyone learning SQL.

---

## Contents

- `sql/01_cornershop_schema.sql`  
  Schema and sample data for a simple corner-shop database with products, customers, sales, and sale items.

- `sql/02_world_db_practical.sql`  
  A series of queries solving realistic scenarios using the MySQL `world` sample database.

---

## Getting started

### 1. Requirements

- Any SQL database that supports standard SQL and the `world` schema  
  (e.g. MySQL / MariaDB).

### 2. Corner shop schema

To create the corner shop database and insert sample data:

```bash
mysql -u your_user -p < sql/01_cornershop_schema.sql
