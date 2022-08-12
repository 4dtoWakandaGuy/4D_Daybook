If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oVsDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 16:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VsDateToSet)
	C_DATE:C307(VsdateF; VsdateFBASE; VsDateT)
	C_LONGINT:C283($_l_CompaniesCount; $_l_event; $_l_offset; VsDateFupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oVsDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VsdateF=!00-00-00!)
			VsdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
				QUERY:C277([ORDERS:24]; [ORDERS:24]Quotation_Date:26<VsdateF; *)
				QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Quotation_Date:26#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_CompaniesCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VsdateF:=VsdateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VsdateF:=VsDateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
						
					End if 
				End if 
			Until ($_l_offset<=1) | (VsdateF<!1995-01-01!)
			
		End if 
		If (VsdateFBASE=!00-00-00!)
			VsdateFBASE:=VsdateF
		End if 
		VsDateF:=VsdateFBASE+VsDateFupDown
		If (VsDateF>!00-00-00!)
			If (SRCH_bo_VsDateToSet=False:C215)
				//VsDateT:=VsDateF
			End if 
			If (VsDateF>VsDateT) & (VsDateT>!00-00-00!)
				VsDateT:=VsDateF
			End if 
			OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oVsDateFUpDown"; $_t_oldMethodName)
