If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oDoDateUp
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
	C_LONGINT:C283($_l_event)
	C_POINTER:C301(SD_ptr_Date1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oDoDateUp"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (Not:C34(Read only state:C362([DIARY:12])))
			If ([DIARY:12]Diary_Code:3#"") & ([DIARY:12]Done:14=False:C215)
				If (Not:C34(Is nil pointer:C315(SD_ptr_Date1)))
					SD_ptr_Date1->:=SD_ptr_Date1->+1
					Diary_InD
				End if 
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oDoDateUp"; $_t_oldMethodName)
