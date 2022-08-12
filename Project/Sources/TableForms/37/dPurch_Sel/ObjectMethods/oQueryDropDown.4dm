If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.oQueryDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/07/2012 20:34
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
	C_DATE:C307(vIDateF; vIDateT; vPDateF; vPDateT; vRDateF; vRDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_offset; $_l_PurchaseOrdersTable; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; CH0; CH1; cNAA; cNAL; cSIS)
	C_LONGINT:C283(R0; R1; SM_l_QueryMode; SM_l_ReturnQueryID; ViDateFOffset; ViDateTOffset; VPDateFOffset; VPDateTOffset; VRDateFOffset; VRDateTOffset)
	C_REAL:C285(vInvF; vinvT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalysis; VCompCode; VCompName; VCOmpNameC; vContCode)
	C_TEXT:C284(vEvent; VforeName; VLayer; VorderNo; VProdCode; VPurchCode; VPurchInvNo; Vsurname)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].dPurch Sel.oQueryDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_PurchaseOrdersTable:=Table:C252(->[PURCHASE_ORDERS:57])
$_t_ContextName:="Purchase orders"

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
					
					VIDateFOffset:=0
					VPDateFOffset:=0
					VRDateFOffset:=0
					
					ViDateTOffset:=0
					VPDateTOffset:=0
					VRDateTOffset:=0
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
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
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
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
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					End if 
					If (vPDateFOffset#0)
						Case of 
							: (vPDateFOffset>0)
								vPDateF:=Current date:C33-vPDateFOffset
							: (vPDateFOffset>-100)
								//months
								vPDateF:=Add to date:C393(Current date:C33; 0; vPDateFOffset; 0)
							Else 
								//years
								vPDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateFOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					End if 
					If (vPDateTOffset#0)
						Case of 
							: (vPDateTOffset>0)
								vPDateF:=Current date:C33-vPDateTOffset
							: (vPDateTOffset>-100)
								//months
								vPDateT:=Add to date:C393(Current date:C33; 0; vPDateTOffset; 0)
							Else 
								//years
								vPDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateTOffset)/100); 0; 0)
						End case 
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
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
						OBJECT SET VISIBLE:C603(*; "oDueDateT@"; True:C214)
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
						OBJECT SET VISIBLE:C603(*; "oDueDateT@"; True:C214)
					End if 
					
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
							
							OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
							If (ACC_l_PeriodToOffset>0)
								If (ACC_l_PeriodToOffset<Size of array:C274($_ad_FromDates))
									ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
								Else 
									ACC_t_PeriodTo:=$_at_PeriodCodes{1}
								End if 
								
								OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
								
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
								
								OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
							End if 
						End if 
					End if 
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different sea"+"rch")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						Gen_Set_enterable($_bo_Enterable; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
						
					End if 
					
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" search for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_PurchaseOrdersTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_PurchaseOrdersTable; <>PER_l_CurrentUserID; 0)
							
							
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
								SM_LoadSearchParameterNames($_l_PurchaseOrdersTable)
								
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->vEvent; ->VIDateFOffset; ->VPDateFOffset; ->VRDateFOffset; ->ViDateTOffset; ->VPDateTOffset; ->VRDateTOffset)
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset)
					
					
					
					
					
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_PurchaseOrdersTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->vEvent)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->VIDateFOffset; ->VPDateFOffset; ->VRDateFOffset; ->ViDateTOffset; ->VPDateTOffset; ->VRDateTOffset)
						
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_PurchaseOrdersTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_PurchaseOrdersTable)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].dPurch Sel.oQueryDropDown"; $_t_oldMethodName)
