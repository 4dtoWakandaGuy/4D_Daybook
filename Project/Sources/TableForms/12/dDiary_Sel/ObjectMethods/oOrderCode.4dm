If (False:C215)
	//object Name: [DIARY]dDiary_Sel.oOrderCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.oOrderCode"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vOrderCode; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Company_Code:1; "Order")
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.oOrderCode"; $_t_oldMethodName)
