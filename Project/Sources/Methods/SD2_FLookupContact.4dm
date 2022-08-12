//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_FLookupContact
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
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_FLookupContact")

If ([DIARY:12]Contact_Code:2#"")
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
End if 
$0:=[CONTACTS:1]Contact_Name:31
UNLOAD RECORD:C212([CONTACTS:1])
ERR_MethodTrackerReturn("SD2_FLookupContact"; $_t_oldMethodName)
