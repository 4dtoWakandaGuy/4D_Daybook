//%attributes = {}
If (False:C215)
	//Project Method Name:      MailP_ExpCont
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
	C_TEXT:C284($_t_oldMethodName; vFld)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_ExpCont")
SEND PACKET:C103(Address_ContactName+vFld+[CONTACTS:1]Job_Title:6+vFld+[CONTACTS:1]Dept:8+vFld)
ERR_MethodTrackerReturn("MailP_ExpCont"; $_t_oldMethodName)