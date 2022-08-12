//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ImShow2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(i)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(<>RemNewMod)
	C_LONGINT:C283($_l_CharPosition; vNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $2; $3; $4; $5; $6; $7; $8; WIN_t_CurrentOutputform)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Remote_ImShow2")


$_l_CharPosition:=Position:C15($7; GEN_at_Name{i})
If ($_l_CharPosition>0)
	LOAD SET:C185($1->; "Extra"; [PERSONNEL:11]Import_Set_Path:14+":"+$2)
	LOAD SET:C185($1->; "Master"; [PERSONNEL:11]Import_Set_Path:14+":"+$3)
	LOAD SET:C185($1->; "Not"; [PERSONNEL:11]Import_Set_Path:14+":"+$8)
	If ((Records in set:C195("Extra")>0) | (Records in set:C195("Master")>0))
		If (<>RemNewMod)
			If (Records in set:C195("Extra")>0)
				Gen_Confirm("Do you want to View "+String:C10(Records in set:C195("Extra"))+" New "+$4+"?"; "Yes"; "No")
				If (OK=1)
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$5)
					EXECUTE FORMULA:C63($5)
					If ($6="Master")
						USE SET:C118("Master")
						CREATE SET:C116([PURCHASE_INVOICES:37]; "Extra2")
					End if 
					USE SET:C118("Extra")
					CREATE SET:C116([PURCHASE_INVOICES:37]; $6)
					vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
					Open_Pro_Window("View New "+$4; 0; 1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
					FS_SetFormSort(WIN_t_CurrentOutputform)
					WIn_SetFormSize(1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
					MODIFY SELECTION:C204([PURCHASE_INVOICES:37]; *)
					Close_ProWin
					If ($6="Master")
						USE SET:C118("Extra2")
						CREATE SET:C116($1->; "Master")
					End if 
				End if 
			End if 
			If (Records in set:C195("Master")>0)
				Gen_Confirm("Do you want to View "+String:C10(Records in set:C195("Master"))+" Modified "+$4+"?"; "Yes"; "No")
				If (OK=1)
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$5)
					EXECUTE FORMULA:C63($5)
					USE SET:C118("Master")
					If ($6#"Master")
						CREATE SET:C116([PURCHASE_INVOICES:37]; $6)
					End if 
					vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
					Open_Pro_Window("View Modified "+$4)
					Open_Pro_Window("View New "+$4)
					WIn_SetFormSize(1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
					MODIFY SELECTION:C204([PURCHASE_INVOICES:37]; *)
					Close_ProWin
				End if 
			End if 
		Else 
			UNION:C120("Master"; "Extra"; "Master")
			Gen_Confirm("Do you want to View "+String:C10(Records in set:C195("Master"))+" updated "+$4+"?"; "Yes"; "No")
			If (OK=1)
				$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$5)
				EXECUTE FORMULA:C63($5)
				USE SET:C118("Master")
				If ($6#"Master")
					CREATE SET:C116([PURCHASE_INVOICES:37]; $6)
				End if 
				vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
				Open_Pro_Window("View updated"+$4)
				MODIFY SELECTION:C204([PURCHASE_INVOICES:37]; *)
				Close_ProWin
			End if 
		End if 
	End if 
	If (Records in set:C195("Not")>0)
		Gen_Confirm("Do you want to View "+String:C10(Records in set:C195("Not"))+" "+$4+" that could not be updated?"; "Yes"; "No")
		If (OK=1)
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$5)
			EXECUTE FORMULA:C63($5)
			USE SET:C118("Not")
			CREATE SET:C116([PURCHASE_INVOICES:37]; $6)
			vNo:=Records in selection:C76([PURCHASE_INVOICES:37])
			Open_Pro_Window("View "+$4+" not updated")
			Open_Pro_Window("View New "+$4)
			WIn_SetFormSize(1; ->[PURCHASE_INVOICES:37]; WIN_t_CurrentOutputform)
			MODIFY SELECTION:C204([PURCHASE_INVOICES:37]; *)
			Close_ProWin
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Remote_ImShow2"; $_t_oldMethodName)
