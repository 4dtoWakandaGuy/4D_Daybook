//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_CheckUserFonts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	ARRAY TEXT:C222($_at_installedFonts; 0)
	//ARRAY TEXT(DB_at_LocalFontPreference;0)
	//ARRAY TEXT(DB_at_MachineNames;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305($_bo_Option; $_bo_UserModify; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_FontsIndex; $_l_ItemID; $_l_MachineRow; $_l_offset; $_l_Retries; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>FormFont; $_t_MachineName; $_t_oldMethodName; DB_t_WindowTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CheckUserFonts")

//NG August 2004
//This method runs on the client and single user versions of daybook
//this checks that fonts required are installed in the system
$_t_oldMethodName:=ERR_MethodTracker("DB_CheckUserFonts")
ARRAY TEXT:C222($_at_installedFonts; 0)
FONT LIST:C460($_at_installedFonts)
$_bo_Option:=(Gen_Option)

If (Find in array:C230($_at_installedFonts; <>FormFont)<0) | ($_bo_Option)
	$_l_Retries:=0
	While (Semaphore:C143("LoadingFontPrefs"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	$_l_ItemID:=PREF_GetPreferenceID("Font Preferences")
	
	$_l_offset:=0
	ARRAY TEXT:C222(DB_at_MachineNames; 0)
	ARRAY TEXT:C222(DB_at_LocalFontPreference; 0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		VARIABLE TO BLOB:C532(DB_at_MachineNames; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DB_at_LocalFontPreference; [PREFERENCES:116]DataBlob:2; *)
		
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_at_MachineNames; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_at_LocalFontPreference; $_l_offset)
	End if 
	CLEAR SEMAPHORE:C144("LoadingFontPrefs")
	
	$_t_MachineName:=Current machine:C483
	If ($_t_MachineName#"")
		$_l_MachineRow:=Find in array:C230(DB_at_MachineNames; $_t_MachineName)
		If ($_l_MachineRow>0)
			<>FormFont:=DB_at_LocalFontPreference{$_l_MachineRow}
		End if 
		
	Else 
		$_l_MachineRow:=-99  // cant save preference
	End if 
	$_bo_UserModify:=False:C215
	If (Gen_Option)
		$_bo_UserModify:=True:C214
	End if 
	If ($_l_MachineRow<0) | ($_bo_UserModify)
		SPLASH_HIDE
		Gen_Alert("The selected preferred printing font ("+<>FormFont+") is not installed on this computer, this may cause problems so you need to selec"+"t a different font, you should install the required font on this machine")
		ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274($_at_installedFonts))
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274($_at_installedFonts))
		SORT ARRAY:C229($_at_installedFonts)
		$_l_CurrentRow:=0
		For ($_l_FontsIndex; 1; Size of array:C274($_at_installedFonts))
			If (Length:C16($_at_installedFonts{$_l_FontsIndex})<56)
				$_l_CurrentRow:=$_l_CurrentRow+1
				GEN_at_DropDownMenu{$_l_CurrentRow}:=$_at_installedFonts{$_l_FontsIndex}
			End if 
		End for 
		
		
		GEN_Bo_ShowCreate:=False:C215
		DB_t_WindowTitle:="Select Font"
		GEN_at_DropDownMenu:=0
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1986)
		DIALOG:C40([USER:15]; "Gen_PopUpChoice")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (GEN_at_DropDownMenu>0)
			<>FormFont:=GEN_at_DropDownMenu{GEN_at_DropDownMenu}
		Else 
			<>FormFont:="Times"
		End if 
		ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
		If ($_l_MachineRow=-1) | ($_bo_UserModify)
			//machine was not unknown so store it
			$_l_Retries:=0
			While (Semaphore:C143("WriteFontPrefs"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End while 
			
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_at_MachineNames; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DB_at_LocalFontPreference; $_l_offset)
			$_l_MachineRow:=Find in array:C230(DB_at_MachineNames; $_t_MachineName)
			If ($_l_MachineRow<0)
				INSERT IN ARRAY:C227(DB_at_MachineNames; Size of array:C274(DB_at_MachineNames)+1; 1)
				INSERT IN ARRAY:C227(DB_at_LocalFontPreference; Size of array:C274(DB_at_LocalFontPreference)+1; 1)
				$_l_MachineRow:=Size of array:C274(DB_at_LocalFontPreference)
			End if 
			
			DB_at_MachineNames{$_l_MachineRow}:=$_t_MachineName
			DB_at_LocalFontPreference{$_l_MachineRow}:=<>FormFont
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(DB_at_MachineNames; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DB_at_LocalFontPreference; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			CLEAR SEMAPHORE:C144("WriteFontPrefs")
			
			
		End if 
		
		
		SPLASH_SHOW
	End if 
End if 
ERR_MethodTrackerReturn("DB_CheckUserFonts"; $_t_oldMethodName)