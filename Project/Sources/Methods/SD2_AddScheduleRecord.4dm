//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_AddScheduleRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_SelectedPersons;0)
	ARRAY TEXT:C222($_at_CurrentDiaryInitials; 0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD2_at_CurrentDiaryInitials;0)
	//ARRAY TEXT(SD2_at_CurrentDiaryPersons;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Linked; $_bo_NewWindow; $_bo_PassDateTimePerson; $4; $5)
	C_DATE:C307($2)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_DiaryEntryProcess; $_l_PersonRow; $_l_PersonsIndex; $_l_SelectedPersonsCount; $_l_TimeSeconds; SD_l_DiaryInState; SD2_l_PersonsSelected; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>CompCode; <>ContCode; $_t_CurrentDiaryInitials; $_t_DateString; $_t_oldMethodName; $_t_TimeString; $1)
	C_TIME:C306($3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_AddScheduleRecord")
//SD_AutoAddRec($1;$2;$3)
//DiaryActionVar:= $1
//DateVar:= $2
//TimeVar:= $3
//MODNG 67-2
$_bo_NewWindow:=True:C214


If (Count parameters:C259>=3)
	If (Count parameters:C259>=4)
		$_bo_Linked:=$4
	Else 
		$_bo_Linked:=False:C215
	End if 
	If (Count parameters:C259>=5)
		$_bo_PassDateTimePerson:=$5
	Else 
		$_bo_PassDateTimePerson:=False:C215
	End if 
	If ($_bo_PassDateTimePerson)
		ARRAY TEXT:C222($_at_CurrentDiaryInitials; 0)
		While (Semaphore:C143("$ChangingDiaPerArray"))
			DelayTicks(2)
		End while 
		If (Size of array:C274(SD2_at_CurrentDiaryPersons)>1)
			//Here ask user which calendar to add it to(allow multiple selection
			ARRAY TEXT:C222(SD2_at_CurrentDiaryPersons; 0)
			For ($_l_PersonsIndex; 1; Size of array:C274(SD2_at_CurrentDiaryPersons))
				$_l_PersonRow:=Find in array:C230(SD_at_PersonInitials; SD2_at_CurrentDiaryPersons{$_l_PersonsIndex})
				If ($_l_PersonRow>0)  // it should be!!
					APPEND TO ARRAY:C911(SD2_at_CurrentDiaryPersons; SD_at_DiaryOwners{$_l_PersonRow})
				End if 
				
			End for 
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; -1986; "Whose Diary?")
			DIALOG:C40([USER:15]; "SD2_SelectPersons")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			If (SD2_l_PersonsSelected=1)
				$_bo_Continue:=True:C214
				$_l_SelectedPersonsCount:=0
				ARRAY TEXT:C222($_at_CurrentDiaryInitials; 0)
				For ($_l_PersonsIndex; 1; Size of array:C274(SD2_abo_SelectedPersons))
					If (SD2_abo_SelectedPersons{$_l_PersonsIndex})
						$_l_SelectedPersonsCount:=$_l_SelectedPersonsCount+1
						APPEND TO ARRAY:C911($_at_CurrentDiaryInitials; SD2_at_CurrentDiaryPersons{$_l_PersonsIndex})
					End if 
				End for 
				If ($_l_SelectedPersonsCount=1)  //only selected one
					$_t_CurrentDiaryInitials:=$_at_CurrentDiaryInitials{1}
				Else 
					$_t_CurrentDiaryInitials:="MULTI"  //Use that to trigger the get method
					//selected more than one
				End if 
			Else 
				$_bo_Continue:=False:C215
			End if 
		Else 
			$_bo_Continue:=True:C214
			$_t_CurrentDiaryInitials:=SD2_at_CurrentDiaryPersons{1}
		End if 
		CLEAR SEMAPHORE:C144("$ChangingDiaPerArray")
	End if 
	If ($_bo_Linked)
		If ($_bo_PassDateTimePerson)
			If ($_bo_Continue)
				
				$_l_TimeSeconds:=$3*1
				$_t_TimeString:=Time string:C180($_l_TimeSeconds)
				$_t_DateString:=String:C10($2)
				If ($1="")
					$_l_DiaryEntryProcess:=ZProc_withReply("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); <>CompCode; <>ContCode; "Diary_InNEW"; $_t_DateString; $_t_TimeString; $_t_CurrentDiaryInitials)
				Else 
					$_l_DiaryEntryProcess:=ZProc_withReply("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); <>CompCode; <>ContCode; "Diary_InNEW"; $_t_DateString; $_t_TimeString; $_t_CurrentDiaryInitials; $1)
				End if 
				If (Size of array:C274($_at_CurrentDiaryInitials)>0)
					While (SD_l_DiaryInState=0)
						DelayTicks(2)
						GET PROCESS VARIABLE:C371($_l_DiaryEntryProcess; SD_l_DiaryInState; SD_l_DiaryInState)
					End while 
					VARIABLE TO VARIABLE:C635($_l_DiaryEntryProcess; SD2_at_CurrentDiaryInitials; $_at_CurrentDiaryInitials)
					SD_l_DiaryInState:=0
					
				End if 
			End if 
		Else 
			If ($1="")
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); <>CompCode; <>ContCode; "Diary_InNEW")
			Else 
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); <>CompCode; <>ContCode; "Diary_InNEW"; ""; ""; ""; $1)
			End if 
		End if 
	Else 
		If ($_bo_PassDateTimePerson)
			If ($_bo_Continue)
				$_l_TimeSeconds:=$3*1
				
				$_t_TimeString:=Time string:C180($_l_TimeSeconds)
				$_t_DateString:=String:C10($2)
				If ($1="")
					$_l_DiaryEntryProcess:=ZProc_withReply("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW"; $_t_DateString; $_t_TimeString; $_t_CurrentDiaryInitials)
				Else 
					$_l_DiaryEntryProcess:=ZProc_withReply("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW"; $_t_DateString; $_t_TimeString; $_t_CurrentDiaryInitials; $1)
				End if 
				If (Size of array:C274($_at_CurrentDiaryInitials)>0)
					While (SD_l_DiaryInState=0)
						DelayTicks(2)
						GET PROCESS VARIABLE:C371($_l_DiaryEntryProcess; SD_l_DiaryInState; SD_l_DiaryInState)
					End while 
					VARIABLE TO VARIABLE:C635($_l_DiaryEntryProcess; SD2_at_CurrentDiaryInitials; $_at_CurrentDiaryInitials)
					SD_l_DiaryInState:=0
				End if 
				
			End if 
		Else 
			If ($1="")
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW")
			Else 
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); ""; ""; "Diary_InNEW"; ""; ""; ""; $1)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD_AutoAddRec"; $_t_oldMethodName)
