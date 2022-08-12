If (False:C215)
	//object Name: Object Name:      dInvoiceItems_Sel.Variable75
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
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
	C_DATE:C307(VDoDateF; VDoDateT; viDateF; viDateT; VRdateF; VRDateT; vSDateF; vSDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_TableNumber; CH0; CH1; CH2; CH3; CH4; CH5; CH6; CH7)
	C_LONGINT:C283(CH8; cNAA; cNAL; cSIS; r0; r1; SM_l_QueryMode; SM_l_ReturnQueryID)
	C_REAL:C285(VamountF; VamountT; VChargesF; VChargesT; VDueF; VDueTo; VinvF; VInvT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalCodeT; Varea)
	C_TEXT:C284(VCompCode; VCompName; VContCode; Vevent; VForename; VInvNoF; VInvNoT; VJob; Vlayer; Vname; VProdCode)
	C_TEXT:C284(Vsales; VStage; Vsurname; VTerms)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable75")

$_t_oldMethodName:=ERR_MethodTracker("OBJ dInvoiceItems_Sel.Variable75"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_TableNumber:=Table:C252(->[INVOICES:39])
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
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
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
							Sm_SetUserSearchPrefs(True:C214; $_l_TableNumber; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_TableNumber; <>PER_l_CurrentUserID; 0)
							
							
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
								SM_LoadSearchParameterNames($_l_TableNumber)
								
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
					
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_TableNumber; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
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
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_TableNumber; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_TableNumber)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ dInvoiceItems_Sel.Variable75"; $_t_oldMethodName)
