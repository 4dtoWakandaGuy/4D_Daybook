//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_ConvertStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SVS_ConvertStates
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(STATE_al_TableIDs;0)
	//ARRAY LONGINT(ST_al_CodeID;0)
	//ARRAY LONGINT(ST_al_CodeUsed;0)
	//ARRAY TEXT(ST_at_CodeUseName;0)
	//ARRAY TEXT(STATE_at_FileStateCodes;0)
	C_LONGINT:C283($_l_Index; $_l_RelateTableID; $_l_StateCode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_ConvertStates")
While (Semaphore:C143("UpdatingServiceCallStates"))
	DelayTicks(2)
End while 
$_l_RelateTableID:=Table:C252(->[SERVICE_CALLS:20])
$_l_StateCode:=10
ARRAY TEXT:C222(STATE_at_FileStateCodes; 0)
ARRAY INTEGER:C220(STATE_al_TableIDs; 0)
ARRAY TEXT:C222(ST_at_CodeUseName; 18)
ARRAY LONGINT:C221(ST_al_CodeUsed; 18)
ARRAY LONGINT:C221(ST_al_CodeID; 18)
READ WRITE:C146([TABLE_RECORD_STATES:90])
READ WRITE:C146([SERVICE_CALLS:20])
QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=("0"*(3-Length:C16(String:C10($_l_RelateTableID))))+String:C10($_l_RelateTableID)+String:C10($_l_StateCode))
If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
	CREATE RECORD:C68([TABLE_RECORD_STATES:90])
	[TABLE_RECORD_STATES:90]State_Reference:4:=("0"*(3-Length:C16(String:C10($_l_RelateTableID))))+String:C10($_l_RelateTableID)+String:C10($_l_StateCode)
	[TABLE_RECORD_STATES:90]State_Code:1:=String:C10($_l_StateCode)
	[TABLE_RECORD_STATES:90]Listing_Name:2:="Open Service Request"
	[TABLE_RECORD_STATES:90]Table_number:3:=$_l_RelateTableID
	[TABLE_RECORD_STATES:90]Entry_Name:5:="Open Service Request"
	[TABLE_RECORD_STATES:90]Abbreviated_Name:6:=""
	[TABLE_RECORD_STATES:90]xPipeStateID:7:=0
	[TABLE_RECORD_STATES:90]xStateClass:8:=0
	DB_SaveRecord(->[TABLE_RECORD_STATES:90])
	ST_SaveCodeUses([TABLE_RECORD_STATES:90]State_Reference:4)
End if 

QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Resolved:9=False:C215; *)
QUERY:C277([SERVICE_CALLS:20];  & ; [SERVICE_CALLS:20]Table_State:29#[TABLE_RECORD_STATES:90]State_Reference:4)

If (Not:C34(In transaction:C397))
	DB_lockFile(->[SERVICE_CALLS:20])
	APPLY TO SELECTION:C70([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Table_State:29:=[TABLE_RECORD_STATES:90]State_Reference:4)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[SERVICE_CALLS:20]))
Else 
	FIRST RECORD:C50([SERVICE_CALLS:20])
	For ($_l_Index; 1; Records in selection:C76([SERVICE_CALLS:20]))
		[SERVICE_CALLS:20]Table_State:29:=[TABLE_RECORD_STATES:90]State_Reference:4
		DB_SaveRecord(->[SERVICE_CALLS:20])
		AA_CheckFileUnlocked(->[SERVICE_CALLS:20]x_ID:27)
		NEXT RECORD:C51([SERVICE_CALLS:20])
	End for 
	
End if 

$_l_StateCode:=20
QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=("0"*(3-Length:C16(String:C10($_l_RelateTableID))))+String:C10($_l_RelateTableID)+String:C10($_l_StateCode))
If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
	CREATE RECORD:C68([TABLE_RECORD_STATES:90])
	[TABLE_RECORD_STATES:90]State_Reference:4:=("0"*(3-Length:C16(String:C10($_l_RelateTableID))))+String:C10($_l_RelateTableID)+String:C10($_l_StateCode)
	[TABLE_RECORD_STATES:90]State_Code:1:=String:C10($_l_StateCode)
	[TABLE_RECORD_STATES:90]Listing_Name:2:="Closed Service Request"
	[TABLE_RECORD_STATES:90]Table_number:3:=$_l_RelateTableID
	[TABLE_RECORD_STATES:90]Entry_Name:5:="Closed Service Request"
	[TABLE_RECORD_STATES:90]Abbreviated_Name:6:=""
	[TABLE_RECORD_STATES:90]xPipeStateID:7:=0
	[TABLE_RECORD_STATES:90]xStateClass:8:=0
	DB_SaveRecord(->[TABLE_RECORD_STATES:90])
	ST_SaveCodeUses([TABLE_RECORD_STATES:90]State_Reference:4)
End if 

QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Resolved:9=True:C214; *)
QUERY:C277([SERVICE_CALLS:20];  & ; [SERVICE_CALLS:20]Table_State:29#[TABLE_RECORD_STATES:90]State_Reference:4)
If (Not:C34(In transaction:C397))
	
	DB_lockFile(->[SERVICE_CALLS:20])
	APPLY TO SELECTION:C70([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Table_State:29:=[TABLE_RECORD_STATES:90]State_Reference:4)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[SERVICE_CALLS:20]))
Else 
	FIRST RECORD:C50([SERVICE_CALLS:20])
	For ($_l_Index; 1; Records in selection:C76([SERVICE_CALLS:20]))
		[SERVICE_CALLS:20]Table_State:29:=[TABLE_RECORD_STATES:90]State_Reference:4
		DB_SaveRecord(->[SERVICE_CALLS:20])
		AA_CheckFileUnlocked(->[SERVICE_CALLS:20]x_ID:27)
		NEXT RECORD:C51([SERVICE_CALLS:20])
	End for 
	
End if 






CLEAR SEMAPHORE:C144("UpdatingServiceCallStates")
ERR_MethodTrackerReturn("SVS_ConvertStates"; $_t_oldMethodName)
