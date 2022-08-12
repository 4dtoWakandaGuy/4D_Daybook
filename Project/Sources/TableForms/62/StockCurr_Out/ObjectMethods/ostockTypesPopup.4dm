If (False:C215)
	//object Name: [CURRENT_STOCK]StockCurr_Out.ostockTypesPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 14:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_Status; vStatus; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CURRENT_STOCK].StockCurr_Out.ostockTypesPopup"; Form event code:C388)

If (STK_at_AllStockTypes>0)
	$_t_Status:=vStatus
	CUT NAMED SELECTION:C334([CURRENT_STOCK:62]; "$Selection")
	vStatus:=STK_at_AllStockTypes{STK_at_AllStockTypes}
	StockCurr_Sel2
	If (Records in selection:C76([CURRENT_STOCK:62])>0)
		vTitle:=Uppercase:C13(Term_StoWT("CURRENT STOCK:  "+vStatus))
		CLEAR NAMED SELECTION:C333("$Selection")
	Else 
		vStatus:=$_t_Status
		USE NAMED SELECTION:C332("$Selection")
		Gen_Alert(Term_StoWT("No Current Stock found - the selection is unchanged"); "")
	End if 
	vNo:=Records in selection:C76([CURRENT_STOCK:62])
End if 
If (vStatus#STK_at_AllStockTypes{STK_at_AllStockTypes})
	STK_at_AllStockTypes:=Find in array:C230(STK_at_AllStockTypes; vStatus)
	vTitle:=Uppercase:C13(Term_StoWT("CURRENT STOCK:  "+vStatus))
End if 
ERR_MethodTrackerReturn("OBJ [CURRENT_STOCK].StockCurr_Out.ostockTypesPopup"; $_t_oldMethodName)
