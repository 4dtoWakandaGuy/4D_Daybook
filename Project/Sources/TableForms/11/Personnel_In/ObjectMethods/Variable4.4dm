If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>MP_al_DiaryAccessID;0)
	//ARRAY LONGINT(<>PER_al_RelateIDs;0)
	//ARRAY LONGINT(<>PER_al_RemoveRelationID;0)
	//ARRAY TEXT(<>MP_at_DiaryAccessNames;0)
	//ARRAY TEXT(<>MP_at_DiaryAcessInitials;0)
	//ARRAY TEXT(<>PER_at_RelateInitials;0)
	//ARRAY TEXT(<>PER_at_RelateNames;0)
	C_LONGINT:C283($_l_IDPosition; $_l_Index; $_l_Process; $_l_ProcessState; $_l_ProcessTime)
	C_TEXT:C284($_t_Initials; $_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable4"; Form event code:C388)


$_l_Process:=New process:C317("MP_ModifyDiaryAccess"; 128000; "Modify Access"; Current process:C322; [PERSONNEL:11]Personnel_ID:48)

DelayTicks(5)
Repeat 
	//   $_l_ProcessState:=Process state($_l_Process)
	PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	If ($_l_ProcessState>=0) & ($_t_ProcessName="Modify Access")
		DelayTicks(3)
	End if 
	$_l_ProcessState:=Process state:C330($_l_Process)
Until ($_l_ProcessState<0) | ($_t_ProcessName#"Modify Access")

SHOW PROCESS:C325(Current process:C322)
BRING TO FRONT:C326(Current process:C322)

If (Size of array:C274(<>PER_at_RelateInitials)>0)
	For ($_l_Index; 1; Size of array:C274(<>PER_at_RelateInitials))
		CREATE RECORD:C68([PERSONNEL_DIARY_ACCESS:149])
		[PERSONNEL_DIARY_ACCESS:149]Person_Code:4:=[PERSONNEL:11]Initials:1
		[PERSONNEL_DIARY_ACCESS:149]ID:3:=AA_GetNextID(->[PERSONNEL_DIARY_ACCESS:149]ID:3)
		[PERSONNEL_DIARY_ACCESS:149]Person:1:=<>PER_at_RelateInitials{$_l_Index}
		DB_SaveRecord(->[PERSONNEL_DIARY_ACCESS:149])
		
		
		INSERT IN ARRAY:C227(<>MP_at_DiaryAcessInitials; 9999; 1)
		INSERT IN ARRAY:C227(<>MP_at_DiaryAccessNames; 9999; 1)
		INSERT IN ARRAY:C227(<>MP_al_DiaryAccessID; 9999; 1)
		<>MP_al_DiaryAccessID{Size of array:C274(<>MP_al_DiaryAccessID)}:=<>PER_al_RelateIDs{$_l_Index}
		<>MP_at_DiaryAccessNames{Size of array:C274(<>MP_at_DiaryAccessNames)}:=<>PER_at_RelateNames{$_l_Index}
		<>MP_at_DiaryAcessInitials{Size of array:C274(<>MP_at_DiaryAcessInitials)}:=<>PER_at_RelateInitials{$_l_Index}
	End for 
End if 
If (Size of array:C274(<>PER_al_RemoveRelationID)>0)
	For ($_l_Index; 1; Size of array:C274(<>PER_al_RemoveRelationID))
		$_l_IDPosition:=Find in array:C230(<>MP_al_DiaryAccessID; <>PER_al_RemoveRelationID{$_l_Index})
		$_t_Initials:=<>MP_at_DiaryAcessInitials{$_l_IDPosition}
		QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=[PERSONNEL:11]Initials:1; *)
		QUERY:C277([PERSONNEL_DIARY_ACCESS:149];  & ; [PERSONNEL_DIARY_ACCESS:149]Person:1=$_t_Initials)
		DELETE RECORD:C58([PERSONNEL_DIARY_ACCESS:149])
		QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=[PERSONNEL:11]Initials:1)
		DELETE FROM ARRAY:C228(<>MP_at_DiaryAcessInitials; $_l_IDPosition; 1)
		DELETE FROM ARRAY:C228(<>MP_at_DiaryAccessNames; $_l_IDPosition; 1)
		DELETE FROM ARRAY:C228(<>MP_al_DiaryAccessID; $_l_IDPosition; 1)
	End for 
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Variable4"; $_t_oldMethodName)
