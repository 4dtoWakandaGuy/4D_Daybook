//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Done
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
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Done")
[DIARY:12]Date_Done_From:5:=Current date:C33
[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
[DIARY:12]Time_Done_From:7:=Current time:C178
[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
[DIARY:12]Result_Code:11:=$1
[DIARY:12]Done:14:=True:C214
Diary_PersPrior
ERR_MethodTrackerReturn("Diary_Done"; $_t_oldMethodName)