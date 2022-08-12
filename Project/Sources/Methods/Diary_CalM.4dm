//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_CalM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 15:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_LONGINT:C283(vMod)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_CalM")
//Diary_CalM
Start_Process
If (Diary_File)  // modified NG June 2004
	vMod:=0
	vUser2:=<>PER_t_CurrentUserInitials
	vDate:=!00-00-00!
	Diary_Cal
	If (vDate>!00-00-00!)
		FORM SET OUTPUT:C54([DIARY:12]; "Diary")
		Diary_DateSrch
		Open_Pro_Window(Diary_DiaryWT)
		DB_t_CurrentFormUsage:="Cal"
		Gen_ModMidAP("DMaster"; ->[DIARY:12]; "Diary Items")
		DB_t_CurrentFormUsage:=""
		Close_ProWin
	End if 
End if 

Process_End
ERR_MethodTrackerReturn("Diary_CalM"; $_t_oldMethodName)