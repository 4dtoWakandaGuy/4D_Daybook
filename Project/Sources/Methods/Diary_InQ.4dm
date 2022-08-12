//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InQ
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAdd)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InQ")
//Diary_InQ
$_t_WindowTitle:="Enter "+Term_OrdWT("Quotations")
Start_Process
If (Diary_FileL)  // modified NG June 2004
	
	If (In_Allowed($_t_WindowTitle; ->[DIARY:12]))
		CREATE SET:C116([DIARY:12]; "DMaster")
		REDUCE SELECTION:C351([DIARY:12]; 0)
		vAdd:=1
		OK:=1
		Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; "Diary_inL"+Documents_4DWriteAccessType(False:C215))  //Rollo July 2004 added form
		While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
			DB_t_CurrentFormUsage:="Q"
			FORM SET INPUT:C55([DIARY:12]; "Diary_inL"+Documents_4DWriteAccessType(False:C215))  //NG April 2004 removed reference to ◊screen
			
			ADD RECORD:C56([DIARY:12]; *)
			ADD TO SET:C119([DIARY:12]; "DMaster")
			Gen_InOne
		End while 
		Close_ProWin
	End if 
End if 

Process_End
ERR_MethodTrackerReturn("Diary_InQ"; $_t_oldMethodName)