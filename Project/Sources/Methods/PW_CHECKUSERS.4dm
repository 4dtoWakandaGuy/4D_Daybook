//%attributes = {}
If (False:C215)
	//Project Method Name:      PW_CHECKUSERS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 00:08`Method: PW_CHECKUSERS
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PW_al_4DGroupIDs;0)
	//ARRAY LONGINT(<>PW_al_4DUserGroupsBinaries;0)
	ARRAY LONGINT:C221($_al_Sort; 0)
	ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
	ARRAY LONGINT:C221($_al_UserIDS; 0)
	//ARRAY LONGINT(PW_al_UserID;0)
	//ARRAY LONGINT(PW_al_ModUserGroup;0)
	//ARRAY LONGINT(PW_al_ModUserGroup2;0)
	//ARRAY TEXT(<>PW_at_4DUserGroups;0)
	ARRAY TEXT:C222($_at_UserNames; 0)
	//ARRAY TEXT(PW_at_ModUserGroups2;0)
	//ARRAY TEXT(PW_at_ModUsers;0)
	//ARRAY TEXT(PW_at_ModUsers2;0)
	//ARRAY TEXT(PW_at_UserPasswords;0)
	//ARRAY TEXT(PW_at_UserPasswords2;0)
	//ARRAY TEXT(PW_at_UsertNames;0)
	C_BOOLEAN:C305(<>SYS_bo_inStartup; <>SYS_bo_PWActive; <>SYS_bo_PWActiveOLD; <>SYS_bo_QuitCalled; $_bo_DeleteNeed; $_bo_GroupIsSet; $_bo_IsDeleted; $_bo_Reset; $_bo_ReturnToCurrentUser; $_bo_SwitchtoAdministrator; $_bo_UsersAdded)
	C_BOOLEAN:C305($1)
	C_DATE:C307($_d_LoginDate)
	C_LONGINT:C283($_l_adminitratorRow; $_l_BinaryNumber; $_l_CurrentUserRow; $_l_element; $_l_GroupElement; $_l_GroupsIndex; $_l_Index; $_l_Logins; $_l_Process; $_l_PWGroupID; $_l_SortIndex)
	C_LONGINT:C283($_l_UserRow)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_t_Current4DUser; $_t_CurrentUser; $_t_CurrentUserName; $_t_oldMethodName; $_t_Startup; $_t_UserName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PW_CHECKUSERS")
//PW_CHECKUSERS

While (Semaphore:C143("PW_CheckUsersInUse"))
	DelayTicks(30)
End while 

$_t_UserName:=<>PER_t_CurrentUserName
If (Is compiled mode:C492=False:C215)  // 16/05/02 pb
	<>PER_t_CurrentUserName:="designer"
End if 
If (<>SYS_bo_inStartup=False:C215)
	//$t:="User logging out (CheckUsers: start)"+Char(9)+Char(9)+<>PER_t_CurrentUserName+Char(9)+String(Current date(*))+Char(9)+String(Current time(*))+Char(13)
	//AuditLogDocumentModify ($t)  `25/0702 pb/bsw donot need it at the moment
End if 

$_bo_SwitchtoAdministrator:=False:C215
If (Count parameters:C259>=1)
	$_bo_SwitchtoAdministrator:=$1
End if 
If (Not:C34(Is compiled mode:C492))
	<>SYS_bo_PWActive:=False:C215
	
	<>SYS_bo_PWActiveOLD:=False:C215
	//MESSING WITH PASSWORDS IS NOT ALLOWED IN UNCOMPILED
	//THIS IS SO WE LEAVE THE STANDARD STUFF ALONE
Else 
	
	If (<>SYS_bo_PWActive)
		$_bo_DeleteNeed:=True:C214
		$_bo_ReturnToCurrentUser:=False:C215
		If ($_bo_SwitchtoAdministrator)
			If (Current user:C182#"ADMINISTRATOR")
				CHANGE CURRENT USER:C289("Administrator"; "Timur")
				$_t_CurrentUserName:=Current user:C182
				$_l_CurrentUserRow:=Find in array:C230(PW_at_UsertNames; $_t_CurrentUserName)
				If ($_l_CurrentUserRow>0)
					$_bo_ReturnToCurrentUser:=True:C214
				End if 
			End if 
		End if 
		PW_CHECKGROUPS
		//ALERT("Groups")
		ARRAY TEXT:C222(PW_at_UsertNames; 0)
		ARRAY LONGINT:C221(PW_al_UserID; 0)
		ARRAY TEXT:C222(PW_at_ModUsers; 0)
		ARRAY LONGINT:C221(PW_al_ModUserGroup; 0)
		ARRAY TEXT:C222(PW_at_UserPasswords; 0)
		GET USER LIST:C609(PW_at_UsertNames; PW_al_UserID)
		//ALERT("Number of users in password file: "+String(Size of array(PW_at_UsertNames)))
		ARRAY LONGINT:C221($_al_Sort; Size of array:C274(PW_at_UsertNames))
		$_l_element:=1
		For ($_l_SortIndex; Size of array:C274($_al_Sort); 1; -1)
			$_al_Sort{$_l_SortIndex}:=$_l_element
			$_l_element:=$_l_element+1
		End for 
		SORT ARRAY:C229($_al_Sort; PW_at_UsertNames; PW_al_UserID)
		$_bo_UsersAdded:=False:C215
		
		If (Current user:C182="Designer") | (Current user:C182="ADMINISTRATOR")
			$_l_adminitratorRow:=Find in array:C230(PW_at_UsertNames; "Administrator")
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214)
			SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; PW_at_ModUsers; [PERSONNEL:11]Person_Identity:13; PW_at_UserPasswords; [PERSONNEL:11]UserGroupIDs:39; PW_al_ModUserGroup)
			REDUCE SELECTION:C351([PERSONNEL:11]; 0)
			$_bo_Reset:=False:C215
			For ($_l_Index; 1; Size of array:C274(PW_at_ModUsers))
				$_l_UserRow:=Find in array:C230(PW_at_UsertNames; PW_at_ModUsers{$_l_Index})  //check if personnel record's name is found in actual structure password list
				If ($_l_UserRow>0)
					$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
					If ($_bo_IsDeleted)
						//ALERT("user "+PW_at_ModUsers{$_l_Index}+" found in password list but was deleted.")
						$_l_UserRow:=-1
					End if 
				Else 
					//ALERT("user "+PW_at_ModUsers{$_l_Index}+" not found in password list.")
				End if 
				
				If ($_l_UserRow<0)
					$_bo_Reset:=True:C214
					//GROUPS ARE
					//1 USER
					ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
					//ARRAY LONGINT($_AL_USERGROUPIDS;Size of array(<>PW_al_4DUserGroupsBinaries))
					$_l_GroupElement:=0  //
					If (PW_al_ModUserGroup{$_l_Index}>0)  //user is in a group
						For ($_l_GroupsIndex; 1; Size of array:C274(<>PW_al_4DUserGroupsBinaries))
							$_l_BinaryNumber:=<>PW_al_4DUserGroupsBinaries{$_l_GroupsIndex}
							//find out if that binary is set
							$_bo_GroupIsSet:=(PW_al_ModUserGroup{$_l_Index} ?? $_l_BinaryNumber)
							If ($_bo_GroupIsSet)
								$_l_PWGroupID:=<>PW_al_4DGroupIDs{$_l_GroupsIndex}
								If ($_l_PWGroupID#0)
									$_l_GroupElement:=$_l_GroupElement+1
									APPEND TO ARRAY:C911($_AL_USERGROUPIDS; $_l_PWGroupID)
								Else 
									//put in group user
									//$_l_PWGroupID:=<>PW_al_4DGroupIDs{Find in array(<>PW_at_4DUserGroups;"User")}
									//$_l_GroupElement:=$_l_GroupElement+1
									//$_AL_USERGROUPIDS{$_l_GroupElement}:=$_l_PWGroupID
								End if 
							End if 
						End for 
						If (Size of array:C274($_AL_USERGROUPIDS)=0)
							$_l_PWGroupID:=<>PW_al_4DGroupIDs{Find in array:C230(<>PW_at_4DUserGroups; "User")}
							APPEND TO ARRAY:C911($_AL_USERGROUPIDS; $_l_PWGroupID)
						End if 
						
					Else 
						//put in group user
						$_l_PWGroupID:=<>PW_al_4DGroupIDs{Find in array:C230(<>PW_at_4DUserGroups; "User")}
						APPEND TO ARRAY:C911($_AL_USERGROUPIDS; $_l_PWGroupID)
					End if 
					
					If (<>SYS_bo_PWActive)
						$_t_CurrentUser:=<>PER_t_CurrentUserName
						
						CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
						If (Not:C34(<>SYS_bo_QuitCalled))
							$_bo_UsersAdded:=True:C214
							
							//If ($_l_PWGroupID=0)
							//$_l_PWGroupID:=<>PW_al_4DGroupIDs{Find in array(<>PW_at_4DUserGroups;"User")}
							//End if
							Set user properties:C612(-2; PW_at_ModUsers{$_l_Index}; ""; PW_at_UserPasswords{$_l_Index}; 0; !00-00-00!; $_AL_USERGROUPIDS)
							//ALERT("User name"+PW_at_ModUsers{$_l_Index}+" Set to "+PW_at_UserPasswords{$_l_Index}+" GROUP"+String($_l_PWGroupID))
							If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
								If (<>PER_t_CurrentUserName#"Server")
									GET USER LIST:C609($_at_UserNames; $_al_UserIDS)
									
									$_l_UserRow:=Find in array:C230($_at_UserNames; <>PER_t_CurrentUserName)
									If ($_l_UserRow>0)
										QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
										
										CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
									End if 
								Else 
									
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							Else 
								
								CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
							End if 
							
						End if 
					End if 
					
					
				Else 
					If (Not:C34(<>SYS_bo_PWActive))
						$_bo_DeleteNeed:=True:C214
						<>SYS_bo_PWActiveOLD:=True:C214
					End if 
				End if 
			End for 
			//Now if there were users delete the Modulus passwords
			If (<>SYS_bo_PWActive)
				If (Size of array:C274(PW_at_ModUsers)>0)
					If ($_bo_UsersAdded)
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "User")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								//$ref:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
										
										CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
									Else 
										
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							End if 
							
						End if 
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "User WP")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								// $ref:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							$_t_CurrentUser:=<>PER_t_CurrentUserName
							
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
										CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
									Else 
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							End if 
						End if 
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "Demo")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								//$ref:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							$_t_CurrentUser:=<>PER_t_CurrentUserName
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
										CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
									Else 
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							End if 
						End if 
						
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "Demo WP")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								//$ref:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							$_t_CurrentUser:=<>PER_t_CurrentUserName
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
										CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
									Else 
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							End if 
						End if 
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "Administrator WP")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								// $_l_UserRow:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							$_t_CurrentUser:=<>PER_t_CurrentUserName
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
										CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
									Else 
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
								
							End if 
						End if 
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "Manager WP")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								//$_l_UserRow:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							$_t_CurrentUser:=<>PER_t_CurrentUserName
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										$_l_UserRow:=Find in array:C230(PW_at_UsertNames; [PERSONNEL:11]Name:2)
										If ($_l_UserRow>0)
											QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
											CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
										Else 
											$_l_UserRow:=Find in array:C230(PW_at_UsertNames; $_t_Current4DUser)
											If ($_l_UserRow>0) & ($_t_Current4DUser#Current user:C182)
												Case of 
													: ($_t_Current4DUser="Administrator WP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "TimurWP")
													: ($_t_Current4DUser="User")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "U1")
													: ($_t_Current4DUser="UserWP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "U1WP")
													: ($_t_Current4DUser="Designer")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "Redey0735")
													: ($_t_Current4DUser="Manager")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "M1")
													: ($_t_Current4DUser="ManangerWP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "M1WP")
												End case 
											End if 
										End if 
									Else 
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							End if 
						End if 
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "Manager")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								//$ref:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							$_t_CurrentUser:=<>PER_t_CurrentUserName
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										$_l_UserRow:=Find in array:C230(PW_at_UsertNames; [PERSONNEL:11]Name:2)
										If ($_l_UserRow>0)
											QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
											CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
										Else 
											$_l_UserRow:=Find in array:C230(PW_at_UsertNames; $_t_Current4DUser)
											If ($_l_UserRow>0) & ($_t_Current4DUser#Current user:C182)
												Case of 
													: ($_t_Current4DUser="Administrator WP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "TimurWP")
													: ($_t_Current4DUser="User")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "U1")
													: ($_t_Current4DUser="UserWP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "U1WP")
													: ($_t_Current4DUser="Designer")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "Redey0735")
													: ($_t_Current4DUser="Manager")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "M1")
													: ($_t_Current4DUser="ManangerWP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "M1WP")
												End case 
											End if 
										End if 
									Else 
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							End if 
						End if 
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "DTK")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								//$ref:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							$_t_CurrentUser:=<>PER_t_CurrentUserName
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										$_l_UserRow:=Find in array:C230(PW_at_UsertNames; [PERSONNEL:11]Name:2)
										If ($_l_UserRow>0)
											QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
											CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
										Else 
											$_l_UserRow:=Find in array:C230(PW_at_UsertNames; $_t_Current4DUser)
											If ($_l_UserRow>0) & ($_t_Current4DUser#Current user:C182)
												Case of 
													: ($_t_Current4DUser="Administrator WP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "TimurWP")
													: ($_t_Current4DUser="User")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "U1")
													: ($_t_Current4DUser="UserWP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "U1WP")
													: ($_t_Current4DUser="Designer")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "Redey0735")
													: ($_t_Current4DUser="Manager")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "M1")
													: ($_t_Current4DUser="ManangerWP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "M1WP")
												End case 
											End if 
										End if 
									Else 
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							End if 
						End if 
						$_l_UserRow:=Find in array:C230(PW_at_UsertNames; "Designer II")
						If ($_l_UserRow>0)
							$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
							If ($_bo_IsDeleted)
								//$_l_UserRow:=-1
							End if 
						End if 
						If ($_l_UserRow>0)
							$_t_UserName:=""
							$_t_Startup:=""
							$_t_UserName:=""
							$_l_Logins:=0
							$_d_LoginDate:=!00-00-00!
							$_t_CurrentUser:=<>PER_t_CurrentUserName
							
							CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
							
							ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
							GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
							DELETE USER:C615(PW_al_UserID{$_l_UserRow})
							If (Not:C34(<>SYS_bo_QuitCalled))
								If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
									If (<>PER_t_CurrentUserName#"Server")
										$_l_UserRow:=Find in array:C230(PW_at_UsertNames; [PERSONNEL:11]Name:2)
										If ($_l_UserRow>0)
											QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
											
											CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
										Else 
											$_l_UserRow:=Find in array:C230(PW_at_UsertNames; $_t_Current4DUser)
											If ($_l_UserRow>0) & ($_t_Current4DUser#Current user:C182)
												Case of 
													: ($_t_Current4DUser="Administrator WP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "TimurWP")
													: ($_t_Current4DUser="User")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "U1")
													: ($_t_Current4DUser="UserWP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "U1WP")
													: ($_t_Current4DUser="Designer")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "Redey0735")
													: ($_t_Current4DUser="Manager")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "M1")
													: ($_t_Current4DUser="ManangerWP")
														CHANGE CURRENT USER:C289($_t_Current4DUser; "M1WP")
												End case 
											End if 
										End if 
									Else 
										
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								Else 
									
									CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
								End if 
							End if 
						End if 
					End if 
				End if 
				//Because we have deleted these if the administrator then turns off the
				//password system these would be recreated(new ids)
				//this could lead to long password lists with users deleted and recreated
				//but this would be deleted when a new version of Daybook `
				//  is downloaded anyway
				//Now if there are any deleted users make sure they are not in the list
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38=1)
				QUERY:C277([PERSONNEL:11];  | ; [PERSONNEL:11]Startup_List:15=False:C215)
				If (Records in selection:C76([PERSONNEL:11])>0)
					ARRAY TEXT:C222(PW_at_ModUsers2; 0)
					ARRAY TEXT:C222(PW_at_ModUserGroups2; 0)
					ARRAY TEXT:C222(PW_at_UserPasswords2; 0)
					ARRAY LONGINT:C221(PW_al_ModUserGroup2; 0)
					
					SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; PW_at_ModUsers2; [PERSONNEL:11]Person_Identity:13; PW_at_UserPasswords2; [PERSONNEL:11]UserGroupIDs:39; PW_al_ModUserGroup2)
					REDUCE SELECTION:C351([PERSONNEL:11]; 0)
					$_bo_Reset:=False:C215
					For ($_l_Index; 1; Size of array:C274(PW_at_ModUsers2))
						//make sure they are not recreated
						$_l_UserRow:=Find in array:C230(PW_at_ModUsers; PW_at_ModUsers2{$_l_Index})
						If ($_l_UserRow<0)  //not recreated
							$_l_UserRow:=Find in array:C230(PW_at_UsertNames; PW_at_ModUsers2{$_l_Index})
							If ($_l_UserRow>0)
								$_bo_IsDeleted:=Is user deleted:C616(PW_al_UserID{$_l_UserRow})
								If ($_bo_IsDeleted)
									$_l_UserRow:=-1
								End if 
							End if 
							If ($_l_UserRow>0)  //is still on password list)
								$_t_UserName:=""
								$_t_Startup:=""
								$_t_UserName:=""
								$_l_Logins:=0
								$_d_LoginDate:=!00-00-00!
								$_t_CurrentUser:=<>PER_t_CurrentUserName
								
								CHANGE CURRENT USER:C289("Administrator"; "Timur")  //NG we will have to provide a way to hold this in the system...
								
								ARRAY LONGINT:C221($_AL_USERGROUPIDS; 0)
								
								GET USER PROPERTIES:C611(PW_al_UserID{$_l_UserRow}; $_t_UserName; $_t_Startup; $_t_UserName; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
								
								Set user properties:C612(PW_al_UserID{$_l_UserRow}; "OLD_"+$_t_UserName; $_t_Startup; *; $_l_Logins; $_d_LoginDate; $_AL_USERGROUPIDS)
								
								DELETE USER:C615(PW_al_UserID{$_l_UserRow})
								If (Not:C34(<>SYS_bo_QuitCalled))
									If (<>PER_t_CurrentUserName#"Designer") & (<>PER_t_CurrentUserName#"")
										
										If (<>PER_t_CurrentUserName#"Server")
											$_l_UserRow:=Find in array:C230(PW_at_UsertNames; [PERSONNEL:11]Name:2)
											If ($_l_UserRow>0)
												QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=<>PER_t_CurrentUserName)
												
												CHANGE CURRENT USER:C289(<>PER_t_CurrentUserName; [PERSONNEL:11]Person_Identity:13)
											Else 
												$_l_UserRow:=Find in array:C230(PW_at_UsertNames; $_t_Current4DUser)
												If ($_l_UserRow>0) & ($_t_Current4DUser#Current user:C182)
													Case of 
														: ($_t_Current4DUser="Administrator WP")
															CHANGE CURRENT USER:C289($_t_Current4DUser; "TimurWP")
														: ($_t_Current4DUser="User")
															CHANGE CURRENT USER:C289($_t_Current4DUser; "U1")
														: ($_t_Current4DUser="UserWP")
															CHANGE CURRENT USER:C289($_t_Current4DUser; "U1WP")
														: ($_t_Current4DUser="Designer")
															CHANGE CURRENT USER:C289($_t_Current4DUser; "Redey0735")
														: ($_t_Current4DUser="Manager")
															CHANGE CURRENT USER:C289($_t_Current4DUser; "M1")
														: ($_t_Current4DUser="ManangerWP")
															CHANGE CURRENT USER:C289($_t_Current4DUser; "M1WP")
													End case 
												End if 
											End if 
										Else 
											
											CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
										End if 
									Else 
										
										CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
									End if 
								End if 
							End if 
						End if 
					End for 
				End if 
				
			Else 
				//only clear the users if they were set up
				
				$_l_Process:=New process:C317("PW_CLEARUSERS"; 128000; "Clear users")
				DelayTicks(60)
				Repeat 
					DelayTicks(60)
				Until (((Process state:C330($_l_Process)<0)) | (<>SYS_bo_QuitCalled))
			End if 
		End if 
		If ($_bo_ReturnToCurrentUser)
			Case of 
				: ($_t_CurrentUserName="AdministratorWP")
					CHANGE CURRENT USER:C289("AdministratorWP"; "TimurWP")
				: ($_t_CurrentUserName="DefaultUser")
					CHANGE CURRENT USER:C289("DefaultUser"; "")
				: ($_t_CurrentUserName="Designer")
					CHANGE CURRENT USER:C289("Designer"; "Redeye0735")
				: ($_t_CurrentUserName="Manager")
					CHANGE CURRENT USER:C289("Manager"; "M1")
				: ($_t_CurrentUserName="ManagerWP")
					CHANGE CURRENT USER:C289("ManagerWP"; "M1WP")
				: ($_t_CurrentUserName="User")
					CHANGE CURRENT USER:C289("User"; "U1WP")
				: ($_t_CurrentUserName="UserWP")
					CHANGE CURRENT USER:C289("UserWP"; "U1WP")
			End case 
		End if 
	End if 
	
End if 
<>PER_t_CurrentUserName:=$_t_UserName
CLEAR SEMAPHORE:C144("PW_CheckUsersInUse")
ERR_MethodTrackerReturn("PW_CHECKUSERS"; $_t_oldMethodName)
