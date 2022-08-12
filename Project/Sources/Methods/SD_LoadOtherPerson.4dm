//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_LoadOtherPerson
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
	//ARRAY LONGINT(SD_al_DIOPersonnelid;0)
	//ARRAY LONGINT(SD_al_DIORelid;0)
	//ARRAY TEXT(SD_at_DIOPersonnelNAME;0)
	C_LONGINT:C283($_l_Index; $_l_PersonID; $_l_PersonRow; Badd_Person)
	C_TEXT:C284($_t_oldMethodName; $1; $2; SD_t_DiaryDefaultUser; SD_t_DiaryPersonName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_LoadOtherPerson")
READ ONLY:C145([DIARY_ITEMOWNERS:106])
READ ONLY:C145([PERSONNEL:11])
ARRAY LONGINT:C221(SD_al_DIORelid; 0)
ARRAY LONGINT:C221(SD_al_DIOPersonnelid; 0)
ARRAY TEXT:C222(SD_at_DIOPersonnelNAME; 0)
If ($1#"") & ($2#"")
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=$1; *)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$2)
	$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
	QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2#$_l_PersonID)
	
	
	SORT ARRAY:C229(SD_al_DIOPersonnelid; SD_al_DIORelid)
	$_l_PersonRow:=Find in array:C230(SD_al_DIORelid; 3)
	If ($_l_PersonRow>0)
		INSERT IN ARRAY:C227(SD_al_DIOPersonnelid; $_l_PersonRow; 1)
		INSERT IN ARRAY:C227(SD_al_DIORelid; $_l_PersonRow; 1)
	End if 
	
	For ($_l_Index; Size of array:C274(SD_al_DIOPersonnelid)-1; 1; -1)
		$_l_PersonRow:=Find in array:C230(SD_al_DIOPersonnelid; SD_al_DIOPersonnelid{$_l_Index}; $_l_Index+1)
		If ($_l_PersonRow>0)
			DELETE FROM ARRAY:C228(SD_al_DIOPersonnelid; $_l_PersonRow; 1)
			DELETE FROM ARRAY:C228(SD_al_DIORelid; $_l_PersonRow; 1)
		End if 
	End for 
	ARRAY TEXT:C222(SD_at_DIOPersonnelNAME; Size of array:C274(SD_al_DIOPersonnelid))
	For ($_l_Index; 1; Size of array:C274(SD_al_DIOPersonnelid))
		If (SD_al_DIOPersonnelid{$_l_Index}>0)
			$_l_PersonRow:=Find in array:C230(SD_al_DIOPersonnelid; SD_al_DIOPersonnelid{$_l_Index}; $_l_Index+1)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SD_al_DIOPersonnelid{$_l_Index})
			SD_at_DIOPersonnelNAME{$_l_Index}:=[PERSONNEL:11]Name:2
		Else 
			SD_at_DIOPersonnelNAME{$_l_Index}:="-"
		End if 
	End for 
	If (Size of array:C274(SD_al_DIOPersonnelid)>0)
		If ([DIARY:12]Done:14=False:C215) & ([DIARY:12]Date_Do_From:4>=Current date:C33(*)) & ([DIARY:12]Person:8=SD_t_DiaryDefaultUser)
			INSERT IN ARRAY:C227(SD_al_DIOPersonnelid; 1; 1)
			INSERT IN ARRAY:C227(SD_al_DIORelid; 1; 1)
			INSERT IN ARRAY:C227(SD_at_DIOPersonnelNAME; 1; 1)
			SD_al_DIOPersonnelid{1}:=$_l_PersonID
			SD_al_DIORelid{1}:=1
			SD_at_DIOPersonnelNAME{1}:=SD_t_DiaryPersonName
			
			SD_AllowEditDiaryOwnersOption(True:C214)  //17/10/08 v621b120a, kmw - factored out and expanded slightly so can use elsewhere (e.g...need to display/undisplay edit option whenever Diary_Done gets changed)
			
			OBJECT SET VISIBLE:C603(SD_at_DIOPersonnelNAME; True:C214)
			OBJECT SET VISIBLE:C603(Badd_Person; False:C215)
			SD_at_DIOPersonnelNAME:=1
			OBJECT SET VISIBLE:C603([DIARY:12]Person:8; False:C215)
			OBJECT SET VISIBLE:C603(SD_t_DiaryPersonName; False:C215)
		Else 
			INSERT IN ARRAY:C227(SD_al_DIOPersonnelid; 1; 1)
			INSERT IN ARRAY:C227(SD_al_DIORelid; 1; 1)
			INSERT IN ARRAY:C227(SD_at_DIOPersonnelNAME; 1; 1)
			SD_al_DIOPersonnelid{1}:=$_l_PersonID
			SD_al_DIORelid{1}:=1
			SD_at_DIOPersonnelNAME{1}:=SD_t_DiaryPersonName
			OBJECT SET VISIBLE:C603(SD_at_DIOPersonnelNAME; True:C214)
			OBJECT SET VISIBLE:C603(Badd_Person; False:C215)
			SD_at_DIOPersonnelNAME:=1
			OBJECT SET VISIBLE:C603([DIARY:12]Person:8; False:C215)
			OBJECT SET VISIBLE:C603(SD_t_DiaryPersonName; False:C215)
			
		End if 
	Else 
		OBJECT SET VISIBLE:C603(SD_at_DIOPersonnelNAME; False:C215)
		If ([DIARY:12]Person:8=SD_t_DiaryDefaultUser) & ([DIARY:12]Done:14=False:C215) & ([DIARY:12]Date_Do_From:4>=Current date:C33(*))
			OBJECT SET VISIBLE:C603(Badd_Person; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(Badd_Person; False:C215)
		End if 
		
		OBJECT SET VISIBLE:C603([DIARY:12]Person:8; True:C214)
		OBJECT SET VISIBLE:C603(SD_t_DiaryPersonName; True:C214)
	End if 
	
Else 
	OBJECT SET VISIBLE:C603(SD_at_DIOPersonnelNAME; False:C215)
	OBJECT SET VISIBLE:C603(Badd_Person; False:C215)
	OBJECT SET VISIBLE:C603([DIARY:12]Person:8; True:C214)
	OBJECT SET VISIBLE:C603(SD_t_DiaryPersonName; True:C214)
End if 
ERR_MethodTrackerReturn("SD_LoadOtherPerson"; $_t_oldMethodName)
