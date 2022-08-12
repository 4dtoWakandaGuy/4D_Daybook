If (False:C215)
	//Table Form Method Name: [REC_JOURNALS_DATES]Dates_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/08/2009 13:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [REC_JOURNALS_DATES].Dates_Sub"; Form event code:C388)

If (Modified:C32([REC_JOURNALS_DATES:160]Posting_Date:1))
	DB_bo_RecordModified:=True:C214
End if 
ERR_MethodTrackerReturn("FM [REC_JOURNALS_DATES].Dates_Sub"; $_t_oldMethodName)
