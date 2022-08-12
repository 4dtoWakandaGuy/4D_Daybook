//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InBTime
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284(<>TimeAct; <>PER_t_CurrentUserInitials; $_t_oldMethodName; vPerson)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InBTime")
//Diary_InBTime
[DIARY:12]Action_Code:9:=<>TimeAct
[DIARY:12]Value:16:=0
[DIARY:12]Cost_Value:75:=0  //added 30/03/07 -kmw
If ([DIARY:12]Date_Done_From:5=!00-00-00!)
	[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
	[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials  //altered from "" to ◊User -26/10/07,kmw
	RELATE ONE:C42([DIARY:12]Person:8)  //added -26/10/07, kmw
	If (Records in selection:C76([PERSONNEL:11])>0)  //added -26/10/07, kmw
		vPerson:=[PERSONNEL:11]Name:2  //added -26/10/07, kmw
		[DIARY:12]PersonID:56:=[PERSONNEL:11]Personnel_ID:48  //added 30/10/07 -kmw
	Else   //added -26/10/07, kmw
		[DIARY:12]Person:8:=""  //added -26/10/07, kmw
		vPerson:=""  //added -26/10/07, kmw
	End if   //added -26/10/07, kmw
	Check_JobPers  //added 30/10/07 -kmw
End if 
[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
[DIARY:12]Time_Done_From:7:=Current time:C178
[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
[DIARY:12]Done:14:=True:C214
ERR_MethodTrackerReturn("Diary_InBTime"; $_t_oldMethodName)