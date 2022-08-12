//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_BORDER_STYLE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 07:00
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_BORDER_STYLE")


Case of 
	: (Count parameters:C259=1)  //Current worksheet is assumed
		Case of 
			: ($1="Continuous")
				$0:=SCPT_XL_BORDER_STYLE($1; 1)
			: ($1="Dash")
				$0:=SCPT_XL_BORDER_STYLE($1; -4115)
			: ($1="Dash_Dot")
				$0:=SCPT_XL_BORDER_STYLE($1; 4)
			: ($1="Dash_Dot_Dot")
				$0:=SCPT_XL_BORDER_STYLE($1; 5)
			: ($1="Dot")
				$0:=SCPT_XL_BORDER_STYLE($1; -4118)
			: ($1="Double")
				$0:=SCPT_XL_BORDER_STYLE($1; -4119)
			: ($1="None")
				$0:=SCPT_XL_BORDER_STYLE($1; -4142)
			: ($1="Slant_Dash_Dot")
				$0:=SCPT_XL_BORDER_STYLE($1; 13)
			: ($1="Slant_Dash_Dot")
				$0:=SCPT_XL_BORDER_STYLE($1; 13)
		End case 
	Else 
		$0:=$2
End case 
ERR_MethodTrackerReturn("SCPT_XL_BORDER_STYLE"; $_t_oldMethodName)
