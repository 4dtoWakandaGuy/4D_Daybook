//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_targetPathGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_taregtFilePathStr; $_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_targetPathGet")

PDF995_constantsInit

If (<>PDF995_taregtFilePathStr="")
	PDF995_targetPathSet
End if 

$0:=<>PDF995_taregtFilePathStr

ERR_MethodTrackerReturn("PDF995_targetPathGet"; $_t_oldMethodName)
