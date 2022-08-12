//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_UNDERLINE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 07:48
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_UNDERLINE")


Case of 
	: (Count parameters:C259=1)  //Current worksheet is assumed
		Case of 
			: ($1="Double")
				$0:=SCPT_XL_UNDERLINE($1; -4119)
			: ($1="Double_Accounting")
				$0:=SCPT_XL_UNDERLINE($1; 5)
			: ($1="None")
				$0:=SCPT_XL_UNDERLINE($1; -4142)
			: ($1="Single")
				$0:=SCPT_XL_UNDERLINE($1; 2)
			: ($1="Single_Accounting")
				$0:=SCPT_XL_UNDERLINE($1; 4)
				
				
		End case 
	Else 
		$0:=$2
End case 
ERR_MethodTrackerReturn("SCPT_XL_UNDERLINE"; $_t_oldMethodName)
