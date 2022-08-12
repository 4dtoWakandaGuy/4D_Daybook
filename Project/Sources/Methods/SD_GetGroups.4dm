//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetGroups
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DiaryGroupIDS; 0)
	ARRAY LONGINT:C221($_al_DiaryGroupOwners; 0)
	ARRAY LONGINT:C221($_al_GroupMembers; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes2; 0)
	//ARRAY LONGINT(SD_al_DiaryGroupIDS;0)
	//ARRAY LONGINT(SD_al_MyDiaryGroupIDS;0)
	//ARRAY LONGINT(SD_al_MyDiaryGroupMembers;0;0)
	//ARRAY LONGINT(SD_al_DiaryGroupMembers;0)
	//ARRAY LONGINT(SD_al_DiaryGroupOwners;0)
	//ARRAY LONGINT(SD_l_aMyDiaryGroupIDS;0)
	//ARRAY LONGINT(SD_al_MyDiaryGroupOwners;0)
	//ARRAY LONGINT(SD_al_MyDiaryOwnedGroupIDs;0)
	ARRAY OBJECT:C1221($_aObj_DiaryGroupMembers; 0)
	ARRAY OBJECT:C1221($_aObj_GroupMembers; 0)
	ARRAY TEXT:C222($_at_DiaryGroupNames; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_Properties2; 0)
	//ARRAY TEXT(SD_at_DiaryGroupNames;0)
	//ARRAY TEXT(SD_at_MyDiaryGroups;0)
	//ARRAY TEXT(SD_at_MyOwnedGroups;0)
	C_BOOLEAN:C305($_bo_PersonnelSelection; $2)
	C_LONGINT:C283($_i_Index; $_l_GroupIDS; $_l_GroupMembers; $_l_GroupNames; $_l_GroupOwners; $_l_GroupRow; $_l_Index; $_l_RecordNumber; $1)
	C_OBJECT:C1216($_obj_DiaryGroups; $0)
	C_TEXT:C284(<>PER_t_UserGroup; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD_GetGroups")

//this method will load the pref from the [Preferences] for groups
//plus it will load the group from groups
//this will populate a list of GROUP IDS to which this user belongs
//NOTE : if the [preference] is modified as it can be by any user
//then then this method needs to be re-called to reset the groups
//In the preferences
//the data is stored in the following
//1) List of group names
//2) List of Group IDs
//3) List of Group owner IDS
//For each ID a list of Group member IDS

$_obj_DiaryGroups:=SD_groupPrefs
ARRAY TEXT:C222(SD_at_MyDiaryGroups; 0)
ARRAY LONGINT:C221(SD_al_MyDiaryGroupIDS; 0)
ARRAY LONGINT:C221(SD_al_MyDiaryGroupOwners; 0)
ARRAY LONGINT:C221(SD_al_MyDiaryGroupMembers; 0; 0)
ARRAY TEXT:C222(SD_at_MyOwnedGroups; 0)

ARRAY LONGINT:C221(SD_al_MyDiaryOwnedGroupIDs; 0)
OB GET PROPERTY NAMES:C1232($_obj_DiaryGroups; $_at_Properties; $_al_PropertyTypes)
$_l_GroupNames:=Find in array:C230($_at_Properties; "DiaryGroupNames")
$_l_GroupIDS:=Find in array:C230($_at_Properties; "DiaryGroupIDS")
$_l_GroupOwners:=Find in array:C230($_at_Properties; "DiaryGroupOwners")
$_l_GroupMembers:=Find in array:C230($_at_Properties; "DiaryGroupMembers")
If ($_l_GroupNames>0) & ($_l_GroupIDS>0) & ($_l_GroupOwners>0) & ($_l_GroupMembers>0)
	OB GET ARRAY:C1229($_obj_DiaryGroups; "DiaryGroupNames"; $_at_DiaryGroupNames)
	OB GET ARRAY:C1229($_obj_DiaryGroups; "DiaryGroupMembers"; $_aObj_DiaryGroupMembers)
	OB GET ARRAY:C1229($_obj_DiaryGroups; "DiaryGroupIDS"; $_al_DiaryGroupIDS)
	OB GET ARRAY:C1229($_obj_DiaryGroups; "DiaryGroupOwners"; $_al_DiaryGroupOwners)
	
	
	For ($_l_Index; 1; Size of array:C274($_at_DiaryGroupNames))
		OB GET PROPERTY NAMES:C1232($_aObj_DiaryGroupMembers{$_l_Index}; $_at_Properties2; $_al_PropertyTypes2)
		ARRAY LONGINT:C221($_al_GroupMembers; 0)
		
		If (Find in array:C230($_at_Properties2; "Row "+String:C10($_l_Index))>0)
			OB GET ARRAY:C1229($_aObj_DiaryGroupMembers{$_l_Index}; "Row "+String:C10($_l_Index); $_al_GroupMembers)
		End if 
		$_l_GroupRow:=Find in array:C230($_al_GroupMembers; $1)
		If ($_l_GroupRow>0)
			APPEND TO ARRAY:C911(SD_at_MyDiaryGroups; $_at_DiaryGroupNames{$_l_Index})
			APPEND TO ARRAY:C911(SD_al_MyDiaryGroupIDS; $_al_DiaryGroupIDS{$_l_Index})
			APPEND TO ARRAY:C911(SD_al_MyDiaryGroupOwners; $_al_DiaryGroupOwners{$_l_Index})
			INSERT IN ARRAY:C227(SD_al_MyDiaryGroupMembers; Size of array:C274(SD_al_MyDiaryGroupMembers)+1; 1)
			COPY ARRAY:C226($_al_GroupMembers; SD_al_MyDiaryGroupMembers{Size of array:C274(SD_al_MyDiaryGroupMembers)})
		End if 
		If (SD_al_DiaryGroupOwners{$_l_Index}=$1)  //its my group!
			APPEND TO ARRAY:C911(SD_at_MyOwnedGroups; $_at_DiaryGroupNames{$_l_Index})
			APPEND TO ARRAY:C911(SD_al_MyDiaryOwnedGroupIDs; $_al_DiaryGroupIDS{$_l_Index})
		End if 
	End for 
End if 
//now add in the group to which i belong in the log in
If (Count parameters:C259>=2)
	$_bo_PersonnelSelection:=$2
Else 
	$_bo_PersonnelSelection:=False:C215
End if 
If (Not:C34($_bo_PersonnelSelection))
	If (<>PER_t_UserGroup#"")
		$_l_RecordNumber:=Record number:C243([PERSONNEL:11])  //BSW 24/04/03
		COPY NAMED SELECTION:C331([PERSONNEL:11]; "$Temp")
		If ($_l_RecordNumber#-1) | ($_l_RecordNumber=-3)
			PUSH RECORD:C176([PERSONNEL:11])
		End if 
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=<>PER_t_UserGroup)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
		APPEND TO ARRAY:C911(SD_at_MyDiaryGroups; [PERSONNEL_GROUPS:92]Group_Name:2)
		APPEND TO ARRAY:C911(SD_al_MyDiaryGroupIDS; [PERSONNEL_GROUPS:92]x_ID:12)
		APPEND TO ARRAY:C911(SD_al_MyDiaryGroupOwners; -1)
		INSERT IN ARRAY:C227(SD_al_MyDiaryGroupMembers; Size of array:C274(SD_al_MyDiaryGroupMembers)+1; 1)
		APPEND TO ARRAY:C911(SD_al_MyDiaryGroupMembers{Size of array:C274(SD_al_MyDiaryGroupMembers)}; [PERSONNEL:11]Personnel_ID:48)
		
		SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD_al_MyDiaryGroupMembers{Size of array:C274(SD_al_MyDiaryGroupMembers)})
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=<>PER_t_UserGroup)  //BSW 24/04/03
		USE NAMED SELECTION:C332("$temp")
		If ($_l_RecordNumber#-1)
			POP RECORD:C177([PERSONNEL:11])
		End if 
		If ($_l_RecordNumber>=0)  //BSW 24/04/03
			GOTO RECORD:C242([PERSONNEL:11]; $_l_RecordNumber)  //BSW 24/04/03
		Else 
			ONE RECORD SELECT:C189([PERSONNEL:11])
		End if   //BSW 24/04/03
		
	End if 
End if 


SORT ARRAY:C229(SD_at_MyDiaryGroups; SD_al_MyDiaryGroupIDS; SD_al_MyDiaryGroupOwners; SD_al_MyDiaryGroupMembers)

OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryOwnedGroupNames"; SD_at_MyOwnedGroups)
OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryOwnedGroupIDS"; SD_al_MyDiaryOwnedGroupIDs)

OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryGroupNames"; SD_at_MyDiaryGroups)
OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryGroupIDS"; SD_al_MyDiaryGroupIDS)
OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryGroupOwners"; SD_al_MyDiaryGroupOwners)
//C_OBJECT($_aObj_GroupMembers)
ARRAY OBJECT:C1221($_aObj_GroupMembers; 0)
ARRAY OBJECT:C1221($_aObj_GroupMembers; Size of array:C274(SD_at_DiaryGroupNames))
If (Size of array:C274(SD_al_MyDiaryGroupMembers)>0)
	For ($_i_Index; 1; Size of array:C274(SD_al_MyDiaryGroupMembers))
		OB SET ARRAY:C1227($_obj_DiaryGroups; "Row "+String:C10($_i_Index); SD_al_MyDiaryGroupMembers{$_i_Index})
	End for 
End if 
OB SET ARRAY:C1227($_obj_DiaryGroups; "DiaryGroupMembers"; $_aObj_GroupMembers)
$0:=$_obj_DiaryGroups
ERR_MethodTrackerReturn("SD_GetGroups"; $_t_oldMethodName)
