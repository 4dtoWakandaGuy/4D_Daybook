//%attributes = {}
If (False:C215)
	//Project Method Name:      Psuedo_Diary_InLLPA
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
	C_BOOLEAN:C305($_bo_Continue)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Psuedo_Diary_InLLPA")
//we are in a diary entry so here we are just validating and closing the form
$_bo_Continue:=Diary_PrintS
ERR_MethodTrackerReturn("Psuedo_Diary_InLLPA"; $_t_oldMethodName)
