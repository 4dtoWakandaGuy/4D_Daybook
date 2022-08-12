If (False:C215)
	//Table Form Method Name: [SMS_Log]SMSLog_Out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_FormReference)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_Process; $_l_SMSID; DB_l_ButtonPrefsSet; DEF_l_SettingsCalled; SIZ_l_COLastBottom; SIZ_l_COLastLeft; SIZ_l_COLastRight; SIZ_l_COLastTop; SIZ_l_Minimized)
	C_LONGINT:C283(SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop)
	C_TEXT:C284($_t_oldMethodName; vButtDisO; vRequest; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [SMS_Log].SMSLog_Out"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (DEF_l_SettingsCalled=0)
			OpenHelp(Table:C252(->[SMS_Log:124]); "SMSLog_Out")
			
			Cache_Initialise("CMaster")
			vButtDisO:="O                "
			Out_Buttons
			//    FSetting_SetLabel (WIN_t_CurrentOutputform)
			//   C_LONGINT(SIZ_l_Minimized;SIZ_l_OLDLEFT;SIZ_l_OLDTop;SIZ_l_OLDRight;SIZ_l_OLD
			//   If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTT
			//    WS_OutputResize
			
			//  End if
			Case of 
				: (Character code:C91(Substring:C12(vRequest; 1; 1))=215)
					vRequest:=Substring:C12(vRequest; 2; 32000)
					HIGHLIGHT TEXT:C210(vRequest; 100; 100)
				: (vRequest="•None")
					vRequest:=""
			End case 
			DEF_l_SettingsCalled:=1
		Else 
			DEF_l_SettingsCalled:=0
		End if 
		
	: ($_l_event=On Header:K2:17)
		//   C_BOOLEAN(INT_bo_DetailOpen)
		//   C_LONGINT(SIZ_l_Minimized;SIZ_l_OLDLEFT;SIZ_l_OLDTop;SIZ_l_OLDRight;SIZ_l_OLD
		//  If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTO
		//   WS_OutputResize
		
		//  End if
		INT_Setoutput(Table:C252(->[SMS_Log:124]); WIN_t_CurrentOutputform)
	: ($_l_event=On Resize:K2:27)
		
		//   If (Not(INT_bo_DetailOpen))
		//    WS_OutputResize
		//   End if
		
		//  INT_bo_DetailOpen:=False
		
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[SMS_Log:124]); "SMSLog_Out")
		If (DB_l_ButtonPrefsSet=1)
			vButtDisO:="O D MONPFSSSRCADT"
		Else 
			vButtDisO:="O                "
		End if 
		Out_Buttons
		//Cache_Update
	: ($_l_event=On Outside Call:K2:11)
		Out_ButtCall(->[SMS_Log:124]; ->[SMS_Log:124]X_ID:8; ->[SMS_Log:124]From:7; "SMS Log"; "SMS_Add"; "SMS_Sel"; "SMS_Delete"; ""; ""; ""; 0; 0)
		
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Unload:K2:2)
		//    SIZ_l_Minimized:=0
		//    SIZ_l_COLastLeft:=0
		//   SIZ_l_COLastTop:=0
		//   SIZ_l_COLastRight:=0
		//  SIZ_l_COLastBottom:=0
	: ($_l_event=On Open Detail:K2:23)
		COPY NAMED SELECTION:C331([SMS_Log:124]; "Current selection")
		$_l_SMSID:=[SMS_Log:124]X_ID:8
		SET QUERY DESTINATION:C396(Into set:K19:2; "OneRecord")
		QUERY:C277([SMS_Log:124]; [SMS_Log:124]X_ID:8=$_l_SMSID)
		SET QUERY DESTINATION:C396(0)
		
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		INT_bo_DetailOpen:=True:C214
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[SMS_Log:124])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		$_l_Process:=Frontmost process:C327
		USE NAMED SELECTION:C332("Current selection")
		CLEAR NAMED SELECTION:C333("Current selection")
		HIGHLIGHT RECORDS:C656("OneRecord")
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		If (DB_l_ButtonPrefsSet=1)
			vButtDisO:="O D MONPFSSSRCADT"
		Else 
			vButtDisO:="O                "
		End if 
		Out_Buttons
		BRING TO FRONT:C326($_l_Process)
		
	: (On Resize:K2:27=$_l_event)
		
End case 
ERR_MethodTrackerReturn("FM [SMS_Log].SMSLog_Out"; $_t_oldMethodName)
