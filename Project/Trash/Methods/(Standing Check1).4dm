//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Standing_Check1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 15:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing_Check1")
QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4=[RECURRING_JOURNALS:38]x_ID:15)
ORDER BY:C49([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]Posting_Date:1; >)
FIRST RECORD:C50([REC_JOURNALS_DATES:160])
ERR_MethodTrackerReturn("Standing_Check1"; $_t_oldMethodName)