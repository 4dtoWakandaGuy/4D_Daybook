//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_Addtoreminders
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
	ARRAY LONGINT:C221($_al_OwnerIDS; 0)
	ARRAY TEXT:C222($_at_OwnerInitials; 0)
	C_BOOLEAN:C305($_bo_Add; $0; $3)
	C_LONGINT:C283($_l_Element; $_l_index; $_l_OwnerRow; $_l_RecordNumber; $_l_recordsinselection)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_Addtoreminders")
If ([DIARY:12]Diary_Code:3#$1)
	QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$1)
End if 
$_l_RecordNumber:=Record number:C243([DIARY:12])
READ ONLY:C145([DIARY_ITEMOWNERS:106])
QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=$1)
$_l_recordsinselection:=Records in selection:C76([DIARY_ITEMOWNERS:106])
ARRAY LONGINT:C221($_al_OwnerIDS; 1+$_l_recordsinselection)
ARRAY TEXT:C222($_at_OwnerInitials; 1+$_l_recordsinselection)
READ ONLY:C145([PERSONNEL:11])
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
$_al_OwnerIDS{1}:=[PERSONNEL:11]Personnel_ID:48
$_at_OwnerInitials{1}:=[PERSONNEL:11]Initials:1
$_l_Element:=1
FIRST RECORD:C50([DIARY_ITEMOWNERS:106])
For ($_l_index; 1; Records in selection:C76([DIARY_ITEMOWNERS:106]))
	$_l_OwnerRow:=Find in array:C230($_al_OwnerIDS; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2)
	If ($_l_OwnerRow<0)
		$_l_Element:=$_l_Element+1
		$_al_OwnerIDS{$_l_Element}:=[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2)
		$_at_OwnerInitials{$_l_Element}:=[PERSONNEL:11]Initials:1
	End if 
	NEXT RECORD:C51([DIARY_ITEMOWNERS:106])
End for 
ARRAY LONGINT:C221($_al_OwnerIDS; $_l_Element)
ARRAY TEXT:C222($_at_OwnerInitials; $_l_Element)
For ($_l_index; 1; Size of array:C274($_al_OwnerIDS))
	$_bo_Add:=True:C214
	If (Count parameters:C259>=3)
		$_bo_Add:=$3
	End if 
	If ($_bo_Add)
		SD_UpdateReminderList($_al_OwnerIDS{$_l_index}; $_at_OwnerInitials{$_l_index}; $_l_RecordNumber)
	Else 
		SD_UpdateReminderList($_al_OwnerIDS{$_l_index}; $_at_OwnerInitials{$_l_index}; -$_l_RecordNumber)
	End if 
End for 
$0:=True:C214
ERR_MethodTrackerReturn("SD_Addtoreminders"; $_t_oldMethodName)
