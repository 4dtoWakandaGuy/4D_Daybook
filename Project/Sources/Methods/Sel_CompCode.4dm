//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_CompCode
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
	C_TEXT:C284(<>CompCode; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_CompCode")
If (<>CompCode="")
	$0:=""
Else 
	$0:="Company: "+<>CompCode
End if 
ERR_MethodTrackerReturn("Sel_CompCode"; $_t_oldMethodName)