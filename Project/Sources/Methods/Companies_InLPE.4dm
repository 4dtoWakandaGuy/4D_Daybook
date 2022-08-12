//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InLPE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
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

$_t_oldMethodName:=ERR_MethodTracker("Companies_InLPE")
If ([COMPANIES:2]Company_Code:1="")
	Gen_Alert("Please first type a Code or part of a Name into the Company Code box")
	GOTO OBJECT:C206([CONTACTS:1]Company_Code:1)
Else 
	Companies_InLPD
End if 
ERR_MethodTrackerReturn("Companies_InLPE"; $_t_oldMethodName)