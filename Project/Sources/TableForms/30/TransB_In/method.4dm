If (False:C215)
	//Table Form Method Name: [TRANSACTION_BATCHES]TransB_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2011 16:30
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
$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTION_BATCHES]TransB_in"; Form event code:C388)

//$_t_oldMethodName:=ERR_MethodTracker ("FM [TRANSACTION_BATCHES].TransB_in";Form event)
If (Form event code:C388=On Outside Call:K2:11)
	//TRACE
End if 
$_l_event:=Form event code:C388

TransB_InLP($_l_event)
//ERR_MethodTrackerReturn ("FM:TransB_in";$_t_oldMethodName)
