//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_APPLICATION_GET
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 14:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(left)
	//C_UNKNOWN(width)
	ARRAY LONGINT:C221($_al_matchlength; 0)
	ARRAY LONGINT:C221($_al_MatchPosition; 0)
	C_BOOLEAN:C305($_bo_FullScreen)
	C_POINTER:C301($2; $3; $4; $5)
	C_REAL:C285($_r_height; $_r_left; $_r_top; $_r_width)
	C_TEXT:C284($_t_json; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_APPLICATION_GET")

Case of 
		
	: ($1="Get_Fullscreen")
		$_bo_FullScreen:=(SCPT_XL("application_get_display_fullscreen")="True")
		If ($_bo_FullScreen)
			$0:="YES"
		Else 
			$0:="NO"
		End if 
	: ($1="Get_Rect")
		$_t_json:=SCPT_XL("application_get_rect")
		
		ARRAY LONGINT:C221($_al_MatchPosition; 0)
		ARRAY LONGINT:C221($_al_matchlength; 0)
		
		If (Match regex:C1019("\\{\"left\":(.+?),\"top\":(.+?),\"width\":(.+?),\"height\":(.+?)\\}"; $_t_json; 1; $_al_MatchPosition; $_al_matchlength))
			
			
			$_r_left:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{1}; $_al_matchlength{1}))
			$_r_top:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{2}; $_al_matchlength{2}))
			$_r_width:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{3}; $_al_matchlength{3}))
			$_r_height:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{4}; $_al_matchlength{4}))
			
			SCPT_XL_PARAMETER_GET($2; ->$_r_left)
			SCPT_XL_PARAMETER_GET($3; ->$_r_top)
			SCPT_XL_PARAMETER_GET($4; ->$_r_width)
			SCPT_XL_PARAMETER_GET($5; ->$_r_height)
			
			
		End if 
End case 
ERR_MethodTrackerReturn("SCPT_XL_APPLICATION_GET"; $_t_oldMethodName)
