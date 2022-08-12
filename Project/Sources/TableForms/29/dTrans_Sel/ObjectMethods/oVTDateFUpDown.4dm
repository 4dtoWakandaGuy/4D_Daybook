If (False:C215)
	//object Name: [TRANSACTIONS]dTrans_Sel.oVTDateFUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/07/2012 04:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CountBackStopped; SRCH_bo_VTdateToSet)
	C_DATE:C307(SRCH_d_TransToDate; VTdateF; VTdateFBASE)
	C_LONGINT:C283($_l_event; $_l_offset; $_l_TransactionsInCount; VTdateFupDown)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].dTrans_Sel.oVTDateFUpDown"; Form event code:C388)



$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VTdateF=!00-00-00!)
			VTdateF:=Current date:C33-365
			$_l_offset:=365
			$_bo_CountBackStopped:=False:C215
			Repeat 
				SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_TransactionsInCount)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5<VTdateF; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Trans_Date:5#!00-00-00!)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				If ($_l_TransactionsInCount=0)
					If ($_l_offset>1)
						$_l_offset:=Int:C8($_l_offset/2)
					End if 
					VTdateF:=VTdateF+$_l_offset
					$_bo_CountBackStopped:=True:C214
				Else 
					VTdateF:=VTdateF-$_l_offset
					If (Not:C34($_bo_CountBackStopped))
						If ($_l_offset<(16*365))
							$_l_offset:=$_l_offset*2
						End if 
					End if 
				End if 
			Until ($_l_offset<=1) | (VTdateF<!1995-01-01!)
			
			
		End if 
		If (VTdateFBASE=!00-00-00!)
			VTdateFBASE:=VTdateF
		End if 
		VTdateF:=VTdateFBASE+VTdateFupDown
		If (VTdateF>!00-00-00!)
			If (SRCH_bo_VTdateToSet=False:C215)
				//SRCH_d_TransToDate:=VTdateF
			End if 
			If (VTdateF>SRCH_d_TransToDate) & (SRCH_d_TransToDate>!00-00-00!)
				SRCH_d_TransToDate:=VTdateF
			End if 
			OBJECT SET VISIBLE:C603(*; "oVTdateT@"; True:C214)
		End if 
End case 
ERR_MethodTrackerReturn("[COMPANIES].dComp_Sel.Ruler"; $_t_oldMethodName)
