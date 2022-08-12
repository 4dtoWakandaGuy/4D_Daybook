//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts New
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>NoStart; DB_l_ButtonPrefsSet; vNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts New")
If (DB_l_ButtonPrefsSet=1)
	<>NoStart:=0
	ADD RECORD:C56([CONTACTS:1]; *)
	ADD TO SET:C119([CONTACTS:1]; "OMaster")
	ACCEPT:C269
Else 
	<>NoStart:=1
	Contacts_In
	USE SET:C118("OMaster")
End if 
vNo:=Records in selection:C76([CONTACTS:1])
ERR_MethodTrackerReturn("Contacts New"; $_t_oldMethodName)