//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_OpenAccBalfromselection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   09/08/2010 15:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	C_BOOLEAN:C305(ACCBAL_Bo_NoCancel; DB_bo_DisplayFilters; DB_bo_RecordsinNewProcess; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_bo_EditBalanceinProcess; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm)
	C_TEXT:C284($_t_AutoSearchCode; $_t_oldMethodName; DB_t_CurrentContext; DB_t_CUrrentMenuReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_OpenAccBalfromselection")
CREATE SET:C116([ACCOUNT_BALANCES:34]; "$temp")
//ng not sure this is right
USE SET:C118("ListboxSet0")
FIRST RECORD:C50([ACCOUNT_BALANCES:34])
If (DB_GetModuleSettingByNUM(Module_NominalLedger)>=2)
	If (DB_bo_RecordsinNewProcess)
		$_t_AutoSearchCode:=[ACCOUNT_BALANCES:34]Unique_StringIdent:8
		UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
		ZAccBal_Bal($_t_AutoSearchCode; "TRUE"; ->$_bo_EditBalanceinProcess)
		
		
	Else 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		ACC_BalFile
		SET MENU BAR:C67(9)
		ACCBAL_Bo_NoCancel:=True:C214
		MODIFY RECORD:C57([ACCOUNT_BALANCES:34]; *)
		UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
		READ ONLY:C145([ACCOUNT_BALANCES:34])
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		//Need to make sure objects end up in the correct place 2
		//``
		If (DB_bo_ShowArrayBased)
			DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_lb_OutputArrays; 90; 60; DB_bo_DisplayFilters)
		Else 
			DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_l_LBOutputForm; 90; 60; DB_bo_DisplayFilters)
		End if 
		
		//``
		SET MENU BAR:C67(DB_t_CUrrentMenuReference)
		
		
		
	End if 
	USE SET:C118("$temp")
	DB_SetFormMenuoptions
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	
End if 
ERR_MethodTrackerReturn("ACC_OpenAccBalfromselection"; $_t_oldMethodName)