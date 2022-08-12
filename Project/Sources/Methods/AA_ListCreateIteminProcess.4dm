//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_ListCreateIteminProcess
	//------------------ Method Notes ------------------
	//This method creates a list itiem. in its own process so it is outside of a transaction
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 09:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_ListCreateIteminProcess")

If (Count parameters:C259>=2)
	CREATE RECORD:C68([LIST_ITEMS:95])
	[LIST_ITEMS:95]X_ListID:4:=$1
	[LIST_ITEMS:95]List_Entry:2:=$2
	DB_SaveRecord(->[LIST_ITEMS:95])
	AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
	
End if 
ERR_MethodTrackerReturn("AA_ListCreateIteminProcess"; $_t_oldMethodName)