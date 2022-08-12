//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoice_FormTot
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoice_FormTot")
//Jobs_Code
//[JOBS]Job Code:=Gen_CodePref (17)
//What is going on?
ERR_MethodTrackerReturn("Invoice_FormTot"; $_t_oldMethodName)