If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oLayer
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vLayer)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oLayer"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vLayer; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oLayer"; $_t_oldMethodName)
