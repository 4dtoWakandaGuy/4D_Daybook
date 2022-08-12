//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_PrintCallsList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   12/11/2010 16:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_PrintCallsList")
CREATE SET:C116([SERVICE_CALLS:20]; "$temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([SERVICE_CALLS:20])>0)
	
	If (Not:C34(SR_ReportOK("CallList")))
		FORM SET OUTPUT:C54([SERVICE_CALLS:20]; "CallList")  //NG may 2004 added $4 to this line
		//DB_t_CurrentFormUsage:=Calls_List
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Calls")
		If ($_l_OK>=0)
			PRINT SELECTION:C60([SERVICE_CALLS:20])  //NG may 2004 added $4 to this line
			PRT_SetPrinterPaperOptions("Calls_List")
		End if 
	End if 
End if 

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("SVS_PrintCallsList"; $_t_oldMethodName)