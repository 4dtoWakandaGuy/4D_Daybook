//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryWT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vDiaryCheck)
	C_TEXT:C284($_t_oldMethodName; $0; vUser2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryWT")
Case of 
	: (vDiaryCheck=1)
		$0:="Diary Priority 1"
	: (vDiaryCheck=2)
		$0:="Diary To Do"
	: (vDiaryCheck=0)
		$0:="Diary All Items"
	: (vDiaryCheck=3)
		$0:="Diary_Done"
	Else 
		$0:="Diary"
End case 
$0:=$0+": "+vUser2
ERR_MethodTrackerReturn("Diary_DiaryWT"; $_t_oldMethodName)