If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oVfDateFUpDown
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
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VfdateToSet)
	C_DATE:C307(VfdateF; VfdateFBASE; VfdateT)
	C_LONGINT:C283($_l_CompaniesCount; $_l_event; $_l_offset; VfdateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oVfDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VfdateF=!00-00-00!)
			VfdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
				QUERY:C277([ORDERS:24]; [ORDERS:24]Forecast_Date:23<VfdateF; *)
				QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Forecast_Date:23#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_CompaniesCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VfdateF:=VfdateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VfdateF:=VfdateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (VfdateF<!1995-01-01!)
		End if 
		If (VfdateFBASE=!00-00-00!)
			VfdateFBASE:=VfdateF
		End if 
		VfdateF:=VfdateFBASE+VfdateFupDown
		If (VfdateF>!00-00-00!)
			If (SRCH_bo_VfdateToSet=False:C215)
				//VfdateT:=VfdateF
			End if 
			If (VfdateF>VfdateT) & (VfdateT>!00-00-00!)
				VfdateT:=VfdateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oVfdateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oVfDateFUpDown"; $_t_oldMethodName)
