//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_ReadingOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 07:27
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_ReadingOrder")


Case of 
	: (Count parameters:C259=1)  //Current worksheet is assumed
		Case of 
			: ($1="Context")
				SCPT_XL_ReadingOrder($1; -5002)
			: ($1="Left_to_Right")
				SCPT_XL_ReadingOrder($1; -5003)
			: ($1="Right_to_Left")
				SCPT_XL_ReadingOrder($1; -5004)
		End case 
	Else 
End case 
ERR_MethodTrackerReturn("SCPT_XL_ReadingOrder"; $_t_oldMethodName)
