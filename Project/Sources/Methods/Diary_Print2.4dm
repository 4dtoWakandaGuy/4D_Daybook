//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Print2
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
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Print2")
Menu_Record("Diary_Print2"; "Print Document")
Diary_Print
FORM SET INPUT:C55([DIARY:12]; "Diary_In")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Diary_In"
FORM SET OUTPUT:C54([DIARY:12]; "Diary")
WIN_t_CurrentOutputform:="Diary"
ERR_MethodTrackerReturn("Diary_Print2"; $_t_oldMethodName)