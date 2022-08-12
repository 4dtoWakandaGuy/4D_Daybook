//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_SubscriptionRenewals
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/03/2011 18:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordsinSelection; cList; DB_l_CurrentDisplayedForm; rOrd; vNo; vP)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_SubscriptionRenewals")
CREATE SET:C116([ORDER_ITEMS:25]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([ORDER_ITEMS:25])>0)
	Subscript_OrdRe
	If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
		
		If (OK=1)
			vNo:=Records in selection:C76([ORDER_ITEMS:25])
			Subscript_OrdRe
			$_l_RecordsinSelection:=Records in selection:C76([ORDERS:24])
			Gen_Confirm("Do you want to mail each Subscription individually ("+String:C10(vNo)+" Item"+("s"*(Num:C11(vNo#1)))+"), or once to each different Ordering Company ("+String:C10($_l_RecordsinSelection)+" Item"+("s"*(Num:C11($_l_RecordsinSelection#1)))+") ?"; "Subscription"; "Company")
			If (OK=1)
				
				rOrd:=1
				MAsk_Print(->[ORDER_ITEMS:25])
				
				If (vP=1)
					MAsk_MS(->[ORDER_ITEMS:25])
					If (OK=1)
						If (cList=1)
							FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Items_List")
							MList_Print(->[ORDER_ITEMS:25])
						End if 
						MailP_Let(->[ORDER_ITEMS:25])
						MailP_Lab(->[ORDER_ITEMS:25])
						MailP_Env(->[ORDER_ITEMS:25])
						MailP_Exp(->[ORDER_ITEMS:25])
						Mail_SubsUp(->[ORDER_ITEMS:25])
					End if 
				End if 
				
			Else 
				
				
				CREATE SET:C116([ORDERS:24]; "OMaster")
				
				rOrd:=3
				MAsk_Print(->[ORDERS:24])
				If (vP=1)
					MAsk_MS(->[ORDERS:24])
					If (OK=1)
						If (cList=1)
							FORM SET OUTPUT:C54([ORDERS:24]; "Orders_List")
							MList_Print(->[ORDERS:24])
						End if 
						MailP_Let(->[ORDERS:24])
						MailP_Lab(->[ORDERS:24])
						MailP_Env(->[ORDERS:24])
						MailP_Exp(->[ORDERS:24])
						Mail_SubsUp(->[ORDERS:24])
					End if 
				End if 
				
			End if 
			
		End if 
		Close_ProWin
	End if 
Else 
	Gen_Alert("You found Order Items, but did not find any Subscription Details"; "Cancel")
End if 

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
SEL_UpdateRecordCache(DB_l_CurrentDisplayedForm)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_SubscriptionRenewals"; $_t_oldMethodName)
