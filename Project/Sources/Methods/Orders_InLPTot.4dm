//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPTot
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    22/11/2010 23:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAB)
	C_BOOLEAN:C305($1)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; LB_l_ColumnNumber; LB_l_RowNumber; vAB; vColumn; Vrow; $_l_WindowBottom)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPTot")
//Orders_InLPTot
If (vAB=0)
	[ORDERS:24]Total_Amount:6:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)); 2; 2)
	[ORDERS:24]Total_StandA:38:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Standard_Amount:40)); 2; 2)
	OrderI_SubCostT
	[ORDERS:24]Total_TAX:7:=Gen_Round((Sum:C1([ORDER_ITEMS:25]TAX_Amount:8)); 2; 2)
	[ORDERS:24]Total_Total:8:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Total_Amount:9)); 2; 2)
	[ORDERS:24]Export:24:=Export_Stamp3([ORDERS:24]Export:24)
	//GET WINDOW RECT($_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom)
	//SET WINDOW RECT($_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom+1)
	//SET WINDOW RECT($_l_WindowLeft;$_l_WindowTop;$_l_WindowRight;$_l_WindowBottom)
End if 
ERR_MethodTrackerReturn("Orders_InLPTot"; $_t_oldMethodName)
