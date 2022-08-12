//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_DiaryItemView
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
	C_BOOLEAN:C305($_bo_Modify; $2; SD_bo_AddingDiaryRecord)
	C_LONGINT:C283(SD_CurrentFormObject; SD_l_EditingDiaryRecord)
	C_POINTER:C301($_Ptr_ListBox; $1)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_DiaryItemView")
// LB_DiaryItemView
// 26/06/06 pb
// parameters: $1 = pointer to the listbox area
// $2=True or False (modifiable or not)
// $3 = Diary code to query for

$_Ptr_ListBox:=$1
$_bo_Modify:=$2
//$_l_Row:=$_Ptr_ListBox->
SD_CurrentFormObject:=3  // not sure what this is used for - is it necessary?
If (SD_RecordModified(->[DIARY:12]))
	SuperDiary_SaveChk
End if 
SD_SetFieldsFalse
QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$3)
SD_EventItemData(-[DIARY:12]x_ID:50)
If ($_bo_Modify)
	
	If ([DIARY:12]Done:14=False:C215)
		UNLOAD RECORD:C212([PERSONNEL:11])
		READ WRITE:C146([DIARY:12])
		LOAD RECORD:C52([DIARY:12])
		If ([DIARY:12]Done:14=False:C215)
			SD_l_EditingDiaryRecord:=1
			SD_SetVisible(True:C214)
			SD_SetFieldsTrue
		Else 
			READ WRITE:C146([DIARY:12])
			LOAD RECORD:C52([DIARY:12])
			OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_DiaryItemView"; $_t_oldMethodName)