//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_ListDry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_ListDry")
//Comp_ListDry
If (DB_t_CurrentFormUsage#"")
	If (DB_t_CurrentFormUsage="ToDo")
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
	Else 
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1)
	End if 
	Diary_SelCheck
	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; <)
	If (DB_t_CurrentFormUsage="Last")
		LAST RECORD:C200([DIARY:12])
		ONE RECORD SELECT:C189([DIARY:12])
	End if 
End if 
ERR_MethodTrackerReturn("Comp_ListDry"; $_t_oldMethodName)