//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BatchPrintRem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  30/03/2011 12:57 v7.0.0/B45
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

$_t_oldMethodName:=ERR_MethodTracker("DB_BatchPrintRem")
ERR_MethodTrackerReturn("DB_BatchPrintRem"; $_t_oldMethodName)