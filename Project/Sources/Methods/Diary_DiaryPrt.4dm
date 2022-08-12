//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_DiaryPrt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 15:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryPrt")
//Diary_DiaryPrt
COPY NAMED SELECTION:C331([DIARY:12]; "Diary")
Userset
If (Records in selection:C76([DIARY:12])>1)
	FORM SET OUTPUT:C54([DIARY:12]; "Call_Summaries")
	ORDER BY:C49([DIARY:12]; [DIARY:12]Person:8; >; [DIARY:12]Date_Do_From:4; >; [DIARY:12]Action_Code:9; >; [DIARY:12]Time_Do_From:6; >)
	BREAK LEVEL:C302(1; 1)
	ACCUMULATE:C303([DIARY:12]Value:16)
Else 
	FORM SET OUTPUT:C54([DIARY:12]; "Diary_Sheet")
End if 
PRINT SELECTION:C60([DIARY:12])
FORM SET OUTPUT:C54([DIARY:12]; "Diary")
USE NAMED SELECTION:C332("Diary")
CLEAR NAMED SELECTION:C333("Diary")
vNo:=Records in selection:C76([DIARY:12])
ERR_MethodTrackerReturn("Diary_DiaryPrt"; $_t_oldMethodName)