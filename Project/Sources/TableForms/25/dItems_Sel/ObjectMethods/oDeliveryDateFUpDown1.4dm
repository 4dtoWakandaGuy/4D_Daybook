If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oDeliveryDateFUpDown1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 15:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped)
	C_BOOLEAN:C305(SRCH_bo_vDNDateToSet)
	C_DATE:C307(vDNDateF; vDNDateFBASE; vDNDateT)
	C_LONGINT:C283($_l_event; $_l_InvoicesCount; $_l_offset; vDNDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS]dItems_Sel.oDeliveryDateFUpDown1"; Form event code:C388)


$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vDNDateF=!00-00-00!)
			vDNDateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_InvoicesCount)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11<vDNDateF; *)
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Delivery_Date:11#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_InvoicesCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					vDNDateF:=vDNDateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					vDNDateF:=vDNDateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (vDNDateF<!1995-01-01!)
			
		End if 
		If (vDNDateFBASE=!00-00-00!)
			vDNDateFBASE:=vDNDateF
		End if 
		vDNDateF:=vDNDateFBASE+vDNDateFupDown
		If (vDNDateF>!00-00-00!)
			If (SRCH_bo_vDNDateToSet=False:C215)
				//vDNDateT:=vDNDateF
			End if 
			If (vDNDateF>vDNDateT) & (vDNDateT>!00-00-00!)
				vDNDateT:=vDNDateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)
