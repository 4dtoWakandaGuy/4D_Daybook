//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPDel4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 12:54
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ItemNumbersNotPosted; 0)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	C_BOOLEAN:C305(<>StockPostAu; <>StockPostIn; <>StockPostOr)
	C_LONGINT:C283($_l_BlankRow; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPDel4")
If ((OK=1) & (DB_GetModuleSettingByNUM(Module_StockControl)>0) & (<>StockPostIn=False:C215) & (<>StockPostOr))
	If (OrdDel_CheckNec)
		If (<>StockPostAu=False:C215)
			Gen_Confirm("Do you want to post the Delivery Note for Order "+[ORDERS:24]Order_Code:3+" as a Stock Movement?"; "Yes"; "No")
		End if 
		If (OK=1)
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "PPDel4")
			SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers)
			ARRAY LONGINT:C221($_al_ItemNumbersNotPosted; Size of array:C274($_al_OrderItemNumbers))
			FIRST RECORD:C50([ORDER_ITEMS:25])
			RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
			CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Temp")
			CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "Temp2")
			For ($_l_Index; 1; Size of array:C274($_al_OrderItemNumbers))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_al_OrderItemNumbers{$_l_Index})
				QUERY SELECTION BY FORMULA:C207([STOCK_MOVEMENT_ITEMS:27]; Orders_StockSel)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					$_al_ItemNumbersNotPosted{$_l_Index}:=$_al_OrderItemNumbers{$_l_Index}
				End if 
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "Temp2")
				UNION:C120("Temp2"; "Temp"; "Temp")
			End for 
			USE SET:C118("Temp")
			CLEAR SET:C117("Temp2")
			CLEAR SET:C117("Temp")
			SORT ARRAY:C229($_al_ItemNumbersNotPosted; <)
			$_l_BlankRow:=Find in array:C230($_al_ItemNumbersNotPosted; 0)
			If ($_l_BlankRow>0)
				ARRAY LONGINT:C221($_al_ItemNumbersNotPosted; $_l_BlankRow-1)
			End if 
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
			QUERY SELECTION BY FORMULA:C207([STOCK_MOVEMENT_ITEMS:27]; Orders_StockSel)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
				OrdDel_StockP(DB_t_CurrentFormUsage2; [ORDERS:24]Company_Code:1; [ORDERS:24]Currency_Code:32; [ORDERS:24]Analysis_Code:33; [ORDERS:24]Layer_Code:47)
			Else 
				If (Size of array:C274($_al_ItemNumbersNotPosted)>0)
					Gen_Confirm("Some of Those items have already been posted to a Stock Movement.  "+"Are you sure you want to post  all of them again?"; "Cancel"; "Continue")
					If (OK=0)
						OK:=1
						OrdDel_StockP(DB_t_CurrentFormUsage2; [ORDERS:24]Company_Code:1; [ORDERS:24]Currency_Code:32; [ORDERS:24]Analysis_Code:33; [ORDERS:24]Layer_Code:47)
					Else 
						CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "TOPOST")
						For ($_l_Index; 1; Size of array:C274($_al_ItemNumbersNotPosted))
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_al_ItemNumbersNotPosted{$_l_Index})
							ADD TO SET:C119([ORDER_ITEMS:25]; "TOPOST")
						End for 
						USE SET:C118("TOPOST")
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "PPDel4")
						Gen_Confirm("Post the unposeted items?"; "Yes"; "Cancel")
						If (OK=1)
							OK:=1
							OrdDel_StockP(DB_t_CurrentFormUsage2; [ORDERS:24]Company_Code:1; [ORDERS:24]Currency_Code:32; [ORDERS:24]Analysis_Code:33; [ORDERS:24]Layer_Code:47)
						End if 
						
						
						
					End if 
				Else 
					Gen_Confirm("Those items have already been posted to a Stock Movement.  "+"Are you sure you want to post them again?"; "Cancel"; "Continue")
					If (OK=0)
						OK:=1
						OrdDel_StockP(DB_t_CurrentFormUsage2; [ORDERS:24]Company_Code:1; [ORDERS:24]Currency_Code:32; [ORDERS:24]Analysis_Code:33; [ORDERS:24]Layer_Code:47)
					End if 
				End if 
				
			End if 
			
			USE NAMED SELECTION:C332("PPDel4")
			CLEAR NAMED SELECTION:C333("PPDel4")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Orders PPDel4"; $_t_oldMethodName)
