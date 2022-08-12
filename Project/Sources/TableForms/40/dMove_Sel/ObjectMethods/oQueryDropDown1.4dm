If (False:C215)
	//object Name: [STOCK_MOVEMENTS]dMove Sel.oQueryDropDown1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/07/2012 16:45
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
	C_DATE:C307(vDeliveryDate; vIDateF; vIDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_StockMovementsTable; cNAA; cNAL; cSIS; SM_l_QueryMode; SM_l_ReturnQueryID; ViDateFOffset; ViDateTOffset)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; ACC_t_CurrencyCode; Vanalysis; VcompCode; VcompName; VContCode; VContrCode; vDeliveryReference; Vlayer)
	C_TEXT:C284(Vprodcode; VType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].dMove Sel.oQueryDropDown1"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_StockMovementsTable:=Table:C252(->[STOCK_MOVEMENTS:40])
$_t_ContextName:="Stock Movements"

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
					ViDateFOffset:=0
					ViDateTOffset:=0
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					If (ViDateFOffset#0)
						Case of 
							: (ViDateFOffset>0)
								vIDateF:=Current date:C33-ViDateFOffset
								OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
							: (ViDateFOffset>-100)
								//months
								vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
								OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
							Else 
								//years
								vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
						End case 
						
						
					End if 
					If (ViDateTOffset#0)
						Case of 
							: (ViDateTOffset>0)
								vIDateT:=Current date:C33-ViDateTOffset
								OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
							: (ViDateTOffset>-100)
								//months
								vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
								OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
							Else 
								//years
								vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
						End case 
						
						
					End if 
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different sea"+"rch")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						Gen_Set_enterable($_bo_Enterable; ->VcompCode; ->VcompName; ->VType; ->VContrCode; ->VContCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateF; ->ViDateT; ->Vprodcode; ->cSIS; ->cNAA; ->cNAL)
						
					End if 
					
					
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" search for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_StockMovementsTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_StockMovementsTable; <>PER_l_CurrentUserID; 0)
							
							
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
								SM_LoadSearchParameterNames($_l_StockMovementsTable)
								
							End if 
							
							
						End if 
					End if 
					SM_at_SearchNames:=0
				: (SM_al_SearchIDs{SM_at_SearchNames}<0)  //Resave
					//resave parameters
					//might want a save as option here
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VcompCode; ->VcompName; ->VType; ->VContrCode; ->VContCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateF; ->ViDateT; ->Vprodcode; ->vDeliveryReference; ->vDeliveryDate; ->ViDateFOffset; ->ViDateTOffset; ->cSIS; ->cNAA; ->cNAL)
					
					
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_StockMovementsTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
				: (SM_al_SearchIDs{SM_at_SearchNames}<-99997)  //SEPERATOR
					SM_at_SearchNames:=0
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VcompCode; ->VcompName; ->VType; ->VContrCode; ->VContCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateF; ->ViDateT; ->Vprodcode; ->vDeliveryReference; ->vDeliveryDate; ->ViDateFOffset; ->ViDateTOffset; ->cSIS; ->cNAA; ->cNAL)
						
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_StockMovementsTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_StockMovementsTable)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].dMove Sel.oQueryDropDown1"; $_t_oldMethodName)
