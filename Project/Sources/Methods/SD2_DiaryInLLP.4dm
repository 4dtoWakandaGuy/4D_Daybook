//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryInLLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 19:02`Method: SD2_DiaryInLLP
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(iOK)
	//C_UNKNOWN(vButtDisDry)
	//C_UNKNOWN(vEdit)
	//C_UNKNOWN(vFrom)
	//ARRAY LONGINT(WS_al_PersonID;0)
	//ARRAY TEXT(SD2_at_ContactIDs;0)
	//ARRAY TEXT(SD2_at_EmailAddresses;0)
	C_BOOLEAN:C305($_bo_Continue; DB_bo_NoLoad; EMAIL_bo_ConfirmBefore; Mail_bo_inOK; SD2_bo_SaveDraftEmail; <>EMAIL_bo_NotHandleEmailing; $_bo_Continue; DB_bo_NoLoad; EMAIL_bo_ConfirmBefore; Mail_bo_inOK; SD2_bo_SaveDraftEmail)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_Event; $_l_Index; DB_l_ButtonClickedFunction; iOK; vEdit; $_l_ButtonPressed; $_l_Event; $_l_Index; DB_l_ButtonClickedFunction; SD2_l_SaveRecord)
	C_TEXT:C284(DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; vButtDisDry; vFrom; WIN_t_CurrentInputForm; $_t_oldMethodName; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryInLLP")
$_l_Event:=Form event code:C388


Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		WS_AutoscreenSize(1; 355; 597; Table name:C256(->[DIARY:12])+"_"+"Diary_InEmail")
		SD2_DiaryInLLPB
		SD2_DiaryINLLPInterface("SD2_EmailEntry")
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
		
		
		In_ButtChkDis(->vButtDisDry)
		
		
	: ($_l_Event=On Data Change:K2:15)
		If ([DIARY:12]Company_Code:1="") & (Size of array:C274(SD2_at_EmailAddresses)>0)
			For ($_l_Index; 1; Size of array:C274(WS_al_PersonID))
				If (WS_al_PersonID{$_l_Index}>0)
					[DIARY:12]Contact_Code:2:=SD2_at_ContactIDs{$_l_Index}
					$_l_Index:=Size of array:C274(WS_al_PersonID)
				End if 
			End for 
		End if 
		Diary_InD
		Case of 
			: (Modified:C32([DIARY:12]Company_Code:1))
				MCont_Add("")
				Diary_InLLPHead
			: (Modified:C32([DIARY:12]Contact_Code:2))
				MCont_Add("")
				Diary_InLLPHead
			: (Modified:C32([DIARY:12]Date_Do_From:4))
				vDate:=[DIARY:12]Date_Do_From:4
				Letter_Date
				Diary_InLLPHead
			: (Modified:C32([DIARY:12]Person:8))
				vFrom:=[PERSONNEL:11]Name:2
			: (Modified:C32([DIARY:12]Document_Code:15))
				
				
				vEdit:=0
		End case 
	: ($_l_Event=On Outside Call:K2:11)
		//TRACE
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("OK")) | (iOK=1)
				iOK:=0
				$_l_ButtonPressed:=DB_GetButtonFunction("Cancel")
				DB_l_ButtonClickedFunction:=0
				Mail_bo_inOK:=True:C214
				$_bo_Continue:=True:C214
				SD2_l_SaveRecord:=1
				If (<>EMAIL_bo_NotHandleEmailing=False:C215) & (Not:C34(SD2_bo_SaveDraftEmail))
					If ([DIARY:12]Email_Subject:40="")
						Gen_Confirm("This email has no subject! Do you still wish to send it?"; "NO"; "YES")
						If (OK=0)
							OK:=1
							$_bo_Continue:=True:C214
						Else 
							$_bo_Continue:=False:C215
						End if 
					Else 
						$_bo_Continue:=True:C214
					End if 
					If ($_bo_Continue)
						$_bo_Continue:=SD2_DiaryEmailSend(True:C214; True:C214)
						If ($_bo_Continue)
							EMAIL_bo_ConfirmBefore:=True:C214
						End if 
					End if 
					
					
					
				Else 
					If (SD2_bo_SaveDraftEmail)
						$_bo_Continue:=SD2_DiaryEmailSend(True:C214; False:C215; False:C215)
						If ($_bo_Continue)
							EMAIL_bo_ConfirmBefore:=True:C214
						End if 
					End if 
				End if 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Cancel")) | (iOK=1)
				$_l_ButtonPressed:=DB_l_ButtonClickedFunction
				$_bo_Continue:=True:C214
			Else 
				$_l_ButtonPressed:=DB_l_ButtonClickedFunction
				$_bo_Continue:=True:C214
		End case 
		
		If ($_bo_Continue)
			DB_l_ButtonClickedFunction:=$_l_ButtonPressed
			In_ButtCall(""; ""; "Minor_DelSinEx"; ->[DIARY:12]; ->[DIARY:12]Diary_Code:3; "RECORDINGS"; "3 9"; "SD2_DiaryInLLPB"; "DMaster"; "Diary_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisDry)
		End if 
		DB_l_ButtonClickedFunction:=0
End case 
ERR_MethodTrackerReturn("SD2_DiaryInLLP"; $_t_oldMethodName)  //added 08/07/08 -kmw
