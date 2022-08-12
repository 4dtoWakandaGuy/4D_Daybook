//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_SubscriptionDelivery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/03/2011 18:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vOrdI)
	ARRAY LONGINT:C221($_al_OrderItemNumbers; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_SizeofArray; DB_l_CurrentDisplayedForm; vOrdI; $_l_Index; $_l_SizeofArray; DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage; $_t_FormName; $_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_SubscriptionDelivery")
CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([ORDER_ITEMS:25])>0)
	Subscript_OrdRe
	If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
		Gen_Confirm("Do you want to print Delivery Notes, or to use a different SuperReport form?"; "Del Notes"; "SuperReport")
		If (OK=1)
			Gen_PPMulti(->[ORDERS:24]; "Delivery_Note"; "Orders_Out"; "Subs"; "Delivery_Note"; "Orders_PPDelL2"; 0; ->[ORDERS:24]State:15; "Delivery"; [ORDERS:24]Analysis_Code:33)
		Else 
			OK:=1
			$_t_FormName:=""
			While (($_t_FormName="") & (OK=1))
				
				$_t_FormName:=Gen_Request("Which SR Form?")
				If (OK=1)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_FormName)
					If (Records in selection:C76([DOCUMENTS:7])=1)
						DB_t_CurrentFormUsage:="Subs"
						SR_CallPrint("Orders"; $_t_FormName; 2)
					Else 
						Gen_Confirm("Report '"+$_t_FormName+"' was not found"; "Try again"; "Cancel")
						$_t_FormName:=""
					End if 
				End if 
			End while 
		End if 
		If (OK=1)
			Gen_Confirm("Do you now wish to mark any relevant Subscription Details as Done?"; "Yes"; "No")
			If (OK=1)
				MESSAGES OFF:C175
				USE SET:C118("OMaster")
				SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_OrderItemNumbers; [ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)
				$_l_SizeofArray:=Size of array:C274($_al_OrderItemNumbers)
				READ WRITE:C146([SUBSCRIPTIONS:93])
				For ($_l_Index; 1; $_l_SizeofArray)
					USE SET:C118("AMaster")
					QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=$_al_OrderItemNumbers{$_l_Index}; *)
					QUERY SELECTION:C341([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Date_Done:9=!00-00-00!; *)
					QUERY SELECTION:C341([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="ISS")
					If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
						ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; >)
						FIRST RECORD:C50([SUBSCRIPTIONS:93])
						If (Check_LockMess(->[SUBSCRIPTIONS:93]; "Subscription"))
							[SUBSCRIPTIONS:93]Date_Done:9:=<>DB_d_CurrentDate
							DB_SaveRecord(->[SUBSCRIPTIONS:93])
							AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
						End if 
						
						//for perpetual ones
						If (Records in selection:C76([SUBSCRIPTIONS:93])=1)
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_ProductCodes{$_l_Index})
							If ([PRODUCTS:9]Subscription_Perpetual:41)
								DUPLICATE RECORD:C225([SUBSCRIPTIONS:93])
								[SUBSCRIPTIONS:93]x_ID:11:=0
								
								[SUBSCRIPTIONS:93]Date_Done:9:=!00-00-00!
								[SUBSCRIPTIONS:93]Subscription_Date:3:=Subscript_SDate([SUBSCRIPTIONS:93]Subscription_Date:3)
								[SUBSCRIPTIONS:93]After_Number:5:=[SUBSCRIPTIONS:93]After_Number:5+[PRODUCTS:9]Every_Number:28
								DB_SaveRecord(->[SUBSCRIPTIONS:93])
								AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
							End if 
						End if 
						
					End if 
				End for 
				UNLOAD RECORD:C212([SUBSCRIPTIONS:93])
			End if 
			MESSAGES ON:C181
		End if 
	End if 
	Close_ProWin
	
Else 
	Gen_None("Order Items"; ->vOrdI)
End if 
USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_SubscriptionDelivery"; $_t_oldMethodName)
