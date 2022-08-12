//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_StatementPrint2010
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 14:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; rState; vP)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_StatementPrint2010")
CREATE SET:C116([INVOICES:39]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1)
	DB_t_CurrentFormUsage:="StatementA"
	rState:=2
	MAsk_Print(->[INVOICES:39])
	Mail_StateComp
	If (vP=1)
		MAsk_MS(->[INVOICES:39])
		If (OK=1)
			Mail_StateState
		End if 
	End if 
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("INV_StatementPrint2010"; $_t_oldMethodName)