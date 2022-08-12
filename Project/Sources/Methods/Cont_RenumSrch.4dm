//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_RenumSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_RenumSrch")
//If (DB_GetModuleSetting(Module_DiaryManager)>0)
QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$1)
//`End if

QUERY:C277([INFORMATION:55]; [INFORMATION:55]Contact_Code:1=$1)
//End if
QUERY:C277([JOBS:26]; [JOBS:26]Contact_Code:4=$1)

//End if

QUERY:C277([ORDERS:24]; [ORDERS:24]Contact_Code:2=$1)
//End if
//If (DB_GetModuleSetting(Module_SalesLedger)>0)
QUERY:C277([INVOICES:39]; [INVOICES:39]Contact_Code:3=$1)
QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Contact_Code:5=$1)
//End if
//If (DB_GetModuleSetting(Module_DataManager)>0)
QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contact_Code:2=$1)
QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Contact_Code:2=$1)
//End if
//If (DB_GetModuleSetting(14)>0)
QUERY:C277([PUBLICATIONS:52]; [PUBLICATIONS:52]Contact_Code:4=$1)
//

//End if
QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=("001"+$1))
ERR_MethodTrackerReturn("Cont_RenumSrch"; $_t_oldMethodName)