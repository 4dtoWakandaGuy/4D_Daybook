If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oOrderType
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
	C_TEXT:C284($_t_oldMethodName; vAttendType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oOrderType"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vAttendType; ""; ->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; ->[JOB_TYPES:65]Type_Name:2; "Order Type"; "1")
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oOrderType"; $_t_oldMethodName)
