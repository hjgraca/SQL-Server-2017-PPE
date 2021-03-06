This is a repro package to demonstrate the Automatic Tuning (Auto Plan Correction) in SQL Server 2017. This feature is using telemtry from the Query Store feature we launched with Azure SQL Database and SQL Server 2016 to provide built-in intelligence.

This repro assumes the following:

* Windows
* SQL Server 2017 installed (pick at minimum Database Engine) default instance.
* You have installed SQL Server Management Studio or SQL Operations Studio
* Download database WideWorldImporters-Full.bak https://github.com/Microsoft/sql-server-samples/releases/tag/wide-world-importers-v1.0

1. Install ostress from the package RML_Setup_AMD64.msi. Add C:\Program Files\Microsoft Corporation\RMLUtils to your path.

2. Restore the WideWorldImporters database backup to your SQL Server 2017 instance. The WideWorldImporters-Full.bak is provided along with a restorewwi.sql script to restore the database. This script assumes the backup is in the c:\demos\autotune directory and that all database files will be placed in c:\temp

3. Run repro_setup.cmd to customize the WideWorldImporters database for the demo

4. Setup Performance Monitor to track SQL Statistics/Batch Requests/sec

5. Run initalize.cmd to setup the repro for default of recommendations.

6. Run report.cmd to start the workload. This will pop-up a command window running the workload. Note the chart showing Batch Requests/Sec as your workload throughput

7. Run regression.cmd (you may need to run this two or three times). Notice the drop in batch requests/sec which shows a performance regression in your workload.

8. Load recommendations.sql into SQL Server Management Studio or SQL Operations Studio and review the results. Notice the time difference under the reason column and value of state_transition_reason which should be AutomaticTuningOptionNotEnabled. This means we found a regression but are recommending it only, not automatically fixing it. The script column shows a query that could be used to fix the problem.

9. Stop the report.cmd workload by pressing <Ctrl>+<C> in the command window and pressing 'y' to stop. This should close that command window.

10. Now let's see what happens with automatic plan correction which uses this command in SQL Server 2017

**ALTER DATABASE <db>
SET AUTOMATIC_TUNING ( FORCE_LAST_GOOD_PLAN = ON )**

11. Run auto_tune.cmd which uses the above command to set automatic plan correct ON for WideWorldImporters

12. Repeat steps 6-8 as above. In Performance Monitor you will see the batch requests/sec dip but within a second go right back up. This is because SQL Server detected the regression and automatically reverted to "last known good" or the last known good query plan as found in the Query Store. Note in the output of recommendations.sql the state_transition_reason now says LastGoodPlanForced.