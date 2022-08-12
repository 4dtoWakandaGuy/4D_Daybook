//%attributes = {}
If (False:C215)
	//Project Method Name:      TRG_DiaryOrlDatetimeStamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("TRG_DiaryOrlDatetimeStamp")
//this method will put the time date stamp into the field
//this significant date could be the date DONE not the date do
//so this may need to check a pre-but at the moment it will just
// set them based on the date.time to do

[DIARY:12]Original_Date_Time_Stamp:47:=GEN_TimeDateStamp(Current date:C33(*); Current time:C178(*))
ERR_MethodTrackerReturn("TRG_DiaryOrlDatetimeStamp"; $_t_oldMethodName)