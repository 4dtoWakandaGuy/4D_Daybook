//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_Placement
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 14:47
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_Placement")

Case of 
	: (Count parameters:C259=1)  //Current worksheet is assumed
		Case of 
			: ($1="Move")
				$0:=SCPT_XL_Placement($1; 2)
			: ($1="Move_And_Size")
				$0:=SCPT_XL_Placement($1; 2)
		End case 
	Else 
		$0:=$2
		
End case 
ERR_MethodTrackerReturn("SCPT_XL_Placement"; $_t_oldMethodName)
