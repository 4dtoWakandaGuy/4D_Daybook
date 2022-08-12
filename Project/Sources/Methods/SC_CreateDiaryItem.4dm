//%attributes = {}
If (False:C215)
	//Project Method Name:      SC_CreateDiaryItem
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SC_CreateDiaryItem")
ERR_MethodTrackerReturn("SC_CreateDiaryItem"; $_t_oldMethodName)