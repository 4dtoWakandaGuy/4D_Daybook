//%attributes = {}
If (False:C215)
	//Project Method Name:      StockLev_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/01/2012 00:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_LONGINT:C283(<>AutoProc; $_l_FSPosition)
	C_TEXT:C284($_t_oldMethodName; $_T_SearchValue; $_T_SearchValueWithWildCard; $1; vProdCode; vSelPrev; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev_Sel2")
$_T_SearchValue:=$1
vSelPrev:=$_T_SearchValue
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_T_SearchValue:="◊IA"
Else 
	If (((Length:C16($_T_SearchValue)=1) & (Character code:C91($_T_SearchValue)=64)) | ($_T_SearchValue="") | ($_T_SearchValue="•ALL"))
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Free_Level:3#0; *)
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Allocated_Level:4#0)
		
		vStatus:="•ALL"
	Else 
		$_T_SearchValueWithWildCard:=Sel_AtSign($_T_SearchValue)
		QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_T_SearchValueWithWildCard)
		vProdCode:=$_T_SearchValueWithWildCard
		vStatus:="•ALL"
		If (Records in selection:C76([STOCK_LEVELS:58])=0)
			$_l_FSPosition:=Position:C15("/"; $_T_SearchValue)
			If ($_l_FSPosition>0)
				vStatus:=Uppercase:C13(Substring:C12($_T_SearchValue; 1; $_l_FSPosition-1))
				vProdCode:=Substring:C12($_T_SearchValueWithWildCard; $_l_FSPosition+1; 32000)
				StockLev_Sel2
			Else 
				Sel_NoAtAt(->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]Stock_Type:2; $_T_SearchValue; $_T_SearchValueWithWildCard)
				vStatus:=Uppercase:C13($_T_SearchValue)
				vProdCode:="@"
			End if 
			
			If (Records in selection:C76([STOCK_LEVELS:58])=0)
				$_l_FSPosition:=Position:C15("/"; $_T_SearchValue)
				If ($_l_FSPosition>0)
					vStatus:=Uppercase:C13(Substring:C12($_T_SearchValue; 1; $_l_FSPosition-1))
					vProdCode:=Substring:C12($_T_SearchValueWithWildCard; $_l_FSPosition+1; 32000)
				Else 
					vProdCode:=$_T_SearchValueWithWildCard
					vStatus:="•ALL"
				End if 
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Short_Code:19=vProdCode)
				If (Records in selection:C76([PRODUCTS:9])=0)
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Model_Code:5=vProdCode)
					If (Records in selection:C76([PRODUCTS:9])=0)
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2=vProdCode)
						If (Records in selection:C76([PRODUCTS:9])=0)
							QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4=vprodCode)
							SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
							
						End if 
					End if 
				End if 
				vProdCode:="@"
				If (Records in selection:C76([PRODUCTS:9])>0)
					If (Records in selection:C76([PRODUCTS:9])=1)
						vProdCode:=[PRODUCTS:9]Product_Code:1
					End if 
					Project_SelFast(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; ->[STOCK_LEVELS:58]; ->[STOCK_LEVELS:58]Product_Code:1)
					If (vStatus#"•All")
						QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2=vStatus)
					End if 
				End if 
			End if 
			
		End if 
	End if 
	QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Free_Level:3#0; *)
	QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Allocated_Level:4#0)
End if 
ERR_MethodTrackerReturn("StockLev_Sel2"; $_t_oldMethodName)