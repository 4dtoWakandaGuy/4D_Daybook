//%attributes = {}
If (False:C215)
	//Project Method Name:      TRANS_GetNextJournalDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/05/2010 06:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TRANS_GetNextJournalDate")
QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4=[RECURRING_JOURNALS:38]x_ID:15)
QUERY SELECTION:C341([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]Posting_Date:1>=Current date:C33(*))
ORDER BY:C49([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]Posting_Date:1; >)

$0:=[REC_JOURNALS_DATES:160]Posting_Date:1
ERR_MethodTrackerReturn("TRANS_GetNextJournalDate"; $_t_oldMethodName)
