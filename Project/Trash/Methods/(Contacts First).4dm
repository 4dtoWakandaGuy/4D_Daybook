//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts First
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>MultiCo)
	C_LONGINT:C283(vDY)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts First")
//Contacts First Page

USE NAMED SELECTION:C332("Contacts")
CLEAR NAMED SELECTION:C333("Contacts")
If (<>MultiCo=False:C215)
	RELATE ONE:C42([CONTACTS:1]Company_Code:1)
	Company_Details
End if 
vDY:=0
ERR_MethodTrackerReturn("Contacts First"; $_t_oldMethodName)