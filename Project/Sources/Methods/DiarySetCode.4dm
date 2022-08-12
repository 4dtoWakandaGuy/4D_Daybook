//%attributes = {}
If (False:C215)
	//Project Method Name:      DiarySetCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(INV_isUnique)
	C_TEXT:C284(<>DefPrior; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DiarySetCode")
//DiarySetCode
//[DIARY]Diary Code:=Gen_CodePref (3;->[DIARY]Diary Code)
DiaryCode  //renamed method(leaving old on in case referred to in any macros
ERR_MethodTrackerReturn("DiarySetCode"; $_t_oldMethodName)