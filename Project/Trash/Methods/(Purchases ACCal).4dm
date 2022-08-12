//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_ACCal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2010 16:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_LONGINT:C283($No)
	C_REAL:C285($1; v0; v31; v61; v91)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_ACCal")
$No:=vDate-[PURCHASE_INVOICES:37]Invoice_Date:5  //this is not corrent the invoice did not become due that day!
If ($No>DB_GetLedgerADStageThree)
	v91:=v91+$1
End if 
If (($No>DB_GetLedgerADStageTwo) & ($No<=DB_GetLedgerADStageThree))
	v61:=v61+$1
End if 
If (($No>DB_GetLedgerADStageOne) & ($No<=DB_GetLedgerADStageTwo))
	v31:=v31+$1
End if 
If ($No<=DB_GetLedgerADStageOne)
	v0:=v0+$1
End if 
ERR_MethodTrackerReturn("Purchases_ACCal"; $_t_oldMethodName)