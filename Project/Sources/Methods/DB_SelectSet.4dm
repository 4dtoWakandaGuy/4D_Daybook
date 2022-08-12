//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SelectSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    17/05/2010 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_DisplayStats)
	C_LONGINT:C283($_l_MenuItemParameterNum; DB_l_CurrentDisplayedForm)
	C_POINTER:C301($_ptr_Table)
	C_REAL:C285($2)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $1; DB_t_CurrentContext; SM_t_loadedsetName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SelectSet")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter="") & (Count parameters:C259>0)
	$_l_MenuItemParameterNum:=Num:C11($1)
Else 
	$_l_MenuItemParameterNum:=Num:C11($_t_MenuItemParameter)
End if 
If (String:C10($_l_MenuItemParameterNum)=$_t_MenuItemParameter) & ($_l_MenuItemParameterNum>0)
	SEL_AllRecords($_t_MenuItemParameter)
Else 
	SM_t_loadedsetName:=""
	SM_t_loadedsetName:=SM_LoadSet($_l_MenuItemParameterNum; True:C214; False:C215; 10000+DB_l_CurrentDisplayedForm)
	
	If (SM_t_loadedsetName#"")
		USE SET:C118(SM_t_loadedsetName)
	End if 
	SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
End if 
$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
SRCH_Applyfilterstoselection($_ptr_Table)
DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
If (DB_bo_DisplayStats)
	//stats are displayed
	StatsView_Cal1
	StatsView_Cal2
End if 
ERR_MethodTrackerReturn("DB_SelectSet"; $_t_oldMethodName)