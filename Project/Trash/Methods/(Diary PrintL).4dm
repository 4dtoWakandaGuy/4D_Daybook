//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_PrintL
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
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283(cSave)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_PrintL")
//Diary_PrintL
Menu_Record("Diary_PrintL"; "Print Document")
If (cSave=0)
	cSave:=1
End if 
$_bo_Continue:=Diary_PrintS
Diary_Print
FORM SET OUTPUT:C54([DIARY:12]; "Diary OutL")
WIN_t_CurrentOutputform:="Diary OutL"
ERR_MethodTrackerReturn("Diary_PrintL"; $_t_oldMethodName)