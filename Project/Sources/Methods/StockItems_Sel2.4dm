//%attributes = {}
If (False:C215)
	//Project Method Name:      StockItems_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/06/2010 21:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_LONGINT:C283(<>AutoProc; $_l_PrefixLength)
	C_TEXT:C284($_t_oldMethodName; $_T_SearchValue; $_T_SearchValueWithWildCard; $1; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockItems_Sel2")
$_T_SearchValue:=$1
vSelPrev:=$_T_SearchValue
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_T_SearchValue:="◊IA"
Else 
	
	If (((Length:C16($_T_SearchValue)=1) & (Character code:C91($_T_SearchValue)=64)) | ($_T_SearchValue=""))
		ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
	Else 
		If ($_T_SearchValue="Movement: @")
			$_l_PrefixLength:=Length:C16("Movement: ")+1
			$_T_SearchValue:=Substring:C12($_T_SearchValue; $_l_PrefixLength)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$_T_SearchValue)
		Else 
			$_T_SearchValueWithWildCard:=Sel_AtSign($_T_SearchValue)
			Sel_NoAtAt(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_T_SearchValue; $_T_SearchValueWithWildCard)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
				Sel_NoAtAt(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3; $_T_SearchValue; $_T_SearchValueWithWildCard)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					Sel_NoAtAt(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_T_SearchValue; $_T_SearchValueWithWildCard)
					
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Short_Code:19=$_T_SearchValueWithWildCard)
						If (Records in selection:C76([PRODUCTS:9])=0)
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Model_Code:5=$_T_SearchValueWithWildCard)
							If (Records in selection:C76([PRODUCTS:9])=0)
								QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2=$_T_SearchValueWithWildCard)
								If (Records in selection:C76([PRODUCTS:9])=0)
									QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4=$_T_SearchValueWithWildCard)
									SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
									QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
									
									
								End if 
							End if 
						End if 
						If (Records in selection:C76([PRODUCTS:9])>0)
							Project_SelFast(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
						End if 
					End if 
					
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("StockItems_Sel2"; $_t_oldMethodName)