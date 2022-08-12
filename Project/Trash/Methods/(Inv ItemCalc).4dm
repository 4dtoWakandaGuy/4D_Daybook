//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv ItemCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv ItemCalc")
//Inv ItemCalc
Inv_ItemCalcV
[INVOICES_ITEMS:161]Total_Amount:8:=Gen_Round(([INVOICES_ITEMS:161]Amount:5+[INVOICES_ITEMS:161]Tax_Amount:7); 2; 2)
vTot:=1
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("Inv ItemCalc"; $_t_oldMethodName)