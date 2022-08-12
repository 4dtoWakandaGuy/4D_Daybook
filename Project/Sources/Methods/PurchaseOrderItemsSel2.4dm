//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchaseOrderItemsSel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 12:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_PurchaseOrderCodes; 0)
	C_BOOLEAN:C305(<>SelOr)
	C_LONGINT:C283(<>AutoProc; $_l_StringLength)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; vSelPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchaseOrderItemsSel2")
$_t_Search:=$1
vSelPrev:=""
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
		ALL RECORDS:C47([PURCHASE_ORDERS_ITEMS:169])
	Else 
		If ($_t_Search="pOrder: @") | ($_t_Search="Purchase Order No: @")
			If ($_t_Search="pOrder: @")
				$_l_StringLength:=Length:C16("pOrder:")+1
			Else 
				$_l_StringLength:=Length:C16("Purchase Order No:")+1
			End if 
			
			$_t_Search:=Substring:C12($_t_Search; $_l_StringLength; 32000)
			QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=$_t_Search)
		Else 
			If ($_t_Search="Order: @") | ($_t_Search="Sales Order No: @")
				If ($_t_Search="Order: @")
					$_t_Search:=Substring:C12($_t_Search; 8; 32000)
				Else 
					$_l_StringLength:=Length:C16("Sales Order No")+1
					$_t_Search:=Substring:C12($_t_Search; $_l_StringLength; 32000)
				End if 
				READ ONLY:C145([ORDER_ITEMS:25])
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_Search)
				Join_SelFast(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Purchase_Order_Number:18; ->[PURCHASE_ORDERS_ITEMS:169]; ->[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
				UNLOAD RECORD:C212([ORDER_ITEMS:25])
			Else 
				If ($_t_Search="Company: @")
					$_t_Search:=Substring:C12($_t_Search; 10; 32000)
					QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Company_Code:1=$_t_Search)
					SELECTION TO ARRAY:C260([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderCodes)
					QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PurchaseOrderCodes)
				Else 
					$_t_SearchAt:=Sel_AtSign($_t_Search)
					Sel_NoAtAt(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Company_Code:1; $_t_Search; $_t_SearchAt)
					SelOr_1(->[PURCHASE_ORDERS:57])
					If ((Records in selection:C76([PURCHASE_ORDERS:57])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
						Sel_NoAtAt(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_t_Search; $_t_SearchAt)
						SelOr_2(->[PURCHASE_ORDERS:57])
						If ((Records in selection:C76([PURCHASE_ORDERS:57])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
							CompCont_Proj($_t_SearchAt; ->[PURCHASE_ORDERS:57]Company_Code:1; ->[PURCHASE_ORDERS:57]Contact_Code:5)
							SelOr_3(->[PURCHASE_ORDERS:57])
						End if 
					End if 
					If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
						SELECTION TO ARRAY:C260([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderCodes)
						QUERY WITH ARRAY:C644([PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18; $_at_PurchaseOrderCodes)
					Else 
						REDUCE SELECTION:C351([PURCHASE_ORDERS_ITEMS:169]; 0)
						
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PurchaseOrderItemsSel2"; $_t_oldMethodName)
