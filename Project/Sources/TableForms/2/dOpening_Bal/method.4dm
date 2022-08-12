If (False:C215)
	//Table Form Method Name: Object Name:      [COMPANIES].dOpening_Bal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 20:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY DATE(LB_ad_01_1;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY REAL(LB_ar_01_1;0)
	//ARRAY REAL(LB_ar_01_2;0)
	ARRAY TEXT:C222($_at_Columns; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	C_BOOLEAN:C305(<>ALUseListBox; DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_CreditAccountRow; $_l_DebitAccountRow; $_l_Error; $_l_event; $_l_Index; $_l_SIzeofArray; ACC_l_BUT1; ACC_l_BUT2; ACC_l_BUT3; ACC_l_BUT4; ACC_l_BUT5)
	C_LONGINT:C283(ACC_l_BUT6; ACC_l_BUT7; ACC_l_BUT9; ACC_L8; DB_l_ButtonClickedFunction; eALContI; iCancel; iOK; s1; vALLevels)
	C_REAL:C285(vT1; vT2; vTot; vTot2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; oAccBalance_COL1; oAccBalance_COL2; oAccBalance_COL3; oAccBalance_COL4; oAccBalance_COL5; oAccBalance_COL6; oAccBalance_COL7; oAccBalance_COL8)
	C_TEXT:C284(oAccBalance_COL9; oAccBalance_HED1; oAccBalance_HED2; oAccBalance_HED3; oAccBalance_HED4; oAccBalance_HED5; oAccBalance_HED6; oAccBalance_HED7; oAccBalance_HED8; oAccBalance_HED9; vButtDisTxt)
	C_TEXT:C284(vTitle; vTitle3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dOpening_Bal"; Form event code:C388)
$_l_event:=Form event code:C388
//Companies_OutLP$_l_event:=Form event


Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 395; 541)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dOpening_Bal")
		WS_AutoscreenSize(2; 395; 541)
		
		vT1:=0
		vT2:=0
		ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
		vALLevels:=0
		//LBi_ArrDef01 
		LBI_AddDef07to99(1)
		LBI_ArrayDefPic(1)
		LBI_arrayDefTime(1)
		$_l_Error:=1
		vTitle3:="Press the + button to add items, or the - button to remove them (with "+Term_Platform("Option")+" to remove all)."
		vTitle3:=vTitle3+Char:C90(13)+"When the entries are complete, press the Tick button to confirm them."
		//``
		If (<>ALUseListBox)
			//``
			//LBi_ArrDef01 
			LBI_AddDef07to99(1)
			LBI_ArrayDefPic(1)
			LBI_arrayDefTime(1)
			Case of 
				: (vTitle="Sales@")
					LB_SetupListbox(->GEN_lb_ItemsArea; "oAccBalances"; "ACC_L"; 1; ->LB_at_01_1; ->LB_at_01_2; ->LB_at_01_3; ->LB_ad_01_1; ->LB_ar_01_1)
					LB_SetColumnHeaders(->GEN_lb_ItemsArea; "ACC_L"; 1; "Customer"; "Telephone"; "Invoice No"; "Invoice Date"; "Total Outstanding")
					LB_SetColumnWidths(->GEN_lb_ItemsArea; "oAccBalances"; 1; 140; 110; 70; 70; 110)
					LB_SetScroll(->GEN_lb_ItemsArea; -3; -2)
					
					LB_SetFormat(->GEN_lb_ItemsArea; 2; ""; 4; 0; 2)
					LB_SetFormat(->GEN_lb_ItemsArea; 2; ""; 5; 0; 2)
					
					Startup_Page2Im("SLOpeBal.TXT")
					
					
					
				: (vTitle="Purch@")
					LB_SetupListbox(->GEN_lb_ItemsArea; "oAccBalances"; "ACC_L"; 1; ->LB_at_01_1; ->LB_at_01_2; ->LB_at_01_3; ->LB_ad_01_1; ->LB_ar_01_1)
					
					LB_SetColumnHeaders(->GEN_lb_ItemsArea; "ACC_L"; 1; "Supplier"; "Telephone"; "Invoice No"; "Invoice Date"; "Total Outstanding")
					LB_SetColumnWidths(->GEN_lb_ItemsArea; "oAccBalances"; 1; 140; 110; 70; 70; 110)
					LB_SetScroll(->GEN_lb_ItemsArea; -3; -2)
					
					LB_SetFormat(->GEN_lb_ItemsArea; 2; ""; 4; 0; 2)
					LB_SetFormat(->GEN_lb_ItemsArea; 2; ""; 5; 0; 2)
					
					Startup_Page2Im("SLOpeBal.TXT")
					
				: (vTitle="Gene@")
					LB_SetupListbox(->GEN_lb_ItemsArea; "oAccBalances"; "ACC_L"; 1; ->LB_at_01_1; ->LB_at_01_2; ->LB_ar_01_1; ->LB_ar_01_2)
					
					LB_SetColumnHeaders(->GEN_lb_ItemsArea; "ACC_L"; 1; "Account Code"; "AccountName"; "Debit Amount"; "Credit Amount")
					LB_SetColumnWidths(->GEN_lb_ItemsArea; "oAccBalances"; 1; 90; 205; 100; 100)
					LB_SetScroll(->GEN_lb_ItemsArea; -3; -2)
					//AL_SetCallbacks (eALContI;"";"Startup_SLOBMod")
					LB_SetFormat(->GEN_lb_ItemsArea; 2; ""; 2; 0; 2)
					LB_SetFormat(->GEN_lb_ItemsArea; 2; ""; 3; 0; 2)
					LB_SetFormat(->GEN_lb_ItemsArea; 2; ""; 4; 0; 2)
					
					Startup_Page2Im("SLOpeBal.TXT")
					
					$_l_SIzeofArray:=Size of array:C274(LB_at_01_1)
					
					If ($_l_SIzeofArray=0)
						MESSAGES OFF:C175
						If (s1=1)
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="B"; *)
							QUERY:C277([ACCOUNTS:32];  & ; [ACCOUNTS:32]Account_Code:2#DB_GetLedgerProfitACC)
						Else 
							QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2#DB_GetLedgerProfitACC)
						End if 
						MESSAGES ON:C181
						
						SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; LB_at_01_1; [ACCOUNTS:32]Account_Name:3; LB_at_01_2)
						SORT ARRAY:C229(LB_at_01_1; LB_at_01_2; >)
						$_l_SIzeofArray:=Size of array:C274(LB_at_01_1)
						INSERT IN ARRAY:C227(LB_ar_01_1; 1; $_l_SIzeofArray)
						INSERT IN ARRAY:C227(LB_ar_01_2; 1; $_l_SIzeofArray)
					End if 
					If (vTot#0)  //add in the SL figure
						MESSAGES OFF:C175
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
						If (Records in selection:C76([TRANSACTION_TYPES:31])=1)
							$_l_DebitAccountRow:=Find in array:C230(LB_at_01_1; [TRANSACTION_TYPES:31]Debit_Account:4)
							If ($_l_DebitAccountRow>0)
								LB_ar_01_1{$_l_DebitAccountRow}:=vTot
							End if 
							$_l_CreditAccountRow:=Find in array:C230(LB_at_01_1; [TRANSACTION_TYPES:31]Credit_Account:5)
							If ($_l_CreditAccountRow>0)
								LB_ar_01_2{$_l_CreditAccountRow}:=vTot
							End if 
							MESSAGES ON:C181
						End if 
					End if 
					If (vTot2#0)  //add in the PL figure
						MESSAGES OFF:C175
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
						If (Records in selection:C76([TRANSACTION_TYPES:31])=1)
							$_l_DebitAccountRow:=Find in array:C230(LB_at_01_1; [TRANSACTION_TYPES:31]Debit_Account:4)
							If ($_l_DebitAccountRow>0)
								LB_ar_01_1{$_l_DebitAccountRow}:=vTot2
							End if 
							$_l_CreditAccountRow:=Find in array:C230(LB_at_01_1; [TRANSACTION_TYPES:31]Credit_Account:5)
							If ($_l_CreditAccountRow>0)
								LB_ar_01_2{$_l_CreditAccountRow}:=vTot2
							End if 
						End if 
						MESSAGES ON:C181
					End if 
					
					UNLOAD RECORD:C212([TRANSACTION_TYPES:31])
			End case 
			
			If ($_l_Error=0)
				LBi_SimpleLPB2(->eALContI)
				
				
				If (vTitle="Gene@")
					vT1:=0
					vT2:=0
					For ($_l_Index; 1; $_l_SIzeofArray)
						vT1:=vT1+LB_ar_01_1{$_l_Index}
						vT2:=vT2+LB_ar_01_2{$_l_Index}
					End for 
					ARRAY TEXT:C222($_at_Columns; 3)
					ARRAY TEXT:C222($_at_Values; 3)
					ARRAY TEXT:C222($_at_Formats; 3)
					$_at_Columns{1}:="Account Balance"
					$_at_Values{1}:="Difference: "+String:C10(Round:C94((vT1-vT2); 2))
					$_at_Formats{1}:="|Accounts"
					$_at_Columns{2}:="Total Debit Amount"
					$_at_Values{2}:=String:C10(vT1)
					$_at_Formats{2}:="|Accounts"
					$_at_Columns{3}:="Total Credit Amount"
					$_at_Values{3}:=String:C10(vT2)
					$_at_Formats{3}:="|Accounts"
					
					
					LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
					
					LB_SetScroll(->GEN_lb_ItemsArea; 1; 1)
					
				End if 
			End if 
			
		Else 
			//LBi_ArrDef01 
			LBI_AddDef07to99(1)
			LBI_ArrayDefPic(1)
			LBI_arrayDefTime(1)
			//``
			Case of 
				: (vTitle="Sales@")
					
					//$_l_Error:=AL_SetArraysNam (eALContI;1;5;"LB_at_01_1";"LB_at_01_2";"LB_at_01_3";"LB_ad_01_1";"LB_ar_01_1")
					If ($_l_Error=0)
						//AL_SetHeaders (eALContI;1;5;"Customer";"Telephone";"Invoice No";"Invoice Date";"Total Outstanding")
						//AL_SetWidths (eALContI;1;5;140;110;70;70;110)
						//AL_SetCallbacks (eALContI;"";"Startup_SLOBMod")
						//AL_SetFormat (eALContI;4;"";1;0;0;0)  `Date - left just line
						//AL_SetFormat (eALContI;5;"";0;3;3;0)  `Num - right Hdr & Ftr
						
						Startup_Page2Im("SLOpeBal.TXT")
						
						
					End if 
				: (vTitle="Purch@")
					LB_SetupListbox(->GEN_lb_ItemsArea; "oAccBalances"; "ACC_L"; 1; ->LB_at_01_1; ->LB_at_01_2; ->LB_at_01_3; ->LB_ad_01_1; ->LB_ar_01_1)
					
					If ($_l_Error=0)
						//AL_SetHeaders (eALContI;1;5;"Supplier";"Telephone";"Invoice No";"Invoice Date";"Total Outstanding")
						//AL_SetWidths (eALContI;1;5;140;110;70;70;110)
						//AL_SetCallbacks (eALContI;"";"Startup_SLOBMod")
						//AL_SetFormat (eALContI;4;"";1;0;0;0)  `Date - left just line
						//AL_SetFormat (eALContI;5;"";0;3;3;0)  `Num - right Hdr & Ftr
						Startup_Page2Im("PLOpeBal.TXT")
					End if 
				: (vTitle="Gene@")
					//$_l_Error:=AL_SetArraysNam (eALContI;1;4;"LB_at_01_1";"LB_at_01_2";"LB_ar_01_1";"LB_ar_01_2")
					If ($_l_Error=0)
						//AL_SetHeaders (eALContI;1;4;"Account Code";"Account Name";"Debit Amount";"Credit Amount")
						//AL_SetWidths (eALContI;1;4;90;205;100;100)
						//AL_SetCallbacks (eALContI;"";"Startup_GLOBMod")
						//AL_SetFormat (eALContI;2;"";0;0;3;0)  `right just Ftr
						//AL_SetFormat (eALContI;3;"";0;3;3;0)  `Num - right Hdr & Ftr
						//AL_SetFormat (eALContI;4;"";0;3;3;0)  `Num - right Hdr & Ftr
						//AL_SetEnterable (eALContI;2;0)
						Startup_Page2Im("GLOpeBal.TXT")
						$_l_SIzeofArray:=Size of array:C274(LB_at_01_1)
						
						If ($_l_SIzeofArray=0)
							MESSAGES OFF:C175
							If (s1=1)
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]PB:4="B"; *)
								QUERY:C277([ACCOUNTS:32];  & ; [ACCOUNTS:32]Account_Code:2#DB_GetLedgerProfitACC)
							Else 
								QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2#DB_GetLedgerProfitACC)
							End if 
							MESSAGES ON:C181
							
							SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; LB_at_01_1; [ACCOUNTS:32]Account_Name:3; LB_at_01_2)
							SORT ARRAY:C229(LB_at_01_1; LB_at_01_2; >)
							$_l_SIzeofArray:=Size of array:C274(LB_at_01_1)
							INSERT IN ARRAY:C227(LB_ar_01_1; 1; $_l_SIzeofArray)
							INSERT IN ARRAY:C227(LB_ar_01_2; 1; $_l_SIzeofArray)
						End if 
						If (vTot#0)  //add in the SL figure
							MESSAGES OFF:C175
							QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
							If (Records in selection:C76([TRANSACTION_TYPES:31])=1)
								$_l_DebitAccountRow:=Find in array:C230(LB_at_01_1; [TRANSACTION_TYPES:31]Debit_Account:4)
								If ($_l_DebitAccountRow>0)
									LB_ar_01_1{$_l_DebitAccountRow}:=vTot
								End if 
								$_l_CreditAccountRow:=Find in array:C230(LB_at_01_1; [TRANSACTION_TYPES:31]Credit_Account:5)
								If ($_l_CreditAccountRow>0)
									LB_ar_01_2{$_l_CreditAccountRow}:=vTot
								End if 
								MESSAGES ON:C181
							End if 
						End if 
						If (vTot2#0)  //add in the PL figure
							MESSAGES OFF:C175
							QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSPURpost)
							If (Records in selection:C76([TRANSACTION_TYPES:31])=1)
								$_l_DebitAccountRow:=Find in array:C230(LB_at_01_1; [TRANSACTION_TYPES:31]Debit_Account:4)
								If ($_l_DebitAccountRow>0)
									LB_ar_01_1{$_l_DebitAccountRow}:=vTot2
								End if 
								$_l_CreditAccountRow:=Find in array:C230(LB_at_01_1; [TRANSACTION_TYPES:31]Credit_Account:5)
								If ($_l_CreditAccountRow>0)
									LB_ar_01_2{$_l_CreditAccountRow}:=vTot2
								End if 
							End if 
							MESSAGES ON:C181
						End if 
					End if 
					UNLOAD RECORD:C212([TRANSACTION_TYPES:31])
			End case 
			
			If ($_l_Error=0)
				LBi_SimpleLPB2(->GEN_lb_ItemsArea)
				
				If (vTitle="Gene@")
					vT1:=0
					vT2:=0
					For ($_l_Index; 1; $_l_SIzeofArray)
						vT1:=vT1+LB_ar_01_1{$_l_Index}
						vT2:=vT2+LB_ar_01_2{$_l_Index}
					End for 
				End if 
			End if 
		End if 
		
		vButtDisTxt:="IMD  O  FSSSRCAXT"
		Input_Buttons(->[COMPANIES:2]; ->vButtDisTxt)
		SD2_SetDiaryPopup
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[COMPANIES:2]); "dOpening_Bal")
		In_ButtChkDis(->vButtDisTxt)
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				//yes this form is in the companies table but we are really in the account balances table so this keeps it simple..
				
				inButtSubHandle(FORM Get current page:C276; ->[ACCOUNT_BALANCES:34])
				
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				In_ButtCall("R:Startup_OBLPA:D:Startup_OBLPCan"; ""; ""; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ""; ""; ""; ""; "")
				
				
				
				
		End case 
		DB_l_ButtonClickedFunction:=0
		
		
		
	: ($_l_event=On Data Change:K2:15)
		DB_bo_RecordModified:=True:C214
End case 
ERR_MethodTrackerReturn("FM:dOpening_Bal"; $_t_oldMethodName)
