//%attributes = {}
If (False:C215)
	//Project Method Name:      Per_GetDiaryShares
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PER_al_AccessType;0)
	//ARRAY LONGINT(AB_al_AccessRights;0)
	//ARRAY TEXT(<>PER_at_AccessType;0)
	//ARRAY TEXT(<>PER_at_DiaryShareInitials;0)
	//ARRAY TEXT(<>PER_at_DiarySharePerson;0)
	ARRAY TEXT:C222($_at_PersonInitials; 0)
	//ARRAY TEXT(AB_at_AccessRights;0)
	C_BOOLEAN:C305(PER_Bo_ShareSetup)
	C_LONGINT:C283($_l_AccessListID; $_l_accessPosition; $_l_iitemID; $_l_index; $_l_RRPosition; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_PersonInitials; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Per_GetDiaryShares")
//this method will return a list of the people who
//have access to the diary whose initials are passed in $2

If (Count parameters:C259>=2)
	$_t_PersonInitials:=$2
	ARRAY TEXT:C222(<>PER_at_DiarySharePerson; 0)
	ARRAY TEXT:C222(<>PER_at_DiaryShareInitials; 0)
	If ($2#"")
		QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person:1=$_t_PersonInitials)
		SELECTION TO ARRAY:C260([PERSONNEL_DIARY_ACCESS:149]Person_Code:4; $_at_PersonInitials)
		QUERY WITH ARRAY:C644([PERSONNEL:11]Initials:1; $_at_PersonInitials)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; <>PER_at_DiarySharePerson; [PERSONNEL:11]Initials:1; <>PER_at_DiaryShareInitials)
		ARRAY TEXT:C222(<>PER_at_AccessType; Size of array:C274(<>PER_at_DiaryShareInitials))
		ARRAY LONGINT:C221(<>PER_al_AccessType; Size of array:C274(<>PER_at_DiaryShareInitials))
		FIRST RECORD:C50([PERSONNEL:11])
		For ($_l_index; 1; Records in selection:C76([PERSONNEL:11]))
			QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=[PERSONNEL:11]Initials:1)
			
			If (Records in selection:C76([PERSONNEL_DIARY_ACCESS:149])>0)
				
				QUERY SELECTION:C341([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person:1=$_t_PersonInitials)
				<>PER_al_AccessType{$_l_index}:=[PERSONNEL_DIARY_ACCESS:149]xAccessType:2
			End if 
			
			NEXT RECORD:C51([PERSONNEL:11])
		End for 
		ARRAY TEXT:C222(AB_at_AccessRights; 0)
		ARRAY LONGINT:C221(AB_al_AccessRights; 0)
		$_l_AccessListID:=AA_LoadListByName("Diary Access Rights"; ->AB_at_AccessRights; ->AB_al_AccessRights)
		If (Size of array:C274(AB_at_AccessRights)=0)
			$_l_iitemID:=AA_ListAddItembyID($_l_AccessListID; "Read Write"; "Read only")
		End if 
		For ($_l_index; 1; Size of array:C274(<>PER_al_AccessType))
			If (<>PER_al_AccessType{$_l_index}>0)
				$_l_accessPosition:=Find in array:C230(AB_al_AccessRights; <>PER_al_AccessType{$_l_index})
				If ($_l_accessPosition>0)
					<>PER_at_AccessType{$_l_index}:=AB_at_AccessRights{$_l_accessPosition}
				Else 
					<>PER_al_AccessType{$_l_index}:=0
					<>PER_at_AccessType{$_l_index}:=""
				End if 
			Else 
				$_l_RRPosition:=Find in array:C230(AB_at_AccessRights; "Read Write")
				If ($_l_RRPosition<0)
					$_l_iitemID:=AA_ListAddItembyID($_l_AccessListID; "Read Write")
					$_l_RRPosition:=Find in array:C230(AB_al_AccessRights; $_l_iitemID)
				End if 
				If ($_l_RRPosition>0)  //it should be
					<>PER_al_AccessType{$_l_index}:=AB_al_AccessRights{$_l_RRPosition}
					<>PER_at_AccessType{$_l_index}:="Read Write"
				End if 
				
			End if 
			
		End for 
		
	End if 
	SET PROCESS VARIABLE:C370($1; PER_Bo_ShareSetup; True:C214)
	
End if 
ERR_MethodTrackerReturn("Per_GetDiaryShares"; $_t_oldMethodName)