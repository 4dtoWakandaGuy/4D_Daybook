//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_RealMod
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
	//ARRAY LONGINT(aApptO;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_DATE:C307(vDate)
	C_LONGINT:C283($1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; vUser2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_RealMod")
//Diary_RealMod
If (aApptO{$1}=0)
	CREATE RECORD:C68([DIARY:12])
	Diary_Code
	[DIARY:12]Date_Do_From:4:=vDate
	[DIARY:12]Time_Do_From:6:=Time:C179(GEN_at_RecordCode{$1})
	[DIARY:12]Person:8:=vUser2
	[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	MODIFY RECORD:C57([DIARY:12]; *)
	If (OK=0)
		DB_DeletionControl(->[DIARY:12])
		
		DELETE RECORD:C58([DIARY:12])
	End if 
Else 
	GOTO RECORD:C242([DIARY:12]; aApptO{$1})
	MODIFY RECORD:C57([DIARY:12]; *)
End if 
Diary_DateSrchR(1)
ERR_MethodTrackerReturn("Diary_RealMod"; $_t_oldMethodName)