If (False:C215)
	//Table Form Method Name: [INVOICES]ALL_FIELDS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2009 21:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(INV_R_SumPaid)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].ALL_FIELDS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Display Detail:K2:22)
		INV_R_SumPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
End case 
ERR_MethodTrackerReturn("FM [INVOICES].ALL_FIELDS"; $_t_oldMethodName)
