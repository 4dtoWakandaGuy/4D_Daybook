If (False:C215)
	//object Name: Object Name:      DOC_AccessRights.oLBAccessRightsGroups
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/06/2012 21:41
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
	ARRAY LONGINT:C221($_al_PersonIDS; 0)
	//ARRAY LONGINT(DOC_al_GroupIDS;0)
	//ARRAY LONGINT(DOC_al_PersonIDS;0)
	C_BOOLEAN:C305(Doc_bo_RightsEdit)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_PersonIndex; $_l_PersonRow; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DOC_AccessRights/oLBAccessRightsGroups"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		
		Doc_bo_RightsEdit:=True:C214
		LISTBOX GET CELL POSITION:C971(DOC_lb_AccessRightsGroups; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)  //NO ACCESS
				If (DOC_abo_GroupNoAccess{$_l_Row})
					DOC_abo_GroupRunReport{$_l_Row}:=False:C215
					DOC_abo_GroupEditReport{$_l_Row}:=False:C215
					DOC_abo_GroupDeleteReport{$_l_Row}:=False:C215
					Gen_Confirm("Set all users in this group to no access?"; "Yes"; "No")
					If (OK=1)
						QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=DOC_al_GroupIDS{$_l_Row})
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=[PERSONNEL_GROUPS:92]Group_Code:1)
						SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS)
						For ($_l_PersonIndex; 1; Size of array:C274($_al_PersonIDS))
							$_l_PersonRow:=Find in array:C230(DOC_al_PersonIDS; $_al_PersonIDS{$_l_PersonIndex})
							If ($_l_PersonRow>0)
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=True:C214
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
							End if 
						End for 
						
					End if 
				Else 
					DOC_abo_GroupRunReport{$_l_Row}:=True:C214
					Gen_Confirm("Set the rights of all users in this group to Run Report?"; "Yes"; "No")
					If (OK=1)
						QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=DOC_al_GroupIDS{$_l_Row})
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=[PERSONNEL_GROUPS:92]Group_Code:1)
						SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS)
						For ($_l_PersonIndex; 1; Size of array:C274($_al_PersonIDS))
							$_l_PersonRow:=Find in array:C230(DOC_al_PersonIDS; $_al_PersonIDS{$_l_PersonIndex})
							If ($_l_PersonRow>0)
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=False:C215
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
							End if 
						End for 
						
					End if 
				End if 
				
			: ($_l_Column=3)  //RUN REPORT
				If (DOC_abo_GroupRunReport{$_l_Row})
					DOC_abo_GroupNoAccess{$_l_Row}:=False:C215
					Gen_Confirm("Set the rights of all users in this group to Run Report?"; "Yes"; "No")
					If (OK=1)
						QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=DOC_al_GroupIDS{$_l_Row})
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=[PERSONNEL_GROUPS:92]Group_Code:1)
						SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS)
						For ($_l_PersonIndex; 1; Size of array:C274($_al_PersonIDS))
							$_l_PersonRow:=Find in array:C230(DOC_al_PersonIDS; $_al_PersonIDS{$_l_PersonIndex})
							If ($_l_PersonRow>0)
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=False:C215
								DOC_abo_PersonRunReport{$_l_PersonRow}:=True:C214
							End if 
						End for 
						
					End if 
				End if 
			: ($_l_Column=4)  //EDIT REPORT
				If (DOC_abo_GroupEditReport{$_l_Row})
					DOC_abo_GroupNoAccess{$_l_Row}:=False:C215
					Gen_Confirm("Set the rights of all users in this group to Edit Report?"; "Yes"; "No")
					If (OK=1)
						QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=DOC_al_GroupIDS{$_l_Row})
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=[PERSONNEL_GROUPS:92]Group_Code:1)
						SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS)
						For ($_l_PersonIndex; 1; Size of array:C274($_al_PersonIDS))
							$_l_PersonRow:=Find in array:C230(DOC_al_PersonIDS; $_al_PersonIDS{$_l_PersonIndex})
							If ($_l_PersonRow>0)
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=False:C215
								DOC_abo_PersonEditReport{$_l_PersonRow}:=True:C214
							End if 
						End for 
						
					End if 
				End if 
				
			: ($_l_Column=4)  //DELETE REPORT
				If (DOC_abo_GroupDeleteReport{$_l_Row})
					DOC_abo_GroupNoAccess{$_l_Row}:=False:C215
					Gen_Confirm("Set the rights of all users in this group to Delete Report?"; "Yes"; "No")
					If (OK=1)
						QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=DOC_al_GroupIDS{$_l_Row})
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=[PERSONNEL_GROUPS:92]Group_Code:1)
						SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS)
						For ($_l_PersonIndex; 1; Size of array:C274($_al_PersonIDS))
							$_l_PersonRow:=Find in array:C230(DOC_al_PersonIDS; $_al_PersonIDS{$_l_PersonIndex})
							If ($_l_PersonRow>0)
								DOC_abo_PersonNoAccess{$_l_PersonRow}:=False:C215
								DOC_abo_PersonDeleteReport{$_l_PersonRow}:=True:C214
							End if 
						End for 
						
					End if 
					
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ DOC_AccessRights.oLBAccessRightsGroups"; $_t_oldMethodName)
