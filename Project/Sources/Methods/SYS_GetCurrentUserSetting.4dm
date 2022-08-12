//%attributes = {}

If (False:C215)
	//Project Method Name:      SYS_GetCurrentUserSetting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/04/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($1)
	C_BOOLEAN:C305($_bo_GetAllData; $_bo_Givup)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ID; $_l_PersonID; $_l_Repeats)
	C_OBJECT:C1216($_obj_Data; $_Obj_GetUser; $_obj_Users)
	C_TEXT:C284($_t_User; $_t_userIdent; $_t_UserInitials)
End if 
//Code Starts Here
//$_t_userIdent:=$1
$_obj_Data:=$1
If (Not:C34($_obj_Data.all=Null:C1517))
	$_bo_GetAllData:=$_obj_Data.all
Else 
	$_bo_GetAllData:=False:C215
End if 
If (Application type:C494=4D Server:K5:6)
	If (Not:C34($_obj_Data.userName=Null:C1517)) | ($_bo_GetAllData)
		$_obj_Data.userName:=Current user:C182
	End if 
	If (Not:C34($_obj_Data.userInitials=Null:C1517)) | ($_bo_GetAllData)
		$_obj_Data.userInitials:="~SV"
	End if 
	
	If (Not:C34($_obj_Data.workGroupIDs=Null:C1517)) | ($_bo_GetAllData)
		$_obj_Data.workGroupIDs:=0
		
	End if 
	If (Not:C34($_obj_Data.diaryOpenNewWindow=Null:C1517)) | ($_bo_GetAllData)
		$_obj_Data.diaryOpenNewWindow:=0
		
	End if 
	If (Not:C34($_obj_Data.personID=Null:C1517)) | ($_bo_GetAllData)
		$_obj_Data.personID:=0
	End if 
	If (Not:C34($_obj_Data.groupRestrictStates=Null:C1517)) | ($_bo_GetAllData)
		$_obj_Data.groupRestrictStates:=False:C215
	End if 
	If (Not:C34($_obj_Data.CCDecode=Null:C1517)) | ($_bo_GetAllData)
		$_obj_Data.CCDecode:=0
		
	End if 
Else 
	If (Not:C34($_obj_Data.userInitials=Null:C1517))  //we can get user by initials
		$_t_UserInitials:=$_obj_Data.userInitials
	End if 
	If ($_t_UserInitials#"")
		$_obj_Users:=ds:C1482.PERSONNEL.query("Initials =:1"; $_t_UserInitials)
	Else 
		If (Not:C34($_obj_Data.personID=Null:C1517))  // or we can get user by iD
			$_l_PersonID:=$_obj_Data.personID
		End if 
		If ($_l_PersonID#0)
			$_obj_Users:=ds:C1482.PERSONNEL.query("Personnel_ID =:1"; $_l_PersonID)
		Else 
			If (Not:C34($_obj_Data.userName=Null:C1517))  //or we can get user by name-or the current user
				$_t_User:=$_obj_Data.userName
			Else 
				$_t_User:=Current user:C182
			End if 
			$_obj_Users:=ds:C1482.PERSONNEL.query("Name =:1"; $_t_User)
		End if 
	End if 
	
	If ($_obj_Users.length>0)
		
		If (Not:C34($_obj_Data.userName=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.userName:=$_obj_Users[0].Name
			
		End if 
		If (Not:C34($_obj_Data.userInitials=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.userInitials:=$_obj_Users[0].Initials
		End if 
		If (Not:C34($_obj_Data.workGroupIDs=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.workGroupIDs:=$_obj_Users[0].UserGroupIDs
		End if 
		If (Not:C34($_obj_Data.diaryOpenNewWindow=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.diaryOpenNewWindow:=$_obj_Users[0].SD_openNewWindow
		End if 
		If (Not:C34($_obj_Data.personID=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.personID:=$_obj_Users[0].Personnel_ID
		End if 
		If (Not:C34($_obj_Data.dataOwnerID=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.PersonID:=$_obj_Users[0].DataOwnerID
		End if 
		If (Not:C34($_obj_Data.CCDecode=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.CCDecode:=$_obj_Users[0].CCM_L_DisplayFullCard
		End if 
		If (Not:C34($_obj_Data.startDiary=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.startDiary:=$_obj_Users[0].Startup_Diary
		End if 
		If (Not:C34($_obj_Data.functions=Null:C1517)) | (Not:C34($_obj_Data.nogreybuttons=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.functions:=$_obj_Users[0].Startup_Diary
			If ($_obj_Data.functions=0)  //a further check due to peculiar probs with no saving the above
				If ((DB_GetModuleSettingByNUM(1))=5)
					$_obj_Data.functions:=$_obj_Data.functions ?+ 5
				Else 
					$_obj_Data.functions:=$_obj_Data.functions ?+ 6
				End if 
				
			End if 
			If (Not:C34($_obj_Data.nogreybuttons=Null:C1517)) | ($_bo_GetAllData)
				$_obj_Data.nogreybuttons:=Not:C34(($_Obj_GetUser.functions ?? 5))
			End if 
			
			$0:=$_obj_Users[0].Personnel_ID
			
		End if 
		
	Else   //nobody logged in yet
		
		If (Not:C34($_obj_Data.userName=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.userName:=""
			
		End if 
		If (Not:C34($_obj_Data.userInitials=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.userInitials:=""
		End if 
		If (Not:C34($_obj_Data.workGroupIDs=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.workGroupIDs:=0
		End if 
		If (Not:C34($_obj_Data.diaryOpenNewWindow=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.diaryOpenNewWindow:=True:C214
		End if 
		If (Not:C34($_obj_Data.personID=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.personID:=0
		End if 
		If (Not:C34($_obj_Data.dataOwnerID=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.PersonID:=0
		End if 
		If (Not:C34($_obj_Data.CCDecode=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.CCDecode:=0
		End if 
		If (Not:C34($_obj_Data.startDiary=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.startDiary:=False:C215
		End if 
		If (Not:C34($_obj_Data.functions=Null:C1517)) | (Not:C34($_obj_Data.nogreybuttons=Null:C1517)) | ($_bo_GetAllData)
			$_obj_Data.functions:=0
			If ($_obj_Data.functions=0)  //a further check due to peculiar probs with no saving the above
				If ((DB_GetModuleSettingByNUM(1))=5)
					$_obj_Data.functions:=$_obj_Data.functions ?+ 5
				Else 
					$_obj_Data.functions:=$_obj_Data.functions ?+ 6
				End if 
				
			End if 
			If (Not:C34($_obj_Data.nogreybuttons=Null:C1517)) | ($_bo_GetAllData)
				$_obj_Data.nogreybuttons:=Not:C34(($_Obj_GetUser.functions ?? 5))
			End if 
			If ($_obj_Users.length=0)
				//TRACE
				$_bo_Givup:=False:C215
				$_l_Repeats:=0
				If ($_obj_Data.noDelay=Null:C1517)
					Repeat 
						$_l_Repeats:=$_l_Repeats+1
						UTIL_DelayTicks(60)
						$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; ""; "noDelay"; True:C214)
						$_l_ID:=SYS_GetCurrentUserSetting($_Obj_GetUser)
						If ($_l_ID=0)
							$_l_Repeats:=$_l_Repeats+1
						End if 
						If ($_l_Repeats>20)
							$_bo_Givup:=True:C214
						End if 
					Until ($_l_ID#0) | ($_bo_Givup)
					$0:=$_l_ID
				Else 
					$0:=$_obj_Users[0].Personnel_ID
				End if 
				
			End if 
			
		End if 
	End if 
	