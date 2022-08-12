//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_Openrecordfromselection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     22/05/2010 17:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CON_bo_NoCancel; DB_bo_RecordsinNewProcess; DB_bo_DisplayFilters)
	C_LONGINT:C283($_l_EditCompanyProcess; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_CurrentDisplayedForm)
	C_LONGINT:C283(DB_l_LBOutputForm)
	C_TEXT:C284($_t_AutosearchCode; $_t_oldMethodName; DB_t_CurrentContext; DB_t_CUrrentMenuReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_Openrecordfromselection")
CREATE SET:C116([CONTACTS:1]; "$temp")
USE SET:C118("ListboxSet0")
FIRST RECORD:C50([CONTACTS:1])
If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
	If (DB_bo_RecordsinNewProcess)
		$_t_AutosearchCode:=[CONTACTS:1]Contact_Code:2
		UNLOAD RECORD:C212([CONTACTS:1])
		ZContacts_Mod($_t_AutosearchCode; "TRUE"; ->$_l_EditCompanyProcess)
		
	Else 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		Contacts_File
		//SET MENU BAR(27)
		CON_bo_NoCancel:=True:C214
		MODIFY RECORD:C57([CONTACTS:1]; *)
		Cont_Unload
		READ ONLY:C145([CONTACTS:1])
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		//Need to make sure objects end up in the correct place 2
		//``
		DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
		
		//``
		SET MENU BAR:C67(DB_t_CUrrentMenuReference)
		
		
		
	End if 
	USE SET:C118("$temp")
	DB_SetFormMenuoptions
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	
End if 
ERR_MethodTrackerReturn("CON_Openrecordfromselection"; $_t_oldMethodName)