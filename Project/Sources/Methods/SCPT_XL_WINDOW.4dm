//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_WINDOW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 06:25
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_WINDOW")
Case of 
	: (Count parameters:C259=1)
		Case of 
			: ($1="Cascade")
				SCPT_XL_WINDOW($1; 7)
			: ($1="Horizontal")
				SCPT_XL_WINDOW($1; -4128)
			: ($1="Tiled")
				SCPT_XL_WINDOW($1; 1)
			: ($1="Vertical")
				SCPT_XL_WINDOW($1; -4166)
				
		End case 
	Else 
		$0:=$2
End case 
ERR_MethodTrackerReturn("SCPT_XL_WINDOW"; $_t_oldMethodName)
