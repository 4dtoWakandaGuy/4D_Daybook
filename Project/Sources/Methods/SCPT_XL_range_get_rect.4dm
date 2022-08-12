//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_range_get_rect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:49
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
	C_POINTER:C301($4; $5; $6; $7)
	C_REAL:C285($_r_height; $_r_left; $_r_top; $_r_width)
	C_TEXT:C284($_t_json; $_t_oldMethodName; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_range_get_rect")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_RANGE"; $3)

$_t_json:=SCPT_XL("range_get_rect")

ARRAY LONGINT:C221($_al_MatchPosition; 0)
ARRAY LONGINT:C221($_al_matchlength; 0)

If (Match regex:C1019("\\{\"left\":(.+?),\"top\":(.+?),\"width\":(.+?),\"height\":(.+?)\\}"; $_t_json; 1; $_al_MatchPosition; $_al_matchlength))
	
	
	$_r_left:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{1}; $_al_matchlength{1}))
	$_r_top:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{2}; $_al_matchlength{2}))
	$_r_width:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{3}; $_al_matchlength{3}))
	$_r_height:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{4}; $_al_matchlength{4}))
	
	SCPT_XL_PARAMETER_GET($4; ->$_r_left)
	SCPT_XL_PARAMETER_GET($5; ->$_r_top)
	SCPT_XL_PARAMETER_GET($6; ->$_r_width)
	SCPT_XL_PARAMETER_GET($7; ->$_r_height)
	
End if 
ERR_MethodTrackerReturn("SCPT_XL_range_get_rect"; $_t_oldMethodName)
