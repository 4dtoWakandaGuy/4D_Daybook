//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_FormulaReplaceNoPointers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2012 14:43
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

$_t_oldMethodName:=ERR_MethodTracker("LBI_FormulaReplaceNoPointers")
ERR_MethodTrackerReturn("LBI_FormulaReplaceNoPointers"; $_t_oldMethodName)