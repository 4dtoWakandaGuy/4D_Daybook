//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter Alloc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_LONGINT:C283(ch0)
	C_TEXT:C284(<>LetAct; <>PER_t_CurrentUserInitials; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter Alloc")
//Letter Alloc
If ((OK=1) & (ch0=1) & (DB_GetModuleSettingByNUM(Module_DiaryManager)>0))
	READ WRITE:C146([DIARY:12])
	If ($1="Merge File")
		REDUCE SELECTION:C351([DIARY:12]; 0)
	Else 
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215)
		If (Records in selection:C76([CONTACTS:1])>0)
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Contact_Code:2=[CONTACTS:1]Contact_Code:2)
		End if 
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15=$1)
	End if 
	If (Records in selection:C76([DIARY:12])=0)
		CREATE RECORD:C68([DIARY:12])
		Diary_Code
		[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
		[DIARY:12]Status:30:=[COMPANIES:2]Status:12
		If (Records in selection:C76([CONTACTS:1])>0)
			[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
		End if 
		[DIARY:12]Result_Code:11:="OK"
		[DIARY:12]Document_Code:15:=DOC_MakeLetterFromTemplate($1)
		
		If ([DOCUMENTS:7]Document_Code:1#$1)
			RELATE ONE:C42([DIARY:12]Document_Code:15)
		End if 
		If ([DOCUMENTS:7]Document_Type:13="")
			If (Count parameters:C259=2)
				[DIARY:12]Action_Code:9:=$2
			Else 
				[DIARY:12]Action_Code:9:=<>LetAct
			End if 
		Else 
			[DIARY:12]Action_Code:9:=[DOCUMENTS:7]Document_Type:13
		End if 
		[DIARY:12]Date_Do_From:4:=vDate
		[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
		[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
		[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials
	End if 
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
ERR_MethodTrackerReturn("Letter Alloc"; $_t_oldMethodName)