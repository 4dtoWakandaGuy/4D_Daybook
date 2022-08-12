//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InBAdd
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

$_t_oldMethodName:=ERR_MethodTracker("Diary_InBAdd")
//Diary_InBAdd
OBJECT SET ENTERABLE:C238([DIARY:12]Company_Code:1; False:C215)
OBJECT SET ENTERABLE:C238([DIARY:12]Contact_Code:2; False:C215)
UNLOAD RECORD:C212([COMPANIES:2])
ERR_MethodTrackerReturn("Diary_InBAdd"; $_t_oldMethodName)