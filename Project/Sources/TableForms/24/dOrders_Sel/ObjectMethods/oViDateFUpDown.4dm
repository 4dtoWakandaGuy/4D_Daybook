If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oViDateFUpDown
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
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VidateToSet)
	C_DATE:C307(SRCH_d_FromBase; VidateF; VidateT)
	C_LONGINT:C283($_l_CompaniesCount; $_l_event; $_l_offset; VidateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oViDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VidateF=!00-00-00!)
			VidateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Date:4<VidateF; *)
				QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Order_Date:4#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_CompaniesCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VidateF:=VidateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VidateF:=VidateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (VidateF<!1995-01-01!)
		End if 
		If (SRCH_d_FromBase=!00-00-00!)
			SRCH_d_FromBase:=VidateF
		End if 
		VidateF:=SRCH_d_FromBase+VidateFupDown
		If (VidateF>!00-00-00!)
			If (SRCH_bo_VidateToSet=False:C215)
				//VidateT:=VidateF
			End if 
			If (VidateF>VidateT) & (VidateT>!00-00-00!)
				VidateT:=VidateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oVidateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oViDateFUpDown"; $_t_oldMethodName)
