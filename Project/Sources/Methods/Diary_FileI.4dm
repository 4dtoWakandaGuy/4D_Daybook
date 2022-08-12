//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_FileI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2009 14:38:24If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_FileI")
//NG April 2004 removed reference to ◊screen
//NG April 2004 and removed silver references


FORM SET INPUT:C55([DIARY:12]; "Diary_inNew")
WIN_t_CurrentInputForm:="Diary_InNew"
ERR_MethodTrackerReturn("Diary_FileI"; $_t_oldMethodName)