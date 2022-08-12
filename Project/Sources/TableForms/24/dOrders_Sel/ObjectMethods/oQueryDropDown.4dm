If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oQueryDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/07/2012 12:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_FromDates; 0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_Enterable)
	C_DATE:C307(ACC_d_EntryDateFrom; SRCH_d_EntryDateTo; vFDateF; vFDateT; vIDateF; vIDateT; vRDateF; vRDateT; VsDateF; VsDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_offset; $_l_OrdersTable; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; cNAA; cNAL; cSetAdd)
	C_LONGINT:C283(cSetMod; cSIS; SM_l_QueryMode; SM_l_ReturnQueryID; VfDateFOffset; VfDatetOffset; ViDateFOffset; ViDateTOffset; VRDateFOffset; VRDateTOffset; VsDateFOffset)
	C_LONGINT:C283(VsDatetOffset)
	C_REAL:C285(VamountF; VamountT; VMarginF; vMarginPF; vMarginPT; VMarginT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; Vanalysis; vArea; VattendType; VComments; VCompCode)
	C_TEXT:C284(VCompName; vContactName; VcontCode; vEnclosures; vEvent; VForename; vLayer; VorderCode; vOrderNo; vProdCode; VSales)
	C_TEXT:C284(Vsource; VSurname; vTele)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oQueryDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_OrdersTable:=Table:C252(->[ORDERS:24])
$_t_ContextName:="Orders"

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
					VSDateFOffset:=0
					ViDateFOffset:=0
					VFDateFOffset:=0
					VRDateFOffset:=0
					
					ACC_l_EntryDateToOffset:=0
					VSDateTOffset:=0
					ViDateTOffset:=0
					VFDateTOffset:=0
					VRDateTOffset:=0
					
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					If (ACC_l_PeriodFromOffset>0)
						
						QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
						If (Records in selection:C76([PERIODS:33])>0)
							SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
							SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
							If ($_l_offset<Size of array:C274($_ad_FromDates))
								ACC_t_PeriodFrom:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
							Else 
								ACC_t_PeriodFrom:=$_at_PeriodCodes{1}
							End if 
							
							OBJECT SET VISIBLE:C603(*; "ACC_t_PeriodTo@"; True:C214)
							If (ACC_l_PeriodToOffset>0)
								If (ACC_l_PeriodToOffset<Size of array:C274($_ad_FromDates))
									ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
								Else 
									ACC_t_PeriodTo:=$_at_PeriodCodes{1}
								End if 
								
								OBJECT SET VISIBLE:C603(*; "ACC_t_PeriodTo@"; True:C214)
								
							End if 
							
						End if 
						
					Else 
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
								
								OBJECT SET VISIBLE:C603(*; "ACC_t_PeriodTo@"; True:C214)
							End if 
						End if 
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
						OBJECT SET VISIBLE:C603(*; "oOrderDateT@"; True:C214)
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
						OBJECT SET VISIBLE:C603(*; "oOrderDateT@"; True:C214)
						
					End if 
					If (VsDateFOffset#0)
						Case of 
							: (VsDateFOffset>0)
								VsDateF:=Current date:C33-VsDateFOffset
							: (VsDateFOffset>-100)
								//months
								VsDateF:=Add to date:C393(Current date:C33; 0; VsDateFOffset; 0)
							Else 
								//years
								VsDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VsDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
					End if 
					If (VsDateTOffset#0)
						Case of 
							: (VsDateTOffset>0)
								VsDateF:=Current date:C33-VsDateTOffset
							: (VsDateTOffset>-100)
								//months
								VsDateT:=Add to date:C393(Current date:C33; 0; VsDateTOffset; 0)
							Else 
								//years
								VsDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VsDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oVsDateT@"; True:C214)
					End if 
					If (vIDateFOffset#0)
						Case of 
							: (vIDateFOffset>0)
								vIDateF:=Current date:C33-vIDateFOffset
							: (vIDateFOffset>-100)
								//months
								vIDateF:=Add to date:C393(Current date:C33; 0; vIDateFOffset; 0)
							Else 
								//years
								vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					End if 
					If (vIDateTOffset#0)
						Case of 
							: (vIDateTOffset>0)
								vIDateF:=Current date:C33-vIDateTOffset
							: (vIDateTOffset>-100)
								//months
								vIDateT:=Add to date:C393(Current date:C33; 0; vIDateTOffset; 0)
							Else 
								//years
								vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					End if 
					If (vFDateFOffset#0)
						Case of 
							: (vFDateFOffset>0)
								vFDateF:=Current date:C33-vFDateFOffset
							: (vFDateFOffset>-100)
								//months
								vFDateF:=Add to date:C393(Current date:C33; 0; vFDateFOffset; 0)
							Else 
								//years
								vFDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vFDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "ovFDateT@"; True:C214)
					End if 
					If (vFDateTOffset#0)
						Case of 
							: (vFDateTOffset>0)
								vFDateF:=Current date:C33-vFDateTOffset
							: (vFDateTOffset>-100)
								//months
								vFDateT:=Add to date:C393(Current date:C33; 0; vFDateTOffset; 0)
							Else 
								//years
								vFDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vFDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "ovFDateT@"; True:C214)
					End if 
					If (vRDateFOffset#0)
						Case of 
							: (vRDateFOffset>0)
								vRDateF:=Current date:C33-vRDateFOffset
							: (vRDateFOffset>-100)
								//months
								vRDateF:=Add to date:C393(Current date:C33; 0; vRDateFOffset; 0)
							Else 
								//years
								vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "ovRDateT@"; True:C214)
					End if 
					If (vRDateTOffset#0)
						Case of 
							: (vRDateTOffset>0)
								vRDateF:=Current date:C33-vRDateTOffset
							: (vRDateTOffset>-100)
								//months
								vRDateT:=Add to date:C393(Current date:C33; 0; vRDateTOffset; 0)
							Else 
								//years
								vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "ovRDateT@"; True:C214)
					End if 
					
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different sea"+"rch")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						
						Gen_Set_enterable($_bo_Enterable; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->ACC_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
						Gen_Set_enterable($_bo_Enterable; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->ACC_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
						Gen_Set_enterable($_bo_Enterable; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
						
					End if 
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" search for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_OrdersTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_OrdersTable; <>PER_l_CurrentUserID; 0)
							
							
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
								SM_LoadSearchParameterNames($_l_OrdersTable)
								
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->ACC_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->ACC_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ACC_l_EntryDateFromOffset; ->VSDateFOffset; ->ViDateFOffset; ->VFDateFOffset; ->VRDateFOffset; ->ACC_l_EntryDateToOffset; ->VSDateTOffset; ->ViDateTOffset; ->VFDateTOffset; ->VRDateTOffset)
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_OrdersTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->ACC_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->ACC_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ACC_l_EntryDateFromOffset; ->VSDateFOffset; ->ViDateFOffset; ->VFDateFOffset; ->VRDateFOffset; ->ACC_l_EntryDateToOffset; ->VSDateTOffset; ->ViDateTOffset; ->VFDateTOffset; ->VRDateTOffset)
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_OrdersTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_OrdersTable)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oQueryDropDown"; $_t_oldMethodName)
