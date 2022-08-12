//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_printerNameGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 11:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_printerNameStr; $_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_printerNameGet")

PDF995_constantsInit

If (<>PDF995_printerNameStr="")
	PDF995_printerNameSet
End if 

$0:=<>PDF995_printerNameStr

ERR_MethodTrackerReturn("PDF995_printerNameGet"; $_t_oldMethodName)
