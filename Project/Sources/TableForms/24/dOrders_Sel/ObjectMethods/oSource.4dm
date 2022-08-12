If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oSource
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
	C_TEXT:C284($_t_oldMethodName; vSource)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oSource"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vSource; ""; ->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Source_Name:2; "Source"; "4")
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oSource"; $_t_oldMethodName)
