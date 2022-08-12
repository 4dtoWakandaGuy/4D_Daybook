//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_Code
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/06/2009 16:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_Code")
//Purch_Code
$_t_PurchaseCode:=Substring:C12(Gen_CodePref(8; ->[PURCHASE_INVOICES:37]Purchase_Code:1); 1; 11)
If ($_t_PurchaseCode="")
	CANCEL:C270
Else 
	[PURCHASE_INVOICES:37]Purchase_Code:1:=$_t_PurchaseCode
End if 
[PURCHASE_INVOICES:37]Last_Modified_Stamp:36:=Export_Stamp3([PURCHASE_INVOICES:37]Last_Modified_Stamp:36)
ERR_MethodTrackerReturn("Purch_Code"; $_t_oldMethodName)
