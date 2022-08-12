//%attributes = {}
If (False:C215)
	//Project Method Name:      PW_CLEARUSERS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 09:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 0)
	ARRAY LONGINT:C221($_al_Sort; 0)
	ARRAY LONGINT:C221($_al_UserGroups; 0)
	//ARRAY LONGINT(PW_l_GROUPIDS;0)
	//ARRAY LONGINT(PW_al_UserID;0)
	ARRAY TEXT:C222($_at_ClearPersonnel; 0)
	//ARRAY TEXT(PW_at_GroupNames;0)
	//ARRAY TEXT(PW_at_UsertNames;0)
	C_BOOLEAN:C305(<>SYS_bo_PWActive; <>SYS_bo_PWActiveOLD; $_bo_DeleteAll; $_bo_Deletions; $_bo_IsUserDeleted; $_bo_NoAction)
	C_DATE:C307($_d_LoginDate)
	C_LONGINT:C283($_l_DataType; $_l_Element; $_l_GroupRow; $_l_Index; $_l_Index2; $_l_NumberofLogins; $_l_PersonRow)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_password; $_t_Startup; $_t_Username)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PW_CLEARUSERS")
//This option is only used to Clear passwords
//it can clear ONE password
//a group of passwords
// or ALL


If (Not:C34(Is compiled mode:C492))  //& (False)
	
	<>SYS_bo_PWActive:=False:C215
	<>SYS_bo_PWActiveOLD:=False:C215
	//MESSING WITH PASSWORDS IS NOT ALLOWED IN UNCOMPILED
	//THIS IS SO WE LEAVE THE STANDARD STUFF ALONE
End if 

$_bo_NoAction:=False:C215
If (Current user:C182="Designer") | (Current user:C182="ADMINISTRATOR")
	ARRAY TEXT:C222($_at_ClearPersonnel; 0)
	$_bo_DeleteAll:=False:C215
	GET USER LIST:C609(PW_at_UsertNames; PW_al_UserID)
	ARRAY LONGINT:C221($_al_Sort; Size of array:C274(PW_at_UsertNames))
	$_l_Element:=1
	For ($_l_Index2; Size of array:C274($_al_Sort); 1; -1)
		$_al_Sort{$_l_Index2}:=$_l_Element
		$_l_Element:=$_l_Element+1
	End for 
	SORT ARRAY:C229($_al_Sort; PW_at_UsertNames; PW_al_UserID)
	
	
	If (Count parameters:C259>0)
		$_l_DataType:=Type:C295($1->)
		Case of 
			: ($_l_DataType=Is string var:K8:2)
				ARRAY TEXT:C222($_at_ClearPersonnel; 1)
				$_at_ClearPersonnel{1}:=$1->
			: ($_l_DataType=String array:K8:15) | ($_l_DataType=Text array:K8:16)
				ARRAY TEXT:C222($_at_ClearPersonnel; Size of array:C274($1->))
				For ($_l_Index; 1; Size of array:C274($1->))
					$_at_ClearPersonnel{$_l_Index}:=$1->{$_l_Index}
				End for 
		End case 
	Else 
		//clear all
		If (Not:C34(<>SYS_bo_PWActive) & (<>SYS_bo_PWActiveOLD))
			
			ALL RECORDS:C47([PERSONNEL:11])
			SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; $_at_ClearPersonnel)
			$_bo_DeleteAll:=True:C214
		Else 
			$_bo_NoAction:=True:C214
			<>SYS_bo_PWActiveOLD:=<>SYS_bo_PWActive
		End if 
		
	End if 
	//now delete
	If (Not:C34($_bo_NoAction))
		$_bo_Deletions:=True:C214
		PW_CHECKGROUPS
		For ($_l_Index; 1; Size of array:C274($_at_ClearPersonnel))
			If ($_at_ClearPersonnel{$_l_Index}#"")
				$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; $_at_ClearPersonnel{$_l_Index})
				
				If ($_l_PersonRow>0)  //is still on password list)
					$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
					If (Not:C34($_bo_IsUserDeleted))
						$_t_Username:=""
						$_t_Startup:=""
						$_t_password:=""
						$_l_NumberofLogins:=0
						$_d_LoginDate:=!00-00-00!
						ARRAY LONGINT:C221($_al_UserGroups; 0)
						GET USER PROPERTIES:C611(PW_al_UserID{$_l_PersonRow}; $_t_Username; $_t_Startup; $_t_password; $_l_NumberofLogins; $_d_LoginDate; $_al_UserGroups)
						Set user properties:C612(PW_al_UserID{$_l_PersonRow}; "OLD_"+$_t_Username; $_t_Startup; *; $_l_NumberofLogins; $_d_LoginDate; $_al_UserGroups)
						DELETE USER:C615(PW_al_UserID{$_l_PersonRow})
						$_bo_Deletions:=True:C214
					End if 
				End if 
			End if 
		End for 
		If ($_bo_DeleteAll) & ($_bo_Deletions)
			//we deleted all so must recreate the standard passwords
			// Set user properties(userID;name;Startup ;password;nbLogin;lastLogin{;membership
			PW_CHECKGROUPS
			$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; "User")
			If ($_l_PersonRow>0)
				$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
				If ($_bo_IsUserDeleted)
					$_l_PersonRow:=-1
				End if 
			End if 
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; "User")
			ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 1)
			$_al_PWUserGroupsIDS{1}:=PW_al_GroupIDS{$_l_GroupRow}
			If ($_l_PersonRow<0)
				Set user properties:C612(-2; "User"; "No"; "U1"; 0; !00-00-00!; $_al_PWUserGroupsIDS)
			End if 
			$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; "User WP")
			If ($_l_PersonRow>0)
				$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
				If ($_bo_IsUserDeleted)
					$_l_PersonRow:=-1
				End if 
			End if 
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; "4D Write Group")
			ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 1)
			$_al_PWUserGroupsIDS{1}:=PW_al_GroupIDS{$_l_GroupRow}
			If ($_l_PersonRow<0)
				Set user properties:C612(-2; "User WP"; "No"; "U1WP"; 0; !00-00-00!; $_al_PWUserGroupsIDS)
			End if 
			$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; "Demo")
			If ($_l_PersonRow>0)
				$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
				If ($_bo_IsUserDeleted)
					$_l_PersonRow:=-1
				End if 
			End if 
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; "User")
			ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 1)
			$_al_PWUserGroupsIDS{1}:=PW_al_GroupIDS{$_l_GroupRow}
			If ($_l_PersonRow<0)
				Set user properties:C612(-2; "Demo"; "No"; "Demo"; 0; !00-00-00!; $_al_PWUserGroupsIDS)
			End if 
			$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; "Demo WP")
			If ($_l_PersonRow>0)
				$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
				If ($_bo_IsUserDeleted)
					$_l_PersonRow:=-1
				End if 
			End if 
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; "4D Write Group")
			ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 1)
			$_al_PWUserGroupsIDS{1}:=PW_al_GroupIDS{$_l_GroupRow}
			If ($_l_PersonRow<0)
				Set user properties:C612(-2; "Demo WP"; "No"; "DemoWP"; 0; !00-00-00!; $_al_PWUserGroupsIDS)
			End if 
			$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; "Administrator WP")
			If ($_l_PersonRow>0)
				$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
				If ($_bo_IsUserDeleted)
					$_l_PersonRow:=-1
				End if 
			End if 
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; "4D Write Group")
			ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 1)
			$_al_PWUserGroupsIDS{1}:=PW_al_GroupIDS{$_l_GroupRow}
			If ($_l_PersonRow<0)
				Set user properties:C612(-2; "Administrator WP"; ""; "TimurWP"; 0; !00-00-00!; $_al_PWUserGroupsIDS)
			End if 
			$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; "Manager WP")
			If ($_l_PersonRow>0)
				$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
				If ($_bo_IsUserDeleted)
					$_l_PersonRow:=-1
				End if 
			End if 
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; "4D Write Group")
			ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 1)
			$_al_PWUserGroupsIDS{1}:=PW_al_GroupIDS{$_l_GroupRow}
			If ($_l_PersonRow<0)
				Set user properties:C612(-2; "Manager WP"; "No"; "M1WP"; 0; !00-00-00!; $_al_PWUserGroupsIDS)
				
			End if 
			$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; "Manager")
			If ($_l_PersonRow>0)
				$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
				If ($_bo_IsUserDeleted)
					$_l_PersonRow:=-1
				End if 
			End if 
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; "User")
			ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 1)
			$_al_PWUserGroupsIDS{1}:=PW_al_GroupIDS{$_l_GroupRow}
			If ($_l_PersonRow<0)
				Set user properties:C612(-2; "Manager"; "No"; "M1"; 0; !00-00-00!; $_al_PWUserGroupsIDS)
			End if 
			$_l_PersonRow:=Find in array:C230(PW_at_UsertNames; "DTK")
			If ($_l_PersonRow>0)
				$_bo_IsUserDeleted:=Is user deleted:C616(PW_al_UserID{$_l_PersonRow})
				If ($_bo_IsUserDeleted)
					$_l_PersonRow:=-1
				End if 
			End if 
			$_l_GroupRow:=Find in array:C230(PW_at_GroupNames; "DTK")
			ARRAY LONGINT:C221($_al_PWUserGroupsIDS; 1)
			$_al_PWUserGroupsIDS{1}:=PW_al_GroupIDS{$_l_GroupRow}
			If ($_l_PersonRow<0)
				Set user properties:C612(-2; "DTK"; "No"; "Internet"; 0; !00-00-00!; $_al_PWUserGroupsIDS)
			End if 
		End if 
		
		
		
		
		//clear memory
		ARRAY TEXT:C222($_at_ClearPersonnel; 0)
	End if 
	
End if 
ERR_MethodTrackerReturn("PW_CLEARUSERS"; $_t_oldMethodName)
