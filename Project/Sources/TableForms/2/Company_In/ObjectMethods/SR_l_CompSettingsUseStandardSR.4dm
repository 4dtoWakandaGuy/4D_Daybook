If (False:C215)
	//object Name: [COMPANIES]Company_In.SR_l_CompSettingsUseStandardSR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SR_bo_ReportPrefsDirty)
	C_LONGINT:C283(SR_l_CompPrevOverrideSR; SR_l_CompPrevUseStandardSR; SR_l_CompSettingsOverrideSR; SR_l_CompSettingsUseStandardSR)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.SR_l_CompSettingsUseStandardSR"; Form event code:C388)

//added 17/11/08 -kmw v631b120i

Case of 
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		
		Companies_SaveDocOptions(True:C214)
		
		//DocReportEmailResetValues (not really needed as we are only using for certain arrays to be availabel when we check defaults)
		SR_l_CompPrevUseStandardSR:=SR_l_CompSettingsUseStandardSR
		SR_l_CompPrevOverrideSR:=SR_l_CompSettingsOverrideSR
		//REP_t_CurrentSRDocReport
		Companies_DisplayDocOptions(True:C214)
		
		SR_bo_ReportPrefsDirty:=True:C214  //Added 01/12/08 v631b120i -kmw
		
	Else 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.SR_l_CompSettingsUseStandardSR"; $_t_oldMethodName)
