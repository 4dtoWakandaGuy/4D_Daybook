If (False:C215)
	//object Name: [RECURRING_JOURNALS]dDup Dates.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; vDate; vDateF)
	C_LONGINT:C283($_l_Index; $_l_NumberofWeeks; $_l_Weeks)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [RECURRING_JOURNALS].dDup Dates.Variable2"; Form event code:C388)
//xSelect - Weeks
$_l_Weeks:=Num:C11(Request:C163("Units of Weeks to use:"; "1"))
If ((OK=1) & ($_l_Weeks>0))
	If ([REC_JOURNALS_DATES:160]Posting_Date:1=!00-00-00!)
		vDateF:=vDate+7
	Else 
		vDateF:=[REC_JOURNALS_DATES:160]Posting_Date:1+Int:C8(7*$_l_Weeks)
	End if 
	$_l_NumberofWeeks:=Num:C11(Request:C163("Number of Weeks to create:"; "1"))
	If ((OK=1) & ($_l_NumberofWeeks>0))
		vDateF:=Date:C102(Request:C163("Starting with Date:"; String:C10(vDateF)))
		If (OK=1)
			$_d_Date:=vDateF
			$_l_Index:=1
			While ($_l_Index<=$_l_NumberofWeeks)
				CREATE RECORD:C68([REC_JOURNALS_DATES:160])
				[REC_JOURNALS_DATES:160]Posting_Date:1:=$_d_Date
				$_d_Date:=$_d_Date+Int:C8(7*$_l_Weeks)
				$_l_Index:=$_l_Index+1
			End while 
		End if 
	End if 
End if 
QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4=[RECURRING_JOURNALS:38]x_ID:15)
ERR_MethodTrackerReturn("OBJ [RECURRING_JOURNALS].dDup Dates.Variable2"; $_t_oldMethodName)
