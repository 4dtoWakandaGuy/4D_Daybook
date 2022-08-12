//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_inTB
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
	//Array TEXT(SD_at_TrState;0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284(<>DefPrior; <>TimeAct; <>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_inTB")
//NG april 2004
//New method to populate the diary fields when entering Time_In relation to an order
//Used in the form[ORDERS];"Jobs_TCIn"
//Based on the subform code from[DIARY];"Diary_OutT"

[DIARY:12]Action_Code:9:=<>TimeAct
[DIARY:12]Result_Code:11:=[ORDERS:24]Taken_By:17
[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
If (SD_at_TrState=1)
	[DIARY:12]Date_Do_From:4:=[ORDERS:24]Order_Date:4
	[DIARY:12]Date_Do_To:33:=[ORDERS:24]Order_Date:4
	[DIARY:12]Time_Do_From:6:=Current time:C178
	If ([DIARY:12]Result_Code:11#"")
		[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
	End if 
Else 
	[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
	[DIARY:12]Date_Do_To:33:=<>DB_d_CurrentDate
	[DIARY:12]Date_Done_From:5:=[ORDERS:24]Order_Date:4
	[DIARY:12]Date_Done_To:34:=[ORDERS:24]Order_Date:4
	[DIARY:12]Time_Done_From:7:=Current time:C178
	If ([DIARY:12]Result_Code:11#"")
		[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Do_From:6
	End if 
	[DIARY:12]Done:14:=True:C214
End if 
[DIARY:12]Person:8:=[ORDERS:24]Person:5
[DIARY:12]Job_Code:19:=[ORDERS:24]Your_Order_Number:10
If ([DIARY:12]Job_Code:19#"")
	If ([JOBS:26]Job_Code:1#[DIARY:12]Job_Code:19)
		MESSAGES OFF:C175
		QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[DIARY:12]Job_Code:19)
		MESSAGES ON:C181
		
	End if 
	[DIARY:12]Company_Code:1:=[JOBS:26]Company_Code:3
	[DIARY:12]Contact_Code:2:=[JOBS:26]Contact_Code:4
End if 
[DIARY:12]Stage_Code:21:=[ORDERS:24]Source:18
If ([DIARY:12]Stage_Code:21#"")
	Diary_InDStage
End if 

If (False:C215)  //blocked out 28/03/07 -kmw (change to use normal diary codes)
	[DIARY:12]Diary_Code:3:=Substring:C12("*TR"+Gen_Unique; 1; 11)
	//+String(Num(Export_Stamp )+Num([DIARY]Job Code));1;11)
	[DIARY:12]Priority:17:=<>DefPrior
	// Diary_InB
End if 

DiarySetCode  //added 28/3/7-kmw (change to use normal diary codes)


Diary_PersPrior
ERR_MethodTrackerReturn("Diary_inTB"; $_t_oldMethodName)