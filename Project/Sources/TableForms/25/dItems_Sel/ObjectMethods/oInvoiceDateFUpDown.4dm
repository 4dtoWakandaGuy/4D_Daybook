If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oInvoiceDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped)
	C_BOOLEAN:C305(SRCH_bo_vIDateToSet)
	C_DATE:C307(vIDateF; SRCH_d_FromBase; vIDateT)
	C_LONGINT:C283($_l_event; $_l_InvoicesCount; $_l_offset; vIDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS]dItems_Sel.oInvoiceDateFUpDown"; Form event code:C388)


$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vIDateF=!00-00-00!)
			vIDateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_InvoicesCount)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Date:25<vIDateF; *)
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Invoice_Date:25#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_InvoicesCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					vIDateF:=vIDateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					vIDateF:=vIDateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (vIDateF<!1995-01-01!)
			
		End if 
		If (SRCH_d_FromBase=!00-00-00!)
			SRCH_d_FromBase:=vIDateF
		End if 
		vIDateF:=SRCH_d_FromBase+vIDateFupDown
		If (vIDateF>!00-00-00!)
			If (SRCH_bo_vIDateToSet=False:C215)
				//vIDateT:=vIDateF
			End if 
			If (vIDateF>vIDateT) & (vIDateT>!00-00-00!)
				vIDateT:=vIDateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)
