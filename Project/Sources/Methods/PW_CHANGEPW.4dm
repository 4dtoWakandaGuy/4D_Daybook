//%attributes = {}
If (False:C215)
	//Project Method Name:      PW_CHANGEPW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 23:52`Method: PW_CHANGEPW
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PW_al_4DGroupIDs;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsBinaries;0)
	ARRAY LONGINT:C221($_al_UserGroupID; 0)
	ARRAY LONGINT:C221($_al_UsersSort; 0)
	//ARRAY LONGINT(PW_al_UserID;0)
	//ARRAY TEXT(<>PW_at_4DUserGroups;0)
	//ARRAY TEXT(PW_at_DBUserGroups;0)
	//ARRAY TEXT(PW_at_ModUsers;0)
	//ARRAY TEXT(PW_at_UserPasswords;0)
	//ARRAY TEXT(PW_at_UsertNames;0)
	C_BOOLEAN:C305(<>SYS_bo_PWActive; <>SYS_bo_PWActiveOLD; $_bo_isDeleted; $_bo_IsGroupSet; $_bo_UsersAdded)
	C_LONGINT:C283($_l_AdminRow; $_l_BinaryGroups; $_l_DataDummy; $_l_Element; $_l_GroupRow; $_l_index; $_l_Index2; $_l_PersonRow; $_l_PWGroupID; $3)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_t_CUrrent4DUser; $_t_CurrentUser; $_t_oldMethodName; $_t_oldMethodName2; $1; $2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("PW_CHANGEPW")

//PW_CHECKUSERS
While (Semaphore:C143("PW_CheckUsersInUse"))
	DelayTicks(30)
End while 


If (<>SYS_bo_PWActive) & (Is compiled mode:C492)
	If (Application type:C494=4D Remote mode:K5:5)
		$_l_DataDummy:=$3
		ProcessServices_CreateRecord(->[PERSONNEL:11]; ->$_l_DataDummy; "ChangePW")
		
	Else 
		PW_CHECKGROUPS  //group might have changed
		ARRAY TEXT:C222(PW_at_UsertNames; 0)
		ARRAY LONGINT:C221(PW_al_UserID; 0)
		ARRAY TEXT:C222(PW_at_ModUsers; 0)
		ARRAY TEXT:C222(PW_at_DBUserGroups; 0)
		ARRAY TEXT:C222(PW_at_UserPasswords; 0)
		GET USER LIST:C609(PW_at_UsertNames; PW_al_UserID)
		ARRAY LONGINT:C221($_al_UsersSort; Size of array:C274(PW_at_UsertNames))
		$_l_Element:=1
		For ($_l_index; Size of array:C274($_al_UsersSort); 1; -1)
			$_al_UsersSort{$_l_index}:=$_l_Element
			$_l_Element:=$_l_Element+1
		End for 
		SORT ARRAY:C229($_al_UsersSort; PW_at_UsertNames; PW_al_UserID)
		$_bo_UsersAdded:=False:C215
		// If (Current user="Designer") | (Current user="ADMINISTRATOR")
		$_l_AdminRow:=Find in array:C230(PW_at_UsertNames; "Administrator")
		
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
		
		$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; [PERSONNEL:11]Name:2)
		If ($_l_PersonRow>0)
			$_bo_isDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
			If ($_bo_isDeleted)
				$_l_PersonRow:=-1
			End if 
		End if 
		
		
		ARRAY LONGINT:C221($_al_UserGroupID; 0)
		ARRAY LONGINT:C221($_al_UserGroupID; Size of array:C274(<>PW_al_4DUserGroupsBinaries))
		$_l_GroupRow:=0  //
		If ([PERSONNEL:11]UserGroupIDs:39>0)  //user is in a group
			For ($_l_Index2; 1; Size of array:C274(<>PW_al_4DUserGroupsBinaries))
				$_l_BinaryGroups:=<>PW_al_4DUserGroupsBinaries{$_l_Index2}
				//find out if that binary is set
				$_bo_IsGroupSet:=([PERSONNEL:11]UserGroupIDs:39 ?? $_l_BinaryGroups)
				If ($_bo_IsGroupSet)
					$_l_PWGroupID:=<>PW_al_4DGroupIDs{$_l_Index2}
					If ($_l_PWGroupID#0)
						$_l_GroupRow:=$_l_GroupRow+1
						
						$_al_UserGroupID{$_l_GroupRow}:=$_l_PWGroupID
					Else 
						//put in group user
						$_l_PWGroupID:=<>PW_al_4DGroupIDs{Find in array:C230(<>PW_at_4DUserGroups; "User")}
						$_l_GroupRow:=$_l_GroupRow+1
						$_al_UserGroupID{$_l_GroupRow}:=$_l_PWGroupID
					End if 
				End if 
			End for 
			ARRAY LONGINT:C221($_al_UserGroupID; $_l_Element)
		Else 
			//put in group user
			$_l_PWGroupID:=<>PW_al_4DGroupIDs{Find in array:C230(<>PW_at_4DUserGroups; "User")}
			ARRAY LONGINT:C221($_al_UserGroupID; 1)
			$_al_UserGroupID{1}:=$_l_PWGroupID
		End if 
		
		Case of 
			: ([PERSONNEL:11]PersonDeleted:38=1)
				If ($_l_PersonRow>0)
					DELETE USER:C615(PW_al_UserID{$_l_PersonRow})
				End if 
			: ([PERSONNEL:11]Person_Identity:13#"")
				If ($_l_PersonRow>0)
					//TRACE
					$_t_CUrrent4DUser:=Current user:C182
					$_t_CurrentUser:=<>PER_t_CurrentUserName
					CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
					Set user properties:C612(PW_al_UserID{$_l_PersonRow}; [PERSONNEL:11]Name:2; ""; [PERSONNEL:11]Person_Identity:13; 0; !00-00-00!; $_al_UserGroupID)
					If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
						If (<>PER_t_CurrentUserName#"Server")
							$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; [PERSONNEL:11]Name:2)
							If ($_l_PersonRow>0)
								QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
								$_t_oldMethodName2:=ERR_MethodTracker("PW_CHANGEPW_ToUser'"+<>PER_t_CurrentUserName+"'")
								CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
							Else 
								$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; $_t_CUrrent4DUser)
								If ($_l_PersonRow>0) & ($_t_CUrrent4DUser#Current user:C182)
									Case of 
										: ($_t_CUrrent4DUser="Administrator WP")
											CHANGE CURRENT USER:C289($_t_CUrrent4DUser; "TimurWP")
										: ($_t_CUrrent4DUser="User")
											CHANGE CURRENT USER:C289($_t_CUrrent4DUser; "U1")
										: ($_t_CUrrent4DUser="UserWP")
											CHANGE CURRENT USER:C289($_t_CUrrent4DUser; "U1WP")
										: ($_t_CUrrent4DUser="Designer")
											CHANGE CURRENT USER:C289($_t_CUrrent4DUser; "Redey0735")
										: ($_t_CUrrent4DUser="Manager")
											CHANGE CURRENT USER:C289($_t_CUrrent4DUser; "M1")
										: ($_t_CUrrent4DUser="ManangerWP")
											CHANGE CURRENT USER:C289($_t_CUrrent4DUser; "M1WP")
									End case 
								End if 
							End if 
						Else 
							$_t_oldMethodName2:=ERR_MethodTracker("PW_CHANGEPW_ToUserDesignerA")
							CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
						End if 
					Else 
						$_t_oldMethodName2:=ERR_MethodTracker("PW_CHANGEPW_ToUserDesignerB")
						CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
					End if 
				End if 
		End case 
	End if 
End if 
CLEAR SEMAPHORE:C144("PW_CheckUsersInUse")

//BSW 11/06/03 this may be crashing
//$0:=True  `  18/04/02 PB TESTING ONLY NEEDS CHECKING!!!!!!!!!
ERR_MethodTrackerReturn("PW_CHANGEPW"; $_t_oldMethodName)
