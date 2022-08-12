//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetUsersAndGroups
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
	//ARRAY LONGINT(<>SP_al_GroupIDs;0)
	//ARRAY LONGINT(<>SP_al_HlistIDs;0)
	//ARRAY LONGINT(<>SP_al_PersonnelIDs;0)
	//ARRAY LONGINT(SP_al_GroupIDs;0)
	//ARRAY LONGINT(SP_al_HlistIDs;0)
	//ARRAY LONGINT(SP_al_PersonnelIDs;0)
	//ARRAY TEXT(<>SP_at_GroupCodes;0)
	//ARRAY TEXT(<>SP_at_GroupNames;0)
	//ARRAY TEXT(<>SP_at_PersonnelGroupCodes;0)
	//ARRAY TEXT(<>SP_at_PersonnelNames;0)
	//ARRAY TEXT(SP_at_GroupCodes;0)
	//ARRAY TEXT(SP_at_GroupNames;0)
	//ARRAY TEXT(SP_at_PersonnelGroupCodes;0)
	//ARRAY TEXT(SP_at_PersonnelNames;0)
	C_LONGINT:C283(<>SP_l_UsersnGroups; $_l_CountPersonnel; $_l_Index; $_l_Index2; $_l_ItemCount; $_l_NextGroupID; SP_l_UsersnGroups)
	C_REAL:C285($1)
	C_TEXT:C284($_t_GroupCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetUsersAndGroups")
ARRAY TEXT:C222(<>SP_at_GroupCodes; 0)
ARRAY TEXT:C222(<>SP_at_PersonnelGroupCodes; 0)
ARRAY TEXT:C222(<>SP_at_GroupNames; 0)
ARRAY TEXT:C222(<>SP_at_PersonnelNames; 0)

If (Records in table:C83([PERSONNEL_GROUPS:92])>0)
	QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=0)
	If (Records in selection:C76([PERSONNEL_GROUPS:92])>0)
		READ WRITE:C146([PERSONNEL_GROUPS:92])
		LOAD RECORD:C52([PERSONNEL_GROUPS:92])
		DB_lockFile(->[PERSONNEL_GROUPS:92])
		APPLY TO SELECTION:C70([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12:=0)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL_GROUPS:92]))
		UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
		READ ONLY:C145([PERSONNEL_GROUPS:92])
	End if 
	
	
	
	QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1#"")
	While (Semaphore:C143("Inserting ◊SP_al_GroupIDs"))
		DelayTicks
	End while 
	Case of 
		: (Count parameters:C259=0)
			SELECTION TO ARRAY:C260([PERSONNEL_GROUPS:92]Group_Code:1; SP_at_GroupCodes; [PERSONNEL_GROUPS:92]Group_Name:2; SP_at_GroupNames; [PERSONNEL_GROUPS:92]x_ID:12; SP_al_GroupIDs)
			SORT ARRAY:C229(SP_al_GroupIDs; SP_at_GroupNames; SP_at_GroupCodes)
			$_l_NextGroupID:=SP_al_GroupIDs{Size of array:C274(SP_al_GroupIDs)}+1
			SORT ARRAY:C229(SP_at_GroupNames; SP_al_GroupIDs; SP_at_GroupCodes)
			INSERT IN ARRAY:C227(SP_at_GroupCodes; Size of array:C274(SP_at_GroupCodes)+1; 1)
			INSERT IN ARRAY:C227(SP_at_GroupNames; Size of array:C274(SP_at_GroupNames)+1; 1)
			SP_at_GroupNames{Size of array:C274(SP_at_GroupNames)}:="No Group"
			INSERT IN ARRAY:C227(SP_al_GroupIDs; Size of array:C274(SP_al_GroupIDs)+1; 1)
			SP_al_GroupIDs{Size of array:C274(SP_al_GroupIDs)}:=$_l_NextGroupID
		Else 
			SELECTION TO ARRAY:C260([PERSONNEL_GROUPS:92]Group_Code:1; <>SP_at_GroupCodes; [PERSONNEL_GROUPS:92]Group_Name:2; <>SP_at_GroupNames; [PERSONNEL_GROUPS:92]x_ID:12; <>SP_al_GroupIDs)
			SORT ARRAY:C229(<>SP_al_GroupIDs; <>SP_at_GroupNames; <>SP_at_GroupCodes)
			$_l_NextGroupID:=<>SP_al_GroupIDs{Size of array:C274(<>SP_al_GroupIDs)}+1
			SORT ARRAY:C229(<>SP_at_GroupNames; <>SP_al_GroupIDs; <>SP_at_GroupCodes)
			INSERT IN ARRAY:C227(<>SP_at_GroupCodes; Size of array:C274(<>SP_at_GroupCodes)+1; 1)
			INSERT IN ARRAY:C227(<>SP_at_GroupNames; Size of array:C274(<>SP_at_GroupNames)+1; 1)
			<>SP_at_GroupNames{Size of array:C274(<>SP_at_GroupNames)}:="No Group"
			INSERT IN ARRAY:C227(<>SP_al_GroupIDs; Size of array:C274(<>SP_al_GroupIDs)+1; 1)
			<>SP_al_GroupIDs{Size of array:C274(<>SP_al_GroupIDs)}:=$_l_NextGroupID
	End case 
	CLEAR SEMAPHORE:C144("Inserting ◊SP_al_GroupIDs")
End if 
//    QUERY([PERSONNEL];[PERSONNEL]Active=True;*)
QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=0)
While (Semaphore:C143("Inserting ◊SP_al_GroupIDs"))
	DelayTicks
End while 
Case of 
	: (Count parameters:C259=0)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SP_at_PersonnelNames; [PERSONNEL:11]Group_Code:28; SP_at_PersonnelGroupCodes; [PERSONNEL:11]Personnel_ID:48; SP_al_PersonnelIDs)
		SORT ARRAY:C229(SP_at_PersonnelNames; SP_at_PersonnelGroupCodes; SP_al_PersonnelIDs)
		$_l_CountPersonnel:=Size of array:C274(SP_at_PersonnelNames)
	Else 
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; <>SP_at_PersonnelNames; [PERSONNEL:11]Group_Code:28; <>SP_at_PersonnelGroupCodes; [PERSONNEL:11]Personnel_ID:48; <>SP_al_PersonnelIDs)
		SORT ARRAY:C229(<>SP_at_PersonnelNames; <>SP_at_PersonnelGroupCodes; <>SP_al_PersonnelIDs)
		$_l_CountPersonnel:=Size of array:C274(<>SP_at_PersonnelNames)
End case 
CLEAR SEMAPHORE:C144("Inserting ◊SP_al_GroupIDs")
While (Semaphore:C143("Inserting ◊SP_al_GroupIDs"))
	DelayTicks
End while 
Case of 
	: (Count parameters:C259=0)
		ARRAY LONGINT:C221(SP_al_HlistIDs; Size of array:C274(SP_al_GroupIDs)+1)
		If (Size of array:C274(SP_at_GroupCodes)>0)
			
			SP_l_UsersnGroups:=New list:C375
			$_l_ItemCount:=0
			For ($_l_Index; 1; Size of array:C274(SP_at_GroupCodes))
				SP_al_HlistIDs{$_l_Index}:=New list:C375
				$_t_GroupCode:=SP_at_GroupCodes{$_l_Index}
				For ($_l_Index2; 1; Size of array:C274(SP_at_PersonnelGroupCodes))
					If (SP_at_PersonnelGroupCodes{$_l_Index2}=$_t_GroupCode)
						$_l_ItemCount:=$_l_ItemCount+1
						APPEND TO LIST:C376(SP_al_HlistIDs{$_l_Index}; SP_at_PersonnelNames{$_l_Index2}; SP_al_PersonnelIDs{$_l_Index2}; 0; False:C215)
					End if 
				End for 
				If ($_l_ItemCount>1)
					APPEND TO LIST:C376(SP_al_HlistIDs{$_l_Index}; "ALL"; -SP_al_GroupIDs{$_l_Index}; 0; False:C215)
				End if 
				If ($_l_ItemCount>0)
					APPEND TO LIST:C376(SP_l_UsersnGroups; SP_at_GroupNames{$_l_Index}; SP_al_GroupIDs{$_l_Index}+999; SP_al_HlistIDs{$_l_Index}; False:C215)
				End if 
			End for 
			SP_al_HlistIDs{$_l_Index}:=New list:C375
			APPEND TO LIST:C376(SP_al_HlistIDs{$_l_Index}; "All Groups"; -999; 0; False:C215)
			APPEND TO LIST:C376(SP_l_UsersnGroups; "Everyone"; 9999; SP_al_HlistIDs{$_l_Index}; False:C215)
		Else 
			//no groups-so only show users
			
			SP_l_UsersnGroups:=New list:C375
			For ($_l_Index2; 1; Size of array:C274(SP_at_PersonnelNames))
				APPEND TO LIST:C376(SP_l_UsersnGroups; SP_at_PersonnelNames{$_l_Index2}; SP_al_PersonnelIDs{$_l_Index2}; 0; False:C215)
			End for 
			
			
		End if 
	: ($1=1)
		ARRAY LONGINT:C221(<>SP_al_HlistIDs; Size of array:C274(<>SP_al_GroupIDs)+1)
		If (Size of array:C274(<>SP_at_GroupCodes)>0)
			
			<>SP_l_UsersnGroups:=New list:C375
			
			For ($_l_Index; 1; Size of array:C274(<>SP_at_GroupCodes))
				<>SP_al_HlistIDs{$_l_Index}:=New list:C375
				$_t_GroupCode:=<>SP_at_GroupCodes{$_l_Index}
				$_l_ItemCount:=0
				For ($_l_Index2; 1; Size of array:C274(<>SP_at_PersonnelGroupCodes))
					If (<>SP_at_PersonnelGroupCodes{$_l_Index2}=$_t_GroupCode)
						$_l_ItemCount:=$_l_ItemCount+1
						APPEND TO LIST:C376(<>SP_al_HlistIDs{$_l_Index}; <>SP_at_PersonnelNames{$_l_Index2}; <>SP_al_PersonnelIDs{$_l_Index2}; 0; False:C215)
					End if 
				End for 
				If ($_l_ItemCount>1)
					APPEND TO LIST:C376(<>SP_al_HlistIDs{$_l_Index}; "ALL"; -<>SP_al_GroupIDs{$_l_Index}; 0; False:C215)
				End if 
				If ($_l_ItemCount>0)
					APPEND TO LIST:C376(<>SP_l_UsersnGroups; <>SP_at_GroupNames{$_l_Index}; <>SP_al_GroupIDs{$_l_Index}+999; <>SP_al_HlistIDs{$_l_Index}; False:C215)
				End if 
				
			End for 
			<>SP_al_HlistIDs{$_l_Index}:=New list:C375
			APPEND TO LIST:C376(<>SP_al_HlistIDs{$_l_Index}; "All Groups"; -999; 0; False:C215)
			APPEND TO LIST:C376(<>SP_l_UsersnGroups; "Everyone"; 9999; <>SP_al_HlistIDs{$_l_Index}; False:C215)
		Else 
			//no groups-so only show users
			<>SP_l_UsersnGroups:=New list:C375
			For ($_l_Index2; 1; Size of array:C274(<>SP_at_PersonnelNames))
				APPEND TO LIST:C376(<>SP_l_UsersnGroups; <>SP_at_PersonnelNames{$_l_Index2}; <>SP_al_PersonnelIDs{$_l_Index2}; 0; False:C215)
			End for 
			
			
		End if 
End case 
CLEAR SEMAPHORE:C144("Inserting ◊SP_al_GroupIDs")
ERR_MethodTrackerReturn("SP_GetUsersAndGroups"; $_t_oldMethodName)
