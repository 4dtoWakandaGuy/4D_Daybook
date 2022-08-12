If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCHES]TransB_In13_TEST
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/11/2009 18:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCHES].TransB_In13_TEST"; Form event code:C388)



$_l_event:=Form event code:C388

TransB_InLP($_l_event)
ERR_MethodTrackerReturn("FM [TRANSACTION_BATCHES].TransB_In13_TEST"; $_t_oldMethodName)