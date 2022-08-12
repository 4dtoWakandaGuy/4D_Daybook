//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_BORDER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 06:37
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_BORDER")

Case of 
	: (Count parameters:C259=1)  //Current worksheet is assumed
		Case of 
			: ($1="Bottom")
				$0:=SCPT_XL_BORDER($1; 4107)
			: ($1="diagonal_down")
				$0:=SCPT_XL_BORDER($1; 5)
			: ($1="diagonal_up")
				$0:=SCPT_XL_BORDER($1; 6)
			: ($1="edge_bottom")
				$0:=SCPT_XL_BORDER($1; 9)
			: ($1="edge_left")
				$0:=SCPT_XL_BORDER($1; 7)
			: ($1="edge_right")
				$0:=SCPT_XL_BORDER($1; 10)
			: ($1="edge_top")
				$0:=SCPT_XL_BORDER($1; 8)
			: ($1="inside_Horizontal")
				$0:=SCPT_XL_BORDER($1; 12)
			: ($1="inside_vertical")
				$0:=SCPT_XL_BORDER($1; 11)
			: ($1="Left")
				$0:=SCPT_XL_BORDER($1; -4131)
			: ($1="Right")
				$0:=SCPT_XL_BORDER($1; -4152)
			: ($1="Right")
				$0:=SCPT_XL_BORDER($1; -4152)
			: ($1="Top")
				$0:=SCPT_XL_BORDER($1; -4160)
				
		End case 
	Else 
		//SCPT_XML_SetParameter ("WINDOW_ARRANGE_STYLE";String($2))
		$0:=$2
		
		SCPT_XL("range_set_border")
End case 
ERR_MethodTrackerReturn("SCPT_XL_BORDER"; $_t_oldMethodName)
