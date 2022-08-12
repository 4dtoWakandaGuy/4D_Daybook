If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oArea
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
	C_TEXT:C284($_t_oldMethodName; vArea)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oArea"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vArea; ""; ->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; "Area")
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oArea"; $_t_oldMethodName)
