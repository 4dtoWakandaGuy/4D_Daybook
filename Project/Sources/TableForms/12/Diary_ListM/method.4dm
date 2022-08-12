If (False:C215)
	//Table Form Method Name: [DIARY]Diary_ListM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vContName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_ListM"; Form event code:C388)
RELATE ONE:C42([DIARY:12]Company_Code:1)
RELATE ONE:C42([DIARY:12]Contact_Code:2)
vContName:=[CONTACTS:1]Contact_Name:31
ERR_MethodTrackerReturn("FM [DIARY].Diary_ListM"; $_t_oldMethodName)