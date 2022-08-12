//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_AddSubrecordParents
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 15:32
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

$_t_oldMethodName:=ERR_MethodTracker("UPD_AddSubrecordParents")
ERR_MethodTrackerReturn("UPD_AddSubrecordParents"; $_t_oldMethodName)