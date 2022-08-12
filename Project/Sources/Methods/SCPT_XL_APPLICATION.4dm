//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_APPLICATION
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 06:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Boolean)
	C_LONGINT:C283($2)
	C_REAL:C285($3; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_APPLICATION")
Case of 
	: ($1="SHOW")
		SCPT_XL("application_show")
	: ($1="ARRANGE_WINDOW")
		If (Count parameters:C259>=2)
			SCPT_XL_SetParameter("WINDOW_ARRANGE_STYLE"; String:C10($2))
			SCPT_XL("application_arrange_windows")
		End if 
	: ($1="Hide")
		SCPT_XL("application_hide")
	: ($1="Quit")
		SCPT_XL("application_quit")
	: ($1="Set_Fullscreen")
		$_bo_Boolean:=($2=1)
		
		SCPT_XL_SetParameter("XCEL_DISPLAY_FULL_SCREEN"; Choose:C955($_bo_Boolean; "True"; "False"))
		
		$0:=SCPT_XL("application_set_display_fullscreen")
	: ($1="Set_Rect")
		//C_REAL($2)
		
		SCPT_XL_SetParameter("XCEL_LEFT"; String:C10($2))
		SCPT_XL_SetParameter("XCEL_TOP"; String:C10($3))
		SCPT_XL_SetParameter("XCEL_WIDTH"; String:C10($4))
		SCPT_XL_SetParameter("XCEL_HEIGHT"; String:C10($5))
		SCPT_XL("application_set_rect")
	: ($1="Set_Rect")
End case 
ERR_MethodTrackerReturn("SCPT_XL_APPLICATION"; $_t_oldMethodName)
