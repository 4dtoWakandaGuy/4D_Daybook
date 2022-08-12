//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_PageOrientation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 07:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_PageOrientation")


Case of 
	: (Count parameters:C259=1)  //Current worksheet is assumed
		Case of 
			: ($1="Landscape")
				$0:=SCPT_XL_PageOrientation($1; 2)
			: ($1="Portrait")
				$0:=SCPT_XL_PageOrientation($1; 1)
		End case 
	Else 
		
		$0:=$2
		
End case 
ERR_MethodTrackerReturn("SCPT_XL_PageOrientation"; $_t_oldMethodName)
