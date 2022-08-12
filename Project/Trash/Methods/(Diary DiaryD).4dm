//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryD
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

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryD")
//Diary_DiaryD
//◊DiaryCheck:=3
Diary_Diary(3)
ERR_MethodTrackerReturn("Diary_DiaryD"; $_t_oldMethodName)