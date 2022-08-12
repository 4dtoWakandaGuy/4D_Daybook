If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dACC_BalSelect.oNoLookupCheckbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 04:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>NAL)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dACC_BalSelect.oNoLookupCheckbox"; Form event code:C388)
<>NAL:=(cNAL=1)
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dACC_BalSelect.oNoLookupCheckbox"; $_t_oldMethodName)