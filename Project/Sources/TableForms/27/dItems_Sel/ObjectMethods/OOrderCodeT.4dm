If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]dItems_Sel.OOrderCodeT
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
	C_TEXT:C284($_t_oldMethodName; vOrderCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].dItems_Sel.OOrderCodeT"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vOrderCode; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Order")
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].dItems_Sel.OOrderCodeT"; $_t_oldMethodName)
