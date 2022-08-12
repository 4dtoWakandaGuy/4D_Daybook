//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_CheckSrch
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
	C_BOOLEAN:C305($0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>CTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_CheckSrch")
If ([DIARY:12]Date_Do_From:4=<>DB_d_CurrentDate)
	$0:=([DIARY:12]Time_Do_From:6<=<>CTime)
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("Diary_CheckSrch"; $_t_oldMethodName)