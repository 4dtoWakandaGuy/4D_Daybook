If (False:C215)
	//object Name: [PURCHASE_ORDERS]dPurchOrd_Sel.oSupplybyDateFUpDown
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
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_vPDateToSet)
	C_DATE:C307(vPDateF; vPDateFBASE; vPDateT)
	C_LONGINT:C283($_l_event; $_l_offset; $_l_PurchaseOrdersCount; vPDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oSupplybyDateFUpDown"; Form event code:C388)



$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vPDateF=!00-00-00!)
			vPDateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_PurchaseOrdersCount)
				QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Supply_by_Date:10<vPDateF; *)
				QUERY:C277([PURCHASE_ORDERS:57];  & ; [PURCHASE_ORDERS:57]Supply_by_Date:10#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_PurchaseOrdersCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					vPDateF:=vPDateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					vPDateF:=vPDateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (vPDateF<!1995-01-01!)
		End if 
		If (vPDateFBASE=!00-00-00!)
			vPDateFBASE:=vPDateF
		End if 
		vPDateF:=vPDateFBASE+vPDateFupDown
		If (vPDateF>!00-00-00!)
			If (SRCH_bo_vPDateToSet=False:C215)
				//vPDateT:=vPDateF
			End if 
			If (vPDateF>vPDateT) & (vPDateT>!00-00-00!)
				vPDateT:=vPDateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oSupplybyDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)
