If (False:C215)
	//object Name: [PURCHASE_ORDERS]dPurchOrd_Sel.oPostedDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2012 14:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_vRDateToSet)
	C_DATE:C307(vRDateF; vRDateFBASE; vRDateT)
	C_LONGINT:C283($_l_event; $_l_offset; $_l_PurchaseOrdersCount; vRDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oPostedDateFUpDown"; Form event code:C388)



$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vRDateF=!00-00-00!)
			vRDateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PurchaseOrdersCount)
				QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Posted_Date:13<vRDateF; *)
				QUERY:C277([PURCHASE_ORDERS:57];  & ; [PURCHASE_ORDERS:57]Posted_Date:13#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_PurchaseOrdersCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					vRDateF:=vRDateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					vRDateF:=vRDateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (vRDateF<!1995-01-01!)
		End if 
		If (vRDateFBASE=!00-00-00!)
			vRDateFBASE:=vRDateF
		End if 
		vRDateF:=vRDateFBASE+vRDateFupDown
		If (vRDateF>!00-00-00!)
			If (SRCH_bo_vRDateToSet=False:C215)
				//vRDateT:=vRDateF
			End if 
			If (vRDateF>vRDateT) & (vRDateT>!00-00-00!)
				vRDateT:=vRDateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)
