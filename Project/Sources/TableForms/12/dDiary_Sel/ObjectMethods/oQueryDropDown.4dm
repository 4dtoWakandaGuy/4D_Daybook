If (False:C215)
	//object Name: [DIARY]dDiary_Sel.oQueryDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/07/2012 07:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_Enterable)
	C_DATE:C307(VDnDateF; VDnDateT; VDoDateF; VDoDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_DiaryTable; $_l_event; cNAA; cNAL; cSetAdd; cSetMod; cSIS; SM_l_QueryMode; SM_l_ReturnQueryID; VDnDateFOffset)
	C_LONGINT:C283(VDnDatetOffset; VDoDateFOffset; VDoDatetOffset)
	C_REAL:C285(VvalueF; VvalueT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; DIA_t_actionCode; DIA_t_actionName; Vcallcode; VCompcode; vCompName; vContactname; vContCode; VContrCode)
	C_TEXT:C284(Vevent; VforeName; VGroup; VJob; VLetterCode; VOrderCode; Vpriority; VProduct; VResDesc; VResult; vSales)
	C_TEXT:C284(VStage; Vstatus; Vsuperior; Vsurname; VTele; VTerms)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].dDiary_Sel.oQueryDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_DiaryTable:=Table:C252(->[DIARY:12])
$_t_ContextName:="Diary"

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
					VDoDateFOffset:=0
					VDnDatetOffset:=0
					VDoDatetOffset:=0
					VDnDatetOffset:=0
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					
					If (VDnDateFOffset#0)
						Case of 
							: (VDnDateFOffset>0)
								VDnDateF:=Current date:C33-VDnDateFOffset
							: (VDnDateFOffset>-100)
								//months
								VDnDateF:=Add to date:C393(Current date:C33; 0; VDnDateFOffset; 0)
							Else 
								//years
								VDnDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVDnDateT@"; True:C214)
					End if 
					If (VDnDateTOffset#0)
						Case of 
							: (VDnDateTOffset>0)
								VDnDateF:=Current date:C33-VDnDateTOffset
							: (VDnDateTOffset>-100)
								//months
								VDnDateT:=Add to date:C393(Current date:C33; 0; VDnDateTOffset; 0)
							Else 
								//years
								VDnDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVDnDateT@"; True:C214)
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
						
						Gen_Set_enterable($_bo_Enterable; ->VCompcode; ->vCompName; ->vContCode; ->VforeName; ->Vsurname; ->Vsuperior; ->VdodateF; ->VDnDateF; ->VdodateT; ->VDnDateT; ->VvalueF; ->VvalueT)
						Gen_Set_enterable($_bo_Enterable; ->vSales; ->VGroup; ->VTele; ->Vpriority; ->Vstatus; ->DIA_t_actionCode; ->DIA_t_actionName; ->VLetterCode; ->VTerms; ->VResult)
						Gen_Set_enterable($_bo_Enterable; ->VResDesc; ->VProduct; ->VJob; ->VStage; ->VContrCode; ->VOrderCode; ->Vevent; ->Vcallcode; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
						
					End if 
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" search for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_DiaryTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_DiaryTable; <>PER_l_CurrentUserID; 0)
							
							
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
								SM_LoadSearchParameterNames($_l_DiaryTable)
								
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompcode; ->vCompName; ->vContCode; ->VforeName; ->Vsurname; ->Vsuperior; ->VdodateF; ->VDnDateF; ->VdodateT; ->VDnDateT; ->VvalueF; ->VvalueT)
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vSales; ->VGroup; ->VTele; ->Vpriority; ->Vstatus; ->DIA_t_actionCode; ->DIA_t_actionName; ->VLetterCode; ->VTerms; ->VResult)
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VResDesc; ->VProduct; ->VJob; ->VStage; ->VContrCode; ->VOrderCode; ->Vevent; ->Vcallcode; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactname)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VDoDateFOffset; ->VDnDatetOffset; ->VDoDatetOffset; ->VDnDatetOffset)
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_DiaryTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompcode; ->vCompName; ->vContCode; ->VforeName; ->Vsurname; ->Vsuperior; ->VdodateF; ->VDnDateF; ->VdodateT; ->VDnDateT; ->VvalueF; ->VvalueT)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vSales; ->VGroup; ->VTele; ->Vpriority; ->Vstatus; ->DIA_t_actionCode; ->DIA_t_actionName; ->VLetterCode; ->VTerms; ->VResult)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VResDesc; ->VProduct; ->VJob; ->VStage; ->VContrCode; ->VOrderCode; ->Vevent; ->Vcallcode; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactname)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VDoDateFOffset; ->VDnDatetOffset; ->VDoDatetOffset; ->VDnDatetOffset)
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_DiaryTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_DiaryTable)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].dDiary_Sel.oQueryDropDown"; $_t_oldMethodName)
