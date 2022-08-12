//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_NewUUID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_NewUUID")


$0:=Generate UUID:C1066
ERR_MethodTrackerReturn("Cal4D_NewUUID"; $_t_oldMethodName)