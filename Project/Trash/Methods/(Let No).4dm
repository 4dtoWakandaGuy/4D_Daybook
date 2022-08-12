//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Let No
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
	C_TEXT:C284($_t_oldMethodName; $1; DOC_t_DocumentCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Let No")
//Let No
If (Count parameters:C259=0)
	
	DOC_t_DocumentCode:=Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1)
Else 
	DOC_t_DocumentCode:=Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; $1)
End if 
ERR_MethodTrackerReturn("Let No"; $_t_oldMethodName)