//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SelectrecordsFromSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/05/2011 17:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OptionKey; DB_bo_DisplayStats; PUR_bo_RESET)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_REAL:C285(PUR_R_TotalDue; PUR_R_TotalDue30; PUR_R_TotalDue60; PUR_R_TotalDue90; PUR_R_TotalDueg90)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SelectrecordsFromSelection")
$_bo_OptionKey:=Gen_Option
CREATE SET:C116(Table:C252(DB_l_CurrentDisplayedForm)->; "Temp")
If (Records in set:C195("ListboxSet0")>0)
	If ($_bo_OptionKey)
		DIFFERENCE:C122("Temp"; "ListboxSet0"; "Temp")
		USE SET:C118("Temp")
	Else 
		USE SET:C118("ListboxSet0")
	End if 
	Case of 
		: (DB_t_CurrentContext="Creditors Report")
			PUR_bo_RESET:=True:C214
			PUR_R_TotalDue:=0
			PUR_R_TotalDue30:=0
			PUR_R_TotalDue90:=0
			PUR_R_TotalDue60:=0
			PUR_R_TotalDueg90:=0
	End case 
	SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
	DB_SetFormButtons(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	DB_SetFormMenuoptions
	DB_HideShowSearch(DB_l_CurrentDisplayedForm)
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	If (DB_bo_DisplayStats)  //stats are displayed
		//TRACE
		StatsView_Cal1
		StatsView_Cal2
	End if 
End if 
ERR_MethodTrackerReturn("DB_SelectrecordsFromSelection"; $_t_oldMethodName)