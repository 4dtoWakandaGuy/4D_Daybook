//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetuserAccessRights
	//------------------ Method Notes ------------------
	//Pass in $1 a [DIARY]x_ID
	//and in $2 a [PERSONNEL]Personnel_ID
	//This method will get that persons rights to view/edit other peoples diary items
	//and check who OWNS the diary record-if they can edit records owned by that user it will be read write so this will return 1
	//if they have access to diary items of and of the 'included' diary personne-l[DIARY_ITEMOWNERS] then it will be read only and return 0
	//if they dont have acess it will return -1
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 2:21 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_aAccessRights;0)
	//ARRAY LONGINT(SD2_al_AccessType;0)
	//ARRAY TEXT(SD2_at_aAccessRights;0)
	//ARRAY TEXT(SD2_at_AccessToDiaryof;0)
	//ARRAY TEXT(SD2_at_PersonID;0)
	C_BOOLEAN:C305(SD2_bo_AccessTypesListLoaded)
	C_LONGINT:C283($_l_DiaryID; $_l_ItemID; $_l_ListID; $_l_PersonRow; $_l_PersonRow2; $0; $1; $2; SD2_l_CurrentAccessRightsOwner)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_DiaryPerson; $_t_oldMethodName; $_t_SQLTemp)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetuserAccessRights")
$0:=1
If (SD2_l_CurrentAccessRightsOwner#$2)
	ARRAY LONGINT:C221(SD2_al_AccessType; 0)
	ARRAY TEXT:C222(SD2_at_PersonID; 0)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$2)
	QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person:1=[PERSONNEL:11]Initials:1)
	//These are all the personnel diaries THIS USER HAS ACCESS TO-no the ones related to the personnel record
	SELECTION TO ARRAY:C260([PERSONNEL_DIARY_ACCESS:149]Person_Code:4; SD2_at_AccessToDiaryof; [PERSONNEL_DIARY_ACCESS:149]xAccessType:2; SD2_al_AccessType)
	SD2_l_CurrentAccessRightsOwner:=$2
	
End if 

If ([DIARY:12]x_ID:50#$1)
	$_l_DiaryID:=$1
	$_t_DiaryPerson:=""
	$_t_SQLTemp:="SELECT  Person"+" From DIARY where x_ID =: $_l_DiaryID into :$_t_DiaryPerson"
	
	Begin SQL
		EXECUTE IMMEDIATE :$_t_SQLTemp
	End SQL
	//QUERY([DIARY];[DIARY]x_ID=$1)
Else 
	$_t_DiaryPerson:=[DIARY:12]Person:8
End if 
If (Not:C34(SD2_bo_AccessTypesListLoaded))
	ARRAY TEXT:C222(SD2_at_aAccessRights; 0)
	ARRAY LONGINT:C221(SD2_al_aAccessRights; 0)
	
	$_l_ListID:=AA_LoadListByName("Diary Access Rights"; ->SD2_at_aAccessRights; ->SD2_al_aAccessRights)
	If (Size of array:C274(SD2_at_aAccessRights)=0)
		$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Read Write"; "Read only")
	End if 
	SD2_bo_AccessTypesListLoaded:=True:C214
End if 
$_l_PersonRow:=Find in array:C230(SD2_at_AccessToDiaryof; $_t_DiaryPerson)
If (<>PER_t_CurrentUserInitials#$_t_DiaryPerson)
	If ($_l_PersonRow>0)
		//return the type of access
		$_l_PersonRow2:=Find in array:C230(SD2_al_aAccessRights; SD2_al_AccessType{$_l_PersonRow})
		If ($_l_PersonRow2>0)
			$0:=Num:C11(SD2_at_aAccessRights{$_l_PersonRow2}="Read Write")+1
			
		Else 
			$0:=0
		End if 
		
	Else 
		$0:=0
	End if 
Else 
	$0:=2
End if 
ERR_MethodTrackerReturn("SD2_GetuserAccessRights"; $_t_oldMethodName)
