//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TransactionsPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/10/2010 11:05
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

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransactionsPrint")
CREATE SET:C116([CONTACTS:1]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
$_l_OK:=PRINT_SetSIZE("A4"; "L"; "Trans_BRP")
If ($_l_OK>=0)
	If ($_l_OK=1)
		PRINT SETTINGS:C106
		$_l_OK:=OK
	Else 
		$_l_OK:=1
	End if 
	If ($_l_OK=1)
		FORM SET OUTPUT:C54([TRANSACTIONS:29]; "Trans_BRP")
		PRINT SELECTION:C60([TRANSACTIONS:29]; *)
		PRT_SetPrinterPaperOptions("Trans_BRP")
		
	End if 
	
End if 

USE SET:C118("$temp")
SEL_UpdateRecordCache(Table:C252(->[TRANSACTIONS:29]))

DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ACC_TransactionsPrint"; $_t_oldMethodName)