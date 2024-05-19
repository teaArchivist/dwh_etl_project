# Data Warehousing Project

## Team Members

Alex CURRAN, Mathilde ROMAN, Chloé GRANGEON, Clémence ROLDAN, Garam BAEK

## Project Description

This project involved creating a data warehouse for the call center company ServiceSpot in order to help them analyze their call center data. Our group followed the traditional data architecture: Staging, Operational Data Storing, Data Warehousing.

The different technologies used:
- MSSQL (for storing our databases)
- Visual Studio (for our ETL process)

A large part of the project involved discussions and reaching a consensus on how our data warehouse tables would look like.

## How to Install and Run the Project

Prerequesites:
- MSSQL
- Visual Studio

***Step 1***

Open MSSQL. Click 'New Query' on the ribbon. Run the following 4 scripts by copy-pasting and executing one by one:
- Script_STA
- Script_ODS
- Script_DWH*
- Script_ADM
*Take note that this script may require a bit more time than the others to execute.

***Step 2***

Open Visual Studio. Choose "Clone a repository" and insert the link to our GitHub project. Make sure you are on the "master" branch.

***Step 3***

After the repository is cloned, double-click DWH_ETL_Project.sln in the Solution Explorer window on the right. Run each package in order, starting from the STA packages, then ODS, and finally DWH:
- STA
  - STA_Call_Charges
  - STA_Call_Data
  - STA_Call_Types
  - STA_Employees
  - STA_US_States
- ODS
  - ODS_Call_Charges
  - ODS_Employees
  - ODS_Call_Data
- DWH
  - DWH_Call_Charges
  - DWH_Employees
  - DWH_Call_Data

***Step 4***

The data warehouse is now done! You can visualize the data on MSSQL. Expand the Project_DWH database, expand the "Tables" folder, and right-click on a table of your choice and click on "Select Top 1000 Rows".

## Testing

Our project has been extensively tested from scratch to ensure that it runs smoothly. If you somehow run into a bug, please let us know!
