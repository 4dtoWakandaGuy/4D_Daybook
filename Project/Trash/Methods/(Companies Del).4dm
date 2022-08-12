//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies Del
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:17
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_OptionKey; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_Index; $_l_WindowReferenceRow; $_l_WindowRow; $No; ch1; ch2; ch3; ch4; ch5; ch6; CO_l_CompanyID)
	C_LONGINT:C283(r1; r2; r3; vNo; vNo1; vNo2; vNo3; vNo4; vNo5; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>CompCode; $_t_AddressLine1; $_t_CompanyCode; $_t_CompanyName; $_t_oldMethodName; $_t_PostCode; $_t_TelephoneNumber; $_t_Town; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(vLayCode; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies Del")
//Companies Del

//Deliberate - Do not remove (deletion blanks problem)
CREATE SET:C116([COMPANIES:2]; "CMaster")
If (DB_t_CurrentFormUsage="Many")
	USE SET:C118("userset")
	vLayCode:=""
Else 
	ONE RECORD SELECT:C189([COMPANIES:2])
	vLayCode:=[COMPANIES:2]Company_Code:1
End if 
If (Records in selection:C76([COMPANIES:2])>0)
	$_bo_OptionKey:=Gen_Option
	If ($_bo_OptionKey)
		Gen_Confirm("Do you want to check for data that needs to be transferred?"; "Check"; "No")
		If (OK=1)
			$_bo_OptionKey:=False:C215
		End if 
	End if 
	If ((DB_t_CurrentFormUsage2#"Dedup") & ($_bo_OptionKey=False:C215))
		$_t_CompanyCode:=""
		FIRST RECORD:C50([COMPANIES:2])
		While ((Not:C34(End selection:C36([COMPANIES:2]))) & ($_t_CompanyCode=""))
			Comp_RenumSrc([COMPANIES:2]Company_Code:1)
			If ((Records in selection:C76([TRANSACTIONS:29])>0) | (Records in selection:C76([INVOICES:39])>0) | (Records in selection:C76([PURCHASE_ORDERS:57])>0) | (Records in selection:C76([PURCHASE_INVOICES:37])>0) | (Records in selection:C76([ORDERS:24])>0) | (Records in selection:C76([PURCHASE_ORDERS:57])>0) | (Records in selection:C76([JOBS:26])>0) | (Records in selection:C76([CONTRACTS:17])>0))
				
				$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
			End if 
			NEXT RECORD:C51([COMPANIES:2])
		End while 
		If ($_t_CompanyCode#"")
			Gen_Alert($_t_CompanyCode+" has vital related information, which must be transferred."+Char:C90(13)+"NB: Only this Company will be deleted"; "OK")
			If (Records in selection:C76([COMPANIES:2])>0)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
			End if 
			vText:="TRANSFER"
		Else 
			vText:=""
		End if 
	Else 
		vText:=""
	End if 
	vNo:=Records in selection:C76([COMPANIES:2])
	Open_AnyTypeWindow(213; 369; 5; "Delete Companies")
	DIALOG:C40([COMPANIES:2]; "dAsk Del")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	WS_KeepFocus
	
	If (OK=1)
		Are_You_Sure
		If (OK=1)
			If (r3=1)
				Comp_DedupSort
				If (OK=1)
					CREATE SET:C116([COMPANIES:2]; "Master")
					
					FIRST RECORD:C50([COMPANIES:2])
					While (Records in set:C195("Master")>0)
						FIRST RECORD:C50([COMPANIES:2])
						ONE RECORD SELECT:C189([COMPANIES:2])
						CREATE SET:C116([COMPANIES:2]; "Extra")
						DIFFERENCE:C122("Master"; "Extra"; "Master")
						vText:=[COMPANIES:2]Company_Code:1
						CO_l_CompanyID:=[COMPANIES:2]x_ID:63
						If (vText#"")
							$_t_CompanyName:=Substring:C12([COMPANIES:2]Company_Name:2; 1; vNo1)+("«««"*(Num:C11(([COMPANIES:2]Company_Name:2="") & (ch6=0))))
							$_t_AddressLine1:=Substring:C12([COMPANIES:2]Address_Line_one:3; 1; vNo2)+("«««"*(Num:C11(([COMPANIES:2]Address_Line_one:3="") & (ch6=0))))
							$_t_Town:=Substring:C12([COMPANIES:2]Town_or_City:5; 1; vNo3)+("«««"*(Num:C11(([COMPANIES:2]Town_or_City:5="") & (ch6=0))))
							$_t_PostCode:=Substring:C12([COMPANIES:2]Postal_Code:7; 1; vNo4)+("«««"*(Num:C11(([COMPANIES:2]Postal_Code:7="") & (ch6=0))))
							$_t_TelephoneNumber:=Substring:C12([COMPANIES:2]Telephone:9; 1; vNo5)+("«««"*(Num:C11(([COMPANIES:2]Telephone:9="") & (ch6=0))))
							If (ch1=1)
								If ((ch2=0) & (ch3=0) & (ch4=0) & (ch5=0))
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName+"@")
								Else 
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName+"@"; *)
								End if 
							End if 
							If (ch2=1)
								If (ch1=0)
									If ((ch3=0) & (ch4=0) & (ch5=0))
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Address_Line_one:3=$_t_AddressLine1+"@")
									Else 
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Address_Line_one:3=$_t_AddressLine1+"@"; *)
									End if 
								Else 
									If ((ch3=0) & (ch4=0) & (ch5=0))
										QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Address_Line_one:3=$_t_AddressLine1+"@")
									Else 
										QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Address_Line_one:3=$_t_AddressLine1+"@"; *)
									End if 
								End if 
							End if 
							If (ch3=1)
								If ((ch1=0) & (ch2=0))
									If ((ch4=0) & (ch5=0))
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Town_or_City:5=$_t_Town+"@")
									Else 
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Town_or_City:5=$_t_Town+"@"; *)
									End if 
								Else 
									If ((ch4=0) & (ch5=0))
										QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Town_or_City:5=$_t_Town+"@")
									Else 
										QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Town_or_City:5=$_t_Town+"@"; *)
									End if 
								End if 
							End if 
							If (ch4=1)
								If ((ch1=0) & (ch2=0) & (ch3=0))
									If (ch5=0)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$_t_PostCode+"@")
									Else 
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Postal_Code:7=$_t_PostCode+"@"; *)
									End if 
								Else 
									If (ch5=0)
										QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Postal_Code:7=$_t_PostCode+"@")
									Else 
										QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Postal_Code:7=$_t_PostCode+"@"; *)
									End if 
								End if 
							End if 
							If (ch5=1)
								If ((ch1=0) & (ch2=0) & (ch3=0) & (ch4=0))
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Telephone:9=$_t_TelephoneNumber+"@")
								Else 
									QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Telephone:9=$_t_TelephoneNumber+"@")
								End if 
							End if 
							CREATE SET:C116([COMPANIES:2]; "Extra")
							INTERSECTION:C121("Master"; "Extra"; "Extra")
							DIFFERENCE:C122("Master"; "Extra"; "Master")
							USE SET:C118("Extra")
							While (Not:C34(End selection:C36([COMPANIES:2])))
								Comp_RenumSrc([COMPANIES:2]Company_Code:1)
								Comp_RenumApp(Uppercase:C13(vText); [COMPANIES:2]Company_Code:1; [COMPANIES:2]x_ID:63; CO_l_CompanyID)
								NEXT RECORD:C51([COMPANIES:2])
							End while 
							CREATE SET:C116([COMPANIES:2]; "Deletion")
							If (Not:C34(In transaction:C397))
								DB_lockFile(->[COMPANIES:2])
								APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]Deleted:61:=1)
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
							Else 
								
								FIRST RECORD:C50([COMPANIES:2])
								For ($_l_Index; 1; Records in selection:C76([COMPANIES:2]))
									[COMPANIES:2]Deleted:61:=1
									DB_SaveRecord(->[COMPANIES:2])
									AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
									NEXT RECORD:C51([COMPANIES:2])
								End for 
							End if 
							
							DIFFERENCE:C122("CMaster"; "Deletion"; "CMaster")
							CLEAR SET:C117("Deletion")
							//DELETE SELECTION([COMPANIES])
						End if 
						USE SET:C118("Master")
						
					End while 
				End if 
			Else 
				OK:=1
				If (r1=1)
					FIRST RECORD:C50([COMPANIES:2])
					While (Not:C34(End selection:C36([COMPANIES:2])))
						If ([COMPANIES:2]Company_Code:1#"")
							Comp_RenumSrc([COMPANIES:2]Company_Code:1)
							Comp_Del
						End if 
						NEXT RECORD:C51([COMPANIES:2])
					End while 
				End if 
				If (r2=1)
					CREATE SET:C116([COMPANIES:2]; "Extra")
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=vText)
					CO_l_CompanyID:=[COMPANIES:2]x_ID:63
					If (Records in selection:C76([COMPANIES:2])=0)
						Gen_Alert("That Company does not exist"; "Cancel")
						USE SET:C118("CMaster")
						OK:=0
					End if 
					If (OK=1)
						USE SET:C118("Extra")
						FIRST RECORD:C50([COMPANIES:2])
						While (Not:C34(End selection:C36([COMPANIES:2])))
							If ([COMPANIES:2]Company_Code:1#"")
								Comp_RenumSrc([COMPANIES:2]Company_Code:1)
								Comp_RenumApp(Uppercase:C13(vText); [COMPANIES:2]Company_Code:1; [COMPANIES:2]x_ID:63; CO_l_CompanyID)
							End if 
							NEXT RECORD:C51([COMPANIES:2])
						End while 
					End if 
				End if 
				If (OK=1)
					Minor_DelRecords(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; "Companies")
					CREATE SET:C116([COMPANIES:2]; "Deletion")
					If (Not:C34(In transaction:C397))
						DB_lockFile(->[COMPANIES:2])
						APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]Deleted:61:=1)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPANIES:2]))
					Else 
						
						FIRST RECORD:C50([COMPANIES:2])
						For ($_l_Index; 1; Records in selection:C76([COMPANIES:2]))
							[COMPANIES:2]Deleted:61:=1
							DB_SaveRecord(->[COMPANIES:2])
							AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
							NEXT RECORD:C51([COMPANIES:2])
						End for 
					End if 
					DIFFERENCE:C122("CMaster"; "Deletion"; "CMaster")
					CLEAR SET:C117("Deletion")
					If (DB_t_CurrentFormUsage#"Many")
						CANCEL:C270
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
USE SET:C118("CMaster")
If (DB_t_CurrentFormUsage="Many")
	Gen_OutNoF(->[COMPANIES:2])
Else 
	Gen_InNoF(->[COMPANIES:2])
End if 
DB_t_CurrentFormUsage:=""
<>CompCode:=""
vNo:=Records in selection:C76([COMPANIES:2])
ERR_MethodTrackerReturn("Companies Del"; $_t_oldMethodName)