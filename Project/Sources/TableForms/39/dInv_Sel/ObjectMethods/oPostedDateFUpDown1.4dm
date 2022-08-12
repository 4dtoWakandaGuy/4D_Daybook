If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oPostedDateFUpDown1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 11:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VRdateToSet)
	C_DATE:C307(VRdateF; VRdateFBASE; VRdateT)
	C_LONGINT:C283($_l_event; $_l_InvoicesCount; $_l_offset; VeDateFupDown; VRdateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oPostedDateFUpDown1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VRdateF=!00-00-00!)
			VRdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_InvoicesCount)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Posted_Date:8<VRdateF; *)
				QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Date:4#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_InvoicesCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VRdateF:=VRdateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VRdateF:=VRdateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (VRdateF<!1995-01-01!)
			
		End if 
		If (VRdateFBASE=!00-00-00!)
			VRdateFBASE:=VRdateF
		End if 
		VRdateF:=VRdateFBASE+VRdateFupDown
		If (VRdateF>!00-00-00!)
			If (SRCH_bo_VRdateToSet=False:C215)
				//VRdateT:=VRdateF
			End if 
			If (VRdateF>VRdateT) & (VRdateT>!00-00-00!)
				VRdateT:=VRdateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oPostedDateFUpDown1"; $_t_oldMethodName)
