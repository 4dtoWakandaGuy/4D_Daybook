//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_UpdateListView
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

$_t_oldMethodName:=ERR_MethodTracker("SM_UpdateListView")
//This method will upate the ICONs shown with the lists
ERR_MethodTrackerReturn("SM_UpdateListView"; $_t_oldMethodName)