If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]dItems_Sel.OMoveDateF
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
	C_TEXT:C284($_t_oldMethodName; vContCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].dItems_Sel.OMoveDateF"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vContCode; ""; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1; ->[STOCK_MOVEMENTS:40]Company_From:2; "Movement")
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].dItems_Sel.OMoveDateF"; $_t_oldMethodName)
