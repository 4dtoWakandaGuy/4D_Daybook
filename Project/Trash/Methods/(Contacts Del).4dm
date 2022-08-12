//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts Del
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_DateAdded)
	//C_UNKNOWN(Address_Status)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_AddressTypes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>MultiCo; $_bo_Create; $_bo_OptionKey; $_bo_Save; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_CharPosition; $_l_CompanyCodeRow; $_l_CurrentRecord; $_l_Index; $_l_RecordCount; $_l_RecordsinSelectionCompanies; $_l_WindowRow; ch1; ch2; r1; r2)
	C_LONGINT:C283(vNo; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>ContCode; $_t_ContactCode; $_t_ContactCompanyCode; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vContCode; vLayCode; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts Del")
//Contacts Del

//Deliberate - Do not remove (deletion blanks problem)
CREATE SET:C116([CONTACTS:1]; "OMaster")
If (DB_t_CurrentFormUsage="Many@")
	If (DB_t_CurrentFormUsage="Many")
		USE SET:C118("userset")
	End if 
	vLayCode:=""
Else 
	ONE RECORD SELECT:C189([CONTACTS:1])
	vLayCode:=[CONTACTS:1]Contact_Code:2
End if 
If (Records in selection:C76([CONTACTS:1])>0)
	$_bo_OptionKey:=Gen_Option
	If ($_bo_OptionKey)
		Gen_Confirm("Do you want to check for data that needs to be transferred?"; "Check"; "No")
		If (OK=1)
			$_bo_OptionKey:=False:C215
		End if 
	End if 
	If ((DB_t_CurrentFormUsage2#"Dedup") & ($_bo_OptionKey=False:C215))
		$_t_ContactCode:=""
		FIRST RECORD:C50([CONTACTS:1])
		While ((Not:C34(End selection:C36([CONTACTS:1]))) & ($_t_ContactCode=""))
			Cont_RenumSrch([CONTACTS:1]Contact_Code:2)
			If ((Records in selection:C76([INVOICES:39])>0) | (Records in selection:C76([PURCHASE_ORDERS:57])>0) | (Records in selection:C76([ORDERS:24])>0) | (Records in selection:C76([JOBS:26])>0))
				
				$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
			End if 
			NEXT RECORD:C51([CONTACTS:1])
		End while 
		If ($_t_ContactCode#"")
			Gen_Alert($_t_ContactCode+" has vital related information, which must be transferred."+Char:C90(13)+"NB: Only this Contact will be deleted"; "OK")
			If (Records in selection:C76([CONTACTS:1])>0)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
			End if 
			vText:="TRANSFER"
		Else 
			vText:=""
			FIRST RECORD:C50([CONTACTS:1])
		End if 
	Else 
		vText:=""
	End if 
	vNo:=Records in selection:C76([CONTACTS:1])
	Open_AnyTypeWindow(234; 377; 5; "Delete Contacts")
	DIALOG:C40([CONTACTS:1]; "dAsk Del")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowRow}
		End if 
	End if 
	
	WS_KeepFocus
	
	If (OK=1)
		Are_You_Sure
		If (OK=1)
			If (r1=1)
				FIRST RECORD:C50([CONTACTS:1])
				While (Not:C34(End selection:C36([CONTACTS:1])))
					Cont_RenumSrch([CONTACTS:1]Contact_Code:2)
					Cont_Del
					NEXT RECORD:C51([CONTACTS:1])
				End while 
			End if 
			
			If (r2=1)
				LOAD RECORD:C52([CONTACTS:1])
				CREATE SET:C116([CONTACTS:1]; "Extra")
				OK:=1
				If (ch1=0)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=vText)
					If (Records in selection:C76([CONTACTS:1])=0)
						Gen_Alert("Contact "+vText+" does not exist"; "Cancel")
						USE SET:C118("OMaster")
						OK:=0
					End if 
				End if 
				
				If (OK=1)
					RELATE ONE:C42([CONTACTS:1]Company_Code:1)
					USE SET:C118("Extra")
					
					FIRST RECORD:C50([CONTACTS:1])
					While (Not:C34(End selection:C36([CONTACTS:1])))
						
						If (<>MultiCo)
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							
							$_l_RecordsinSelectionCompanies:=Records in selection:C76([CONTACTS_COMPANIES:145])
							ARRAY TEXT:C222($_at_CompanyCodes; $_l_RecordsinSelectionCompanies)
							ARRAY TEXT:C222($_at_AddressTypes; $_l_RecordsinSelectionCompanies)
							$_l_RecordCount:=1
						End if 
						
						$_bo_Create:=True:C214
						If (ch1=1)
							vText:=Substring:C12([CONTACTS:1]Comments:10; Length:C16([CONTACTS:1]Comments:10)-14; 32000)
							$_l_CharPosition:=Position:C15(" of "; vText)
							If ($_l_CharPosition=0)
								Gen_Alert("No Duplicate Text found in the Comments field of Contact"+[CONTACTS:1]Contact_Code:2; "Skip it")
								$_bo_Create:=False:C215
							Else 
								CUT NAMED SELECTION:C334([CONTACTS:1]; "$Sel2")
								vText:=Substring:C12(vText; $_l_CharPosition+4; 32000)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=vText)
								If (Records in selection:C76([CONTACTS:1])=0)
									Gen_Alert("Contact "+vText+" does not exist"; "Skip it")
									$_bo_Create:=False:C215
								Else 
									If ([CONTACTS:1]Duplicate_State:26="%D")
										$_bo_Create:=False:C215
									End if 
								End if 
								USE NAMED SELECTION:C332("$Sel2")
							End if 
						End if 
						
						If ($_bo_Create)
							vContCode:=[CONTACTS:1]Contact_Code:2
							Cont_RenumSrch([CONTACTS:1]Contact_Code:2)
							Cont_Trans
							
							If (<>MultiCo)
								FIRST RECORD:C50([CONTACTS_COMPANIES:145])
								While (Not:C34(End selection:C36([CONTACTS_COMPANIES:145])))
									$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
									If (($_l_CompanyCodeRow=-1) & ($_l_RecordCount<=$_l_RecordsinSelectionCompanies))
										$_at_CompanyCodes{$_l_RecordCount}:=[CONTACTS_COMPANIES:145]Company_Code:1
										$_at_AddressTypes{$_l_RecordCount}:=[CONTACTS_COMPANIES:145]Address_Type:2
										$_l_RecordCount:=$_l_RecordCount+1
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
								End while 
							End if 
							[CONTACTS:1]Duplicate_State:26:="%D"
							DB_SaveRecord(->[CONTACTS:1])
							AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
							
						Else 
							CREATE EMPTY SET:C140([CONTACTS:1]; "Extra2")
							ADD TO SET:C119([CONTACTS:1]; "Extra2")
							DIFFERENCE:C122("Extra"; "Extra2"; "Extra")
							CLEAR SET:C117("Extra2")
						End if 
						
						If ((r2=1) & (<>MultiCo))
							CUT NAMED SELECTION:C334([CONTACTS:1]; "$Sel2")
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=vText)
							If ((Records in selection:C76([CONTACTS:1])#0) & ([CONTACTS:1]Duplicate_State:26#"%D"))
								$_l_CurrentRecord:=1
								$_bo_Save:=False:C215
								While ($_l_CurrentRecord<$_l_RecordCount)
									IDLE:C311  // 03/04/03 pb
									
									$_bo_Create:=True:C214
									If (ch2=1)
										$_t_ContactCompanyCode:=[CONTACTS:1]Company_Code:1
										CUT NAMED SELECTION:C334([CONTACTS:1]; "$Sel3")
										QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_at_CompanyCodes{$_l_CurrentRecord}; *)
										QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
										
										SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
										QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
										
										
										If (Records in selection:C76([CONTACTS:1])<2)
											READ WRITE:C146([COMPANIES:2])
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_at_CompanyCodes{$_l_CurrentRecord})
											If (Records in selection:C76([COMPANIES:2])>0)
												Comp_RenumSrc($_at_CompanyCodes{$_l_CurrentRecord})
												Comp_RenumApp($_t_ContactCompanyCode; $_at_CompanyCodes{$_l_CurrentRecord})
												[COMPANIES:2]Deleted:61:=1
												DB_SaveRecord(->[COMPANIES:2])
												AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
												//DELETE RECORD([COMPANIES])
												$_bo_Create:=False:C215
											End if 
										End if 
										USE NAMED SELECTION:C332("$Sel3")
									End if 
									
									If ($_bo_Create)
										QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
										QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0; *)
										
										QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Company_Code:1=$_at_CompanyCodes{$_l_CurrentRecord})
										If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_at_CompanyCodes{$_l_CurrentRecord})
											If (Records in selection:C76([COMPANIES:2])>0)
												CREATE RECORD:C68([CONTACTS_COMPANIES:145])
												[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
												[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
												[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
												
												[CONTACTS_COMPANIES:145]Company_Code:1:=$_at_CompanyCodes{$_l_CurrentRecord}
												[CONTACTS_COMPANIES:145]Address_Type:2:=$_at_AddressTypes{$_l_CurrentRecord}
												$_bo_Save:=True:C214
												DB_SaveRecord(->[CONTACTS_COMPANIES:145])
											End if 
										End if 
									End if 
									$_l_CurrentRecord:=$_l_CurrentRecord+1
								End while 
								If ($_bo_Save)
									
									DB_SaveRecord(->[CONTACTS:1])
									AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
								End if 
							End if 
							USE NAMED SELECTION:C332("$Sel2")
						End if 
						
						NEXT RECORD:C51([CONTACTS:1])
					End while 
					USE SET:C118("Extra")
				End if 
			End if 
			
			If (OK=1)
				Minor_DelRecords(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; "Contacts")
				// DELETE SELECTION([CONTACTS])
				CREATE SET:C116([CONTACTS:1]; "deleted")
				If (Not:C34(In transaction:C397))
					DB_lockFile(->[CONTACTS:1])
					APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]Deleted:32:=1)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[CONTACTS:1]))
				Else 
					FIRST RECORD:C50([CONTACTS:1])
					For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
						[CONTACTS:1]Deleted:32:=1
						DB_SaveRecord(->[CONTACTS:1])
						AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
						NEXT RECORD:C51([CONTACTS:1])
					End for 
				End if 
				
				DIFFERENCE:C122("OMaster"; "Deleted"; "OMaster")
				CLEAR SET:C117("Deleted")
				If ((DB_t_CurrentFormUsage#"Many") & (DB_t_CurrentFormUsage#"OneIncl") & (DB_t_CurrentFormUsage#"ManyIncl"))
					CANCEL:C270
				End if 
			End if 
		End if 
	End if 
End if 
USE SET:C118("OMaster")
If (DB_t_CurrentFormUsage="Many")
	Gen_OutNoF(->[CONTACTS:1])
Else 
	If ((DB_t_CurrentFormUsage#"OneIncl") & (DB_t_CurrentFormUsage#"ManyIncl"))
		Gen_InNoF(->[CONTACTS:1])
	End if 
End if 
DB_t_CurrentFormUsage:=""
<>ContCode:=""
ERR_MethodTrackerReturn("Contacts Del"; $_t_oldMethodName)
