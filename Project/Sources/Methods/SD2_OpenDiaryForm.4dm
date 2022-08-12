//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_OpenDiaryForm
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_OpenDiaryForm")
//`this method will open a diary entry form
ERR_MethodTrackerReturn("SD2_OpenDiaryForm"; $_t_oldMethodName)