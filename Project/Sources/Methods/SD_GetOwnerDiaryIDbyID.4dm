//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetOwnerDiaryIDbyID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 20:31`Method: SD_GetOwnerDiaryIDbyID
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_aDiaryOwnerIds;0)
	//ARRAY LONGINT(SD_al_DiaryOwnerIds;0)
	//ARRAY LONGINT(SD2_al_UserIDS;0)
	//ARRAY TEXT(SD_at_aDiaryOwners;0)
	//ARRAY TEXT(SD_at_aPersonInitials;0)
	C_BOOLEAN:C305(SD2_bo_DiaryUsersInited)
	C_LONGINT:C283($_l_ParameterIndex; $_l_PersonRow; $1)
	C_POINTER:C301($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetOwnerDiaryIDbyID")

//This method will return not the data but a pointer to an array with the IDs of the Diary IDs to get..this particular variant  will create an array of ids from the paramters
ARRAY LONGINT:C221(SD2_al_UserIDS; 0)
If (Not:C34(SD2_bo_DiaryUsersInited))
	ARRAY LONGINT:C221(SD_al_aDiaryOwnerIds; 0)
	ARRAY TEXT:C222(SD_at_aDiaryOwners; 0)
	ARRAY TEXT:C222(SD_at_aPersonInitials; 0)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1)
	SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD_al_DiaryOwnerIds; [PERSONNEL:11]Initials:1; SD_at_aPersonInitials; [PERSONNEL:11]Name:2; SD_at_aDiaryOwners)
	SD2_bo_DiaryUsersInited:=True:C214
End if 
If (Count parameters:C259>0)
	For ($_l_ParameterIndex; 1; Count parameters:C259)
		$_l_PersonRow:=Find in array:C230(SD_al_DiaryOwnerIds; ${$_l_ParameterIndex})
		If ($_l_PersonRow>0)
			APPEND TO ARRAY:C911(SD2_al_UserIDS; SD_al_DiaryOwnerIds{$_l_PersonRow})
		End if 
	End for 
	
End if 
$0:=->SD2_al_UserIDS
ERR_MethodTrackerReturn("SD_GetOwnerDiaryIDbyID"; $_t_oldMethodName)
