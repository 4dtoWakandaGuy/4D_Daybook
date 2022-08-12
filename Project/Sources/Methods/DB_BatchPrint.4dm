//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BatchPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    30/03/2011 13:00 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BatchPrint")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
CREATE SET:C116([INVOICES:39]; "$Temp")
Case of 
	: ($_t_MenuItemParameter="")
		$_t_MenuItemParameter:="Invoices"
		
	: ($_t_MenuItemParameter=String:C10(Table:C252(->[INVOICES:39])))
		$_t_MenuItemParameter:="Invoices"
	: ($_t_MenuItemParameter=String:C10(Table:C252(->[INVOICES:39]))+"_"+"Remitance")
		$_t_MenuItemParameter:="Remitance"
End case 
Gen_Confirm("Batch print the on screen selection?"; "Yes"; "No")
READ WRITE:C146([INVOICES:39])
Case of 
	: ($_t_MenuItemParameter="Invoices")
		If (OK=1)
			
			INV_BatchPrint2010
		Else 
			DBI_MenuDisplayRecords("InvoicesPrint")
			
		End if 
	Else 
		If (OK=1)
			INV_RemittancePrint2010
		Else 
			DBI_MenuDisplayRecords("InvoicesPrintRemittance")
		End if 
End case 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("DB_BatchPrint"; $_t_oldMethodName)