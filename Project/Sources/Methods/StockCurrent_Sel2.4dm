//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurrent_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/06/2010 06:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_LONGINT:C283(<>AutoProc; $_l_CharacterPosition)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; vProdCode; vSelPrev; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurrent_Sel2")
$_t_Search:=$1
vSelPrev:=$_t_Search
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search="") | ($_t_Search="•ALL"))
		//ALL RECORDS([CURRENT STOCK])
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4#0)
		
		vStatus:="•ALL"
	Else 
		$_t_SearchAt:=Sel_AtSign($_t_Search)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_SearchAt)
		vProdCode:=$_t_SearchAt
		vStatus:="•ALL"
		If (Records in selection:C76([CURRENT_STOCK:62])=0)
			$_l_CharacterPosition:=Position:C15("/"; $_t_Search)
			If ($_l_CharacterPosition>0)
				vStatus:=Uppercase:C13(Substring:C12($_t_Search; 1; $_l_CharacterPosition-1))
				vProdCode:=Substring:C12($_t_SearchAt; $_l_CharacterPosition+1; 32000)
				StockCurr_Sel2
			Else 
				Sel_NoAtAt(->[CURRENT_STOCK:62]; ->[CURRENT_STOCK:62]Stock_Type:3; $_t_Search; $_t_SearchAt)
				vStatus:=Uppercase:C13($_t_Search)
				vProdCode:="@"
			End if 
			If (Records in selection:C76([CURRENT_STOCK:62])=0)
				vStatus:="•ALL"
				vProdCode:="@"
				Sel_NoAtAt(->[CURRENT_STOCK:62]; ->[CURRENT_STOCK:62]Serial_Number:2; $_t_Search; $_t_SearchAt)
				If (Records in selection:C76([CURRENT_STOCK:62])=0)
					Sel_NoAtAt(->[CURRENT_STOCK:62]; ->[CURRENT_STOCK:62]Location:8; $_t_Search; $_t_SearchAt)
					
					If (Records in selection:C76([CURRENT_STOCK:62])=0)
						$_l_CharacterPosition:=Position:C15("/"; $_t_Search)
						If ($_l_CharacterPosition>0)
							vStatus:=Uppercase:C13(Substring:C12($_t_Search; 1; $_l_CharacterPosition-1))
							vProdCode:=Substring:C12($_t_SearchAt; $_l_CharacterPosition+1; 32000)
						Else 
							vProdCode:=$_t_SearchAt
							vStatus:="•ALL"
						End if 
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Short_Code:19=vProdCode)
						If (Records in selection:C76([PRODUCTS:9])=0)
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Model_Code:5=vProdCode)
							If (Records in selection:C76([PRODUCTS:9])=0)
								QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2=vProdCode)
								If (Records in selection:C76([PRODUCTS:9])=0)
									QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4=vProdCode)
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
							Project_SelFast(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; ->[CURRENT_STOCK:62]; ->[CURRENT_STOCK:62]Product_Code:1)
							If (vStatus#"•All")
								QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=vStatus)
							End if 
						End if 
					End if 
					
				End if 
			End if 
		End if 
		QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4#0)
		
	End if 
End if 
ERR_MethodTrackerReturn("StockCurrent_Sel2"; $_t_oldMethodName)
