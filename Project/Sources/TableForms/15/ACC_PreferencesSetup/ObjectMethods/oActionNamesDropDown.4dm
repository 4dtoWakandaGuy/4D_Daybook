If (False:C215)
	//object Name: [USER]ACC_PreferencesSetup.Variable11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_DiaryActionCodes;0)
	//ARRAY TEXT(ACC_at_DiaryActionNames;0)
	C_BOOLEAN:C305(ACC_bo_DataChange)
	C_TEXT:C284($_t_oldMethodName; ACC_t_ActionName; ACC_t_ActionCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Variable11"; Form event code:C388)
If (ACC_at_DiaryActionNames>0)
	If (ACC_t_ActionCode#ACC_at_DiaryActionCodes{ACC_at_DiaryActionNames})
		ACC_t_ActionCode:=ACC_at_DiaryActionCodes{ACC_at_DiaryActionNames}
		ACC_t_ActionName:=ACC_at_DiaryActionNames{ACC_at_DiaryActionNames}
		ACC_bo_DataChange:=True:C214
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PreferencesSetup.Variable11"; $_t_oldMethodName)
