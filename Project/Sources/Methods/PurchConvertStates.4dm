//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchConvertStates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("PurchConvertStates")

//TRACE

$_l_RelateTableID:=Table:C252(->[PURCHASE_ORDERS:57])
$_l_StateCode:=10
ARRAY TEXT:C222(STATE_at_FileStateCodes; 0)
ARRAY INTEGER:C220(STATE_al_TableIDs; 0)
ARRAY TEXT:C222(ST_at_CodeUseName; 18)
ARRAY LONGINT:C221(ST_al_CodeUsed; 18)
ARRAY LONGINT:C221(ST_al_CodeID; 18)
READ WRITE:C146([TABLE_RECORD_STATES:90])
READ WRITE:C146([PURCHASE_ORDERS:57])
QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=("0"*(3-Length:C16(String:C10($_l_RelateTableID))))+String:C10($_l_RelateTableID)+String:C10($_l_StateCode))
If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
	CREATE RECORD:C68([TABLE_RECORD_STATES:90])
	[TABLE_RECORD_STATES:90]State_Reference:4:=("0"*(3-Length:C16(String:C10($_l_RelateTableID))))+String:C10($_l_RelateTableID)+String:C10($_l_StateCode)
	[TABLE_RECORD_STATES:90]State_Code:1:=String:C10($_l_StateCode)
	[TABLE_RECORD_STATES:90]Listing_Name:2:="Unconfirmed Purchase order"
	[TABLE_RECORD_STATES:90]Table_number:3:=$_l_RelateTableID
	[TABLE_RECORD_STATES:90]Entry_Name:5:="UNCONFIRMED PURCHASE ORDER"
	[TABLE_RECORD_STATES:90]Abbreviated_Name:6:=""
	[TABLE_RECORD_STATES:90]xPipeStateID:7:=0
	[TABLE_RECORD_STATES:90]xStateClass:8:=0
	[TABLE_RECORD_STATES:90]xSortOrder:9:=1
	DB_SaveRecord(->[TABLE_RECORD_STATES:90])
	ST_SaveCodeUses([TABLE_RECORD_STATES:90]State_Reference:4)
End if 

QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]State:14=-1; *)
QUERY:C277([PURCHASE_ORDERS:57];  & ; [PURCHASE_ORDERS:57]Record_State:19#[TABLE_RECORD_STATES:90]State_Reference:4)
If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[PURCHASE_ORDERS:57])
		APPLY TO SELECTION:C70([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Record_State:19:=[TABLE_RECORD_STATES:90]State_Reference:4)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_ORDERS:57]))
	Else 
		FIRST RECORD:C50([PURCHASE_ORDERS:57])
		For ($_l_Index; 1; Records in selection:C76([PURCHASE_ORDERS:57]))
			[PURCHASE_ORDERS:57]Record_State:19:=[TABLE_RECORD_STATES:90]State_Reference:4
			DB_SaveRecord(->[PURCHASE_ORDERS:57])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_ORDERS:57]))
			NEXT RECORD:C51([PURCHASE_ORDERS:57])
		End for 
		
	End if 
End if 
$_l_StateCode:=20
QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=("0"*(3-Length:C16(String:C10($_l_RelateTableID))))+String:C10($_l_RelateTableID)+String:C10($_l_StateCode))
If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
	CREATE RECORD:C68([TABLE_RECORD_STATES:90])
	[TABLE_RECORD_STATES:90]State_Reference:4:=("0"*(3-Length:C16(String:C10($_l_RelateTableID))))+String:C10($_l_RelateTableID)+String:C10($_l_StateCode)
	[TABLE_RECORD_STATES:90]State_Code:1:=String:C10($_l_StateCode)
	[TABLE_RECORD_STATES:90]Listing_Name:2:="CONFIRMED PURCHASE ORDER"
	[TABLE_RECORD_STATES:90]Table_number:3:=$_l_RelateTableID
	[TABLE_RECORD_STATES:90]Entry_Name:5:="CONFIRMED PURCHASE ORDER"
	[TABLE_RECORD_STATES:90]Abbreviated_Name:6:=""
	[TABLE_RECORD_STATES:90]xPipeStateID:7:=0
	[TABLE_RECORD_STATES:90]xStateClass:8:=0
	[TABLE_RECORD_STATES:90]xSortOrder:9:=2
	DB_SaveRecord(->[TABLE_RECORD_STATES:90])
	ST_SaveCodeUses([TABLE_RECORD_STATES:90]State_Reference:4)
End if 

QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]State:14=0; *)
QUERY:C277([PURCHASE_ORDERS:57];  & ; [PURCHASE_ORDERS:57]Record_State:19="")
If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[PURCHASE_ORDERS:57])
		APPLY TO SELECTION:C70([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Record_State:19:=[TABLE_RECORD_STATES:90]State_Reference:4)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_ORDERS:57]))
	Else 
		FIRST RECORD:C50([PURCHASE_ORDERS:57])
		For ($_l_Index; 1; Records in selection:C76([PURCHASE_ORDERS:57]))
			[PURCHASE_ORDERS:57]Record_State:19:=[TABLE_RECORD_STATES:90]State_Reference:4
			DB_SaveRecord(->[PURCHASE_ORDERS:57])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_ORDERS:57]))
			NEXT RECORD:C51([PURCHASE_ORDERS:57])
		End for 
		
	End if 
End if 
ERR_MethodTrackerReturn("PurchConvertStates"; $_t_oldMethodName)
