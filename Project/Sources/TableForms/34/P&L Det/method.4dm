If (False:C215)
	//Table Form Method Name: [ACCOUNT_BALANCES]PL_Detail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(vBalance)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [ACCOUNT_BALANCES].PL_Detail"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//PL_Detail
		If (vBalance=0)
			OBJECT SET FONT SIZE:C165(vBalance; 1)
		End if 
End case 
ERR_MethodTrackerReturn("FM [ACCOUNT_BALANCES].PL_Detail"; $_t_oldMethodName)
