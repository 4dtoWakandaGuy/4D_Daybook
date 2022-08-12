If (False:C215)
	//object Name: [SUBSCRIPTIONS]dSubs Sel.oviDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/07/2012 13:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_vIDateToSet)
	C_DATE:C307(SUBS_d_iDateFrom; SUBS_d_iDateFromBase; SUBS_d_iDateTo)
	C_LONGINT:C283($_l_event; $_l_offset; $_l_SubscriptionsCount; SUBS_l_IDateFromupDown; SUBS_l_IDateFupDown)
	C_POINTER:C301($_Ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SUBSCRIPTIONS].dSubs Sel.oviDateFUpDown"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (SUBS_d_iDateFrom=!00-00-00!)
			SUBS_d_iDateFrom:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_SubscriptionsCount)
				//QUERY([PURCHASE_INVOICES];[PURCHASE_INVOICES]Invoice_Date<SUBS_d_iDateFrom;*)
				//QUERY([PURCHASE_INVOICES]; & ;[PURCHASE_INVOICES]Invoice_Date#!00-00-00!)
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3<SUBS_d_iDateFrom; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Subscription_Date:3#!00-00-00!)
				
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_SubscriptionsCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					SUBS_d_iDateFrom:=SUBS_d_iDateFrom+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					SUBS_d_iDateFrom:=SUBS_d_iDateFrom-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (SUBS_d_iDateFrom<!1995-01-01!)
		End if 
		If (SUBS_d_iDateFromBase=!00-00-00!)
			SUBS_d_iDateFromBase:=SUBS_d_iDateFrom
		End if 
		SUBS_d_iDateFrom:=SUBS_d_iDateFromBase+SUBS_l_IDateFromupDown
		If (SUBS_d_iDateFrom>!00-00-00!)
			If (SRCH_bo_vIDateToSet=False:C215)
				//SUBS_d_iDateTo:=SUBS_d_iDateFrom
			End if 
			If (SUBS_d_iDateFrom>SUBS_d_iDateTo) & (SUBS_d_iDateTo>!00-00-00!)
				SUBS_d_iDateTo:=SUBS_d_iDateFrom
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SUBSCRIPTIONS].dSubs Sel.oviDateFUpDown"; $_t_oldMethodName)
