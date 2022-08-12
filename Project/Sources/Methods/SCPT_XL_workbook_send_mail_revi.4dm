//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_workbook_send_mail_revi
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_matchlength; 0)
	ARRAY LONGINT:C221($_al_MatchPosition; 0)
	C_LONGINT:C283($_l_Platform; $_l_Recipients; $_l_Startposition)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_workbook_send_mail_revi")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_WORKBOOK_MAIL_RECIPIENTS"; $2)  //semicolon delimiter
SCPT_XL_SetParameter("XCEL_WORKBOOK_MAIL_SUBJECT"; $3)

_O_PLATFORM PROPERTIES:C365($_l_Platform)

If ($_l_Platform=Windows:K25:3)
	SET ENVIRONMENT VARIABLE:C812("_4D_OPTION_BLOCKING_EXTERNAL_PROCESS"; "False")
Else 
	
	
	$_l_Startposition:=1
	$_l_Recipients:=0
	
	ARRAY LONGINT:C221($_al_MatchPosition; 0)
	ARRAY LONGINT:C221($_al_matchlength; 0)
	
	While (Match regex:C1019("(.+?)(;|$)"; $2; $_l_Startposition; $_al_MatchPosition; $_al_matchlength))
		
		$_l_Recipients:=$_l_Recipients+1
		SCPT_XL_SetParameter("XCEL_MAIL_RECIPIENT"+String:C10($_l_Recipients); Substring:C12($2; $_al_MatchPosition{1}; $_al_matchlength{1}))
		$_l_Startposition:=$_al_MatchPosition{1}+$_al_matchlength{1}
	End while 
	
	SCPT_XL_SetParameter("XCEL_MAIL_RECIPIENT_COUNT"; String:C10($_l_Recipients))
	
End if 

SCPT_XL("workbook_send_mail_review")
ERR_MethodTrackerReturn("SCPT_XL_workbook_send_mail_revi"; $_t_oldMethodName)
