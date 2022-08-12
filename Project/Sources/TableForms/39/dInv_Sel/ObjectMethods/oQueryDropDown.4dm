If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oQueryDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/07/2012 20:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_FromDates; 0)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_Enterable)
	C_DATE:C307(vDODateF; vDODateT; vIDateF; vIDateT; vRDateF; vRDateT; vSDateF; vSDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_InvoicesTable; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; CH0; CH1; CH2; CH3; CH4; CH5)
	C_LONGINT:C283(CH6; CH7; CH8; cNAA; cNAL; cSIS; r0; r1; SM_l_QueryMode; SM_l_ReturnQueryID; VDoDateFOffset)
	C_LONGINT:C283(VDoDatetOffset; ViDateFOffset; ViDateTOffset; VRDateFOffset; VRDateTOffset; VsDateFOffset; VsDatetOffset)
	C_REAL:C285(VamountF; VamountT; VChargesF; VChargesT; VDueF; VDueTo; VinvF; VInvT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalCodeT; Varea)
	C_TEXT:C284(VCompCode; VCompName; vContactName; VContCode; Vevent; VForename; VInvNoF; VInvNoT; VJob; Vlayer; Vname)
	C_TEXT:C284(VProdCode; Vsales; VStage; Vsurname; VTerms)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oQueryDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_InvoicesTable:=Table:C252(->[INVOICES:39])
$_t_ContextName:="Invoices"

Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SM_at_SearchNames>0)
			Case of 
				: (SM_al_SearchIDs{SM_at_SearchNames}>0)
					
					SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
					If (SM_l_QueryMode#0)
						//we are building or editing a set manager search
						Gen_Confirm("The search "+SM_at_SearchNames{SM_at_SearchNames}+"Can be used as your search,which will then change if you modify "+SM_at_SearchNames{SM_at_SearchNames}+"(Linked),  or you can load these variables for your search, Which will not change"+" if you mo"+"dify "+SM_at_SearchNames{SM_at_SearchNames}; "Load"; "Link")
						If (OK=0)
							//link
							SM_l_ReturnQueryID:=SM_al_SearchIDs{SM_at_SearchNames}
							OK:=1
						End if 
						
					End if 
					ACC_l_PeriodFromOffset:=0
					ACC_l_PeriodToOffset:=0
					ViDateFOffset:=0
					VRDateFOffset:=0
					VDoDateFOffset:=0
					VsDateFOffset:=0
					ViDateTOffset:=0
					VRDateTOffset:=0
					VDoDateTOffset:=0
					VsDateTOffset:=0
					
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					If (ACC_l_PeriodFromOffset>0)
						If (ACC_l_PeriodToOffset>0)
							QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
							If (Records in selection:C76([PERIODS:33])>0)
								SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
								SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
								If (ACC_l_PeriodToOffset<Size of array:C274($_ad_FromDates))
									ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
								Else 
									ACC_t_PeriodTo:=$_at_PeriodCodes{1}
								End if 
								
								OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
							End if 
						End if 
					End if 
					If (ViDateFOffset#0)
						Case of 
							: (ViDateFOffset>0)
								vIDateF:=Current date:C33-ViDateFOffset
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
							: (ViDateFOffset>-100)
								//months
								vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
							Else 
								//years
								vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
						End case 
						
						
					End if 
					If (VRDateFOffset#0)
						Case of 
							: (VRDateFOffset>0)
								vRDateF:=Current date:C33-VRDateFOffset
								OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
							: (VRDateFOffset>-100)
								//months
								vRDateF:=Add to date:C393(Current date:C33; 0; VRDateFOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
							Else 
								//years
								vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VRDateFOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
						End case 
						
						
					End if 
					If (VDoDateFOffset#0)
						Case of 
							: (VDoDateFOffset>0)
								vDODateF:=Current date:C33-VDoDateFOffset
								OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
							: (VDoDateFOffset>-100)
								//months
								vDoDateF:=Add to date:C393(Current date:C33; 0; VDoDateFOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
							Else 
								//years
								vDoDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateFOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
						End case 
					End if 
					If (VSDateFOffset#0)
						Case of 
							: (VSDateFOffset>0)
								vSDateF:=Current date:C33-VSDateFOffset
								OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
							: (VSDateFOffset>-100)
								//months
								vSDateF:=Add to date:C393(Current date:C33; 0; VSDateFOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
							Else 
								//years
								vSDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateFOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
						End case 
					End if 
					If (ViDateTOffset#0)
						Case of 
							: (ViDateTOffset>0)
								vIDateT:=Current date:C33-ViDateTOffset
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
							: (ViDateTOffset>-100)
								//months
								vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
							Else 
								//years
								vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
						End case 
						
						
					End if 
					If (VRDateTOffset#0)
						Case of 
							: (VRDateTOffset>0)
								vRDateT:=Current date:C33-VRDateTOffset
								OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
							: (VRDateTOffset>-100)
								//months
								vRDateT:=Add to date:C393(Current date:C33; 0; VRDateTOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
							Else 
								//years
								vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VRDateTOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
						End case 
						
						
					End if 
					If (VDoDateTOffset#0)
						Case of 
							: (VDoDateTOffset>0)
								vDODateT:=Current date:C33-VDoDateTOffset
								OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
							: (VDoDateTOffset>-100)
								//months
								vDoDateT:=Add to date:C393(Current date:C33; 0; VDoDateTOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
							Else 
								//years
								vDoDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateTOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
						End case 
						
					End if 
					If (VSDateTOffset#0)
						Case of 
							: (VSDateTOffset>0)
								vSDateT:=Current date:C33-VSDateTOffset
								OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
							: (VSDateTOffset>-100)
								//months
								vSDateT:=Add to date:C393(Current date:C33; 0; VSDateTOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
							Else 
								//years
								vSDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateTOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
						End case 
					End if 
					
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different sea"+"rch")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						Gen_Set_enterable($_bo_Enterable; ->VCompCode; ->VCompName; ->VContCode; ->VForename; ->Vsurname; ->VInvNoF; ->VInvNoT; ->viDateF; ->viDateT)
						Gen_Set_enterable($_bo_Enterable; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->ACC_t_AnalysisCodeFrom; ->VAnalCodeT; ->VStage; ->VJob; ->VRdateF; ->VRDateT; ->VinvF; ->VInvT)
						Gen_Set_enterable($_bo_Enterable; ->VChargesF; ->VChargesT; ->VDueF; ->VDueTo; ->VamountF; ->VamountT; ->VDoDateF; ->VDoDateT; ->vSDateF; ->vSDateT)
						Gen_Set_enterable($_bo_Enterable; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->VTerms; ->VProdCode; ->Vevent; ->Vname; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->cSIS)
						Gen_Set_enterable($_bo_Enterable; ->cNAA; ->cNAL; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->CH8; ->r0; ->r1)
						
					End if 
					
					
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" search for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_InvoicesTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_InvoicesTable; <>PER_l_CurrentUserID; 0)
							
							
						End if 
						
					End if 
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99999)  //Delete
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Delete Search Parameters "+$_t_SearchName+"?")
						If (ok=1)
							READ WRITE:C146([x_QUERY_PARAMETERS:134])
							QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							If ([x_QUERY_PARAMETERS:134]X_OwnerID:2=0) & Not:C34((User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer")))
								Gen_Alert("This search can only be deleted by the administrator")
							Else 
								DB_DeletionControl(->[x_QUERY_PARAMETERS:134])
								
								DELETE RECORD:C58([x_QUERY_PARAMETERS:134])
								READ ONLY:C145([x_QUERY_PARAMETERS:134])
								//and reload--note not generic
								SM_LoadSearchParameterNames($_l_InvoicesTable)
								
							End if 
							
							
						End if 
					End if 
					SM_at_SearchNames:=0
				: (SM_al_SearchIDs{SM_at_SearchNames}<-99997)  //SEPERATOR
					SM_at_SearchNames:=0
				: (SM_al_SearchIDs{SM_at_SearchNames}<0)  //Resave
					//resave parameters
					//might want a save as option here
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VContCode; ->VForename; ->Vsurname; ->VInvNoF; ->VInvNoT; ->viDateF; ->viDateT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->ACC_t_AnalysisCodeFrom; ->VAnalCodeT; ->VStage; ->VJob; ->VRdateF; ->VRDateT; ->VinvF; ->VInvT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VChargesF; ->VChargesT; ->VDueF; ->VDueTo; ->VamountF; ->VamountT; ->VDoDateF; ->VDoDateT; ->vSDateF; ->vSDateT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->VTerms; ->VProdCode; ->Vevent; ->Vname; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->cSIS)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cNAA; ->cNAL; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->CH8; ->r0; ->r1)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ViDateFOffset; ->VRDateFOffset; ->VDoDateFOffset; ->VsDateFOffset; ->ViDateTOffset; ->VRDateTOffset; ->VDoDateTOffset; ->VsDateTOffset)
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_InvoicesTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VContCode; ->VForename; ->Vsurname; ->VInvNoF; ->VInvNoT; ->viDateF; ->ViDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->ACC_t_AnalysisCodeFrom; ->VAnalCodeT; ->VStage; ->VJob; ->VRdateF; ->VRDateT; ->VinvF; ->VInvT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VChargesF; ->VChargesT; ->VDueF; ->VDueTo; ->VamountF; ->VamountT; ->VDoDateF; ->VDoDateT; ->vSDateF; ->vSDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->VTerms; ->VProdCode; ->Vevent; ->Vname; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->cSIS)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cNAA; ->cNAL; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->CH8; ->r0; ->r1)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ViDateFOffset; ->VRDateFOffset; ->VDoDateFOffset; ->VsDateFOffset; ->ViDateTOffset; ->VRDateTOffset; ->VDoDateTOffset; ->VsDateTOffset)
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_InvoicesTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_InvoicesTable)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oQueryDropDown"; $_t_oldMethodName)
