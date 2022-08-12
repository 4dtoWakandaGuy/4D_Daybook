//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_EnterNewRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    17/05/2010 22:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_DisplayFilters; DB_bo_RecordsinNewProcess)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_ButtonPrefsSet; DB_l_CurrentDisplayedForm)
	C_LONGINT:C283(DB_l_LBOutputForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CUrrentMenuReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_EnterNewRecord")
CREATE SET:C116([COMPANIES:2]; "CMaster")
If (DB_bo_RecordsinNewProcess)
	Companies_In_NEW(False:C215; True:C214)
	
Else 
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	DB_l_ButtonPrefsSet:=1
	SET MENU BAR:C67(26)
	Companies_In_NEW(False:C215; False:C215)
	SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
	SET MENU BAR:C67(DB_t_CUrrentMenuReference)
	DB_SetFormMenuoptions
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	
End if 
USE SET:C118("Cmaster")
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
ERR_MethodTrackerReturn("CO_EnterNewRecord"; $_t_oldMethodName)