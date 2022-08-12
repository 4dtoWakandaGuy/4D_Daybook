//%attributes = {}
If (False:C215)
	//Project Method Name:      COM_CommentstoDiary
	//------------------ Method Notes ------------------
	//This takes the data from the 'comments' field
	//And puts it in a 'comment' diary record
	
	//------------------ Revision Control ----------------
	//Date Created: 03/11/2012 11:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_LONGINT:C283($_l_ColumnIndex; $_l_DiaryActionClass; $_l_FieldRow)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("COM_CommentstoDiary")

If ($1->#"")
	SD2_CheckDefaultAction("COM")
	QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1="OK")
	If (Records in selection:C76([RESULTS:14])=0)
		CREATE RECORD:C68([RESULTS:14])
		[RESULTS:14]Result_Code:1:="OK"
		[RESULTS:14]Result_Name:2:="Completed"
		SAVE RECORD:C53([RESULTS:14])
	End if 
	CREATE RECORD:C68([DIARY:12])
	DiarySetCode
	
	[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
	[DIARY:12]Done:14:=True:C214
	[DIARY:12]Action_Code:9:="COM"
	[DIARY:12]Result_Description:12:=$1->
	[DIARY:12]Result_Code:11:="OK"
	[DIARY:12]Date_Do_To:33:=Current date:C33(*)
	[DIARY:12]Date_Do_From:4:=Current date:C33(*)
	[DIARY:12]Date_Done_From:5:=Current date:C33(*)
	[DIARY:12]Date_Done_To:34:=Current date:C33(*)
	[DIARY:12]Time_Do_From:6:=Current time:C178(*)
	[DIARY:12]Time_Do_To:35:=Current time:C178(*)
	[DIARY:12]Time_Done_From:7:=Current time:C178(*)
	[DIARY:12]Time_Done_To:36:=Current time:C178(*)
	$_l_DiaryActionClass:=0
	If ([ACTIONS:13]Action_Code:1#[DIARY:12]Action_Code:9)
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
	End if 
	SD2_ActionAttributesToArrays
	//
	$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
	$_l_DiaryActionClass:=0
	If ($_l_FieldRow>0)
		For ($_l_ColumnIndex; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}))
			$_l_DiaryActionClass:=$_l_DiaryActionClass+(SD2_al_ActionVirtFieldDataMANY{$_l_FieldRow}{$_l_ColumnIndex})
			
		End for 
	End if 
	[DIARY:12]xDiaryClass:65:=$_l_DiaryActionClass  //this tells us where this diary item will appear
	SAVE RECORD:C53([DIARY:12])
	$1->:=""
End if 
ERR_MethodTrackerReturn("COM_CommentstoDiary"; $_t_oldMethodName)