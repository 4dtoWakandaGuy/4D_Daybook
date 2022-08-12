If (False:C215)
	//Table Form Method Name: [DIARY]Stickie_Small
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Stickie_Small"; Form event code:C388)
If (Form event code:C388=On Load:K2:1)
	OpenHelp(Table:C252(->[DIARY:12]); "Stickie_Small")
	[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
	[DIARY:12]Date_Do_To:33:=<>DB_d_CurrentDate
	[DIARY:12]Time_Do_From:6:=Current time:C178
	[DIARY:12]Time_Do_To:35:=Current time:C178
	GOTO OBJECT:C206([DIARY:12]Action_Details:10)
End if 
ERR_MethodTrackerReturn("FM [DIARY].Stickie_Small"; $_t_oldMethodName)
