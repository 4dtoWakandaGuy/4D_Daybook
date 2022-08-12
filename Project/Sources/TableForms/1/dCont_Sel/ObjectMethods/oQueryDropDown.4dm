If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oQueryDropDown
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
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_Enterable)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1; vDateT2; vDateT3; vDateT4)
	C_DATE:C307(vDateT5; VSDateF; VSDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_SearchID; $_l_TableNumber; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ch1; cNAA; cNAL; cSetAdd; cSetMod)
	C_LONGINT:C283(cSIS; SM_l_QueryMode; SM_l_ReturnQueryID; vAct1; vAct2; vAct3; vAct4; vAct5; vNo1; vNo2; vNo3)
	C_LONGINT:C283(vNo4; vNo5; VsDateFOffset; VsDatetOffset)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; vAccName; vAnalysis; Varea; vCalYr; VCharge; Vcomments; vCompCode; VCompName)
	C_TEXT:C284(VContCode; vCountry; vCounty; vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; vemail; VForeName; VJobTitle)
	C_TEXT:C284(Vomit; Vperson; vPersonName; VPostCode; vProdCode; Vrole; VSales; Vsource; Vstatus; vSubGroup1; vSubGroup2)
	C_TEXT:C284(vSubGroup3; vSubGroup4; vSubGroup5; Vsurname; vTele; Vtitle; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
	C_TEXT:C284(Vtown; VType; Vtype_)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oQueryDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_TableNumber:=Table:C252(->[CONTACTS:1])
$_t_ContextName:="Contacts"

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
					ACC_l_EntryDateFromOffset:=0
					VsDateFOffset:=0
					ACC_l_EntryDateToOffset:=0
					VsDatetOffset:=0
					
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					If (VSDateFOffset#0)
						Case of 
							: (VSDateFOffset>0)
								VSDateF:=Current date:C33-VSDateFOffset
							: (VSDateFOffset>-100)
								//months
								VSDateF:=Add to date:C393(Current date:C33; 0; VSDateFOffset; 0)
							Else 
								//years
								VSDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVSDateT@"; True:C214)
					End if 
					If (VSDateTOffset#0)
						Case of 
							: (VSDateTOffset>0)
								VSDateF:=Current date:C33-VSDateTOffset
							: (VSDateTOffset>-100)
								//months
								VSDateT:=Add to date:C393(Current date:C33; 0; VSDateTOffset; 0)
							Else 
								//years
								VSDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVSDateT@"; True:C214)
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
					
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different sea"+"rch")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						Gen_Set_enterable($_bo_Enterable; ->vCompCode; ->Vtitle; ->VForeName; ->Vsurname; ->VJobTitle; ->Vstatus; ->Vtype_; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT; ->VCompName; ->Vtown)
						Gen_Set_enterable($_bo_Enterable; ->vCounty; ->vCountry; ->VStatus; ->VType; ->VSource; ->VContCode; ->Vrole; ->Vomit; ->VCharge; ->Vperson; ->vCalYr; ->vAccName; ->vAccName; ->vemail)
						Gen_Set_enterable($_bo_Enterable; ->vAnalysis; ->Vcomments; ->VPostCode; ->vProdCode; ->Varea; ->VSales; ->vTele; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1)
						Gen_Set_enterable($_bo_Enterable; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3)
						Gen_Set_enterable($_bo_Enterable; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						
						Gen_Set_enterable($_bo_Enterable; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						
					End if 
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for  "+$_t_ContextName+" search for this user to "+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							$_l_SearchID:=Sm_SetUserSearchPrefs(True:C214; $_l_TableNumber; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						If (ok=0)
							$_l_SearchID:=Sm_SetUserSearchPrefs(True:C214; $_l_TableNumber; <>PER_l_CurrentUserID; 0)
							
							
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vCompCode; ->Vtitle; ->VForeName; ->Vsurname; ->VJobTitle; ->Vstatus; ->Vtype_; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT; ->VCompName; ->Vtown)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vCounty; ->vCountry; ->VStatus; ->VType; ->VSource; ->VContCode; ->Vrole; ->Vomit; ->VCharge; ->Vperson; ->vCalYr; ->vAccName; ->vAccName; ->vemail)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vAnalysis; ->Vcomments; ->VPostCode; ->vProdCode; ->Varea; ->VSales; ->vTele; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vPersonName)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset)
					
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_TableNumber; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vCompCode; ->Vtitle; ->VForeName; ->Vsurname; ->VJobTitle; ->Vstatus; ->Vtype_; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT; ->VCompName; ->Vtown)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vCounty; ->vCountry; ->VStatus; ->VType; ->VSource; ->VContCode; ->Vrole; ->Vomit; ->VCharge; ->Vperson; ->vCalYr; ->vAccName; ->vAccName; ->vemail)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vAnalysis; ->Vcomments; ->VPostCode; ->vProdCode; ->Varea; ->VSales; ->vTele; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vPersonName)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset)
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
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oQueryDropDown"; $_t_oldMethodName)
