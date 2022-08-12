//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev OutTyp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_BOOLEAN:C305(<>STK_bo_TypesInited)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_Status; vStatus; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev OutTyp")
If (Not:C34(<>STK_bo_TypesInited))
	Order_Buttons
	<>STK_bo_TypesInited:=True:C214
End if 
If (STK_at_AllStockTypes>0)
	$_t_Status:=vStatus
	CUT NAMED SELECTION:C334([STOCK_LEVELS:58]; "$Selection")
	vStatus:=STK_at_AllStockTypes{STK_at_AllStockTypes}
	StockLev_Sel2
	If (Records in selection:C76([STOCK_LEVELS:58])>0)
		vTitle:=Uppercase:C13(Term_StoWT("STOCK LEVELS:  "+vStatus))
		CLEAR NAMED SELECTION:C333("$Selection")
	Else 
		vStatus:=$_t_Status
		USE NAMED SELECTION:C332("$Selection")
		Gen_Alert(Term_StoWT("No Stock Levels found - the selection is unchanged"); "")
	End if 
	vNo:=Records in selection:C76([STOCK_LEVELS:58])
End if 
If (vStatus#STK_at_AllStockTypes{STK_at_AllStockTypes})
	STK_at_AllStockTypes:=Find in array:C230(STK_at_AllStockTypes; vStatus)
	vTitle:=Uppercase:C13(Term_StoWT("STOCK LEVELS:  "+vStatus))
End if 
ERR_MethodTrackerReturn("StockLev OutTyp"; $_t_oldMethodName)
