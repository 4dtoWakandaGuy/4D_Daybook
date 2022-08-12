If (False:C215)
	//Table Form Method Name: [TIME_BUDGETS]Budgets_Sub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; vResult)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [TIME_BUDGETS].Budgets_Sub"; Form event code:C388)
//Budgets_Sub
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([TIME_BUDGETS:49]Result_Code:3))
				Check_MinorNC(->[TIME_BUDGETS:49]Result_Code:3; "Result"; ->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Result_Name:2)
				If (([RESULTS:14]Result_Code:1#"") & ([RESULTS:14]Time_Result:3=False:C215))
					Gen_Alert("That is not a Time Recording Result"; "Try again")
					[DIARY:12]Result_Code:11:=""
				End if 
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([TIME_BUDGETS:49]Category_Code:2))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([TIME_BUDGETS:49]Budget_Units:4))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([TIME_BUDGETS:49]Start_Week:5))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([TIME_BUDGETS:49]Total_Weeks:6))
				DB_bo_RecordModified:=True:C214
		End case 
		RELATE ONE:C42([TIME_BUDGETS:49]Result_Code:3)
		vResult:=[RESULTS:14]Result_Name:2
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[TIME_BUDGETS:49]); "Budgets_Sub")
		If ([TIME_BUDGETS:49]Person:1#[PERSONNEL:11]Initials:1)
			[TIME_BUDGETS:49]Person:1:=[PERSONNEL:11]Initials:1
		End if 
		If ([TIME_BUDGETS:49]Category_Code:2#[PERSONNEL:11]Category_Code:6)
			[TIME_BUDGETS:49]Category_Code:2:=[PERSONNEL:11]Category_Code:6
		End if 
		vResult:=""
End case 
ERR_MethodTrackerReturn("FM [TIME_BUDGETS].Budgets_Sub"; $_t_oldMethodName)
