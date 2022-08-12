//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_TRANSACTION
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_MethodName; $_t_Msg; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_TRANSACTION")

$_t_Msg:=$1


Case of 
	: ($_t_Msg="START")
		START TRANSACTION:C239
		
	: ($_t_Msg="CANCEL")
		CANCEL TRANSACTION:C241
		
	: ($_t_Msg="VALIDATE")
		If (Transaction level:C961>0)
			VALIDATE TRANSACTION:C240
		End if 
		
End case 
ERR_MethodTrackerReturn("Cal4D_TRANSACTION"; $_t_oldMethodName)