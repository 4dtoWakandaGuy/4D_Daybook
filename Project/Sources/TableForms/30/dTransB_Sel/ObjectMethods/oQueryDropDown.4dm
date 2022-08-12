If (False:C215)
	//object Name: [TRANSACTION_BATCHES]dTransB_Sel.oQueryDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/07/2012 19:17
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
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; SRCH_d_TransToDate; VDoDateF; VDoDateT; VtDateF)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_TransBatchTable; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; ACC_l_TransDateFromOffset; ACC_l_TransDateToOffset; CH0; CH1)
	C_LONGINT:C283(Ch2; cNAA; cNAL; cSIS; R1; R2; SM_l_QueryMode; SM_l_ReturnQueryID; VDoDateFOffset; VDoDatetOffset; VNo1)
	C_LONGINT:C283(VNo2)
	C_REAL:C285(VamountF; VamountT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; Vlayer; VText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].dTransB_Sel.oQueryDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_TransBatchTable:=Table:C252(->[TRANSACTION_BATCHES:30])
$_t_ContextName:="Transaction Batches"

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
					ACC_l_EntryDateFromOffset:=0
					ACC_l_TransDateFromOffset:=0
					VDoDateFOffset:=0
					ACC_l_EntryDateToOffset:=0
					ACC_l_TransDateToOffset:=0
					VDoDatetOffset:=0
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					If (ACC_l_TransDateFromOffset#0)
						Case of 
							: (ACC_l_TransDateFromOffset>0)
								VtDateF:=Current date:C33-ACC_l_TransDateFromOffset
							: (ACC_l_TransDateFromOffset>-100)
								//months
								VtDateF:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateFromOffset; 0)
							Else 
								//years
								VtDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateFromOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVtDateT@"; True:C214)
					End if 
					If (ACC_l_TransDateToOffset#0)
						Case of 
							: (ACC_l_TransDateToOffset>0)
								VtDateF:=Current date:C33-ACC_l_TransDateToOffset
							: (ACC_l_TransDateToOffset>-100)
								//months
								SRCH_d_TransToDate:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateToOffset; 0)
							Else 
								//years
								SRCH_d_TransToDate:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateToOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVtDateT@"; True:C214)
					End if 
					If (ACC_l_EntryDateFromOffset#0)
						Case of 
							: (ACC_l_EntryDateFromOffset>0)
								SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateFromOffset
							: (ACC_l_EntryDateFromOffset>-100)
								//months
								SRCH_d_EntryDateFrom:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateFromOffset; 0)
							Else 
								//years
								SRCH_d_EntryDateFrom:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateFromOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
					End if 
					If (ACC_l_EntryDateToOffset#0)
						Case of 
							: (ACC_l_EntryDateToOffset>0)
								SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateToOffset
							: (ACC_l_EntryDateToOffset>-100)
								//months
								SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateToOffset; 0)
							Else 
								//years
								SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateToOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
					End if 
					If (ACC_l_EntryDateToOffset#0)
						Case of 
							: (ACC_l_EntryDateToOffset>0)
								SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateToOffset
							: (ACC_l_EntryDateToOffset>-100)
								//months
								SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateToOffset; 0)
							Else 
								//years
								SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateToOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
					End if 
					If (VDoDateFOffset#0)
						Case of 
							: (VDoDateFOffset>0)
								VDoDateF:=Current date:C33-VDoDateFOffset
							: (VDoDateFOffset>-100)
								//months
								VDoDateF:=Add to date:C393(Current date:C33; 0; VDoDateFOffset; 0)
							Else 
								//years
								VDoDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVDoDateT@"; True:C214)
					End if 
					If (VDoDateTOffset#0)
						Case of 
							: (VDoDateTOffset>0)
								VDoDateF:=Current date:C33-VDoDateTOffset
							: (VDoDateTOffset>-100)
								//months
								VDoDateT:=Add to date:C393(Current date:C33; 0; VDoDateTOffset; 0)
							Else 
								//years
								VDoDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVDoDateT@"; True:C214)
					End if 
					
					
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different sea"+"rch")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						
						Gen_Set_enterable($_bo_Enterable; ->VNo1; ->VNo2; ->Vlayer; ->VamountF; ->VamountT; ->VText; ->VDoDateF; ->VDoDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VTDateF; ->R1; ->R2; ->CH0; ->CH1; ->Ch2; ->SRCH_d_TransToDate; ->cSIS; ->cNAA; ->cNAL)
						
					End if 
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" search for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_TransBatchTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_TransBatchTable; <>PER_l_CurrentUserID; 0)
							
							
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
								SM_LoadSearchParameterNames($_l_TransBatchTable)
								
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VNo1; ->VNo2; ->Vlayer; ->VamountF; ->VamountT; ->VText; ->VDoDateF; ->VDoDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VTDateF; ->R1; ->R2; ->CH0; ->CH1; ->Ch2; ->SRCH_d_TransToDate; ->cSIS; ->cNAA; ->cNAL)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->ACC_l_TransDateFromOffset; ->VDoDateFOffset; ->ACC_l_EntryDateToOffset; ->ACC_l_TransDateToOffset; ->VDoDatetOffset)
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_TransBatchTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VNo1; ->VNo2; ->Vlayer; ->VamountF; ->VamountT; ->VText; ->VDoDateF; ->VDoDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VTDateF; ->R1; ->R2; ->CH0; ->CH1; ->Ch2; ->SRCH_d_TransToDate; ->cSIS; ->cNAA; ->cNAL)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->ACC_l_TransDateFromOffset; ->VDoDateFOffset; ->ACC_l_EntryDateToOffset; ->ACC_l_TransDateToOffset; ->VDoDatetOffset)
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_TransBatchTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_TransBatchTable)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].dTransB_Sel.oQueryDropDown"; $_t_oldMethodName)
