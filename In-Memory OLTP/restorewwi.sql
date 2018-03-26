restore database WideWorldImporters from disk = 'C:\Users\hegraca\OneDrive - Microsoft\Deliveries\PPEs\PRSM259 SQL Server 2017\windows\WideWorldImporters-Full.bak' with
move 'WWI_Primary' to 'C:\Users\hegraca\OneDrive - Microsoft\Deliveries\PPEs\PRSM259 SQL Server 2017\windows\data\WideWorldImporters.mdf',
move 'WWI_UserData' to 'C:\Users\hegraca\OneDrive - Microsoft\Deliveries\PPEs\PRSM259 SQL Server 2017\windows\data\WideWorldImporters_UserData.ndf',
move 'WWI_Log' to 'C:\Users\hegraca\OneDrive - Microsoft\Deliveries\PPEs\PRSM259 SQL Server 2017\windows\log\WideWorldImporters.ldf',
move 'WWI_InMemory_Data_1' to 'C:\Users\hegraca\OneDrive - Microsoft\Deliveries\PPEs\PRSM259 SQL Server 2017\windows\data\WideWorldImporters_InMemory_Data_1',
stats=5
go