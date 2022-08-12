//%attributes = {}
If (False:C215)
	//Project Method Name:      Standing_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/08/2009 13:33
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

$_t_oldMethodName:=ERR_MethodTracker("Standing_InLPA")
QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4=[RECURRING_JOURNALS:38]x_ID:15)
QUERY SELECTION:C341([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]Posting_Date:1<!1980-01-01!)
If (Records in selection:C76([REC_JOURNALS_DATES:160])>0)
	Gen_Alert("The date "+String:C10([REC_JOURNALS_DATES:160]Posting_Date:1)+" is invalid"; "Try again")
Else 
	QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4=[RECURRING_JOURNALS:38]x_ID:15)
	
	If ((Records in selection:C76([REC_JOURNALS_DATES:160])>1) & ([RECURRING_JOURNALS:38]Monthly:8))
		Gen_Confirm("You have chosen 'Same date every month' but specified more than one date."+"  Dates other than the first will be ignored"; "Try again"; "OK")
		If (OK=0)
			ACCEPT:C269
		End if 
	Else 
		ACCEPT:C269
	End if 
End if 
ERR_MethodTrackerReturn("Standing_InLPA"; $_t_oldMethodName)