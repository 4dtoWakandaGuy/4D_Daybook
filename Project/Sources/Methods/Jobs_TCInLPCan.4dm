//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_TCInLPCan
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
	C_LONGINT:C283($d; $i)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_TCInLPCan")

//**************************************added 11/01/07 - kmw*********************************
//make sure we have records in selection that match what the user is seeing displayed in the listbox (in case later on in the code any assumptions are made about the current record selection but at the very least this will mean users warning message will display the correct number of records)
If (Modified record:C314([DIARY:12]))
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
End if 
If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
Jobs_TC_GetSelectionsFromArrays
//***************************************************************************************

$d:=Records in selection:C76([DIARY:12])
$i:=Records in selection:C76([ORDER_ITEMS:25])
If (($d>0) | ($i>0))
	Gen_Confirm("Are you sure you want to Cancel "+String:C10($d)+" Time and "+String:C10($i)+" Cost entries?"; "Try again"; "Cancel")
	If (OK=0)
		CANCEL:C270
	End if 
Else 
	CANCEL:C270
	OK:=0
End if 
ERR_MethodTrackerReturn("Jobs_TCInLPCan"; $_t_oldMethodName)