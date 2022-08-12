//%attributes = {}
If (False:C215)
	//Project Method Name:      BK_EditDataOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 22:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; DSS_bo_Enabled)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Delay; $_l_ItemID; $_l_ListID; $_l_Repeats; $_l_Retries; $_l_WindowReference; DM_l_DataOptions; DM_l_OptionsContext; DM_l_Save; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_REAL:C285($0; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_PreferenceItemName; DM_t_SettingsName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BK_EditDataOptions")
If (Count parameters:C259>=1)
	DM_l_DataOptions:=$1
	DM_l_OptionsContext:=$2
	DM_l_Save:=0
	HIDE WINDOW:C436
	$0:=0
	If (Count parameters:C259>=3)
		$_l_WindowReference:=Open window:C153($2; $3; $2; $3; 4)
	Else 
		$_l_WindowReference:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 4)
	End if 
End if 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=$_l_WindowReference
DIALOG:C40([USER:15]; "BK_FileOptions")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
SHOW WINDOW:C435
If (DM_l_Save=1)
	//DB_SaveRecord
	$_l_Retries:=0
	While (Semaphore:C143("LoadingSettingsPrefs"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	READ ONLY:C145([PREFERENCES:116])
	
	If (DM_l_DataOptions=0)
		$_l_ItemID:=PREF_GetPreferenceID("Settings "+DM_t_SettingsName)
		If ($_l_ItemID#0)
			//new record
			If ($_l_ItemID<0)
				$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Settings "+DM_t_SettingsName)
			End if 
		End if 
		//DM_l_DataOptions:=$_l_ItemID
		DSS_bo_Enabled:=False:C215
		
	Else 
		$_t_PreferenceItemName:=PREF_GetPreferenceName(DM_l_DataOptions)
		
		If ($_t_PreferenceItemName#"")
			$_l_ItemID:=DM_l_DataOptions
			If ($_t_PreferenceItemName#("Settings "+DM_t_SettingsName))
				//name is changed
				READ WRITE:C146([LIST_ITEMS:95])
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=DM_l_DataOptions)
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[LIST_ITEMS:95]; 0)
					If (Not:C34($_bo_OK))
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
					End if 
				Until ($_bo_OK=True:C214)
				
				
				[LIST_ITEMS:95]List_Entry:2:="Settings "+DM_t_SettingsName
				DB_SaveRecord(->[LIST_ITEMS:95])
				AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				UNLOAD RECORD:C212([LIST_ITEMS:95])
				READ ONLY:C145([LIST_ITEMS:95])
			End if 
		Else 
			//missing in action??
			
			DSS_bo_Enabled:=False:C215
			
			$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Settings "+DM_t_SettingsName)
			DM_l_DataOptions:=0
			
		End if 
	End if 
	
	
	If (DM_l_DataOptions>0)
		READ WRITE:C146([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_DataOptions)
		DM_ScreentoOptions(DM_l_OptionsContext)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		$0:=DM_l_DataOptions
	Else 
		//new record
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
		[PREFERENCES:116]Pref_OwnerID:4:=DM_l_OptionsContext
		DM_ScreentoOptions(DM_l_OptionsContext)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		DM_l_DataOptions:=$_l_ItemID
		$0:=DM_l_DataOptions
		
	End if 
	CLEAR SEMAPHORE:C144("LoadingSettingsPrefs")
	
End if 
ERR_MethodTrackerReturn("BK_EditDataOptions"; $_t_oldMethodName)
