USE [SmartOffice]
GO

INSERT INTO [dbo].[Department]
           ([DpmtName]
           ,[DpmtCity]
           ,[DpmtState]
           ,[DpmtCountry])
     VALUES
		   ('Admin Office','Fairfield','CT','US'),
		   ('Human Resource Department','Fairfield','CT','US'),
		   ('Financial Department','New York City','NY','US'),
		   ('Manufacture Department','Charlotte','NC','US'),	   
		   ('Logistic Department','Charlotte','NC','US'),
		   ('Sales Department','Dallas','TX','US')
GO

select * from Department




