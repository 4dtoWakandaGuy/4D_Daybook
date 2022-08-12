//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InLLP_new
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD_bo_AdditionalRelations)
	C_LONGINT:C283($_l_Event; DOC_l_CallEvent; EmailChoiceProc)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; EMAIL_t_EmailBody; EMAIL_T_EmailSignature; EMAIL_t_FooterText; EMAIL_t_InsText; WIN_t_CurrentInputForm)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Diary_InLLP_new")
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		If (WIN_t_CurrentInputForm="Diary_InEmail")
			WS_AutoscreenSize(1; 355; 597; Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		Else 
			WS_AutoscreenSize(1; 0; 700; Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		End if 
		Diary_inLLPB_New
End case 
ERR_MethodTrackerReturn("Diary_InLLP_new"; $_t_oldMethodName)