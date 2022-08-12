//%attributes = {}

If (False:C215)
	//Database Method Name:      SD_groupPrefs
	//------------------ Method Notes ------------------
	If (False:C215)  // ----------------------------------------------------
		//Creator: Nigel Greenlee
		//Date & time: 22/06/2009 10:45
		//Method Name: SD_groupPrefs
		//Description
		
		//Parameters
		//Declarations
		// ----------------------------------------------------
		//Project method Amendments
		//End Project method Amendments
	End if 
	//------------------ Revision Control ----------------
	//Date Created:  07/10/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_DiaryGroupIDS;0)
	//ARRAY LONGINT(SD_al_DiaryGroupMembers;0;0)
	//ARRAY LONGINT(SD_al_DiaryGroupOwners;0)
	ARRAY OBJECT:C1221($_aObj_GroupMembers; 0)
	//ARRAY TEXT(SD_at_DiaryGroupNames;0)
	C_BOOLEAN:C305(SD_Bo_PrefsLoaded)
	C_LONGINT:C283($_i_Index; $_l_Index; $_l_ItemID; $_l_Offset)
	C_OBJECT:C1216($_obj_DiaryGroups; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD_groupPrefs")

//this method load the Diary groups(stored in Prefs)
ARRAY TEXT:C222(SD_at_DiaryGroupNames; 0)
ARRAY LONGINT:C221(SD_al_DiaryGroupIDS; 0)
ARRAY LONGINT:C221(SD_al_DiaryGroupOwners; 0)
ARRAY LONGINT:C221(SD_al_DiaryGroupMembers; 0; 0)  //NOTE 2 Dimensional
If (Not:C34(SD_Bo_PrefsLoaded))
	READ ONLY:C145([PREFERENCES:116])
	While (Semaphore:C143("LoadingPrefsDiary"))
		DelayTicks(2)
	End while 
	$_l_ItemID:=PREF_GetPreferenceID("Diary Groups")
	CLEAR SEMAPHORE:C144("LoadingPrefsDiary")
	
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_Offset:=0
		VARIABLE TO BLOB:C532(SD_at_DiaryGroupNames; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_al_DiaryGroupIDS; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD_al_DiaryGroupOwners; [PREFERENCES:116]DataBlob:2; *)
		//cannot write the blank 2D array in!
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		$_l_Offset:=0
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_DiaryGroupNames; $_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_DiaryGroupIDS; $_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_DiaryGroupOwners; $_l_Offset)
		For ($_l_Index; 1; Size of array:C274(SD_at_DiaryGroupNames))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_DiaryGroupMembers{$_l_Index}; $_l_Offset)
		End for 
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		
	End if 
	SD_Bo_PrefsLoaded:=True:C214
	
	
End if 
OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryGroupNames"; SD_at_DiaryGroupNames)
OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryGroupIDS"; SD_al_DiaryGroupIDS)
OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryGroupOwners"; SD_al_DiaryGroupOwners)
//C_OBJECT($_aObj_GroupMembers)
ARRAY OBJECT:C1221($_aObj_GroupMembers; 0)
ARRAY OBJECT:C1221($_aObj_GroupMembers; Size of array:C274(SD_at_DiaryGroupNames))

For ($_i_Index; 1; Size of array:C274(SD_al_DiaryGroupMembers))
	OB SET ARRAY:C1227($_aObj_GroupMembers; "Row "+String:C10($_i_Index); SD_al_DiaryGroupMembers{$_i_Index})
End for 
OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryGroupMembers"; $_aObj_GroupMembers)
$0:=$_obj_DiaryGroups
ERR_MethodTrackerReturn("SD_groupPrefs"; $_t_oldMethodName)
