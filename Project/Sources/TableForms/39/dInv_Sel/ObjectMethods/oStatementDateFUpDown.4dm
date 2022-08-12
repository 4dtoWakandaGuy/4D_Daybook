If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oStatementDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 11:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_vSdateToSet)
	C_DATE:C307(vSdateF; vSdateFBASE; vSdateT)
	C_LONGINT:C283($_l_event; $_l_InvoicesCount; $_l_offset; VeDateFupDown; vSdateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oStatementDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vSdateF=!00-00-00!)
			vSdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_InvoicesCount)
				
				QUERY:C277([INVOICES:39]; [INVOICES:39]Statement_Date:34<vSdateF; *)
				QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Date:4#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_InvoicesCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					vSdateF:=vSdateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					vSdateF:=vSdateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (vSdateF<!1995-01-01!)
			
		End if 
		If (vSdateFBASE=!00-00-00!)
			vSdateFBASE:=vSdateF
		End if 
		vSdateF:=vSdateFBASE+vSdateFupDown
		If (vSdateF>!00-00-00!)
			If (SRCH_bo_vSdateToSet=False:C215)
				//vSdateT:=vSdateF
			End if 
			If (vSdateF>vSdateT) & (vSdateT>!00-00-00!)
				vSdateT:=vSdateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oStatementDateFUpDown"; $_t_oldMethodName)
