If (False:C215)
	//Table Form Method Name: [REC_JOURNALS_DATES]dDup_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 18:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [REC_JOURNALS_DATES].dDup_Sub"; Form event code:C388)

If (Form event code:C388=On Load:K2:1)
	If ([REC_JOURNALS_DATES:160]Posting_Date:1=!00-00-00!)
		[REC_JOURNALS_DATES:160]Posting_Date:1:=vDate
	End if 
End if 
ERR_MethodTrackerReturn("FM [REC_JOURNALS_DATES].dDup_Sub"; $_t_oldMethodName)
