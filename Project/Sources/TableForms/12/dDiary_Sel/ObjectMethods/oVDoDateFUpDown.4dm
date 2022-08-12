If (False:C215)
	//object Name: [DIARY]dDiary_Sel.oVDoDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VDodateToSet)
	C_DATE:C307(SRCH_d_DodateFBase; VDodateF; VDodateT)
	C_LONGINT:C283($_l_DiaryCount; $_l_event; $_l_offset; VDodateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY]dDiary_Sel.oVDoDateFUpDown"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VDodateF=!00-00-00!)
			
			VDodateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
				QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4<VDodateF; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_DiaryCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VDodateF:=VDodateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VDodateF:=VDodateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (VDodateF<!1995-01-01!)
			
		End if 
		If (SRCH_d_DodateFBase=!00-00-00!)
			SRCH_d_DodateFBase:=VDodateF
		End if 
		VDodateF:=SRCH_d_DodateFBase+VDodateFupDown
		If (VDodateF>!00-00-00!)
			If (SRCH_bo_VDodateToSet=False:C215)
				//VDodateT:=VDodateF
			End if 
			If (VDodateF>VDodateT) & (VDodateT>!00-00-00!)
				
				VDodateT:=VDodateF
			End if 
			OBJECT SET VISIBLE:C603(*; "oVDodateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)
