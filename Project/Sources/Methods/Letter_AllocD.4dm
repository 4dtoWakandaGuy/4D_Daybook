//%attributes = {}
If (False:C215)
	//Project Method Name:      Letter_AllocD
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
	C_DATE:C307(vDate)
	C_LONGINT:C283(ch0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_AllocD")
//Letter_AllocD
If (ch0=1)
	If (([DIARY:12]Document_Code:15#"") & ([DIARY:12]Done:14=False:C215) & (OK=1))
		[DIARY:12]Result_Code:11:="OK"
		[DIARY:12]Document_Code:15:=DOC_MakeLetterFromTemplate($1)
		[DIARY:12]Done:14:=True:C214
		[DIARY:12]Date_Done_From:5:=vDate
		[DIARY:12]Date_Done_To:34:=[DIARY:12]Date_Done_From:5
		[DIARY:12]Time_Done_From:7:=Current time:C178
		[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
		[DIARY:12]Export:24:=Export_Stamp2([DIARY:12]Export:24)
		Diary_PersPrior
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	End if 
End if 
ERR_MethodTrackerReturn("Letter_AllocD"; $_t_oldMethodName)