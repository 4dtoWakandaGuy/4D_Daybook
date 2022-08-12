//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_QueryDiaryserverside
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_EndValues; 0)
	ARRAY LONGINT:C221($_al_StartValues; 0)
	//ARRAY LONGINT(SD_al_CombinedGroupDiaries;0)
	//ARRAY LONGINT(SD_al_CombinedResourceDiaries;0)
	//ARRAY LONGINT(SD_al_PersonDiaries;0)
	C_BOOLEAN:C305($_bo_ActionFilter; $_bo_ActionGroups; $_bo_DateSearch)
	C_DATE:C307($_d_DateFrom)
	C_LONGINT:C283($_l_ArraySize; $_l_DateFromRow; $_l_ID; $_l_Index; $_l_ItemRef; $_l_PreviousDateFromRow; $8)
	C_POINTER:C301($1; $2; $3; $4; $5; $6; $7)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_QueryDiaryserverside")
If (Count parameters:C259>=8)
	CREATE EMPTY SET:C140([DIARY:12]; "$Temp")
	//Some fields are not in the diary-so I am setting up 'pseudo' references to them here
	//-1=Diary groups(soft groups)
	//-2=action Groups(Soft groups)
	$_l_PreviousDateFromRow:=0
	ARRAY LONGINT:C221(SD_al_CombinedGroupDiaries; 0)
	ARRAY LONGINT:C221(SD_al_CombinedResourceDiaries; 0)
	ARRAY LONGINT:C221(SD_al_PersonDiaries; 0)
	///$_l_ItemRef is not set??? 
	Repeat 
		$_l_DateFromRow:=Find in array:C230($1->{$8}; -1; $_l_PreviousDateFromRow)
		If ($_l_DateFromRow>0)
			
			$_l_PreviousDateFromRow:=$_l_DateFromRow
			$_l_ID:=$5->{$8}{$_l_DateFromRow}
			Case of 
				: ($_l_ID<0)  //Group
					INSERT IN ARRAY:C227(SD_al_CombinedGroupDiaries; Size of array:C274(SD_al_CombinedGroupDiaries)+1; 1)
					SD_al_CombinedGroupDiaries{Size of array:C274(SD_al_CombinedGroupDiaries)}:=Abs:C99($_l_ID-9999)
				: ($_l_ID>9999)  //its a resource
					INSERT IN ARRAY:C227(SD_al_CombinedResourceDiaries; Size of array:C274(SD_al_CombinedResourceDiaries)+1; 1)
					SD_al_CombinedResourceDiaries{Size of array:C274(SD_al_CombinedResourceDiaries)}:=$_l_ID-9999
				: ($_l_ID>0) & ($_l_ItemRef<9999)  //its a person
					INSERT IN ARRAY:C227(SD_al_PersonDiaries; Size of array:C274(SD_al_PersonDiaries)+1; 1)
					SD_al_PersonDiaries{Size of array:C274(SD_al_PersonDiaries)}:=$_l_ItemRef
			End case 
		End if 
		
	Until ($_l_DateFromRow<0)
	
	If ((Size of array:C274(SD_al_CombinedGroupDiaries)>0) | (Size of array:C274(SD_al_CombinedResourceDiaries)>0) | (Size of array:C274(SD_al_PersonDiaries)>0))  //| (◊FloatingDiaryDisplayed)
		
		SD_GetOtherDiaries(0)
		CREATE SET:C116([DIARY:12]; "TEMP2")
		UNION:C120("TEMP"; "TEMP2"; "TEMP")
	Else 
		$_l_PreviousDateFromRow:=0
		Repeat 
			$_l_DateFromRow:=Find in array:C230($1->{8}; Field:C253(->[DIARY:12]Person:8); $_l_PreviousDateFromRow)
			//in this particular  case although this is a string field the id may be in the longint..but dont trust that it is
			If ($_l_DateFromRow>0)
				$_l_ID:=$5->{$8}{$_l_DateFromRow}
				If ($_l_ID=0) & ($3->{$8}{$_l_DateFromRow}#"")
					//this is a person code
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Person_Identity:13=$3->{$8}{$_l_DateFromRow})
					$_l_ID:=[PERSONNEL:11]Personnel_ID:48
					UNLOAD RECORD:C212([PERSONNEL:11])
				End if 
				$_l_PreviousDateFromRow:=$_l_DateFromRow
				If ($_l_ID>0)
					QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=$_l_ID)
					RELATE ONE SELECTION:C349([DIARY_ITEMOWNERS:106]; [DIARY:12])
					CREATE SET:C116([DIARY:12]; "TEMP2")
					QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$1)
					CREATE SET:C116([DIARY:12]; "TEMP3")
					UNION:C120("TEMP3"; "TEMP2"; "TEMP2")
					UNION:C120("TEMP"; "TEMP2"; "TEMP")
					CLEAR SET:C117("TEMP2")
					CLEAR SET:C117("TEMP3")
					
				End if 
				
			End if 
		Until ($_l_DateFromRow<0)
	End if 
	$_l_PreviousDateFromRow:=0
	ARRAY LONGINT:C221($_al_StartValues; 0)
	ARRAY LONGINT:C221($_al_EndValues; 0)
	$_bo_DateSearch:=False:C215
	//You need to make sure if you are writing multiple dates in that the from and to match in terms of the column they are in!
	//note that the pointer is to the DO field but the search is actually on the stamp..which is the place it appears in the diary(may be done)
	Repeat 
		$_l_DateFromRow:=Find in array:C230($1->{$8}; Field:C253(->[DIARY:12]Date_Do_From:4); $_l_PreviousDateFromRow)
		If ($_l_DateFromRow>0)
			$_bo_DateSearch:=True:C214
			$_l_PreviousDateFromRow:=$_l_DateFromRow
			$_d_DateFrom:=$7->{$8}{$_l_DateFromRow}
			If ($_d_DateFrom#!00-00-00!)
				INSERT IN ARRAY:C227($_al_StartValues; Size of array:C274($_al_StartValues)+1; 1)
				$_al_StartValues{Size of array:C274($_al_StartValues)}:=Gen_DateStamp($_d_DateFrom)
			Else 
				INSERT IN ARRAY:C227($_al_StartValues; Size of array:C274($_al_StartValues)+1; 1)
				$_al_StartValues{Size of array:C274($_al_StartValues)}:=0
			End if 
			
		End if 
	Until ($_l_DateFromRow<0)
	$_l_PreviousDateFromRow:=0
	Repeat 
		$_l_DateFromRow:=Find in array:C230($1->{$8}; Field:C253(->[DIARY:12]Date_Do_To:33); $_l_PreviousDateFromRow)
		If ($_l_DateFromRow>0)
			$_bo_DateSearch:=True:C214
			$_l_PreviousDateFromRow:=$_l_DateFromRow
			$_d_DateFrom:=$7->{$8}{$_l_DateFromRow}
			If ($_d_DateFrom#!00-00-00!)
				INSERT IN ARRAY:C227($_al_EndValues; Size of array:C274($_al_EndValues)+1; 1)
				$_al_EndValues{Size of array:C274($_al_EndValues)}:=Gen_DateStamp($_d_DateFrom)
			Else 
				INSERT IN ARRAY:C227($_al_EndValues; Size of array:C274($_al_EndValues)+1; 1)
				$_al_EndValues{Size of array:C274($_al_EndValues)}:=0
			End if 
			
		End if 
	Until ($_l_DateFromRow<0)
	//next 3 lines just make sure there is no mismatch in range here
	//this allows for discontiguous dates..not that we allow them at the moment
	$_l_ArraySize:=Size of array:C274($_al_StartValues)
	If (Size of array:C274($_al_EndValues)<$_l_ArraySize)
		$_l_ArraySize:=Size of array:C274($_al_EndValues)
	End if 
	ARRAY LONGINT:C221($_al_StartValues; $_l_ArraySize)
	ARRAY LONGINT:C221($_al_EndValues; $_l_ArraySize)
	If ($_bo_DateSearch)
		CREATE EMPTY SET:C140([DIARY:12]; "DateMatch")
		For ($_l_Index; 1; Size of array:C274($_al_StartValues))
			QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46>=$_al_StartValues{$_l_Index}; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Stamp:46<=$_al_EndValues{$_l_Index})
			CREATE SET:C116([DIARY:12]; "TEMP2")
			UNION:C120("TEMP2"; "DateMatch"; "DateMatch")
			
			CLEAR SET:C117("TEMP2")
			
		End for 
		INTERSECTION:C121("TEMP"; "DateMatch"; "TEMP")
		CLEAR SET:C117("DateMatch")
	End if 
	$_l_PreviousDateFromRow:=0
	$_bo_ActionGroups:=False:C215
	
	Repeat 
		$_l_DateFromRow:=Find in array:C230($1->{$8}; -2; $_l_PreviousDateFromRow)
		If ($_l_DateFromRow>0)
			//here the action group will be added to an array
			$_l_PreviousDateFromRow:=$_l_DateFromRow
			$_bo_ActionGroups:=True:C214
		End if 
		
	Until ($_l_DateFromRow<0)
	If ($_bo_ActionGroups)
	Else 
		//must be  action if any
		$_l_PreviousDateFromRow:=0
		$_bo_ActionFilter:=False:C215
		CREATE EMPTY SET:C140([DIARY:12]; "Actions")
		Repeat 
			$_l_DateFromRow:=Find in array:C230($1->{$8}; Field:C253(->[DIARY:12]Action_Code:9); $_l_PreviousDateFromRow)
			If ($_l_DateFromRow>0)
				$_l_PreviousDateFromRow:=$_l_DateFromRow
				If ($2->{$8}{$_l_DateFromRow}#"")
					$_bo_ActionFilter:=True:C214
					QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9=$2->{$8}{$_l_DateFromRow})
					CREATE SET:C116([DIARY:12]; "TEMP2")
					UNION:C120("Actions"; "TEMP2"; "Actions")
					CLEAR SET:C117("TEMP2")
				End if 
			End if 
			
		Until ($_l_DateFromRow<0)
		If ($_bo_ActionFilter)
			INTERSECTION:C121("Actions"; "TEMP"; "TEMP")
			
		End if 
		CLEAR SET:C117("Actions")
		
	End if 
	
	//[DIARY]Call Code
	//[DIARY]Charge Rate
	//[DIARY]Company Code
	//[DIARY]Contact Code
	//[DIARY]Diary Code
	//[DIARY]Document Code
	//[DIARY]Done
	//[DIARY]Email_From
	//[DIARY]Email_Person
	//[DIARY]Email_Subject
	
	//[DIARY]Export
	//[DIARY]Job Code
	//[DIARY]Macro Code
	//[DIARY]Order Code
	//[DIARY]Original_DatetimeStamp
	//[DIARY]Originator
	//[DIARY]PersPrior
	//[DIARY]Picture Code
	//[DIARY]Priority
	//[DIARY]Product Code
	//[DIARY]Public
	//[DIARY]Result Code
	//[DIARY]SourceDataField
	//[DIARY]Stage Code
	//[DIARY]Status
	//[DIARY]Units
	//[DIARY]Value
	//[DIARY]Time Checked
	
	
	
End if 
ERR_MethodTrackerReturn("SD2_QueryDiaryserverside"; $_t_oldMethodName)
