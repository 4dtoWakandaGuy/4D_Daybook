//%attributes = {}
If (False:C215)
	//Project Method Name:      Co_Openrecordfromselection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    17/05/2010 23:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordsinNewProcess; DB_bo_DisplayFilters)
	C_LONGINT:C283($_l_EditCompanyProcess; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_CurrentDisplayedForm)
	C_LONGINT:C283(DB_l_LBOutputForm)
	C_TEXT:C284($_t_AutoSearchCode; $_t_oldMethodName; DB_t_CurrentContext; DB_t_CUrrentMenuReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Co_Openrecordfromselection")
CREATE SET:C116([COMPANIES:2]; "$temp")
USE SET:C118("ListboxSet0")
FIRST RECORD:C50([COMPANIES:2])

If (DB_GetModuleSettingByNUM(Module_Companies)>=2)
	If (DB_bo_RecordsinNewProcess)
		
		$_t_AutoSearchCode:=[COMPANIES:2]Company_Code:1
		UNLOAD RECORD:C212([COMPANIES:2])
		ZCompanies_Mod($_t_AutoSearchCode; "TRUE"; ->$_l_EditCompanyProcess)
		
	Else 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		READ WRITE:C146([COMPANIES:2])
		Companies_File
		SET MENU BAR:C67(26)
		
		MODIFY RECORD:C57([COMPANIES:2]; *)
		Comp_Unload
		READ ONLY:C145([COMPANIES:2])
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		//Need to make sure objects end up in the correct place 2
		//``
		DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
		
		//``
		SET MENU BAR:C67(DB_t_CUrrentMenuReference)
		DB_SetFormMenuoptions
		DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	End if 
Else 
	Gen_Alert("Sorry you do not have access to company records")
	
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("Co_Openrecordfromselection"; $_t_oldMethodName)  //``