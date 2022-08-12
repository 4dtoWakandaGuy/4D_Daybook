//%attributes = {}
If (False:C215)
	//Project Method Name:      LicNumScreenPathNameEntryCheck
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
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_LONGINT:C283(xOK)
	C_TEXT:C284(<>PathName; $_t_oldMethodName; vTitle4; vTitle5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LicNumScreenPathNameEntryCheck")

//OK:=1
//If (vTitle7#"")
//Gen_Confirm ("NB: After changing your Licence No any additions made by "
//+"'Disk Updates' will need to be reinstalled.")
// If (OK=0)
// ◊PathName:=vTitle7
// End if
//End if
//If (OK=1)
//Path_CheckLUDel
$_bo_ReadOnlyState:=Read only state:C362([USER:15])
If ($_bo_ReadOnlyState=True:C214)
	READ WRITE:C146([USER:15])
	LOAD RECORD:C52([USER:15])
End if 

If (<>PathName#"")
	Path_Check
End if 
If (<>PathName="")
	BEEP:C151
	GOTO OBJECT:C206(<>PathName)
	vTitle5:="Not Accepted"
Else 
	vTitle5:="Accepted"
End if 
vTitle4:="Required"
[USER:15]Path Name:12:=<>PathName
[USER:15]Limit Date:58:=!00-00-00!
OBJECT SET ENABLED:C1123(xOK; False:C215)

vTitle7:=<>PathName
//End if
ERR_MethodTrackerReturn("LicNumScreenPathNameEntryCheck"; $_t_oldMethodName)
