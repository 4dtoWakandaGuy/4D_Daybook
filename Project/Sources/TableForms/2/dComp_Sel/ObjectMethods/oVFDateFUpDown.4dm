If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oVFDateFUpDown
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
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VfDateToSet)
	C_DATE:C307(VfdateF; VfdateFBASE; VfDateT)
	C_LONGINT:C283($_l_DiaryCount; $_l_event; $_l_offset; VfDateFupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oVFDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VfdateF=!00-00-00!)
			VfdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_DiaryCount)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Financial_Year:27<VfdateF; *)
				QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Financial_Year:27#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_DiaryCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VfdateF:=VfdateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VfdateF:=VfDateF-$_l_offset
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
		VfDateF:=VfdateFBASE+VfDateFupDown
		If (VfDateF>!00-00-00!)
			If (SRCH_bo_VfDateToSet=False:C215)
				//VfDateT:=VfDateF
			End if 
			If (VfDateF>VfDateT) & (vFDateT>!00-00-00!)
				
				VfDateT:=VfDateF
			End if 
			OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oVFDateFUpDown"; $_t_oldMethodName)
