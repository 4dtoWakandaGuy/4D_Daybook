//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryT
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryT")
//Diary DairyT
//◊DiaryCheck:=2
Diary_Diary(2)
ERR_MethodTrackerReturn("Diary_DiaryT"; $_t_oldMethodName)