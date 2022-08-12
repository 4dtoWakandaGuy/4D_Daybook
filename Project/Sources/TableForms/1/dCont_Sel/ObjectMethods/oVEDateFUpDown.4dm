If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oVEDateFUpDown
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
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VeDateToSet)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; VedateFBASE)
	C_LONGINT:C283($_l_CatalogueRow; $_l_event; $_l_offset; VeDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oVEDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (SRCH_d_EntryDateFrom=!00-00-00!)
			SRCH_d_EntryDateFrom:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_CatalogueRow)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Entry_Date:17<SRCH_d_EntryDateFrom; *)
				QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Entry_Date:17#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_CatalogueRow=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					SRCH_d_EntryDateFrom:=SRCH_d_EntryDateFrom+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					SRCH_d_EntryDateFrom:=SRCH_d_EntryDateFrom-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (SRCH_d_EntryDateFrom<!1995-01-01!)
		End if 
		If (VedateFBASE=!00-00-00!)
			VedateFBASE:=SRCH_d_EntryDateFrom
		End if 
		SRCH_d_EntryDateFrom:=VedateFBASE+VeDateFupDown
		If (SRCH_d_EntryDateFrom>!00-00-00!)
			If (SRCH_bo_VeDateToSet=False:C215)
				//SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
			End if 
			If (SRCH_d_EntryDateFrom>SRCH_d_EntryDateTo) & (SRCH_d_EntryDateTo>!00-00-00!)
				SRCH_d_EntryDateTo:=SRCH_d_EntryDateFrom
			End if 
			OBJECT SET VISIBLE:C603(*; "oVEDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oVEDateFUpDown"; $_t_oldMethodName)
