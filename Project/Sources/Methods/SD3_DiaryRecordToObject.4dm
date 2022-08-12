//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_DiaryRecordToObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  31/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_DiaryCode; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_DiaryRecordToObject")
If (Count parameters:C259>=1)
	$_t_DiaryCode:=$1
	If ([DIARY:12]Diary_Code:3#$_t_DiaryCode)
		QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
	End if 
End if 
ERR_MethodTrackerReturn("SD3_DiaryRecordToObject"; $_t_oldMethodName)