//%attributes = {}
If (False:C215)
	//Project Method Name:      SEL_PrevRecordsSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/05/2010 21:42
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

$_t_oldMethodName:=ERR_MethodTracker("SEL_PrevRecordsSelection")
SEL_NextRecordsSelection(-1)
ERR_MethodTrackerReturn("SEL_PrevRecordsSelection"; $_t_oldMethodName)