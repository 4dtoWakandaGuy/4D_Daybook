//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_EnterNewRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   22/05/2010 13:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CON_bo_NoCancel; DB_bo_DisplayFilters; DB_bo_RecordsinNewProcess)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_ButtonPrefsSet; DB_l_CurrentDisplayedForm)
	C_LONGINT:C283(DB_l_LBOutputForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentMenuReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_EnterNewRecord")

CREATE SET:C116([CONTACTS:1]; "CMaster")
If (DB_bo_RecordsinNewProcess)
	//Contacts_In_New (False;True)
	
Else 
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	DB_l_ButtonPrefsSet:=1
	//Contacts_In_New (False;False)
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
	
	//``
	SET MENU BAR:C67(DB_t_CUrrentMenuReference)
End if 
USE SET:C118("Cmaster")
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
ERR_MethodTrackerReturn("CON_EnterNewRecord"; $_t_oldMethodName)