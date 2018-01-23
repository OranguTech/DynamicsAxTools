USE [master]
GO

CREATE DATABASE [DynamicsAxTools]
GO
ALTER DATABASE [DynamicsAxTools] SET COMPATIBILITY_LEVEL = 130
GO
ALTER DATABASE [DynamicsAxTools] SET RECOVERY SIMPLE 
GO

USE [DynamicsAxTools]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXInstall_Status](
	[GUID] [nvarchar](36) NULL,
	[SERVERNAME] [nvarchar](50) NULL,
	[TYPE] [nvarchar](25) NULL,
	[STATUS] [nvarchar](25) NULL,
	[LOG] [nvarchar](254) NULL,
	[MODIFIEDDATETIME] [datetime] NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
SET ANSI_PADDING ON

GO
CREATE CLUSTERED INDEX [IX_CREATEDDATETIME_GUID] ON [dbo].[AXInstall_Status]
(
	[CREATEDDATETIME] ASC,
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXInstall_StatusDetails](
	[GUID] [nvarchar](36) NULL,
	[SERVERNAME] [nvarchar](50) NULL,
	[PACKAGENAME] [nvarchar](150) NULL,
	[TYPE] [nvarchar](2) NULL,
	[STATUS] [nvarchar](25) NULL,
	[ARGUMENTLIST] [nvarchar](max) NULL,
	[LOG] [nvarchar](max) NULL,
	[LOGDATE] [nvarchar](25) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
SET ANSI_PADDING ON

GO
CREATE CLUSTERED INDEX [IX_CREATEDDATETIME_GUID] ON [dbo].[AXInstall_StatusDetails]
(
	[CREATEDDATETIME] ASC,
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_AXBatchJobs](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[STARTDATETIME] [datetime] NULL,
	[ENDDATETIME] [datetime] NULL,
	[CAPTION] [nvarchar](200) NULL,
	[STATUS] [nvarchar](15) NULL,
	[CREATEDBY] [nvarchar](15) NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_AXNumberSequences](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[NUMBERSEQUENCE] [nvarchar](20) NULL,
	[TXT] [nvarchar](120) NULL,
	[FORMAT] [nvarchar](40) NULL,
	[STATUS] [nvarchar](15) NULL,
	[CONTINUOUS] [tinyint] NULL,
	[TRANSID] [bigint] NULL,
	[SESSIONID] [int] NULL,
	[USERID] [nvarchar](16) NULL,
	[MODIFIEDBY] [nvarchar](16) NULL,
	[SESSIONLOGINDATETIME] [datetime] NULL,
	[MODIFIEDDATETIME] [datetime] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_ExecutionLog](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[CPU] [decimal](6, 4) NULL,
	[BLOCKING] [int] NULL,
	[WAITING] [int] NULL,
	[GRD] [tinyint] NULL,
	[GRDTOTAL] [int] NULL,
	[STATS] [tinyint] NULL,
	[STATSTOTAL] [int] NULL,
	[EMAIL] [tinyint] NULL,
	[REPORT] [nvarchar](200) NULL,
	[GUID] [nvarchar](36) NULL,
	[LOG] [nvarchar](500) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_GRDLog](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[TABLENAME] [nvarchar](50) NULL,
	[STATSTYPE] [nvarchar](8) NULL,
	[STATEMENT] [nvarchar](150) NULL,
	[JOBNAME] [nvarchar](150) NULL,
	[STARTED] [datetime] NULL,
	[FINISHED] [datetime] NULL,
	[LOG] [nvarchar](500) NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_GRDStatistics](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[TABLENAME] [sysname] NOT NULL,
	[INDEXNAME] [sysname] NOT NULL,
	[INDEXID] [int] NOT NULL,
	[ROWSTOTAL] [bigint] NULL,
	[ROWSMODIFIED] [bigint] NULL,
	[SIZEMB] [decimal](12, 2) NULL,
	[PERCENTCHANGE] [bigint] NULL,
	[LASTUPDATE] [datetime] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
SET ANSI_PADDING ON

GO
CREATE CLUSTERED INDEX [idx_CreatedDateTime_Environment] ON [dbo].[AXMonitor_GRDStatistics]
(
	[CREATEDDATETIME] ASC,
	[ENVIRONMENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_PerfmonData](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[PATH] [nvarchar](300) NULL,
	[VALUE] [decimal](16, 2) NULL,
	[TIMESTAMP] [datetime] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_SQLConfiguration](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[DISPLAYNAME] [nvarchar](50) NULL,
	[DESCRIPTION] [nvarchar](150) NULL,
	[RUNVALUE] [nvarchar](10) NULL,
	[CONFIGVALUE] [nvarchar](10) NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_SQLInformation](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[NAME] [nvarchar](50) NULL,
	[VALUE] [nvarchar](300) NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXMonitor_SQLRunningSpids](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[START_DATE_TIME] [datetime] NULL,
	[SPID] [nvarchar](10) NULL,
	[BLOCKER] [nvarchar](10) NULL,
	[STATUS] [nvarchar](10) NULL,
	[HOST_NAME] [nvarchar](50) NULL,
	[CONTEXT_INFO] [nvarchar](50) NULL,
	[WAIT_TIME_MS] [bigint] NULL,
	[TOTAL_TIME_MS] [bigint] NULL,
	[CPU_TIME_MS] [bigint] NULL,
	[CPU_TIME_PERC] [decimal](15, 10) NULL,
	[READS] [bigint] NULL,
	[WRITES] [bigint] NULL,
	[LOGICAL_READS] [bigint] NULL,
	[WAIT_TYPE] [nvarchar](50) NULL,
	[DATABASE] [nvarchar](50) NULL,
	[SQL_TEXT] [nvarchar](max) NULL,
	[PLAN_HANDLE] [nvarchar](max) NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
SET ANSI_PADDING ON

GO
CREATE CLUSTERED INDEX [idx_CreatedDateTime_Environment] ON [dbo].[AXMonitor_SQLRunningSpids]
(
	[CREATEDDATETIME] ASC,
	[ENVIRONMENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, DATA_COMPRESSION = PAGE) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_AxBatchJobs](
	[HISTORYCAPTION] [nvarchar](150) NULL,
	[JOBCAPTION] [nvarchar](150) NULL,
	[STATUS] [nvarchar](30) NULL,
	[SERVERID] [nvarchar](30) NULL,
	[STARTDATETIMECST] [datetime] NULL,
	[ENDDATETIMECST] [datetime] NULL,
	[EXECUTEDBY] [nvarchar](15) NULL,
	[BATCHID] [bigint] NULL,
	[BATCHJOBID] [bigint] NULL,
	[BATCHJOBHISTORYID] [bigint] NULL,
	[LOG] [nvarchar](max) NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_AxLongBatchJobs](
	[JOB] [nvarchar](150) NULL,
	[COUNT] [int] NULL,
	[STATUS] [nvarchar](30) NULL,
	[DURATION] [int] NULL,
	[EXECUTEDBY] [nvarchar](15) NULL,
	[SERVERID] [nvarchar](30) NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_AxMRP](
	[REQPLANID] [nvarchar](30) NULL,
	[STARTDATETIME] [datetime] NULL,
	[ENDDATETIME] [datetime] NULL,
	[CANCELLED] [int] NULL,
	[USEDCHILDTHREADS] [int] NULL,
	[MAXCHILDTHREADS] [int] NULL,
	[COMPLETEUPDATE] [int] NULL,
	[USEDTODAYSDATE] [datetime] NULL,
	[NUMOFITEMS] [bigint] NULL,
	[NUMOFINVENTONHAND] [bigint] NULL,
	[NUMOFSALESLINE] [bigint] NULL,
	[NUMOFPURCHLINE] [bigint] NULL,
	[NUMOFTRANSFERPLANNEDORDER] [bigint] NULL,
	[NUMOFITEMPLANNEDORDER] [bigint] NULL,
	[NUMOFINVENTJOURNAL] [bigint] NULL,
	[TIMECOPY] [bigint] NULL,
	[TIMECOVERAGE] [bigint] NULL,
	[TIMEUPDATE] [bigint] NULL,
	[LOG] [nvarchar](max) NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_AxRetailJobs](
	[JOBID] [nvarchar](10) NULL,
	[DATASTORESTATUS] [bigint] NULL,
	[STATUSDOWNLOADSESSIONDATASTORE] [nvarchar](30) NULL,
	[MESSAGE] [nvarchar](max) NULL,
	[DATEREQUESTED] [datetime] NULL,
	[DATEDOWNLOADED] [datetime] NULL,
	[DATEAPPLIED] [datetime] NULL,
	[CURRENTROWVERSION] [bigint] NULL,
	[ROWSAFFECTED] [bigint] NULL,
	[DATAFILEOUTPUTPATH] [nvarchar](max) NULL,
	[SESSIONSTATUS] [bigint] NULL,
	[STATUSDOWNLOADSESSION] [nvarchar](30) NULL,
	[DATABASE_] [nvarchar](30) NULL,
	[NAME] [nvarchar](50) NULL,
	[MODIFIEDDATETIME] [datetime] NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_AxServices](
	[SERVERNAME] [nvarchar](30) NULL,
	[SERVICE] [nvarchar](150) NULL,
	[NAME] [nvarchar](150) NULL,
	[STATUS] [nvarchar](30) NULL,
	[STARTTIME] [datetime] NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_EventLogs](
	[SERVERNAME] [nvarchar](30) NULL,
	[FQDN] [nvarchar](50) NULL,
	[LOGNAME] [nvarchar](50) NULL,
	[ENTRYTYPE] [nvarchar](50) NULL,
	[EVENTID] [bigint] NULL,
	[SOURCE] [nvarchar](max) NULL,
	[TIMEGENERATED] [datetime] NULL,
	[MESSAGE] [nvarchar](max) NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_PerfmonData](
	[SERVERNAME] [nvarchar](30) NULL,
	[SERVERTYPE] [nvarchar](30) NULL,
	[COUNTERTYPE] [nvarchar](10) NULL,
	[REPORTVIEW] [bit] NULL,
	[PATH] [nvarchar](max) NULL,
	[MAXIMUM] [float] NULL,
	[MINIMUM] [float] NULL,
	[AVERAGE] [float] NULL,
	[FULLPATH] [nvarchar](max) NULL,
	[STARTDATETIME] [datetime] NULL,
	[ENDDATETIME] [datetime] NULL,
	[SAMPLES] [bigint] NULL,
	[COUNTER] [nvarchar](max) NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_RunningProcesses](
	[SERVERNAME] [nvarchar](30) NULL,
	[NAME] [nvarchar](100) NULL,
	[ID] [bigint] NULL,
	[HANDLES] [bigint] NULL,
	[VM] [bigint] NULL,
	[WS] [bigint] NULL,
	[PM] [bigint] NULL,
	[NPM] [bigint] NULL,
	[WORKINGSET] [bigint] NULL,
	[PAGEDMEMORYSIZE] [bigint] NULL,
	[PRIVATEMEMORYSIZE] [bigint] NULL,
	[VIRTUALMEMORYSIZE] [bigint] NULL,
	[BASEPRIORITY] [bigint] NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_SqlDatabases](
	[ENVIRONMENT] [nvarchar](30) NULL,
	[DBSERVER] [nvarchar](150) NULL,
	[DBNAME] [nvarchar](150) NULL,
	[DETAILS] [nvarchar](255) NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_SQLLog](
	[LOGDATE] [datetime] NULL,
	[PROCESSINFO] [nvarchar](50) NULL,
	[TEXT] [nvarchar](max) NULL,
	[SERVER] [nvarchar](50) NULL,
	[DATABASE] [nvarchar](50) NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXReport_SRSLog](
	[STATUS] [nvarchar](50) NULL,
	[INSTANCENAME] [nvarchar](30) NULL,
	[REPORTPATH] [nvarchar](max) NULL,
	[USERNAME] [nvarchar](30) NULL,
	[FORMAT] [nvarchar](30) NULL,
	[TIMESTART] [datetime] NULL,
	[TIMEEND] [datetime] NULL,
	[TIMEDATARETRIEVAL] [bigint] NULL,
	[TIMEPROCESSING] [bigint] NULL,
	[TIMERENDERING] [bigint] NULL,
	[REPORTDATE] [date] NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXTools_EmailLog](
	[SENT] [tinyint] NOT NULL,
	[EMAILPROFILE] [nvarchar](60) NOT NULL,
	[SUBJECT] [nvarchar](200) NULL,
	[BODY] [nvarchar](max) NULL,
	[ATTACHMENT] [nvarchar](200) NULL,
	[LOG] [nvarchar](500) NULL,
	[GUID] [nvarchar](36) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXTools_EmailProfile](
	[ID] [nvarchar](60) NOT NULL,
	[USERID] [nvarchar](60) NULL,
	[SMTPSERVER] [nvarchar](100) NULL,
	[SMTPPORT] [nvarchar](6) NULL,
	[SMTPSSL] [tinyint] NULL,
	[FROM] [nvarchar](max) NULL,
	[TO] [nvarchar](max) NULL,
	[CC] [nvarchar](max) NULL,
	[BCC] [nvarchar](max) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXTools_Environments](
	[ENVIRONMENT] [nvarchar](30) NOT NULL,
	[DESCRIPTION] [nvarchar](100) NULL,
	[DBSERVER] [nvarchar](150) NULL,
	[DBNAME] [nvarchar](150) NULL,
	[DBUSER] [nvarchar](50) NULL,
	[CPUTHOLD] [int] NULL,
	[BLOCKTHOLD] [int] NULL,
	[WAITINGTHOLD] [int] NULL,
	[RUNGRD] [tinyint] NULL,
	[RUNSTATS] [tinyint] NULL,
	[EMAILPROFILE] [nvarchar](60) NULL,
	[LOCALADMINUSER] [nvarchar](50) NULL,
	[DYNPERFSERVER] [nvarchar](50) NULL,
	[DYNPERFNAME] [nvarchar](50) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXTools_ExecutionLog](
	[CREATEDDATETIME] [datetime] NULL,
	[LOG] [nvarchar](max) NULL,
	[GUID] [nvarchar](36) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXTools_PerfmonTemplates](
	[SERVERTYPE] [nvarchar](50) NULL,
	[ACTIVE] [bit] NULL,
	[TEMPLATEXML] [xml] NULL,
	[TEMPLATETXT] [nvarchar](max) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
DATA_COMPRESSION = PAGE
)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXTools_Servers](
	[ENVIRONMENT] [nvarchar](30) NOT NULL,
	[ACTIVE] [tinyint] NULL,
	[SERVERNAME] [nvarchar](150) NOT NULL,
	[SERVERTYPE] [nvarchar](50) NOT NULL,
	[IP] [nvarchar](50) NULL,
	[DOMAIN] [nvarchar](150) NULL,
	[FQDN] [nvarchar](150) NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXTools_UserAccount](
	[ID] [nvarchar](50) NOT NULL,
	[USERNAME] [nvarchar](200) NOT NULL,
	[PASSWORD] [nvarchar](max) NOT NULL,
	[CREATEDDATETIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[AXInstall_Status] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXInstall_StatusDetails] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_AXBatchJobs] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_AXNumberSequences] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_ExecutionLog] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_GRDLog] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_GRDStatistics] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_PerfmonData] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_SQLConfiguration] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_SQLInformation] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXMonitor_SQLRunningSpids] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_AxBatchJobs] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_AxLongBatchJobs] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_AxMRP] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_AxRetailJobs] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_AxServices] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_EventLogs] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_PerfmonData] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_RunningProcesses] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_SqlDatabases] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_SQLLog] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXReport_SRSLog] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXTools_EmailLog] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXTools_EmailProfile] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXTools_Environments] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXTools_ExecutionLog] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXTools_PerfmonTemplates] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXTools_Servers] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
ALTER TABLE [dbo].[AXTools_UserAccount] ADD  DEFAULT (getdate()) FOR [CREATEDDATETIME]
GO
