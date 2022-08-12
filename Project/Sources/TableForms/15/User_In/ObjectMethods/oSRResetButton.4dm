If (False:C215)
	//object Name: [USER]User_In.SR_btnResetOptions1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(SR_aptr_PrefsToSave;0)
	C_TEXT:C284($_t_oldMethodName; REP_t_CurrentSRDocReport)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.SR_btnResetOptions1"; Form event code:C388)

//Added 13/11/08 v631b120g -kmw

Reports_PrefsSetDefaults
ARRAY POINTER:C280(SR_aptr_PrefsToSave; 0)
Reports_PrefsSaveNEW(REP_t_CurrentSRDocReport; "REPORT"; ->SR_aptr_PrefsToSave; Table:C252(->[DOCUMENTS:7]); 0)  //added 26/11/08 v631b120i - will do this save at a later point anyway (if selected report is changed or we quit preferences)....however shouldn't do any harm to have here immediately also but main reason for doing it here immediately is so we now have a means to get rid of corrupt blobs during testing

Reports_PrefsSetVisibility
ERR_MethodTrackerReturn("OBJ [USER].User_In.SR_btnResetOptions1"; $_t_oldMethodName)
