If (False:C215)
	//object Name: [USER]User_In.oSinglePasswordField
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_abo_UserAdministrator;0)
	//ARRAY BOOLEAN(DB_abo_Usergetswrite;0)
	//ARRAY BOOLEAN(DB_abo_UserisDesigner;0)
	//ARRAY BOOLEAN(DB_abo_UserIsManager;0)
	//ARRAY BOOLEAN(DB_abo_UserisUser;0)
	//ARRAY LONGINT(<>PW_al_4DGroupIDs;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsBinaries;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsINC;0)
	ARRAY LONGINT:C221($_al_PersonnelIDS; 0)
	//ARRAY LONGINT(DB_al_UserGroups;0)
	//ARRAY LONGINT(DB_al_UserIDS;0)
	//ARRAY TEXT(<>PW_at_4DUserGroups;0)
	ARRAY TEXT:C222($_at_PersonNames; 0)
	//ARRAY TEXT(DB_at_UserNames;0)
	C_BOOLEAN:C305(<>PW_Bo_WindowsAutoLogin; $_bo_GroupSet; $_bo_NoPassword; $_bo_Save; $_bo_Vis; pw_bo_save)
	C_LONGINT:C283($_l_AdministratorRow; $_l_ArraySize; $_l_BinaryNumber; $_l_CurrentWinRefOLD; $_L_DesignerRow; $_l_event; $_l_GroupsIndex; $_l_Index; $_l_ManagerRow; $_l_ObjectBottom; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectTop; $_l_PersonRow; $_l_Settings; $_l_UserRow; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WPRow; PW_l_WindowsAutoLogin)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oSinglePasswordField"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (Current user:C182="ADMINISTRATOR")
			$_bo_Vis:=[USER:15]SinglePWsystem:235
			If ($_bo_Vis)
				READ WRITE:C146([PERSONNEL:11])
				ARRAY LONGINT:C221($_al_PersonnelIDS; 0)
				ARRAY TEXT:C222($_at_PersonNames; 0)
				ALL RECORDS:C47([PERSONNEL:11])
				$_bo_NoPassword:=False:C215
				For ($_l_Index; 1; Records in selection:C76([PERSONNEL:11]))
					$_bo_Save:=False:C215
					If ([PERSONNEL:11]Personnel_ID:48=0)
						[PERSONNEL:11]Personnel_ID:48:=AA_GetNextID(->[PERSONNEL:11]Personnel_ID:48)
						$_bo_Save:=True:C214
					End if 
					Repeat 
						$_l_PersonRow:=Find in array:C230($_al_PersonnelIDS; [PERSONNEL:11]Personnel_ID:48)
						If ($_l_PersonRow>0)
							[PERSONNEL:11]Personnel_ID:48:=AA_GetNextID(->[PERSONNEL:11]Personnel_ID:48)
						End if 
					Until ($_l_PersonRow<0)
					APPEND TO ARRAY:C911($_al_PersonnelIDS; [PERSONNEL:11]Personnel_ID:48)
					$_l_PersonRow:=Find in array:C230($_at_PersonNames; [PERSONNEL:11]Name:2)
					If ($_l_PersonRow>0)
						Gen_Alert("THERE ARE 2 PEOPLE WITH THE NAME "+[PERSONNEL:11]Name:2+" This must be resolved before this can be turned on")
						$_bo_Vis:=False:C215
						[USER:15]SinglePWsystem:235:=False:C215
					End if 
					APPEND TO ARRAY:C911($_at_PersonNames; [PERSONNEL:11]Name:2)
					If ([PERSONNEL:11]Person_Identity:13="")
						$_bo_NoPassword:=True:C214
						//Gen_Alert ("There are users with no password, you will probably wish to set passwords for security")
					End if 
					DB_SaveRecord(->[PERSONNEL:11])
					
					NEXT RECORD:C51([PERSONNEL:11])
				End for 
				If ($_bo_NoPassword)
					Gen_Alert("There are users with no password, you will probably wish to set passwords for security")
				End if 
				ARRAY TEXT:C222(<>PW_at_4DUserGroups; 0)
				ARRAY LONGINT:C221(<>PW_al_4DGroupIDs; 0)
				ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; 0)
				//PW_CHECKUSERS
				PW_CHECKGROUPS
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=0; *)
				QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214)
				
				
				SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; DB_al_UserIDS; [PERSONNEL:11]UserGroupIDs:39; DB_al_UserGroups; [PERSONNEL:11]Name:2; DB_at_UserNames)
				SORT ARRAY:C229(DB_at_UserNames; DB_al_UserIDS; DB_al_UserGroups)
				
				ARRAY BOOLEAN:C223(DB_abo_UserAdministrator; 0)
				ARRAY BOOLEAN:C223(DB_abo_UserIsManager; 0)
				ARRAY BOOLEAN:C223(DB_abo_UserisUser; 0)
				ARRAY BOOLEAN:C223(DB_abo_UserisDesigner; 0)
				ARRAY BOOLEAN:C223(DB_abo_Usergetswrite; 0)
				$_l_ArraySize:=Size of array:C274(DB_al_UserIDS)
				ARRAY BOOLEAN:C223(DB_abo_UserAdministrator; $_l_ArraySize)
				ARRAY BOOLEAN:C223(DB_abo_UserIsManager; $_l_ArraySize)
				ARRAY BOOLEAN:C223(DB_abo_UserisUser; $_l_ArraySize)
				ARRAY BOOLEAN:C223(DB_abo_UserisDesigner; $_l_ArraySize)
				ARRAY BOOLEAN:C223(DB_abo_Usergetswrite; $_l_ArraySize)
				ARRAY LONGINT:C221(<>PW_al_4DUserGroupsINC; Size of array:C274(<>PW_at_4DUserGroups))
				// [PERSONNEL]UserGroupIDs:=0
				For ($_l_Index; 1; Size of array:C274(DB_al_UserIDS))
					
					For ($_l_GroupsIndex; 1; Size of array:C274(<>PW_al_4DUserGroupsBinaries))
						$_l_BinaryNumber:=<>PW_al_4DUserGroupsBinaries{$_l_GroupsIndex}
						//find out if that binary is set
						$_bo_GroupSet:=(DB_al_UserGroups{$_l_Index} ?? $_l_BinaryNumber)
						If ($_bo_GroupSet)
							Case of 
								: (<>PW_at_4DUserGroups{$_l_GroupsIndex}="Administrator")
									DB_abo_UserAdministrator{$_l_Index}:=True:C214
								: (<>PW_at_4DUserGroups{$_l_GroupsIndex}="Manager")
									DB_abo_UserIsManager{$_l_Index}:=True:C214
								: (<>PW_at_4DUserGroups{$_l_GroupsIndex}="User")
									DB_abo_UserisUser{$_l_Index}:=True:C214
								: (<>PW_at_4DUserGroups{$_l_GroupsIndex}="Word Processor")
									DB_abo_Usergetswrite{$_l_Index}:=True:C214
								: (<>PW_at_4DUserGroups{$_l_GroupsIndex}="Designer")
									DB_abo_UserisDesigner{$_l_Index}:=True:C214
							End case 
							
						Else 
							
						End if 
					End for 
				End for 
				
				
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				OBJECT GET COORDINATES:C663(Self:C308->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				
				WIN_l_CurrentWinRef:=Open window:C153($_l_ObjectLeft+$_l_WindowLeft; $_l_ObjectTop+$_l_WindowTop; $_l_ObjectLeft+$_l_WindowLeft; $_l_ObjectTop+$_l_WindowTop; 1986+4+1+Texture appearance:K34:17)
				DIALOG:C40([USER:15]; "PWGroupsManager")
				If (pw_bo_save)
					For ($_l_Index; 1; Size of array:C274(DB_al_UserIDS))
						$_l_Settings:=0
						//$_l_Settings:=$_l_Settings ?+ ◊4DUserGroupsBINARIES{$Ref}
						If (DB_abo_UserAdministrator{$_l_Index})
							$_l_AdministratorRow:=Find in array:C230(<>PW_at_4DUserGroups; "Administrator")
							If ($_l_AdministratorRow>0)  //it should be
								$_l_Settings:=$_l_Settings ?+ <>PW_al_4DUserGroupsBinaries{$_l_AdministratorRow}
							End if 
						End if 
						If (DB_abo_UserIsManager{$_l_Index})
							$_l_ManagerRow:=Find in array:C230(<>PW_at_4DUserGroups; "Manager")
							If ($_l_ManagerRow>0)  //it should be
								$_l_Settings:=$_l_Settings ?+ <>PW_al_4DUserGroupsBinaries{$_l_ManagerRow}
							End if 
						End if 
						If (DB_abo_UserisUser{$_l_Index})
							$_l_UserRow:=Find in array:C230(<>PW_at_4DUserGroups; "User")
							If ($_l_UserRow>0)  //it should be
								$_l_Settings:=$_l_Settings ?+ <>PW_al_4DUserGroupsBinaries{$_l_UserRow}
							End if 
						End if 
						If (DB_abo_Usergetswrite{$_l_Index})
							$_l_WPRow:=Find in array:C230(<>PW_at_4DUserGroups; "Word Processor")
							If ($_l_WPRow>0)  //it should be
								$_l_Settings:=$_l_Settings ?+ <>PW_al_4DUserGroupsBinaries{$_l_WPRow}
							End if 
						End if 
						If (DB_abo_UserisDesigner{$_l_Index})
							$_L_DesignerRow:=Find in array:C230(<>PW_at_4DUserGroups; "Designer")
							If ($_L_DesignerRow>0)  //it should be
								$_l_Settings:=$_l_Settings ?+ <>PW_al_4DUserGroupsBinaries{$_L_DesignerRow}
							End if 
						End if 
						If ($_l_Settings#DB_al_UserGroups{$_l_Index})
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=DB_al_UserIDS{$_l_Index})
							[PERSONNEL:11]UserGroupIDs:39:=$_l_Settings
							DB_SaveRecord(->[PERSONNEL:11])
							
						End if 
						
					End for 
				End if 
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
				
			End if 
			OBJECT SET VISIBLE:C603(*; "oAutoLogin@"; [USER:15]SinglePWsystem:235)
			If (Not:C34($_bo_Vis))  //must turn off the auto login too...
				<>PW_Bo_WindowsAutoLogin:=False:C215
				PW_l_WindowsAutoLogin:=0
			End if 
		Else 
			Gen_Alert("Sorry, you can only modify this if you are logged in administrator!")
			[USER:15]SinglePWsystem:235:=Old:C35([USER:15]SinglePWsystem:235)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:User_In,015235"; $_t_oldMethodName)
