//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Tel DiaryCreat
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel DiaryCreat")

If (($1#"") & ($2#""))
	If (($3#"") & ($4#""))
		CREATE RECORD:C68([DIARY:12])
		Diary_Code
		[DIARY:12]Company_Code:1:=$1
		[DIARY:12]Contact_Code:2:=$2
		[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
		[DIARY:12]Date_Do_To:33:=<>DB_d_CurrentDate
		[DIARY:12]Time_Do_From:6:=Current time:C178
		[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
		[DIARY:12]Person:8:=$3
		[DIARY:12]Action_Code:9:=$4
		RELATE ONE:C42([DIARY:12]Action_Code:9)
		[DIARY:12]Action_Details:10:=[ACTIONS:13]Default_Description:6
		[DIARY:12]Document_Code:15:=[ACTIONS:13]Document_Code:4
		Diary_PersPrior
		[DIARY:12]Picture_Code:37:=[PICTURES:85]Picture_Code:1
		[ACTIONS:13]Priority:5:="1"
		Diary_InLPM
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	Else 
		Gen_Alert("No Diary record has been created - you must pass the Person and Action"; "OK")
	End if 
End if 
ERR_MethodTrackerReturn("Tel DiaryCreat"; $_t_oldMethodName)