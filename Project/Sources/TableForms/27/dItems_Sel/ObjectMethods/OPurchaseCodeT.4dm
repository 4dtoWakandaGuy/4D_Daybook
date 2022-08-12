If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]dItems_Sel.OPurchaseCodeT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; $_t_ContCode; vCompCode; vContCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].dItems_Sel.OPurchaseCodeT"; Form event code:C388)
If (cNAL=0)
	$_t_ContCode:=vContCode
	Check_CompanyNC(->vCompCode; ->[COMPANIES:2]Company_Code:1; ->[STOCK_MOVEMENT_ITEMS:27])
	vContCode:=$_t_ContCode
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].dItems_Sel.OPurchaseCodeT"; $_t_oldMethodName)
