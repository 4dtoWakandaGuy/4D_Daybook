If (False:C215)
	//Project Form Method Name: DOC_AccessRights
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/06/2012 19:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_abo_GroupDeleteReport;0)
	//ARRAY BOOLEAN(DOC_abo_GroupEditReport;0)
	//ARRAY BOOLEAN(DOC_abo_GroupNoAccess;0)
	//ARRAY BOOLEAN(DOC_abo_GroupRunReport;0)
	//ARRAY BOOLEAN(DOC_abo_PersonDeleteReport;0)
	//ARRAY BOOLEAN(DOC_abo_PersonEditReport;0)
	//ARRAY BOOLEAN(DOC_abo_PersonNoAccess;0)
	//ARRAY BOOLEAN(DOC_abo_PersonRunReport;0)
	//ARRAY BOOLEAN(DOC_lb_AccessRightsGroups;0)
	//ARRAY BOOLEAN(DOC_lb_AccessRightsPersons;0)
	//ARRAY LONGINT(DOC_al_GroupAccessLevel;0)
	//ARRAY LONGINT(DOC_al_GroupIDS;0)
	//ARRAY LONGINT(DOC_Al_GroupsAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccessLevel;0)
	//ARRAY LONGINT(DOC_al_PersonIDS;0)
	//ARRAY TEXT(DOC_at_GroupName;0)
	//ARRAY TEXT(DOC_at_PersonNames;0)
	//ARRAY TEXT(DOC_at_usersgroups;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; Doc_bo_RightsEdit)
	C_LONGINT:C283($_l_event; $_l_GroupRow; $_l_Index; $_l_PersonRow; $_l_SizeofArray; D2OC_l_BUT1; D2OC_l_BUT10; D2OC_l_BUT11; D2OC_l_BUT12; D2OC_l_BUT2; D2OC_l_BUT3)
	C_LONGINT:C283(D2OC_l_BUT4; D2OC_l_BUT5; D2OC_l_BUT6; D2OC_l_BUT7; D2OC_l_BUT8; D2OC_l_BUT9; DOC_l_BUT1; DOC_l_BUT10; DOC_l_BUT11; DOC_l_BUT12; DOC_l_BUT2)
	C_LONGINT:C283(DOC_l_BUT3; DOC_l_BUT4; DOC_l_BUT5; DOC_l_BUT6; DOC_l_BUT7; DOC_l_BUT8; DOC_l_BUT9)
	C_TEXT:C284($_t_CurrentDocument; $_t_oldMethodName; DOC_t_CurrentDocument; oD20C_HED11; oD2OC_COL1; oD2OC_COL10; oD2OC_COL11; oD2OC_COL12; oD2OC_COL2; oD2OC_COL3; oD2OC_COL4)
	C_TEXT:C284(oD2OC_COL5; oD2OC_COL6; oD2OC_COL7; oD2OC_COL8; oD2OC_COL9; oD2OC_HED1; oD2OC_HED10; oD2OC_HED12; oD2OC_HED2; oD2OC_HED3; oD2OC_HED4)
	C_TEXT:C284(oD2OC_HED5; oD2OC_HED6; oD2OC_HED7; oD2OC_HED8; oD2OC_HED9; oDOC_COL1; oDOC_COL10; oDOC_COL11; oDOC_COL12; oDOC_COL2; oDOC_COL3)
	C_TEXT:C284(oDOC_COL4; oDOC_COL5; oDOC_COL6; oDOC_COL7; oDOC_COL8; oDOC_COL9; oDOC_HED1; oDOC_HED10; oDOC_HED11; oDOC_HED12; oDOC_HED2)
	C_TEXT:C284(oDOC_HED3; oDOC_HED4; oDOC_HED5; oDOC_HED6; oDOC_HED7; oDOC_HED8; oDOC_HED9)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/DOC_AccessRights/{formMethod}"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		Doc_bo_RightsEdit:=False:C215
		ARRAY TEXT:C222(DOC_at_usersgroups; 2)
		DOC_at_usersgroups{1}:="Persons"
		DOC_at_usersgroups{2}:="Groups"
		ALL RECORDS:C47([PERSONNEL_GROUPS:92])
		SELECTION TO ARRAY:C260([PERSONNEL_GROUPS:92]x_ID:12; DOC_al_GroupIDS; [PERSONNEL_GROUPS:92]Group_Name:2; DOC_at_GroupName)
		
		SORT ARRAY:C229(DOC_at_GroupName; DOC_al_GroupIDS)
		$_l_SizeofArray:=Size of array:C274(DOC_al_GroupIDS)
		ARRAY BOOLEAN:C223(DOC_abo_GroupNoAccess; 0)
		ARRAY BOOLEAN:C223(DOC_abo_GroupRunReport; 0)
		ARRAY BOOLEAN:C223(DOC_abo_GroupEditReport; 0)
		ARRAY BOOLEAN:C223(DOC_abo_GroupDeleteReport; 0)
		ARRAY BOOLEAN:C223(DOC_abo_GroupNoAccess; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(DOC_abo_GroupRunReport; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(DOC_abo_GroupEditReport; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(DOC_abo_GroupDeleteReport; $_l_SizeofArray)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; DOC_al_PersonIDS; [PERSONNEL:11]Name:2; DOC_at_PersonNames)
		SORT ARRAY:C229(DOC_at_PersonNames; DOC_al_PersonIDS)
		$_l_SizeofArray:=Size of array:C274(DOC_al_PersonIDS)
		ARRAY BOOLEAN:C223(DOC_abo_PersonNoAccess; 0)
		ARRAY BOOLEAN:C223(DOC_abo_PersonRunReport; 0)
		ARRAY BOOLEAN:C223(DOC_abo_PersonEditReport; 0)
		ARRAY BOOLEAN:C223(DOC_abo_PersonDeleteReport; 0)
		ARRAY BOOLEAN:C223(DOC_abo_PersonNoAccess; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(DOC_abo_PersonRunReport; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(DOC_abo_PersonEditReport; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(DOC_abo_PersonDeleteReport; $_l_SizeofArray)
		If (DOC_t_CurrentDocument#"")
			DOC_LoadAccess(DOC_t_CurrentDocument)
			$_t_CurrentDocument:=DOC_t_CurrentDocument
		Else 
			DOC_LoadAccess([DOCUMENTS:7]Document_Code:1)
			$_t_CurrentDocument:=[DOCUMENTS:7]Document_Code:1
		End if 
		SET WINDOW TITLE:C213("Access for :"+$_t_CurrentDocument)
		If (Size of array:C274(DOC_Al_GroupsAccess)>0)
			For ($_l_Index; 1; Size of array:C274(DOC_Al_GroupsAccess))
				$_l_GroupRow:=Find in array:C230(DOC_al_GroupIDS; DOC_Al_GroupsAccess{$_l_Index})
				If ($_l_GroupRow>0)
					If (DOC_al_GroupAccessLevel{$_l_Index}>0)
						Case of 
							: (DOC_al_GroupAccessLevel{$_l_Index}=1)
								DOC_abo_GroupNoAccess{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=2)
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=3)
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupNoAccess{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=4)
								DOC_abo_GroupEditReport{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=5)  //IMPOSSIBLE
								
								DOC_abo_GroupEditReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupNoAccess{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=6)
								DOC_abo_GroupEditReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=7)  //IMPOSSIBLE
								
								DOC_abo_GroupEditReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupNoAccess{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=8)
								DOC_abo_GroupDeleteReport{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=9)  //IMPOSSIBLE
								
								DOC_abo_GroupDeleteReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupNoAccess{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=10)
								DOC_abo_GroupDeleteReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=11)  //IMPOSSIBLE
								
								DOC_abo_GroupDeleteReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupNoAccess{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=12)
								DOC_abo_GroupDeleteReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupEditReport{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=13)  //IMPOSSIBLE
								
								DOC_abo_GroupDeleteReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupEditReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupNoAccess{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=14)
								DOC_abo_GroupDeleteReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupEditReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
							: (DOC_al_GroupAccessLevel{$_l_Index}=15)  //IMPOSSIBLE
								
								DOC_abo_GroupDeleteReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupEditReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
								DOC_abo_GroupNoAccess{$_l_GroupRow}:=True:C214
							Else 
								DOC_abo_GroupRunReport{$_l_GroupRow}:=True:C214
						End case 
						//THE ONES MARKTED IMPOSSIBLE ARE BECAUSE IF THE USER HAS NO ACESS THEY CANT RUN EDIT OR DELETE THE REPORT
					End if 
				End if 
				
			End for 
		Else 
			For ($_l_Index; 1; Size of array:C274(DOC_al_GroupIDS))
				DOC_abo_GroupRunReport{$_l_Index}:=True:C214
				Doc_bo_RightsEdit:=True:C214
			End for 
		End if 
		If (Size of array:C274(DOC_al_PersonAccessLevel)>0)
			For ($_l_Index; 1; Size of array:C274(DOC_al_PersonAccessLevel))
				$_l_PersonRow:=Find in array:C230(DOC_al_PersonIDS; DOC_al_PersonAccess{$_l_Index})
				If ($_l_PersonRow>0)
					If (DOC_al_PersonAccessLevel{$_l_Index}>0)
						Case of 
							: (DOC_al_PersonAccessLevel{$_l_Index}=1)
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=2)
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=3)
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=4)
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=5)  //IMPOSSIBLE
								
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=6)
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=7)  //IMPOSSIBLE
								
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=8)
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=9)  //IMPOSSIBLE
								
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=10)
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=11)  //IMPOSSIBLE
								
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=12)
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=13)  //IMPOSSIBLE
								
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=14)
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
							: (DOC_al_PersonAccessLevel{$_l_Index}=15)  //IMPOSSIBLE
								
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
							Else 
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
						End case 
						//THE ONES MARKTED IMPOSSIBLE ARE BECAUSE IF THE USER HAS NO ACESS THEY CANT RUN EDIT OR DELETE THE REPORT
					End if 
				End if 
			End for 
		Else 
			For ($_l_Index; 1; Size of array:C274(DOC_al_PersonIDS))
				DOC_abo_PersonRunReport{$_l_Index}:=True:C214
				Doc_bo_RightsEdit:=True:C214
			End for 
		End if 
		
		LB_SetupListbox(->DOC_lb_AccessRightsPersons; "oDOC"; "DOC_L"; 1; ->DOC_at_PersonNames; ->DOC_abo_PersonNoAccess; ->DOC_abo_PersonRunReport; ->DOC_abo_PersonEditReport; ->DOC_abo_PersonDeleteReport; ->DOC_al_PersonIDS)
		LB_SetColumnHeaders(->DOC_lb_AccessRightsPersons; "DOC_L"; 1; "Person"; "No Access"; "Run Report"; "Edit Report"; "Delete Report"; "")
		LB_SetColumnWidths(->DOC_lb_AccessRightsPersons; "oDOC"; 1; 140; 80; 80; 80; 80; 0)
		LB_SetScroll(->DOC_lb_AccessRightsPersons; -2; -2)
		LB_SetEnterable(->DOC_lb_AccessRightsPersons; False:C215; 0; "")
		LB_SetEnterable(->DOC_lb_AccessRightsPersons; True:C214; 2; "")
		LB_SetEnterable(->DOC_lb_AccessRightsPersons; True:C214; 3; "")
		LB_SetEnterable(->DOC_lb_AccessRightsPersons; True:C214; 4; "")
		LB_SetEnterable(->DOC_lb_AccessRightsPersons; True:C214; 5; "")
		LBi_InclSetupJustStyle(->DOC_lb_AccessRightsPersons)
		
		LB_SetupListbox(->DOC_lb_AccessRightsGroups; "oD2OC"; "D2OC_L"; 1; ->DOC_at_GroupName; ->DOC_abo_GroupNoAccess; ->DOC_abo_GroupRunReport; ->DOC_abo_GroupEditReport; ->DOC_abo_GroupDeleteReport; ->DOC_al_GroupIDS)
		LB_SetColumnHeaders(->DOC_lb_AccessRightsGroups; "D2OC_L"; 1; "Person"; "No Access"; "Run Report"; "Edit Report"; "Delete Report")
		LB_SetColumnWidths(->DOC_lb_AccessRightsGroups; "oD2OC"; 1; 140; 80; 80; 80; 80; 0)
		LB_SetScroll(->DOC_lb_AccessRightsGroups; -2; -2)
		LB_SetEnterable(->DOC_lb_AccessRightsGroups; False:C215; 0; "")
		LB_SetEnterable(->DOC_lb_AccessRightsGroups; True:C214; 2; "")
		LB_SetEnterable(->DOC_lb_AccessRightsGroups; True:C214; 3; "")
		LB_SetEnterable(->DOC_lb_AccessRightsGroups; True:C214; 4; "")
		LB_SetEnterable(->DOC_lb_AccessRightsGroups; True:C214; 5; "")
		
		LBi_InclSetupJustStyle(->DOC_lb_AccessRightsGroups)
		
		DOC_at_usersgroups:=1
		OBJECT SET VISIBLE:C603(*; "oLBAccessRightsGroups"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oLBAccessRights"; True:C214)
		
End case 
ERR_MethodTrackerReturn("FM DOC_AccessRights"; $_t_oldMethodName)
