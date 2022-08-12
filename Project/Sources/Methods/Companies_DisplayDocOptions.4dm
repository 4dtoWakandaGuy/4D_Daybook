//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_DisplayDocOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 08:57`Method: Companies_DisplayDocOptions
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
	//ARRAY POINTER(SR_aptr_PrefsToLoad;0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	C_BOOLEAN:C305($_bo_ReportSettingLevelJustChang; $1)
	C_LONGINT:C283(SR_l_CompPrevOverrideSR; SR_l_CompPrevUseStandardSR; SR_l_CompSettingsOverrideSR; SR_l_CompSettingsUseStandardSR)
	C_TEXT:C284($_t_oldMethodName; REP_t_CurrentSRDocReport; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_DisplayDocOptions")

//Added 17/11/08 v631b120i -kmw


//
//

If (Count parameters:C259>0)
	$_bo_ReportSettingLevelJustChang:=$1
Else 
	$_bo_ReportSettingLevelJustChang:=False:C215
End if 


If ($_bo_ReportSettingLevelJustChang=False:C215)
	
	Reports_BuildArrayofElements(->SR_aptr_PrefsToLoad; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
	Reports_PrefsLoadNEW(REP_t_CurrentSRDocReport; "COMPANY REPORT"; ->$_aptr_PrefsToLoad; $_bo_ReportSettingLevelJustChang; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)
	//Load the override prefs from company level prefs
	
End if 


//Need to add functionality to save/load SR_l_CompSettingsUseStandardSR and SR_l_CompSettingsOverrideSR
Case of   //Added 17/11/08 v631b120i -kmw
	: (SR_l_CompSettingsUseStandardSR=1)  //Added 17/11/08 v631b120i -kmw
		//************************* altered to use selective pref loading 19/11/08 v631b120i -kmw **********************
		
		Reports_BuildArrayofElements(->SR_aptr_PrefsToLoad; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
		
		Reports_PrefsLoadNEW(REP_t_CurrentSRDocReport; "REPORT"; ->SR_aptr_PrefsToLoad; False:C215; Table:C252(->[DOCUMENTS:7]); 0)  //Load the rest of the prefs from report level prefs
		//*********************************************************************************************************
		OBJECT SET ENABLED:C1123(*; "SR_EmailPrintOption@"; False:C215)
		
	: (SR_l_CompSettingsOverrideSR=1)  //Added 17/11/08 v631b120i -kmw
		Reports_BuildArrayofElements(->SR_aptr_PrefsToLoad; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
		
		Reports_PrefsLoadNEW(REP_t_CurrentSRDocReport; "COMPANY REPORT"; ->SR_aptr_PrefsToLoad; $_bo_ReportSettingLevelJustChang; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)  //Added 17/11/08 v631b120i -kmw
		If (SR_l_CompSettingsOverrideSR=1)  //need to check this because company level Reports_PrefsLoadNEW can set option back to use standard report option and then recall itself at report level in the event there was no company level pref record yet
			//_O_ENABLE BUTTON(*;"SR_EmailPrintOption@")
			OBJECT SET ENABLED:C1123(*; "oSREmailPrintOption@"; True:C214)
		Else 
			//_O_DISABLE BUTTON(*;"SR_EmailPrintOption@")
			OBJECT SET ENABLED:C1123(*; "oSREmailPrintOption@"; False:C215)
		End if 
		
	Else   //shouldn't happen
		//default to report settings
		SR_l_CompPrevUseStandardSR:=1
		SR_l_CompSettingsUseStandardSR:=1
		SR_l_CompPrevOverrideSR:=0
		SR_l_CompSettingsOverrideSR:=0
		ARRAY POINTER:C280(SR_aptr_PrefsToLoad; 0)
		Reports_BuildArrayofElements(->SR_aptr_PrefsToLoad; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
		Reports_PrefsLoadNEW(REP_t_CurrentSRDocReport; "REPORT"; ->SR_aptr_PrefsToLoad; False:C215; Table:C252(->[DOCUMENTS:7]); 0)  //Load the rest of the prefs from report level prefs
		OBJECT SET ENABLED:C1123(*; "oSREmailPrintOption@"; False:C215)
		
End case   //Added 17/11/08 v631b120i -kmw
Reports_PrefsSetVisibility(SR_at_EmailPrintOption1; SR_at_EmailPrintOption2; SR_at_EmailPrintOption3)

ERR_MethodTrackerReturn("Companies_DisplayDocOptions"; $_t_oldMethodName)
