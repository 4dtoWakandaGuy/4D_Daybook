If (False:C215)
	//object Name: [ORDERS]Orders_Out.Variable72
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(cNAA)
	//C_UNKNOWN(cNAL)
	//C_UNKNOWN(cSetAdd)
	//C_UNKNOWN(cSetMod)
	//C_UNKNOWN(cSIS)
	//C_UNKNOWN(VamountF)
	//C_UNKNOWN(VamountT)
	//C_UNKNOWN(Vanalysis)
	//C_UNKNOWN(vArea)
	//C_UNKNOWN(VattendType)
	//C_UNKNOWN(VComments)
	//C_UNKNOWN(VCompCode)
	//C_UNKNOWN(VcontCode)
	//C_UNKNOWN(vEnclosures)
	//C_UNKNOWN(vEvent)
	//C_UNKNOWN(VFDateF)
	//C_UNKNOWN(VFDateT)
	//C_UNKNOWN(VForename)
	//C_UNKNOWN(viDateF)
	//C_UNKNOWN(ViDateT)
	//C_UNKNOWN(vLayer)
	//C_UNKNOWN(VMarginF)
	//C_UNKNOWN(vMarginPF)
	//C_UNKNOWN(vMarginPT)
	//C_UNKNOWN(VMarginT)
	//C_UNKNOWN(VorderCode)
	//C_UNKNOWN(vOrderNo)
	//C_UNKNOWN(vProdCode)
	//C_UNKNOWN(VRDateF)
	//C_UNKNOWN(VRDateT)
	//C_UNKNOWN(VSales)
	//C_UNKNOWN(VsDateF)
	//C_UNKNOWN(VsDateT)
	//C_UNKNOWN(Vsource)
	//C_UNKNOWN(vTele)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305(ORD_bo_UnfilteredSetKnown; $_bo_Enterable; ORD_bo_UnfilteredSetKnown)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; VFDateF; VFDateT; viDateF; ViDateT; VRDateF; VRDateT; VsDateF; VsDateT; $_d_DateF)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_LONGINT:C283($_l_Days; $_l_event; $_l_OrdersTable; $_l_QueryRow; cNAA; cNAL; cSetAdd; cSetMod; cSIS; ORD_l_ContextualDays; SM_l_ReturnQueryID)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_Days; $_l_event; $_l_OrdersTable; $_l_QueryRow; ORD_l_ContextualDays; ORD_l_SetID; SM_l_QueryMode; SM_l_ReturnQueryID)
	C_POINTER:C301($_Ptr_Table)
	C_REAL:C285(VamountF; VamountT; VMarginF; vMarginPF; vMarginPT; VMarginT)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchName; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; Vanalysis; vArea; VattendType; VComments; VCompCode; VcontCode)
	C_TEXT:C284(vEnclosures; vEvent; VForename; vLayer; VorderCode; vOrderNo; vProdCode; VSales; Vsource; vTele; $_t_ContextName)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchName; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VCompName; VSurname)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.Variable72"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_OrdersTable:=Table:C252(->[ORDERS:24])
$_t_ContextName:="Orders"
$_Ptr_Table:=->[ORDERS:24]

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
					//if(vIDateF
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different fil"+"ter")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						
						Gen_Set_enterable($_bo_Enterable; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
						Gen_Set_enterable($_bo_Enterable; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->SRCH_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
						Gen_Set_enterable($_bo_Enterable; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
					Else 
						If (Not:C34(ORD_bo_UnfilteredSetKnown))
							//Remember the current selection
							ORD_l_SetID:=0
							ORD_l_SetID:=AA_GetNextID(->ORD_l_SetID)
							CREATE SET:C116([ORDERS:24]; "OrdSelection"+String:C10(ORD_l_SetID))
							ORD_bo_UnfilteredSetKnown:=True:C214
							
						Else 
							USE SET:C118("OrdSelection"+String:C10(Ord_l_SetID))
						End if 
						If (ORD_l_ContextualDays>0)
							If (vIDateF=!00-00-00!)
								vIDateF:=Current date:C33(*)-ORD_l_ContextualDays
							End if 
						End if 
						SRCH_Applyfilterstoselection($_Ptr_Table)
					End if 
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_l_QueryRow:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
						
						$_t_SearchName:=SM_at_SearchNames{$_l_QueryRow}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" filter for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_OrdersTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}); 2)
							
							
							SM_at_SearchNames:=0
							
							
						End if 
						If (Not:C34(ORD_bo_UnfilteredSetKnown))
							//Remember the current selection
							ORD_l_SetID:=0
							ORD_l_SetID:=AA_GetNextID(->ORD_l_SetID)
							CREATE SET:C116([ORDERS:24]; "OrdSelection"+String:C10(ORD_l_SetID))
							ORD_bo_UnfilteredSetKnown:=True:C214
							
						Else 
							USE SET:C118("OrdSelection"+String:C10(Ord_l_SetID))
						End if 
						
						SRCH_Applyfilterstoselection($_Ptr_Table)
						SM_at_SearchNames:=$_l_QueryRow
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" filter for this user ?"; "No"; "Yes")
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_OrdersTable; <>PER_l_CurrentUserID; 0; 2)
							
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
								Gen_Alert("This filter can only be deleted by the administrator")
							Else 
								DB_DeletionControl(->[x_QUERY_PARAMETERS:134])
								
								DELETE RECORD:C58([x_QUERY_PARAMETERS:134])
								READ ONLY:C145([x_QUERY_PARAMETERS:134])
								//and reload--note not generic
								SM_LoadSearchParameterNames($_l_OrdersTable; 1; 2)
								SM_at_SearchNames:=0
							End if 
							
							
						End if 
					End if 
					SM_at_SearchNames:=0
				: (SM_al_SearchIDs{SM_at_SearchNames}<-99997)  //SEPERATOR
					SM_at_SearchNames:=0
					
				: (SM_al_SearchIDs{SM_at_SearchNames}<0)  //Resave
					//resave parameters
					//might want a save as option here
					$_d_DateF:=vIDateF
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (ORD_l_ContextualDays=0)
						If (vIDateF#!00-00-00!)
							Gen_Confirm("Save the date as contextual to the current date?"; "Yes"; "No")
							If (OK=1)
								$_l_Days:=Current date:C33(*)-vIDateF
								$_l_Days:=Num:C11(Gen_Request("Date is current date minus how many days"; String:C10($_l_Days)))
								ORD_l_ContextualDays:=$_l_Days
								vIDateF:=!00-00-00!
							Else 
								ORD_l_ContextualDays:=0
							End if 
						End if 
					Else 
						If ((Current date:C33(*)-ORD_l_ContextualDays)#vIDateF)
							//Date changed manually
							
							Gen_Confirm("Change  the  contextual number of days?"; "Yes"; "No")
							If (OK=1)
								$_l_Days:=Current date:C33(*)-vIDateF
								$_l_Days:=Num:C11(Gen_Request("Date is current date minus how many days"; String:C10($_l_Days)))
								ORD_l_ContextualDays:=$_l_Days
								vIDateF:=!00-00-00!
							Else 
								vIDateF:=!00-00-00!
							End if 
							
						End if 
					End if 
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->SRCH_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ORD_l_ContextualDays)
					
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_OrdersTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob; 2)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					vIDateF:=$_d_DateF
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This filter"; "")
					If ($_t_SearchName#"")
						If (ORD_l_ContextualDays=0)
							If (vIDateF#!00-00-00!)
								Gen_Confirm("Save the date as contextual to the current date?"; "Yes"; "No")
								If (OK=1)
									$_l_Days:=Current date:C33(*)-vIDateF
									$_l_Days:=Num:C11(Gen_Request("Date is current date minus how many days"; String:C10($_l_Days)))
									ORD_l_ContextualDays:=$_l_Days
									vIDateF:=!00-00-00!
								Else 
									ORD_l_ContextualDays:=0
								End if 
							End if 
						Else 
							If ((Current date:C33(*)-ORD_l_ContextualDays)#vIDateF)
								//Date changed manually
								
								Gen_Confirm("Change  the  contextual number of days?"; "Yes"; "No")
								If (OK=1)
									$_l_Days:=Current date:C33(*)-vIDateF
									$_l_Days:=Num:C11(Gen_Request("Date is current date minus how many days"; String:C10($_l_Days)))
									ORD_l_ContextualDays:=$_l_Days
									vIDateF:=!00-00-00!
								Else 
									vIDateF:=!00-00-00!
								End if 
								
							End if 
						End if 
						
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->SRCH_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ORD_l_ContextualDays)
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_OrdersTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob; 2)
						SM_LoadSearchParameterNames($_l_OrdersTable; 1; 2)
						If (Find in array:C230(SM_at_SearchNames; $_t_SearchName)>0)
							SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
							SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						End if 
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.Variable72"; $_t_oldMethodName)
