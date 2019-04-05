USE [SmartOffice]
GO

DROP TABLE MthSalesReport
DROP TABLE LogReport
DROP TABLE ContractApproval
DROP TABLE BorrowItemsApproval
DROP TABLE ReimburseApproval
DROP TABLE OvertimeApproval
DROP TABLE LeavingApproval
DROP TABLE Employee
DROP TABLE Department

GO

CREATE TABLE Department(
	DpmtId              INT                NOT NULL      IDENTITY(1,1),
	DpmtName            NVARCHAR(30)       NOT NULL      UNIQUE,
	DpmtCity			NVARCHAR(20)	   NOT NULL,
	DpmtState           NVARCHAR(10)       NOT NULL,
	DpmtCountry			NVARCHAR(20)       NOT NULL,
	PRIMARY KEY(DpmtId)
)
GO

CREATE TABLE Employee(
	EmpyId              INT                NOT NULL      IDENTITY(1,1),
	EmpyName            NVARCHAR(30)       NOT NULL      UNIQUE,
	EmpyAge				INT				   NOT NULL,
	EmpyGender          NVARCHAR(10)       NOT NULL,
	EmpyDOB				DATE               NOT NULL,
	EmpyHmPhnNo         NUMERIC							 UNIQUE,
	EmpyMbPhnNo         NUMERIC		       NOT NULL		 UNIQUE,
	EmpyEmail			NVARCHAR(30)       NOT NULL,
	EmpyMailAdd         NVARCHAR(100)      NOT NULL,
	DpmtId				INT                NOT NULL,
	DpmtName			NVARCHAR(30)       NOT NULL,
	EmpyJobTitle		NVARCHAR(50)       NOT NULL,
	EmpyDrctMgId		INT,
	EmpyDrctMgName		NVARCHAR(30),
	PRIMARY KEY(EmpyId),
	FOREIGN KEY(DpmtId) REFERENCES Department(DpmtId),
	FOREIGN KEY(EmpyDrctMgId) REFERENCES Employee(EmpyId)
)
GO

CREATE TABLE LeavingApproval(
	LAppId              INT                NOT NULL      IDENTITY(1,1),
	LAppTime            DATETIME           NOT NULL,
	DpmtId				INT				   NOT NULL,
	DpmtName            NVARCHAR(30)       NOT NULL,
	LAppType			NVARCHAR(30)       NOT NULL,
	LDestination        NVARCHAR(50)       NOT NULL,
	LAppStartTime       DATETIME           NOT NULL,
	LAppEndTime			DATETIME           NOT NULL,
	LAppDuration        DATETIME           NOT NULL,
	LReason				NVARCHAR(500)      NOT NULL,
	RequesterEpId		INT                NOT NULL,
	RequesterEpNm		NVARCHAR(30)       NOT NULL,
	ApproverEpId		INT			       NOT NULL,
	ApproverEpNm		NVARCHAR(30)       NOT NULL,
	DecisionStatus		BIT,
	PRIMARY KEY(LAppId),
	FOREIGN KEY(DpmtId) REFERENCES Department(DpmtId),
	FOREIGN KEY(RequesterEpId) REFERENCES Employee(EmpyId),
	FOREIGN KEY(ApproverEpId) REFERENCES Employee(EmpyId)
)
GO

CREATE TABLE OvertimeApproval(
	OAppId              INT                NOT NULL      IDENTITY(1,1),
	OAppTime            DATETIME           NOT NULL,
	DpmtId				INT				   NOT NULL,
	DpmtName            NVARCHAR(30)       NOT NULL,
	PublicHolidayYN		BIT				   NOT NULL,
	CompMethod			NVARCHAR(50)       NOT NULL,
	OAppStartTime       DATETIME           NOT NULL,
	OAppEndTime			DATETIME           NOT NULL,
	OAppDuration        DATETIME           NOT NULL,
	OReason				NVARCHAR(500)      NOT NULL,
	RequesterEpId		INT                NOT NULL,
	RequesterEpNm		NVARCHAR(30)       NOT NULL,
	ApproverEpId		INT			       NOT NULL,
	ApproverEpNm		NVARCHAR(30)       NOT NULL,
	DecisionStatus		BIT,
	PRIMARY KEY(OAppId),
	FOREIGN KEY(DpmtId) REFERENCES Department(DpmtId),
	FOREIGN KEY(RequesterEpId) REFERENCES Employee(EmpyId),
	FOREIGN KEY(ApproverEpId) REFERENCES Employee(EmpyId)
)
GO

CREATE TABLE ReimburseApproval(
	RAppId              INT                NOT NULL      IDENTITY(1,1),
	RAppTime            DATETIME           NOT NULL,
	DpmtId				INT				   NOT NULL,
	DpmtName            NVARCHAR(30)       NOT NULL,
	RAppAmount			INT				   NOT NULL,
	RAppType			NVARCHAR(50)       NOT NULL,
	RExpDetails         NVARCHAR(500)       NOT NULL,
	RequesterEpId		INT                NOT NULL,
	RequesterEpNm		NVARCHAR(30)       NOT NULL,
	ApproverEpId		INT			       NOT NULL,
	ApproverEpNm		NVARCHAR(30)       NOT NULL,
	DecisionStatus		BIT,
	PRIMARY KEY(RAppId),
	FOREIGN KEY(DpmtId) REFERENCES Department(DpmtId),
	FOREIGN KEY(RequesterEpId) REFERENCES Employee(EmpyId),
	FOREIGN KEY(ApproverEpId) REFERENCES Employee(EmpyId)
)
GO

CREATE TABLE BorrowItemsApproval(
	BAppId              INT                NOT NULL      IDENTITY(1,1),
	BAppTime            DATETIME           NOT NULL,
	DpmtId				INT				   NOT NULL,
	DpmtName            NVARCHAR(30)       NOT NULL,
	BAppItemUse			NVARCHAR(50)       NOT NULL,
	BAppItem			NVARCHAR(30)       NOT NULL,
	BAppQuantity        INT				   NOT NULL,
	BDetails			NVARCHAR(500)      NOT NULL,
	RequesterEpId		INT                NOT NULL,
	RequesterEpNm		NVARCHAR(30)       NOT NULL,
	ApproverEpId		INT			       NOT NULL,
	ApproverEpNm		NVARCHAR(30)       NOT NULL,
	DecisionStatus		BIT,
	PRIMARY KEY(BAppId),
	FOREIGN KEY(DpmtId) REFERENCES Department(DpmtId),
	FOREIGN KEY(RequesterEpId) REFERENCES Employee(EmpyId),
	FOREIGN KEY(ApproverEpId) REFERENCES Employee(EmpyId)
)
GO

CREATE TABLE ContractApproval(
	CAppId              INT                NOT NULL      IDENTITY(1,1),
	CAppTime            DATETIME           NOT NULL,
	DpmtId				INT				   NOT NULL,
	DpmtName            NVARCHAR(30)       NOT NULL,
	CAppNo				NVARCHAR(30)       NOT NULL      UNIQUE,
	CAppSignDate		DATETIME           NOT NULL,
	MyPartyName         NVARCHAR(30)       NOT NULL,
	MyPartyEpId			INT                NOT NULL,
	MyPartyEpNm         NVARCHAR(30)       NOT NULL,
	OppPartyEpNm        NVARCHAR(30)       NOT NULL,
	CAppContent			NVARCHAR(500)      NOT NULL,
	RequesterEpId		INT                NOT NULL,
	RequesterEpNm		NVARCHAR(30)       NOT NULL,
	ApproverEpId		INT			       NOT NULL,
	ApproverEpNm		NVARCHAR(30)       NOT NULL,
	DecisionStatus		BIT,
	PRIMARY KEY(CAppId),
	FOREIGN KEY(DpmtId) REFERENCES Department(DpmtId),
	FOREIGN KEY(RequesterEpId) REFERENCES Employee(EmpyId),
	FOREIGN KEY(ApproverEpId) REFERENCES Employee(EmpyId),
	FOREIGN KEY(MyPartyEpId) REFERENCES Employee(EmpyId)
)
GO

CREATE TABLE LogReport(
	LogId              INT                NOT NULL      IDENTITY(1,1),
	LogTime            DATETIME           NOT NULL,
	LogType			   NVARCHAR(30)       NOT NULL,
	Complete           NVARCHAR(1000),
	Incomplete         NVARCHAR(1000),
	Pending		       NVARCHAR(1000),
	NextPlan		   NVARCHAR(1000),
	Note			   NVARCHAR(30),
	ReporterEpId	   INT                NOT NULL,
	ReporterEpNm	   NVARCHAR(30)       NOT NULL,
	RecipientEpId	   INT			      NOT NULL,
	RecipientEpNm	   NVARCHAR(30)       NOT NULL,
	Comments		   NVARCHAR(1000),
	ReadStatus		   BIT,
	PRIMARY KEY(LogId),
	FOREIGN KEY(ReporterEpId) REFERENCES Employee(EmpyId),
	FOREIGN KEY(RecipientEpId) REFERENCES Employee(EmpyId)
)
GO

CREATE TABLE MthSalesReport(
	SalesRpId              INT                NOT NULL      IDENTITY(1,1),
	SalesRpTime            DATETIME           NOT NULL,
	Sales			       NVARCHAR(30)       NOT NULL,
	Clients                NVARCHAR(30)		  NOT NULL,
	ItemName               NVARCHAR(100),
	Quantity		       INT                NOT NULL,
	Revenue		           FLOAT,
	SalesTarget			   FLOAT,
	Feedback			   NVARCHAR(1000),
	ReporterEpId	       INT                NOT NULL,
	ReporterEpNm	       NVARCHAR(30)       NOT NULL,
	RecipientEpId	       INT			      NOT NULL,
	RecipientEpNm	       NVARCHAR(30)       NOT NULL,
	Comments		       NVARCHAR(1000),
	ReadStatus		       BIT,
	PRIMARY KEY(SalesRpId),
	FOREIGN KEY(ReporterEpId) REFERENCES Employee(EmpyId),
	FOREIGN KEY(RecipientEpId) REFERENCES Employee(EmpyId)
)
GO
