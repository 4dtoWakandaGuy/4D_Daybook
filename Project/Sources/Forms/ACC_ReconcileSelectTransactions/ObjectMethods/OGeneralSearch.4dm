If (False:C215)
	//object Name: Object Name:      ACC_ReconcileSelectTransactions.OGeneralSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/08/2012 08:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ReconcileSelectTransactions.OGeneralSearch"; Form event code:C388)
Gen_Alert("Please note: The results of this query will be displayed in their own window. They will not be added to the reconcilable transactions. Or be reconcilable against this statement item from that window.")

//ZTrans OnScreen
DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[TRANSACTIONS:29])))
ERR_MethodTrackerReturn("OBJ ACC_ReconcileSelectTransactions.OGeneralSearch"; $_t_oldMethodName)