If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oNoLookupCheckbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 15:24
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oNoLookupCheckbox"; Form event code:C388)
<>NAL:=(cNAL=1)
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oNoLookupCheckbox"; $_t_oldMethodName)