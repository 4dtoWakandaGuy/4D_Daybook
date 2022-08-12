//%attributes = {}
If (False:C215)
	//Project Method Name:      PREF_GetPreferenceID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/02/2010 07:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DSS_al_GeneralPreferences;0)
	//ARRAY TEXT(DSS_at_GeneralPreferences;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_AutoAdd; $2; AA_bo_ListsInited; DSS_bo_Enabled)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_DataOwnerID; $_l_ListID; $_l_PreferenceItemID; $_l_PreferencePosition; $0; $3; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; $_t_PreferenceName; $1; AA_t_CallingMethod)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PREF_GetPreferenceID")


If (Count parameters:C259>=1)
	
	If (Count parameters:C259>=3)
		$_l_DataOwnerID:=$3
	Else 
		
		If (<>PER_l_CurLoggedinDataOwnerID=0)
			$_l_DataOwnerID:=Records in table:C83([USER:15])
		Else 
			$_l_DataOwnerID:=<>PER_l_CurLoggedinDataOwnerID
		End if 
	End if 
	If (DB_l_CurrentOwnerRequest>0) & (Application type:C494=4D Server:K5:6)  //we are loading a data owners record-not thi
		$_l_DataOwnerID:=DB_l_CurrentOwnerRequest
		
	End if 
	If ($_l_DataOwnerID>0)
		$_t_PreferenceName:=$1
		
		If (Count parameters:C259>=2)
			$_bo_AutoAdd:=$2
		Else 
			$_bo_AutoAdd:=True:C214
		End if 
		If (Not:C34(<>SYS_bo_QuitCalled))
			While (Semaphore:C143("LoadingPrefs"))
				DelayTicks(2)
			End while 
		End if 
		ARRAY TEXT:C222(DSS_at_GeneralPreferences; 0)
		ARRAY LONGINT:C221(DSS_al_GeneralPreferences; 0)
		
		AA_t_CallingMethod:="PREF_GetpreferenceID"
		$_l_ListID:=AA_LoadListByName("Preferences"; ->DSS_at_GeneralPreferences; ->DSS_al_GeneralPreferences)
		//new record
		$_l_PreferencePosition:=Find in array:C230(DSS_at_GeneralPreferences; $_t_PreferenceName)
		DSS_bo_Enabled:=False:C215
		If ($_l_PreferencePosition<0)
			If ($_bo_AutoAdd)
				$_l_PreferenceItemID:=AA_ListAddItembyID($_l_ListID; $_t_PreferenceName)
			Else 
				$_l_PreferenceItemID:=0
			End if 
		Else 
			$_l_PreferenceItemID:=DSS_al_GeneralPreferences{$_l_PreferencePosition}
		End if 
		CLEAR SEMAPHORE:C144("LoadingPrefs")
		$0:=$_l_PreferenceItemID
	Else 
		If ($_l_DataOwnerID<0)
			AA_bo_ListsInited:=False:C215  //we reload
			$_t_PreferenceName:=$1
			
			If (Count parameters:C259>=2)
				$_bo_AutoAdd:=$2
			Else 
				$_bo_AutoAdd:=True:C214
			End if 
			If (Not:C34(<>SYS_bo_QuitCalled))
				While (Semaphore:C143("LoadingPrefs"))
					DelayTicks(2)
				End while 
			End if 
			ARRAY TEXT:C222(DSS_at_GeneralPreferences; 0)
			ARRAY LONGINT:C221(DSS_al_GeneralPreferences; 0)
			
			AA_t_CallingMethod:="PREF_GetpreferenceID"
			$_l_ListID:=AA_LoadOwnedListByName($3; "Preferences"; ->DSS_at_GeneralPreferences; ->DSS_al_GeneralPreferences)
			//new record
			$_l_PreferencePosition:=Find in array:C230(DSS_at_GeneralPreferences; $_t_PreferenceName)
			DSS_bo_Enabled:=False:C215
			If ($_l_PreferencePosition<0)
				If ($_bo_AutoAdd)  //Note the List add to does not need the data owner because the owned list is unique to the data owner
					$_l_PreferenceItemID:=AA_ListAddItembyID($_l_ListID; $_t_PreferenceName)
				Else 
					$_l_PreferenceItemID:=0
				End if 
			Else 
				$_l_PreferenceItemID:=DSS_al_GeneralPreferences{$_l_PreferencePosition}
			End if 
			CLEAR SEMAPHORE:C144("LoadingPrefs")
			$0:=$_l_PreferenceItemID
			AA_bo_ListsInited:=False:C215  //we reload
			
		Else 
			//There is no 'owner' to associate this record with
			$0:=0
		End if 
	End if 
Else 
	$0:=0
End if 
UNLOAD RECORD:C212([X_LISTS:111])
READ ONLY:C145([X_LISTS:111])
ERR_MethodTrackerReturn("PREF_GetPreferenceID"; $_t_oldMethodName)