//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_SaveDocOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2010 12:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(SR_aptr_PrefsToSave;0)
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

$_t_oldMethodName:=ERR_MethodTracker("Companies_SaveDocOptions")

//Added 17/11/08 v631b120i -kmw




If (Count parameters:C259>0)
	$_bo_ReportSettingLevelJustChang:=$1
Else 
	$_bo_ReportSettingLevelJustChang:=False:C215
End if 


Case of 
	: ($_bo_ReportSettingLevelJustChang=True:C214)
		
		Case of   //Added 17/11/08 v631b120i -kmw
			: (SR_l_CompPrevUseStandardSR=1)  //Added 17/11/08 v631b120i -kmw
				
				If (False:C215)
					
					
					//Reports_PrefsSaveNEW ([COMPANIES]Company Code+"_"+REP_t_CurrentSRDocReport;"REPORT";->SR_aptr_PrefsToSave)
					//Reports_BuildArrayofElements (->SR_aptr_PrefsToSave;->SR_at_EmailPrintOption1;->SR_at_EmailPrintOption2;->SR_t_EmailPrintOption2Email;->SR_t_EmailPrintOption2Cont;->SR_t_EmailPrintOption2Role;->SR_t_EmailPrintOption2Pers;->SR_at_EmailPrintOption3;->SR_t_EmailPrintOption3Email;->SR_t_EmailPrintOption3Cont;->SR_t_EmailPrintOption3Role;->SR_t_EmailPrintOption3Pers;->SR_at_EmailPrintOption4)
					
					Reports_PrefsSaveNEW(REP_t_CurrentSRDocReport; "REPORT"; ->SR_aptr_PrefsToSave; Table:C252(->[DOCUMENTS:7]); 0)
					
					
				End if 
				
				Reports_BuildArrayofElements(->SR_aptr_PrefsToSave; ->SR_l_CompPrevUseStandardSR; ->SR_l_CompPrevUseStandardSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
				
				Reports_PrefsSaveNEW(REP_t_CurrentSRDocReport; "COMPANY REPORT"; ->SR_aptr_PrefsToSave; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)  //Added 17/11/08 v631b120i -kmw
				
				
			: (SR_l_CompPrevOverrideSR=1)  //Added 17/11/08 v631b120i -kmw
				//below lines commenetd out because setting arrays deemed unnecessary as not passing an array pointer to prefs defaults to these ones anyway
				
				Reports_BuildArrayofElements(->SR_aptr_PrefsToSave; ->SR_l_CompPrevUseStandardSR; ->SR_l_CompPrevUseStandardSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
				
				Reports_PrefsSaveNEW(REP_t_CurrentSRDocReport; "COMPANY REPORT"; ->SR_aptr_PrefsToSave; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)  //Added 17/11/08 v631b120i -kmw
				
				
			Else   //shouldnt happen
				SR_l_CompPrevUseStandardSR:=1
				SR_l_CompSettingsUseStandardSR:=1
				SR_l_CompPrevOverrideSR:=0
				SR_l_CompSettingsOverrideSR:=0
				//Reports_PrefsSaveNEW (REP_t_CurrentSRDocReport;"REPORT")  `Added 17/11/08 v631b120i -kmw
				
		End case   //Added 17/11/08 v631b120i -kmw
		
	Else 
		
		
		Case of   //Added 17/11/08 v631b120i -kmw
			: (SR_l_CompSettingsUseStandardSR=1)  //Added 17/11/08 v631b120i -kmw
				//Reports_PrefsSaveNEW (REP_t_CurrentSRDocReport;"REPORT")
				
				Reports_BuildArrayofElements(->SR_aptr_PrefsToSave; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
				
				Reports_PrefsSaveNEW(REP_t_CurrentSRDocReport; "COMPANY REPORT"; ->SR_aptr_PrefsToSave; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)  //Added 17/11/08 v631b120i -kmw
				
				
				
			: (SR_l_CompSettingsOverrideSR=1)  //Added 17/11/08 v631b120i -kmw
				//below lines commenetd out because setting arrays deemed unnecessary as not passing an array pointer to prefs defaults to these ones anyway
				
				Reports_BuildArrayofElements(->SR_aptr_PrefsToSave; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
				
				Reports_PrefsSaveNEW(REP_t_CurrentSRDocReport; "COMPANY REPORT"; ->SR_aptr_PrefsToSave; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)  //Added 17/11/08 v631b120i -kmw
				
			Else   //shouldnt happen
				//except it does. when the preferences are not loaded
				SR_l_CompPrevUseStandardSR:=0
				SR_l_CompSettingsUseStandardSR:=0
				SR_l_CompPrevOverrideSR:=0
				SR_l_CompSettingsOverrideSR:=0
				//Reports_PrefsSaveNEW (REP_t_CurrentSRDocReport;"REPORT")  `Added 17/11/08 v631b120i -kmw
				
		End case   //Added 17/11/08 v631b120i -kmw
		
End case 
ERR_MethodTrackerReturn("Companies_SaveDocOptions"; $_t_oldMethodName)
