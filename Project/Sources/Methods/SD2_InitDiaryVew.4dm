//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_InitDiaryVew
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2009 16:35
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

$_t_oldMethodName:=ERR_MethodTracker("SD2_InitDiaryVew")
ERR_MethodTrackerReturn("SD2_InitDiaryVew"; $_t_oldMethodName)