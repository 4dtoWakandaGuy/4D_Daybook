If (False:C215)
	//object Name: [DIARY]dDiary_Sel.oVDnDateFUpDown
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
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VDndateToSet)
	C_DATE:C307(VDndateF; VDndateFBASE; VDndateT)
	C_LONGINT:C283($_l_DiaryCount; $_l_event; $_l_offset; VDndateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY]dDiary_Sel.oVDnDateFUpDown"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VDndateF=!00-00-00!)
			VDndateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
				QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5<VDndateF; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_DiaryCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VDndateF:=VDndateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VDndateF:=VDndateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (VDndateF<!1995-01-01!)
			
			
		End if 
		If (VDndateFBASE=!00-00-00!)
			VDndateFBASE:=VDndateF
		End if 
		VDndateF:=VDndateFBASE+VDndateFupDown
		If (VDndateF>!00-00-00!)
			If (SRCH_bo_VDndateToSet=False:C215)
				//VDndateT:=VDndateF
			End if 
			If (VDndateF>VDndateT) & (VDndateT>!00-00-00!)
				VDndateT:=VDndateF
			End if 
			OBJECT SET VISIBLE:C603(*; "oVDndateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)
