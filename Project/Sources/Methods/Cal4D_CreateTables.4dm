//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_CreateTables
	//------------------ Method Notes ------------------
	////  Check the host database for necessary tables
	//{
	//If (Shell_SysDocFileName (Structure file(*))#"Cal4Dv11SQL.4DB")
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAL_at_Tables;0)
	C_REAL:C285($_l_ApplicationVersion)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_CreateTables")


$_l_ApplicationVersion:=Num:C11(Application version:C493)/100

If ($_l_ApplicationVersion<11.4)
	
	Gen_Alert("4D v11 SQL Version less that 11.4"+Char:C90(13)+"Cal4D.v11SQL tables will have to be added manually.")
	
	
	
	
Else 
	
	
	ARRAY TEXT:C222(CAL_at_Tables; 0)
	Begin SQL
		SELECT TABLE_NAME
		FROM   _USER_TABLES
		INTO   :CAL_at_Tables;
	End SQL
	
	Begin SQL
		CREATE TABLE IF NOT EXISTS Cal4D_User
		(
		ID                              INT32 NOT NULL UNIQUE,
		User_Name                       VARCHAR(80),
		Default_Group_ID                INT32,
		DB_User_Name                    VARCHAR(80),
		CONSTRAINT pk_Cal4D_User PRIMARY KEY (ID)
		);
		
		CREATE TABLE IF NOT EXISTS Cal4D_Group
		(
		ID                              INT32 NOT NULL UNIQUE,
		User_ID                         INT32 NOT NULL,
		Group_Name                      VARCHAR(80),
		Group_Color                     INT32,
		Other_Users_Can_View            BOOLEAN,
		Other_Users_Can_Modify          BOOLEAN,
		iCal_URL                        TEXT,
		iCal_User_Name                  VARCHAR(80),
		iCal_Password                   VARCHAR(80),
		iCal_Update_Interval_Minutes    SMALLINT,
		iCal_Last_Update                INT32,
		iCal_UUID                       VARCHAR(40),
		Group_Description               TEXT,
		Group_Publish_URL               TEXT,
		CONSTRAINT pk_Cal4D_Group PRIMARY KEY (ID),
		CONSTRAINT fk_Cal4D_Group FOREIGN KEY (User_ID) REFERENCES Cal4D_User(ID) ON DELETE CASCADE
		);
		
		CREATE TABLE IF NOT EXISTS Cal4D_Event
		(
		ID                              INT32 NOT NULL UNIQUE,
		Group_ID                        INT32 NOT NULL,
		Event_Title                     VARCHAR(80),
		Event_Type                      VARCHAR(20),
		Event_Color                     INT32,
		Ori_Start_Date                  Timestamp,
		Ori_Start_Time                  Duration,
		Ori_End_Date                    Timestamp,
		Ori_End_Time                    Duration,
		Ori_TimeZone                    VARCHAR(3),
		Notes                           TEXT,
		Location                        VARCHAR(80),
		iCal_UID                        VARCHAR(40),
		iCal_Date_Time_Stamp            VARCHAR(19),
		Loc_Start_Date                  Timestamp,
		Loc_Start_Time                  Duration,
		Loc_End_Date                    Timestamp,
		Loc_End_Time                    Duration,
		Loc_TimeZone                    VARCHAR(3),
		Event_SeqNo                     INT,
		Event_URL                       TEXT,
		Event_Location                  VARCHAR(80),
		Event_Comments                  TEXT,
		Event_Description               TEXT,
		Event_Notes                     TEXT,
		Event_Status                    VARCHAR(9),
		Event_Duration                  VARCHAR(40),
		Event_Recurrance                VARCHAR(62),
		Event_Categories                VARCHAR(20),
		Event_LastModified              VARCHAR(19),
		CONSTRAINT pk_Cal4D_Event       PRIMARY KEY (ID),
		CONSTRAINT fk_Cal4D_Event       FOREIGN KEY (Group_ID) REFERENCES Cal4D_Group(ID) ON DELETE CASCADE
		);
	End SQL
	
	If ((Find in array:C230(CAL_at_Tables; "Cal4D_User")<1) | (Find in array:C230(CAL_at_Tables; "Cal4D_Group")<1) | (Find in array:C230(CAL_at_Tables; "Cal4D_Event")<1))
		ALERT:C41("Cal4D.v11SQL tables have been added to structure.\r\rThe database will restart to complete the Cal4D.v11SQL install process.")
		
		OPEN DATA FILE:C312(Data file:C490)
		
		Error:=99999
	End if 
	
End if 
//End if
//}
ERR_MethodTrackerReturn("Cal4D_CreateTables"; $_t_oldMethodName)