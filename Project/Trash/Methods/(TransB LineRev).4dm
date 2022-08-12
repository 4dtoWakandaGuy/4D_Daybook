//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB LineRev
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/06/2011 08:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $DB; $DBIO)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB LineRev")
$DB:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=$DB
$DBIO:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:=$DBIO
ERR_MethodTrackerReturn("TransB LineRev"; $_t_oldMethodName)