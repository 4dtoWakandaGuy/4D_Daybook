//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 13:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_BOOLEAN:C305(<>STK_bo_TypesInited)
	C_LONGINT:C283(vPu; xNext)
	C_TEXT:C284(<>ProdCode; $_t_oldMethodName; $_t_Search; $_t_SearchAt; vProdCode; VSELPREV; vStatus; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev Sel")
//StockLev Sel
//called by StockLev_Mod, StockLev_List, StockLev_Cons
If (Not:C34(<>STK_bo_TypesInited))
	Order_Buttons
	<>STK_bo_TypesInited:=True:C214
End if 
//DEFAULT TABLE([STOCK_LEVELS])
vPu:=1
vProdCode:=""
vStatus:=""
vType:=""
If (vSelPrev="•FSC")
	StockLev_SelP
Else 
	If (STK_at_AllStockTypes>0)
		If (<>ProdCode#"")
			$_t_Search:=STK_at_AllStockTypes{STK_at_AllStockTypes}+"/"+<>ProdCode
		Else 
			$_t_Search:=STK_at_AllStockTypes{STK_at_AllStockTypes}+"/"
		End if 
	End if 
	vStatus:=STK_at_AllStockTypes{STK_at_AllStockTypes}
	vProdCode:="@"
	$_t_Search:=Gen_SearchA(Term_StoWT("Stock Type/Product to find:"); vSelPrev; Term_StoWT("Find Stock Levels"); $_t_Search; ""; "")
	If (OK=1)
		If (xNext=0)
			StockLev_Sel2($_t_Search)
		Else 
			vStatus:=""
			StockLev_SelP
		End if 
	Else 
		vPu:=0
	End if 
End if 
If (vProdCode="")
	vProdCode:="@"
End if 
If (vStatus="")
	If (vType="")
		vStatus:="•ALL"
	Else 
		vStatus:=vType
	End if 
End if 
StockType_ArrUp
ERR_MethodTrackerReturn("StockLev Sel"; $_t_oldMethodName)
