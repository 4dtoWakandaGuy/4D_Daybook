If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oQueryDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/07/2012 17:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_Enterable)
	C_DATE:C307(vDnDateF; vDnDateT; vIDateF; vIDateT; vRdDateF; vRdDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_OrderItemsTable; cNAA; cNAL; cSetAdd; cSetMod; cSIS; r0; r1; r2)
	C_LONGINT:C283(r3; r4; r5; r6; r7; SM_l_QueryMode; SM_l_ReturnQueryID; VDnDateFOffset; VDnDateTOffset; ViDateFOffset; ViDateTOffset)
	C_LONGINT:C283(VItemNum; VRdDateFOffset; VRdDateTOffset)
	C_REAL:C285(VamountF; VamountT; VMarginF; VMarginT)
	C_TEXT:C284($_t_ContextName; $_t_oldMethodName; $_t_SearchName; ACC_t_CurrencyCode; Varea; vCOntrCode; VInvNoF; VInvNoT; vItemRef; Vlayer; VOrderCode)
	C_TEXT:C284(vOrderNo; VProbCode; VProdCode; vProdName; VSales; VSerialNo; VSolCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].dItems_Sel.oQueryDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
$_l_OrderItemsTable:=Table:C252(->[ORDER_ITEMS:25])
$_t_ContextName:="Order Items"

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
					VRdDateFOffset:=0
					VDnDateFOffset:=0
					ViDateTOffset:=0
					VRdDateTOffset:=0
					VDnDateTOffset:=0
					
					SM_LoadSearchParameters(SM_al_SearchIDs{SM_at_SearchNames})
					If (VDnDateFOffset#0)
						Case of 
							: (VDnDateFOffset>0)
								vDnDateF:=Current date:C33-VDnDateFOffset
								OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
							: (VDnDateFOffset>-100)
								//months
								vDnDateF:=Add to date:C393(Current date:C33; 0; VDnDateFOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
							Else 
								//years
								vDnDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateFOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
						End case 
						
						
					End if 
					If (VDnDateTOffset#0)
						Case of 
							: (VDnDateTOffset>0)
								vDnDateF:=Current date:C33-VDnDateTOffset
								OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
							: (VDnDateTOffset>-100)
								//months
								vDnDateT:=Add to date:C393(Current date:C33; 0; VDnDateTOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
							Else 
								//years
								vDnDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateTOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
						End case 
						
						
					End if 
					
					
					If (ViDateFOffset#0)
						Case of 
							: (ViDateFOffset>0)
								vIDateF:=Current date:C33-ViDateFOffset
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
							: (ViDateFOffset>-100)
								//months
								vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
							Else 
								//years
								vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
						End case 
						
						
					End if 
					If (ViDateTOffset#0)
						Case of 
							: (ViDateTOffset>0)
								vIDateF:=Current date:C33-ViDateTOffset
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
							: (ViDateTOffset>-100)
								//months
								vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
							Else 
								//years
								vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
						End case 
						
						
					End if 
					If (VRdDateFOffset#0)
						Case of 
							: (VRdDateFOffset>0)
								vRdDateF:=Current date:C33-VRdDateFOffset
								OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
							: (VRdDateFOffset>-100)
								//months
								vRdDateF:=Add to date:C393(Current date:C33; 0; VRdDateFOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
							Else 
								//years
								vRdDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VRdDateFOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
						End case 
						
						
					End if 
					If (VRdDateTOffset#0)
						Case of 
							: (VRdDateTOffset>0)
								vRdDateF:=Current date:C33-VRdDateTOffset
								OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
							: (VRdDateTOffset>-100)
								//months
								vRdDateT:=Add to date:C393(Current date:C33; 0; VRdDateTOffset; 0)
								OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
							Else 
								//years
								vRdDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VRdDateTOffset)/100); 0; 0)
								OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
						End case 
						
						
					End if 
					
					If (SM_l_QueryMode#0)
						If (SM_l_ReturnQueryID>0)
							$_bo_Enterable:=False:C215
							Gen_Alert("This window will now not be further modifiable, unless you select a different sea"+"rch")
							
						Else 
							$_bo_Enterable:=True:C214
							
						End if 
						
						Gen_Set_enterable($_bo_Enterable; ->VOrderCode; ->VSolCode; ->VProdCode; ->vProdName; ->VSerialNo; ->VSales; ->VProbCode; ->VItemNum; ->vItemRef; ->VInvNoF; ->VInvNoT; ->ViDateF; ->ViDateT)
						Gen_Set_enterable($_bo_Enterable; ->VDNDateF; ->VDNDateT; ->VRdDateF; ->VRdDateT; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vOrderNo; ->vCOntrCode; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd)
						Gen_Set_enterable($_bo_Enterable; ->cSetMod; ->r0; ->r1; ->r2; ->r3; ->r4; ->r5; ->r6; ->r7; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer)
						
					End if 
					
				: (SM_al_SearchIDs{SM_at_SearchNames}=-99998)  //Set user default
					If (SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}<0)
						$_t_SearchName:=SM_at_SearchNames{Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))}
						Gen_Confirm("Set defaults for "+$_t_ContextName+" search for this user to"+$_t_SearchName+"?"; "Yes"; "No")
						If (ok=1)
							Sm_SetUserSearchPrefs(True:C214; $_l_OrderItemsTable; <>PER_l_CurrentUserID; Abs:C99(SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}))
							
							
							
							
							
						End if 
					Else 
						Gen_Confirm("Clear defaults for "+$_t_ContextName+" search for this user ?"; "No"; "Yes")
						
						If (ok=0)
							Sm_SetUserSearchPrefs(True:C214; $_l_OrderItemsTable; <>PER_l_CurrentUserID; 0)
							
							
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
								SM_LoadSearchParameterNames($_l_OrderItemsTable)
								
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
					
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VOrderCode; ->VSolCode; ->VProdCode; ->vProdName; ->VSerialNo; ->VSales; ->VProbCode; ->VItemNum; ->vItemRef; ->VInvNoF; ->VInvNoT; ->ViDateF; ->ViDateT)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VDNDateF; ->VDNDateT; ->VRdDateF; ->VRdDateT; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vOrderNo; ->vCOntrCode; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cSetMod; ->r0; ->r1; ->r2; ->r3; ->r4; ->r5; ->r6; ->r7; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer)
					SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ViDateFOffset; ->VRdDateFOffset; ->VDnDateFOffset; ->ViDateTOffset; ->VRdDateTOffset; ->VDnDateTOffset)
					SM_SaveSearchParameters(Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}); ""; $_l_OrderItemsTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
					SM_at_SearchNames:=Find in array:C230(SM_al_SearchIDs; Abs:C99(SM_al_SearchIDs{SM_at_SearchNames}))
					
				Else 
					//name the search parameters
					$_t_SearchName:=Gen_Request("Name This search"; "")
					If ($_t_SearchName#"")
						
						SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VOrderCode; ->VSolCode; ->VProdCode; ->vProdName; ->VSerialNo; ->VSales; ->VProbCode; ->VItemNum; ->vItemRef; ->VInvNoF; ->VInvNoT; ->ViDateF; ->ViDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VDNDateF; ->VDNDateT; ->VRdDateF; ->VRdDateT; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vOrderNo; ->vCOntrCode; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cSetMod; ->r0; ->r1; ->r2; ->r3; ->r4; ->r5; ->r6; ->r7; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ViDateFOffset; ->VRdDateFOffset; ->VDnDateFOffset; ->ViDateTOffset; ->VRdDateTOffset; ->VDnDateTOffset)
						SM_SaveSearchParameters(0; $_t_SearchName; $_l_OrderItemsTable; <>PER_l_CurrentUserID; ->SM_blb_SearchBlob)
						SM_LoadSearchParameterNames($_l_OrderItemsTable)
						SM_at_SearchNames:=Find in array:C230(SM_at_SearchNames; $_t_SearchName)
						SM_al_SearchIDs{Size of array:C274(SM_al_SearchIDs)-1}:=-SM_al_SearchIDs{SM_at_SearchNames}
						
						
					Else 
						SM_at_SearchNames:=0
						
						
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:dItems_Sel,SM_at_SearchNames"; $_t_oldMethodName)
