//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_PrintContractsList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   12/11/2010 16:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_PrintContractsList")
CREATE SET:C116([CONTRACTS:17]; "$temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 

If (OK=1)
	If (Not:C34(SR_ReportOK("ContrList")))
		FORM SET OUTPUT:C54([CONTRACTS:17]; "Contracts_List")  //NG may 2004 added $4 to this line
		DB_t_CurrentFormUsage:=""
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Contracts_List")
		If ($_l_OK>=0)
			PRINT SELECTION:C60([CONTRACTS:17])  //NG may 2004 added $4 to this line
			PRT_SetPrinterPaperOptions("Contracts_List")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("CON_PrintContractsList"; $_t_oldMethodName)