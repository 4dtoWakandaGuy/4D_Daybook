//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GetOtherDiaries
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
	//ARRAY LONGINT(<>SD_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(<>SD_al_CombineResourceDiaries;0)
	ARRAY LONGINT:C221($_al_CombinePersonDiaries; 0)
	ARRAY LONGINT:C221($_al_UsedIDS; 0)
	ARRAY LONGINT:C221($_al_CombineGroupDiaries; 0)
	ARRAY LONGINT:C221($_al_CombineResourceDiaries; 0)
	//ARRAY LONGINT(SD_al_MyDiaryGroupIDS;0)
	//ARRAY LONGINT(SD_al_MyDiaryGroupMembers;0)
	//ARRAY LONGINT(SD_l_aMyDiaryGroupIDS;0)
	//ARRAY TEXT(SD_at_MyDiaryGroups;0)
	//ARRAY TEXT(SD_t_aMyDiaryGroups;0)
	C_LONGINT:C283($_l_GroupID; $_l_GroupRow; $_l_Index; $_l_Index2; $1)
	C_POINTER:C301($2; $3; $4)
	C_TEXT:C284($_t_Initals; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetOtherDiaries")
//this method will get additional diary items
//there are 2 catagories
//firstly the concept of combined diaries(set in the multi-window
//◊SD_l_CombineGroupDiaries
//◊SD_l_CombineResourceDiaries
//◊SD_l_CombinePersonDiaries
//Secondly there is the concept of group owned items.
CREATE EMPTY SET:C140([DIARY:12]; "TeamItems")
CREATE EMPTY SET:C140([DIARY:12]; "Other")
CREATE EMPTY SET:C140([DIARY:12]; "TeamItems")
ARRAY LONGINT:C221($_al_CombinePersonDiaries; 0)
ARRAY LONGINT:C221($_al_CombineResourceDiaries; 0)
ARRAY LONGINT:C221($_al_CombineGroupDiaries; 0)
ARRAY LONGINT:C221($_al_CombinePersonDiaries; 0)

If (Count parameters:C259>=4)
	COPY ARRAY:C226($2->; $_al_CombinePersonDiaries)
	COPY ARRAY:C226($3->; $_al_CombineResourceDiaries)
	COPY ARRAY:C226($4->; $_al_CombineGroupDiaries)
	
Else 
	COPY ARRAY:C226(<>SD_al_CombinePersonDiaries; $_al_CombinePersonDiaries)
	COPY ARRAY:C226(<>SD_al_CombineResourceDiaries; $_al_CombineResourceDiaries)
	COPY ARRAY:C226(<>SD_al_CombineGroupDiaries; $_al_CombineGroupDiaries)
	
End if 

//this is copied here because it was possible to get an error if
//the user closed the window
//or changed the selected
// whilst this was executing

If ($1>0)
	ARRAY LONGINT:C221($_al_UsedIDS; 1)
	$_al_UsedIDS{1}:=$1
Else 
	ARRAY LONGINT:C221($_al_UsedIDS; 0)
End if 


CREATE EMPTY SET:C140([DIARY:12]; "TeamItems")
CREATE EMPTY SET:C140([DIARY:12]; "TheGroup")
For ($_l_Index; 1; Size of array:C274(SD_at_MyDiaryGroups))
	$_l_GroupID:=SD_al_MyDiaryGroupIDS{$_l_Index}
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=-SD_al_MyDiaryGroupIDS{$_l_Index}; *)
	QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3=-1)
	If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0)
		RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
		CREATE SET:C116([DIARY:12]; "TheGroup")
		UNION:C120("TeamItems"; "TheGroup"; "TeamItems")
	End if 
End for 
CREATE EMPTY SET:C140([DIARY:12]; "Other")
For ($_l_Index; 1; Size of array:C274($_al_CombinePersonDiaries))
	$_l_GroupRow:=Find in array:C230($_al_UsedIDS; $_al_CombinePersonDiaries{$_l_Index})
	If ($_l_GroupRow<0)
		INSERT IN ARRAY:C227($_al_UsedIDS; 999999; 1)
		$_al_UsedIDS{Size of array:C274($_al_UsedIDS)}:=$_al_CombinePersonDiaries{$_l_Index}
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_al_CombinePersonDiaries{$_l_Index})
		$_t_Initals:=[PERSONNEL:11]Initials:1
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_al_CombinePersonDiaries{$_l_Index})
		RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
		CREATE SET:C116([DIARY:12]; "oTEMP")
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_t_Initals)
		CREATE SET:C116([DIARY:12]; "oTEMP2")
		UNION:C120("oTEMP"; "oTEMP2"; "oTEMP")
		UNION:C120("Other"; "oTEMP"; "Other")
	End if 
	
End for 
For ($_l_Index; 1; Size of array:C274($_al_CombineResourceDiaries))
	$_l_GroupRow:=Find in array:C230($_al_UsedIDS; $_al_CombineResourceDiaries{$_l_Index})
	If ($_l_GroupRow<0)
		
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_al_CombineResourceDiaries{$_l_Index})
		$_t_Initals:=[PERSONNEL:11]Initials:1
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_al_CombineResourceDiaries{$_l_Index})
		RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
		CREATE SET:C116([DIARY:12]; "oTEMP")
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_t_Initals)
		CREATE SET:C116([DIARY:12]; "oTEMP2")
		UNION:C120("oTEMP"; "oTEMP2"; "oTEMP")
		UNION:C120("Other"; "oTEMP"; "Other")
	End if 
	
	
End for 
For ($_l_Index; 1; Size of array:C274($_al_CombineGroupDiaries))
	$_l_GroupRow:=Find in array:C230(SD_al_MyDiaryGroupIDS; $_al_CombineGroupDiaries{$_l_Index})
	//NG MARCH 2004 noticed a bug in here- it was accessing the wrong array
	If ($_l_GroupRow>0)
		For ($_l_Index2; 1; Size of array:C274(SD_al_MyDiaryGroupMembers{$_l_GroupRow}))
			$_l_GroupRow:=Find in array:C230($_al_UsedIDS; $_al_CombinePersonDiaries{$_l_Index})
			If ($_l_GroupRow<0)
				
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SD_al_MyDiaryGroupMembers{$_l_GroupRow}{$_l_Index2})
				$_t_Initals:=[PERSONNEL:11]Initials:1
				QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=SD_al_MyDiaryGroupMembers{$_l_GroupRow}{$_l_Index2})
				RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
				CREATE SET:C116([DIARY:12]; "oTEMP")
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$1)
				CREATE SET:C116([DIARY:12]; "oTEMP2")
				UNION:C120("oTEMP"; "oTEMP2"; "oTEMP")
				UNION:C120("Other"; "oTEMP"; "Other")
			End if 
			
		End for 
		
	End if 
	
End for 
UNION:C120("TeamItems"; "Other"; "TeamItems")
USE SET:C118("TeamItems")
CLEAR SET:C117("TeamItems")
CLEAR SET:C117("Other")
ERR_MethodTrackerReturn("SD_GetOtherDiaries"; $_t_oldMethodName)
