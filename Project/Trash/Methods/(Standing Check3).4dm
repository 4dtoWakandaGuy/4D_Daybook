//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Standing_Check3
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
	C_DATE:C307($_d_Date; vDateF)
	C_LONGINT:C283($_l_Dayof)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing_Check3")
If ([RECURRING_JOURNALS:38]Monthly:8=True:C214)
	$_l_Dayof:=Day of:C23([REC_JOURNALS_DATES:160]Posting_Date:1)
	$_d_Date:=vDateF+31
	[REC_JOURNALS_DATES:160]Posting_Date:1:=Date_FromNums($_l_Dayof; Month of:C24($_d_Date); Year of:C25($_d_Date))
Else 
	DELETE RECORD:C58([REC_JOURNALS_DATES:160])
End if 
DB_SaveRecord(->[RECURRING_JOURNALS:38])
AA_CheckFileUnlocked(->[RECURRING_JOURNALS:38]x_ID:15)
ERR_MethodTrackerReturn("Standing_Check3"; $_t_oldMethodName)
