//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 21:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_BOOLEAN:C305(<>STK_bo_TypesInited; $2; SRCH_bo_AutoSearch)
	C_LONGINT:C283($_l_StockTypeRow; vPu; xNext)
	C_TEXT:C284(<>ProdCode; $_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; vProdCode; VSELPREV; vStatus; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_Sel")
//StockCurr_Sel
If (Not:C34(<>STK_bo_TypesInited))
	Order_Buttons
	<>STK_bo_TypesInited:=True:C214
End if 

//DEFAULT TABLE([CURRENT STOCK])
vPu:=1
vProdCode:=""
vStatus:=""
vType:=""
If (vSelPrev="•FSC")
	StockCurr_SelP
Else 
	If (Size of array:C274(STK_at_AllStockTypes)>0)
		$_l_StockTypeRow:=STK_at_AllStockTypes
	Else 
		$_l_StockTypeRow:=0
	End if 
	If (<>ProdCode#"") & ($_l_StockTypeRow>0)
		$_t_Search:=STK_at_AllStockTypes{STK_at_AllStockTypes}+"/"+<>ProdCode
	Else 
		If (Size of array:C274(STK_at_AllStockTypes)>0)
			$_t_Search:=STK_at_AllStockTypes{1}+"/"
			vStatus:=STK_at_AllStockTypes{STK_at_AllStockTypes}
		Else 
			$_t_Search:=""
			vStatus:=""
		End if 
	End if 
	If (Count parameters:C259>=1)
		If ($1#"")
			$_t_Search:=STK_at_AllStockTypes{STK_at_AllStockTypes}+"/"+$1
			//$_t_Search:="Company: "+$1
		End if 
	End if 
	If (Count parameters:C259>=2)
		SRCH_bo_AutoSearch:=$2
	Else 
		SRCH_bo_AutoSearch:=False:C215
	End if 
	
	vProdCode:="@"
	$_t_Search:=Gen_SearchA("Type/Product, Serial or Location to find:"; vSelPrev; Term_StoWT("Find Current Stock"); $_t_Search; ""; "")
	If (OK=1)
		If (xNext=0)
			StockCurrent_Sel2($_t_Search)
		Else 
			vStatus:=""
			StockCurr_SelP
		End if 
	Else 
		vPu:=0
	End if 
	StockType_ArrUp
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
ERR_MethodTrackerReturn("StockCurr_Sel"; $_t_oldMethodName)
