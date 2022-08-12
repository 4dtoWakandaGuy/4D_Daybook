//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Standing Create
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
	C_DATE:C307($_d_Date; vDateF; vDateT)
	C_LONGINT:C283($_l_AddToDate; $_l_Dayof)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing Create")
//xSelect - Create Months
vDateF:=Date:C102(Gen_Request("Date From:"))
If ((OK=1) & (vDateF#!00-00-00!))
	vDateT:=Date:C102(Gen_Request("Date To:"))
	If ((OK=1) & (vDateT#!00-00-00!))
		Gen_Confirm("Create Months or Quarters?"; "Months"; "Quarters")
		If (OK=1)
			$_l_AddToDate:=31
		Else 
			$_l_AddToDate:=92
		End if 
		CREATE RECORD:C68([REC_JOURNALS_DATES:160])
		[REC_JOURNALS_DATES:160]ID:3:=AA_GetNextID(->[REC_JOURNALS_DATES:160]ID:3)
		[REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4:=[RECURRING_JOURNALS:38]x_ID:15
		
		[REC_JOURNALS_DATES:160]Posting_Date:1:=vDateF
		$_l_Dayof:=Day of:C23(vDateF)
		$_d_Date:=vDateF+$_l_AddToDate
		$_d_Date:=Date_FromNums($_l_Dayof; Month of:C24($_d_Date); Year of:C25($_d_Date))
		DB_SaveRecord(->[REC_JOURNALS_DATES:160])
		
		While ($_d_Date<=vDateT)
			CREATE RECORD:C68([REC_JOURNALS_DATES:160])
			[REC_JOURNALS_DATES:160]ID:3:=AA_GetNextID(->[REC_JOURNALS_DATES:160]ID:3)
			[REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4:=[RECURRING_JOURNALS:38]x_ID:15
			
			[REC_JOURNALS_DATES:160]Posting_Date:1:=$_d_Date
			$_d_Date:=$_d_Date+$_l_AddToDate
			DB_SaveRecord(->[REC_JOURNALS_DATES:160])
			
			$_d_Date:=Date_FromNums($_l_Dayof; Month of:C24($_d_Date); Year of:C25($_d_Date))
		End while 
	End if 
End if 
QUERY:C277([REC_JOURNALS_DATES:160]; [REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4=[RECURRING_JOURNALS:38]x_ID:15)
ERR_MethodTrackerReturn("Standing Create"; $_t_oldMethodName)
