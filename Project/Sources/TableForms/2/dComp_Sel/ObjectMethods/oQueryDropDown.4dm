If (False:C215)
	//object Name: [COMPANIES]dComp_Sel.oQueryDropDown
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
	C_DATE:C307(ACC_d_EntryDateFrom; SRCH_d_EntryDateTo; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1; vDateT2; vDateT3; vDateT4)
	C_DATE:C307(vDateT5; VDoDateF; VDoDateT; VfDateF; VfDateT; VSDateF; VSDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_TableNumber; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ch1; cNAA; cNAL; cSetAdd; cSetMod; cSIS)
	C_LONGINT:C283(SM_l_QueryMode; SM_l_ReturnQueryID; vAct1; vAct2; vAct3; vAct4; vAct5; VDoDateFOffset; VDoDatetOffset; VfDateFOffset; VfDatetOffset)
	C_LONGINT:C283(vNo1; vNo2; vNo3; vNo4; vNo5; VrStateL; VsDateFOffset; VsDatetOffset)
	C_REAL:C285(VDiscountF; vDiscountT; VValueF; VvalueT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; Varea; VComments; VcompCode; vCompName; vContrCode; VCountry; VCounty; vDesc1)
	C_TEXT:C284(vDesc2; vDesc3; vDesc4; vDesc5; VLocation; VOmit; VpostCode; vProbCode; VProdCode; vrstate; Vsales)
	C_TEXT:C284(Vsource; Vstatus; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vSubGroup5; VSuperior; Vtel; Vtele; vTitle1)
	C_TEXT:C284(vTitle2; vTitle3; vTitle4; vTitle5; Vtown; Vtype)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dComp_Sel.oQueryDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_TableNumber:=Table:C252(->[COMPANIES:2])
$_t_ContextName:="Companies"
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
					VSDateFOffset:=0
					VDoDateFOffset:=0
					VfDatetOffset:=0
					VDoDatetOffset:=0
					
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
								ACC_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateFromOffset
							: (ACC_l_EntryDateFromOffset>-100)
								//months
								ACC_d_EntryDateFrom:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateFromOffset; 0)
							Else 
								//years
								ACC_d_EntryDateFrom:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateFromOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
					End if 
					If (ACC_l_EntryDateToOffset#0)
						Case of 
							: (ACC_l_EntryDateToOffset>0)
								ACC_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateToOffset
							: (ACC_l_EntryDateToOffset>-100)
								//months
								SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateToOffset; 0)
							Else 
								//years
								SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateToOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVeDateT@"; True:C214)
					End if 
					If (VfDateFOffset#0)
						Case of 
							: (VfDateFOffset>0)
								VfDateF:=Current date:C33-VfDateFOffset
							: (VfDateFOffset>-100)
								//months
								VfDateF:=Add to date:C393(Current date:C33; 0; VfDateFOffset; 0)
							Else 
								//years
								VfDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
					End if 
					If (VfDateTOffset#0)
						Case of 
							: (VfDateTOffset>0)
								VfDateF:=Current date:C33-VfDateTOffset
							: (VfDateTOffset>-100)
								//months
								VfDateT:=Add to date:C393(Current date:C33; 0; VfDateTOffset; 0)
							Else 
								//years
								VfDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVfDateT@"; True:C214)
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
						Gen_Set_enterable($_bo_Enterable; ->vrstate; ->VrStateL; ->VcompCode; ->vCompName; ->Vtown; ->VCounty; ->VCountry; ->Vstatus; ->Vtype; ->Vsource; ->VDiscountF)
						Gen_Set_enterable($_bo_Enterable; ->vDiscountT; ->VValueF; ->VvalueT; ->ACC_d_EntryDateFrom; ->VSDateT; ->VFDateT; ->VComments; ->VProdCode; ->vDoDateF; ->VDoDateT)
						Gen_Set_enterable($_bo_Enterable; ->VSuperior; ->VpostCode; ->Vtel; ->Varea; ->Vsales; ->Vtele; ->VOmit; ->VLocation; ->vProbCode; ->vContrCode; ->cSIS; ->cNAA)
						Gen_Set_enterable($_bo_Enterable; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2)
						Gen_Set_enterable($_bo_Enterable; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4)
						Gen_Set_enterable($_bo_Enterable; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						
					End if 
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for   "+$_t_ContextName+" search for this user to "+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_TableNumber; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for  "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vrstate; ->VrStateL; ->VcompCode; ->vCompName; ->Vtown; ->VCounty; ->VCountry; ->Vstatus; ->Vtype; ->Vsource; ->VDiscountF)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDiscountT; ->VValueF; ->VvalueT; ->ACC_d_EntryDateFrom; ->VSDateT; ->VFDateT; ->VComments; ->VProdCode; ->vDoDateF; ->VDoDateT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VSuperior; ->VpostCode; ->Vtel; ->Varea; ->Vsales; ->Vtele; ->VOmit; ->VLocation; ->vProbCode; ->vContrCode; ->cSIS; ->cNAA)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset; ->VSDateFOffset; ->VDoDateFOffset; ->VfDatetOffset; ->VDoDatetOffset)
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_TableNumber; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vrstate; ->VrStateL; ->VcompCode; ->vCompName; ->Vtown; ->VCounty; ->VCountry; ->Vstatus; ->Vtype; ->Vsource; ->VDiscountF)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDiscountT; ->VValueF; ->VvalueT; ->ACC_d_EntryDateFrom; ->VSDateT; ->VFDateT; ->VComments; ->VProdCode; ->vDoDateF; ->VDoDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VSuperior; ->VpostCode; ->Vtel; ->Varea; ->Vsales; ->Vtele; ->VOmit; ->VLocation; ->vProbCode; ->vContrCode; ->cSIS; ->cNAA)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset; ->VSDateFOffset; ->VDoDateFOffset; ->VfDatetOffset; ->VDoDatetOffset)
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
ERR_MethodTrackerReturn("OBJ [COMPANIES].dComp_Sel.oQueryDropDown"; $_t_oldMethodName)
