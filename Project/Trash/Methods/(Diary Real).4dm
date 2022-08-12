//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary Real
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 23:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vMod)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary Real")
//Diary Real
Start_Process
If (Diary_File)  //NG modified June 2004
	vMod:=0
	vDate:=<>DB_d_CurrentDate
	vUser2:=<>PER_t_CurrentUserInitials
	Diary_DateSrchR(0)
	CREATE SET:C116([DIARY:12]; "DMaster")
	Open_Pro_Window("Diary Appointments"; 0; 3; ->[DIARY:12]; "Diary Appts13")  //NG may 2004 added form reference
	
	DIALOG:C40([DIARY:12]; "Diary Appts13")  //NG April 2004 removed reference to ◊screen
	//NG may 2004 added diary to above
	Close_ProWin
End if 

Process_End
ERR_MethodTrackerReturn("Diary Real"; $_t_oldMethodName)