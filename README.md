# University Student Information System (USIS) Database Setup
A University Student Information System school project

## Overview
This guide will walk you through the steps to set up the USIS database, including creating the necessary tables, views, triggers, stored procedures, and inserting data. Please ensure that you have MySQL or a compatible database management system installed before proceeding.

## Prerequisites
Database Management System: MySQL
Database User: Ensure you have a user with privileges to create databases, tables, views, triggers, and stored procedures.

## Files Description
The following files are provided to help you set up the USIS database:

- **table_creation.sql:** Contains the SQL statements to create all necessary tables for the database.
- **db_views.sql:** Defines the database views used to simplify complex queries.
- **db_update_data.sql:** SQL commands for updating existing data in the tables.
- **db_triggers.sql:** Defines the triggers to enforce data integrity and automation.
- **db_table_structure.sql:** Provides a snapshot of the table structure and relationships among them.
- **db_stored_procedures.sql:** Contains stored procedures for commonly executed database operations.
- **db_retrieve_data.sql:** Queries to retrieve data from the database.
- **db_data_insertion.sql:** Inserts the initial set of data into the database.
- **db_data_deletion.sql:** Commands to delete data when needed.

## Step-by-Step Setup Instructions
### Step 1: Create the Database and tables
Open your MySQL command line or any SQL client of your choice (e.g., MySQL Workbench).

Run the **table_creation.sql** file in MySQL to create both the database and the tables

### Step 2: Verify Table Structure
Optionally, you can verify the structure of the tables by running the **db_table_structure.sql** script.

This will give you a snapshot of the tables and relationships in the USIS database.

### Step 3: Insert Initial Data
To populate the database with sample data, execute the **db_data_insertion.sql** script

This will insert sample records into the tables such as students, courses, faculties, and more.

### Step 4: Create Views
The **db_views.sql** file contains SQL statements to create views for common queries.

Execute this file to create the necessary views.

### Step 5: Add Triggers
The **db_triggers.sql** file contains triggers to automate tasks such as updating timestamps or managing related data.

Execute the script to add the triggers.

### Step 6: Create Stored Procedures
To simplify database operations, several stored procedures are defined in the **db_stored_procedures.sql** file.

Execute this script to create them.

### Step 7: Update and Delete Data
If you need to update existing data, run the **db_update_data.sql** script.

For deleting records, use **db_data_deletion.sql**.

### Step 8: Retrieve Data
You can retrieve data from the database using the predefined queries in **db_retrieve_data.sql**.

Run the script to fetch information from the tables.
