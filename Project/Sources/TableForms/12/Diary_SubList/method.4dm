If (False:C215)
	//Table Form Method Name: [DIARY]Diary_SubList
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_SubList"; Form event code:C388)
RELATE ONE:C42([DIARY:12]Result_Code:11)
RELATE ONE:C42([DIARY:12]Action_Code:9)
RELATE ONE:C42([DIARY:12]Contact_Code:2)
Contact_Details
ERR_MethodTrackerReturn("FM [DIARY].Diary_SubList"; $_t_oldMethodName)
