//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_Range_Get_Border
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(color)
	//C_UNKNOWN(style)
	ARRAY LONGINT:C221($_al_matchlength; 0)
	ARRAY LONGINT:C221($_al_MatchPosition; 0)
	C_LONGINT:C283($_l_Colour; $_l_Style; $_l_Weight; $4)
	C_POINTER:C301($5; $6; $7)
	C_TEXT:C284($_t_json; $_t_oldMethodName; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_Range_Get_Border")

SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_RANGE"; $3)
SCPT_XL_SetParameter("XCEL_RANGE_BORDER_TYPE"; String:C10($4))

$_t_json:=SCPT_XL("range_get_border")

ARRAY LONGINT:C221($_al_MatchPosition; 0)
ARRAY LONGINT:C221($_al_matchlength; 0)

If (Match regex:C1019("\\{\"style\":(.+?),\"weight\":(.+?),\"color\":(.+?)\\}"; $_t_json; 1; $_al_MatchPosition; $_al_matchlength))
	
	
	$_l_Style:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{1}; $_al_matchlength{1}))
	$_l_Weight:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{2}; $_al_matchlength{2}))
	$_l_Colour:=Num:C11(Substring:C12($_t_json; $_al_MatchPosition{3}; $_al_matchlength{3}))
	
	SCPT_XL_PARAMETER_GET($5; ->$_l_Style)
	SCPT_XL_PARAMETER_GET($6; ->$_l_Weight)
	SCPT_XL_PARAMETER_GET($7; ->$_l_Colour)
	
End if 
ERR_MethodTrackerReturn("SCPT_XL_Range_Get_Border"; $_t_oldMethodName)
