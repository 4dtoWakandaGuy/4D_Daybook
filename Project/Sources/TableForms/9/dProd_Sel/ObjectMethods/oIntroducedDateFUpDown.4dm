If (False:C215)
	//object Name: [PRODUCTS]dProd_Sel.oIntroducedDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VIntdateToSet)
	C_DATE:C307(VIntdateF; VIntdateFBASE; VIntdateT)
	C_LONGINT:C283($_l_CompaniesCount; $_l_event; $_l_offset; VIntdateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dProd_Sel.oIntroducedDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VIntdateF=!00-00-00!)
			VIntdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CompaniesCount)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Available_From_Date:21<VIntdateF; *)
				QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Available_From_Date:21#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_CompaniesCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VIntdateF:=VIntdateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VIntdateF:=VIntdateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (VIntdateF<!1995-01-01!)
		End if 
		If (VIntdateFBASE=!00-00-00!)
			VIntdateFBASE:=VIntdateF
		End if 
		VIntdateF:=VIntdateFBASE+VIntdateFupDown
		If (VIntdateF>!00-00-00!)
			If (SRCH_bo_VIntdateToSet=False:C215)
				//VIntdateT:=VIntdateF
			End if 
			If (VIntdateF>VIntdateT) & (VIntdateT>!00-00-00!)
				VIntdateT:=VIntdateF
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oVIntdateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dProd_Sel.oIntroducedDateFUpDown"; $_t_oldMethodName)
