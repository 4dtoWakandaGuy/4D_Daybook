//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InBCB
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

$_t_oldMethodName:=ERR_MethodTracker("Diary_InBCB")
//Diary_InBCB
[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
Check_ContDef(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2)
[DIARY:12]Person:8:=[COMPANIES:2]Sales_Person:29
If ([DIARY:12]Person:8="")
	[DIARY:12]Person:8:=[COMPANIES:2]Taken_By:26
End if 
ERR_MethodTrackerReturn("Diary_InBCB"; $_t_oldMethodName)