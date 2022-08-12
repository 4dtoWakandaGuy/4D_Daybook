//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_SelectAndPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    25/03/2011 08:59 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_PrintReport; DB_bo_PrintSelectedReports)
	C_LONGINT:C283($_l_RecordsinSelection; DB_l_CurrentDisplayedForm; PAL_BUTTON_2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_SelectAndPrint")
DB_bo_PrintReport:=False:C215
If (Count parameters:C259=0)
	CREATE SET:C116([DOCUMENTS:7]; "$Temp")
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
	If (Records in selection:C76([DOCUMENTS:7])>1)
		$_l_RecordsinSelection:=Records in selection:C76([DOCUMENTS:7])
		Gen_Confirm("Are you sure you want to print "+String:C10($_l_RecordsinSelection)+" Reports?"; "Yes"; "No")
		If (OK=0)
			USE SET:C118("$temp")
			DB_bo_PrintSelectedReports:=True:C214
			DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
			DB_SetFormMenuoptions
		Else 
			PAL_BUTTON_2:=1
			DB_bo_PrintReport:=True:C214
		End if 
	Else 
		DB_bo_PrintReport:=True:C214
		PAL_BUTTON_2:=1
	End if 
Else 
	//use the current selection
End if 
ERR_MethodTrackerReturn("DOC_SelectAndPrint"; $_t_oldMethodName)