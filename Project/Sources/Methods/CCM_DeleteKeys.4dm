//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_DeleteKeys
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
	C_LONGINT:C283($_l_ItemID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_DeleteKeys")
$_l_ItemID:=PREF_GetPreferenceID("CC Security Preferences")
READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
DELETE SELECTION:C66([PREFERENCES:116])
ERR_MethodTrackerReturn("CCM_DeleteKeys"; $_t_oldMethodName)