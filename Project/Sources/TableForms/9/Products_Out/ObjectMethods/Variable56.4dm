If (False:C215)
	//object Name: [PRODUCTS]Products_Out.Variable56
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(CH1)
	//C_UNKNOWN(CH2)
	//C_UNKNOWN(CH3)
	//C_UNKNOWN(cNAA)
	//C_UNKNOWN(cNAL)
	//C_UNKNOWN(cSetAdd)
	//C_UNKNOWN(cSetMod)
	//C_UNKNOWN(VAmountF)
	//C_UNKNOWN(VAmountT)
	//C_UNKNOWN(vAnalysis)
	//C_UNKNOWN(vBrand)
	//C_UNKNOWN(VComments)
	//C_UNKNOWN(vEnclosures)
	//C_UNKNOWN(Vgroup)
	//C_UNKNOWN(VLetterCode)
	//C_UNKNOWN(vModelCode)
	//C_UNKNOWN(vProblem)
	//C_UNKNOWN(vProdName)
	//C_UNKNOWN(vProduct)
	//C_UNKNOWN(Vsuperior)
	//C_UNKNOWN(Vsupplier)
	//C_UNKNOWN(vValueF)
	//C_UNKNOWN(vValueT)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305(PROD_bo_UnfilteredSetKnown; $_bo_Enterable; PROD_bo_UnfilteredSetKnown)
	C_DATE:C307(SRCH_d_EntryDateTo; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_LONGINT:C283($_l_event; $_l_ProductsTable; $_l_QueryRow; CH1; CH2; CH3; cNAA; cNAL; cSetAdd; cSetMod; SM_l_QueryMode)
	C_LONGINT:C283(SM_l_ReturnQueryID; <>PER_l_CurrentUserID; $_l_event; $_l_ProductsTable; $_l_QueryRow; cSIS; PROD_l_SetID; SM_l_QueryMode; SM_l_ReturnQueryID)
	C_POINTER:C301($_Ptr_Table)
	C_REAL:C285(VAmountF; VAmountT; vValueF; vValueT)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchName; vAnalysis; vBrand; VComments; vEnclosures; Vgroup; VLetterCode; vModelCode; vProblem; vProdName)
	C_TEXT:C284(vProduct; Vsuperior; Vsupplier; $_t_ContextName; $_t_oldMethodName; $_t_SearchName; VProdCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_Out.Variable56"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_ProductsTable:=Table:C252(->[PRODUCTS:9])
$_t_ContextName:="Products"
$_Ptr_Table:=->[PRODUCTS:9]
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SM_at_SearchNames>0)
			Case of 
				: (SM_al_SearchIDs{SM_at_SearchNames}>0)
					
					SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
					If (SM_l_QueryMode#0)
						//we are building or editing a set manager search
						Gen_Confirm("The filter "+SM_at_SearchNames{SM_at_SearchNames}+"Can be used as your filter,which will then change if you modify "+SM_at_SearchNames{SM_at_SearchNames}+"(Linked),  or you can load these variables for your filter, Which will not change"+" if you mo"+"dify "+SM_at_SearchNames{SM_at_SearchNames}; "Load"; "Link")
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
							Gen_Alert("This window will now not be further modifiable, unless you select a different fil"+"ter")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						Gen_Set_enterable($_bo_Enterable; ->Vgroup; ->vBrand; ->vProduct; ->vModelCode; ->VProdCode; ->vProdName; ->VComments; ->vEnclosures; ->Vsuperior; ->VAmountF; ->VAmountT; ->vValueF; ->vValueT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->Vsupplier; ->VLetterCode; ->vProblem; ->vLetterCode; ->vAnalysis; ->CH1; ->CH2; ->CH3; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
					Else 
						If (Not:C34(PROD_bo_UnfilteredSetKnown))
							//Remember the current selection
							PROD_l_SetID:=0
							PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
							CREATE SET:C116([PRODUCTS:9]; "PRODSelection"+String:C10(PROD_l_SetID))
							PROD_bo_UnfilteredSetKnown:=True:C214
							
						Else 
							USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
						End if 
						
						SRCH_Applyfilterstoselection($_Ptr_Table)
						
					End if 
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_l_QueryRow:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
						$_t_SearchName:=SM_at_SearchNames{$_l_QueryRow}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" filter for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_ProductsTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}); 2)
							
							
							SM_at_SearchNames:=0
							
							
						End if 
						If (Not:C34(PROD_bo_UnfilteredSetKnown))
							//Remember the current selection
							PROD_l_SetID:=0
							PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
							CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
							PROD_bo_UnfilteredSetKnown:=True:C214
							
						Else 
							USE SET:C118("ProdSelection"+String:C10(PROD_l_SetID))
						End if 
						
						SRCH_Applyfilterstoselection($_Ptr_Table)
						SM_at_SearchNames:=$_l_QueryRow
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" filter for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_ProductsTable; <>PER_l_CurrentUserID; 0; 2)
							SM_at_SearchNames:=0
							
						End if 
						
					End if 
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99999)  //Delete
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Delete filter Parameters "+$_t_SearchName+"?")
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
								SM_LoadSearchParameterNames($_l_ProductsTable; 1; 2)
								
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Vgroup; ->vBrand; ->vProduct; ->vModelCode; ->VProdCode; ->vProdName; ->VComments; ->vEnclosures; ->Vsuperior; ->VAmountF; ->VAmountT; ->vValueF; ->vValueT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->Vsupplier; ->VLetterCode; ->vProblem; ->vLetterCode; ->vAnalysis; ->CH1; ->CH2; ->CH3; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
					
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_ProductsTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Vgroup; ->vBrand; ->vProduct; ->vModelCode; ->VProdCode; ->vProdName; ->VComments; ->vEnclosures; ->Vsuperior; ->VAmountF; ->VAmountT; ->vValueF; ->vValueT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->Vsupplier; ->VLetterCode; ->vProblem; ->vLetterCode; ->vAnalysis; ->CH1; ->CH2; ->CH3; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_ProductsTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_ProductsTable; 1; 2)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_Out.Variable56"; $_t_oldMethodName)
