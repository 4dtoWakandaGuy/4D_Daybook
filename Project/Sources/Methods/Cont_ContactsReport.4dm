//%attributes = {}
If (False:C215)
	//Project Method Name:      CONT_ContactsReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/05/2010 10:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>MultiCo)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CONT_ContactsReport")
If (Count parameters:C259=0)
	CREATE SET:C116([CONTACTS:1]; "$temp")
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
End if 
If (Not:C34(SR_ReportOK("ContList")))
	If (<>MultiCo)
		Gen_Confirm("Print all Companies or just the first?"; "All"; "First")
		If (OK=1)
			FORM SET OUTPUT:C54([CONTACTS:1]; "Contacts_ListMC")
			Gen_Confirm("Print Full Addresses or only the Name?"; "Full"; "Name")
			If (OK=1)
				DB_t_CurrentFormUsage:="Full"
			End if 
		Else 
			FORM SET OUTPUT:C54([CONTACTS:1]; "Contacts_List")
		End if 
	Else 
		FORM SET OUTPUT:C54([CONTACTS:1]; "Contacts_List")
	End if 
	PRINT SELECTION:C60([CONTACTS:1])
	
End if 
If (Count parameters:C259=0)
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
	
End if 
ERR_MethodTrackerReturn("CONT_ContactsReport"; $_t_oldMethodName)