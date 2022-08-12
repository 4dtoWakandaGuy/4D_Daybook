//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_SatementofAccount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2010 20:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_SatementofAccount")
CREATE SET:C116([INVOICES:39]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1)
	Mail_StateComp
	FORM SET OUTPUT:C54([COMPANIES:2]; "StatementOA")
	PRINT SELECTION:C60([COMPANIES:2])
	FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Out")
	If (OK=1)
		Gen_Confirm("Were the Statements printed OK?"; "Yes"; "No")
		If (OK=1)
			USE SET:C118("Master2")
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Total_Due:7=0)
			DB_lockFile(->[INVOICES:39])
			APPLY TO SELECTION:C70([INVOICES:39]; [INVOICES:39]Statement_Date:34:=<>DB_d_CurrentDate)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[INVOICES:39]))
		End if 
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("INV_SatementofAccount"; $_t_oldMethodName)