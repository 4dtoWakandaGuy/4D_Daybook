//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_FormSR3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRDisc;0)
	//ARRAY REAL(SREuroAmt;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY REAL(SRRetail;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRPricePerT;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	//ARRAY TEXT(SRShortCode;0)
	C_BOOLEAN:C305($_bo_Next; $2)
	C_LONGINT:C283($_l_Level; $_l_OrderItemNumber; $_l_SizeofArray; $1)
	C_REAL:C285(v0; v31; vAmount; vPrice; vRate)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; vComments; vDesc; vInvNoT; vProdCode; vQtyT; vSerialNo; VshortCode; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_FormSR3")
//Orders_FormSR3

vT:=""
$_l_Level:=$1

While (Not:C34((End selection:C36([ORDER_ITEMS:25]))) | (vT#"") | (vComments#""))
	OrderI_FormLP
	Form_SRArrIns(1)
	$_l_SizeofArray:=Size of array:C274(SRProdCode)
	If (vProdCode="")
		SRDesc{$_l_SizeofArray}:=("  "*$_l_Level)+("  "*Num:C11($_l_Level>0))+vDesc
	Else 
		SRProdCode{$_l_SizeofArray}:=vProdCode
		SRShortCode{$_l_SizeofArray}:=VshortCode
		SRDesc{$_l_SizeofArray}:=("  "*$_l_Level)+("- "*Num:C11($_l_Level>0))+vDesc
	End if 
	SRSerial{$_l_SizeofArray}:=vSerialNo
	SRQtyT{$_l_SizeofArray}:=vQtyT
	SRPricePerT{$_l_SizeofArray}:=vInvNoT
	If ($_l_Level=0)
		SRPrice{$_l_SizeofArray}:=vPrice
		SRRate{$_l_SizeofArray}:=vRate
		SRAmount{$_l_SizeofArray}:=vAmount
		SREuroAmt{$_l_SizeofArray}:=WS_EuroConvertor(vAmount; [ORDERS:24]Currency_Code:32)
		SRRetail{$_l_SizeofArray}:=v0
		SRDisc{$_l_SizeofArray}:=v31
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_Assemblies)>0) & (vT="") & (vComments="") & ($_l_Level<10) & ($2))
		PREVIOUS RECORD:C110([ORDER_ITEMS:25])
		$_bo_Next:=True:C214
		
		If (([ORDER_ITEMS:25]Product_Code:2#"") & ([ORDER_ITEMS:25]Purchase_Order_Number:18="BUNDLE"))
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
			If ([PRODUCTS:9]Bundle_Assembly:36)
				If ([PRODUCTS:9]Bundle_Show:37#0)
					$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
					$_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
					CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "FormSR"+String:C10($_l_Level))
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Level_Up_Item_Number:48=$_l_OrderItemNumber)
					If (Records in selection:C76([ORDER_ITEMS:25])#0)
						If (([PRODUCTS:9]Bundle_Show:37=2) & ($_l_Level=0))  //Note only the level 0 items will go to base - so it makes sense
							CREATE SET:C116([ORDER_ITEMS:25]; "Extra")  //to turn on the under option from Level 1 onwards
							UNION:C120("Extra"; "Base"; "Base")
							USE NAMED SELECTION:C332("FormSR"+String:C10($_l_Level))
						Else 
							ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
							$_l_Level:=$_l_Level+1
							$_bo_Next:=False:C215
						End if 
					Else 
						USE NAMED SELECTION:C332("FormSR"+String:C10($_l_Level))
					End if 
					
				End if 
			End if 
		End if 
		
		If ($_bo_Next)
			NEXT RECORD:C51([ORDER_ITEMS:25])
		End if 
		
		If ((End selection:C36([ORDER_ITEMS:25])) & ($_l_Level>$1))
			$_l_Level:=$_l_Level-1
			USE NAMED SELECTION:C332("FormSR"+String:C10($_l_Level))
			NEXT RECORD:C51([ORDER_ITEMS:25])
		End if 
		
	End if 
	
End while 
ERR_MethodTrackerReturn("Orders_FormSR3"; $_t_oldMethodName)
