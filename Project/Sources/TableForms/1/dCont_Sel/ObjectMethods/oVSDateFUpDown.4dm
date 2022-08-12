If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oVSDateFUpDown
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
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VsDateToSet)
	C_DATE:C307(SRCH_d_EntryDateFrom; VSdateF; VSdateFBASE; VsDateT)
	C_LONGINT:C283($_l_ContactsCount; $_l_event; $_l_offset; VeDateFupDown; VSDateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oVSDateFUpDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VSdateF=!00-00-00!)
			//VSdateF:=Current date-365
			VSdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_ContactsCount)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Modified_Date:28<VSdateF; *)
				QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Entry_Date:16#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_ContactsCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VSdateF:=VSdateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VSdateF:=VSDateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (VSdateF<!1995-01-01!)
		End if 
		If (VSdateFBASE=!00-00-00!)
			VSdateFBASE:=SRCH_d_EntryDateFrom
		End if 
		VSDateF:=VSdateFBASE+VSDateFupDown
		If (VSDateF>!00-00-00!)
			If (SRCH_bo_VsDateToSet=False:C215)
				//VsDateT:=VsDateF
			End if 
			If (VsDateF>VsDateT) & (VsDateT>!00-00-00!)
				VsDateT:=VsDateF
			End if 
			OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oVSDateFUpDown"; $_t_oldMethodName)
