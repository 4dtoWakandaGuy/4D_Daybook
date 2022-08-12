If (False:C215)
	//object Name: [RECURRING_JOURNALS]dDup Dates.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 11:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $_d_Date2; vDate; vDateF)
	C_LONGINT:C283($_l_Index; $_l_Months; $_l_NumberofMonths)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [RECURRING_JOURNALS].dDup Dates.Variable3"; Form event code:C388)
//xSelect - Months
$_l_Months:=Num:C11(Request:C163("Units of Months to use:"; "1"))
If ((OK=1) & ($_l_Months>0))
	If ([REC_JOURNALS_DATES:160]Posting_Date:1=!00-00-00!)
		vDateF:=MonthDate(vDate; $_l_Months; 1)
	Else 
		vDateF:=MonthDate([REC_JOURNALS_DATES:160]Posting_Date:1; $_l_Months; 1)
	End if 
	$_l_NumberofMonths:=Num:C11(Request:C163("Number of Months to create:"; "1"))
	If ((OK=1) & ($_l_NumberofMonths>0))
		vDateF:=Date:C102(Request:C163("Starting with Date:"; String:C10(vDateF)))
		If (OK=1)
			$_d_Date:=vDateF
			$_d_Date2:=$_d_Date
			$_l_Index:=1
			While ($_l_Index<=$_l_NumberofMonths)
				CREATE RECORD:C68([REC_JOURNALS_DATES:160])
				[REC_JOURNALS_DATES:160]ID:3:=AA_GetNextID(->[REC_JOURNALS_DATES:160]ID:3)
				[REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4:=[RECURRING_JOURNALS:38]x_ID:15
				[REC_JOURNALS_DATES:160]Posting_Date:1:=$_d_Date2
				$_d_Date2:=MonthDate($_d_Date; $_l_Months; $_l_Index)
				$_l_Index:=$_l_Index+1
				DB_SaveRecord(->[REC_JOURNALS_DATES:160])
				
			End while 
		End if 
	End if 
End if 
QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4=[RECURRING_JOURNALS:38]x_ID:15)
ERR_MethodTrackerReturn("OBJ [RECURRING_JOURNALS].dDup Dates.Variable3"; $_t_oldMethodName)
