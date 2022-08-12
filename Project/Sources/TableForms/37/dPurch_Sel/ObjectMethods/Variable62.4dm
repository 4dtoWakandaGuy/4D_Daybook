If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.Variable62
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2011 15:39
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_Enterable)
	C_DATE:C307(ViDateF; ViDateT; VpDateF; VpDateT; VRDateF; VRDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_PurchaseInvoicesTable; CH0; CH1; CH2; CH3; CH4; CH5; CH6; CH7)
	C_LONGINT:C283(cNAA; cNAL; cSIS; R0; R1; SM_l_QueryMode; SM_l_ReturnQueryID)
	C_REAL:C285(VamountF; VamountT; VChargesF; VChargesT; VDueF; VDueTo; VInvF; VInvT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalCodeT; VAnalCodF)
	C_TEXT:C284(VAnalCodT; VCompCode; VCompName; VEvent; VJob; VLayer; VName; VOrderNo; VProdCode; VPurchCode; VPurchInvNo)
	C_TEXT:C284(VStage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].dPurch Sel.Variable62"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_PurchaseInvoicesTable:=Table:C252(->[PURCHASE_INVOICES:37])
$_t_ContextName:="PURCHASES"

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
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different sea"+"rch")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						Gen_Set_enterable($_bo_Enterable; ->VCompCode; ->VCompName; ->VPurchCode; ->VPurchInvNo; ->VOrderNo; ->ViDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_AnalysisCodeFrom; ->ACC_t_PeriodTo; ->VAnalCodeT; ->VStage; ->VJob; ->VpDateF)
						Gen_Set_enterable($_bo_Enterable; ->VRDateF; ->VamountF; ->VInvF; ->VChargesF; ->VDueF; ->Acc_t_AccountCodeFrom; ->VpDateT; ->VRDateT; ->VamountT; ->VInvT; ->VChargesT; ->VDueTo; ->Acc_t_AccountCodeTo; ->VProdCode; ->VName)
						Gen_Set_enterable($_bo_Enterable; ->VEvent; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
						
					End if 
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" search for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_PurchaseInvoicesTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_PurchaseInvoicesTable; <>PER_l_CurrentUserID; 0)
							
							
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
								SM_LoadSearchParameterNames($_l_PurchaseInvoicesTable)
								
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VPurchCode; ->VPurchInvNo; ->VOrderNo; ->ViDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_AnalysisCodeFrom; ->ACC_t_PeriodTo; ->VAnalCodeT; ->VStage; ->VJob; ->VpDateF)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VRDateF; ->VamountF; ->VInvF; ->VChargesF; ->VDueF; ->Acc_t_AccountCodeFrom; ->VpDateT; ->VRDateT; ->VamountT; ->VInvT; ->VChargesT; ->VDueTo; ->Acc_t_AccountCodeTo; ->VProdCode; ->VName)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VEvent; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
					
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_PurchaseInvoicesTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VPurchCode; ->VPurchInvNo; ->VOrderNo; ->ViDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->VAnalCodF; ->ACC_t_PeriodTo; ->VAnalCodT; ->VStage; ->VJob; ->VpDateF)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VRDateF; ->VamountF; ->VInvF; ->VChargesF; ->VDueF; ->Acc_t_AccountCodeFrom; ->VpDateT; ->VRDateT; ->VamountT; ->VInvT; ->VChargesT; ->VDueTo; ->Acc_t_AccountCodeTo; ->VProdCode; ->VName)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VEvent; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_PurchaseInvoicesTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_PurchaseInvoicesTable)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:dPurch Sel,SM_at_SearchNames"; $_t_oldMethodName)
