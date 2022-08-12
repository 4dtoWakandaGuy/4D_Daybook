//%attributes = {}
If (False:C215)
	//Project Method Name:      Trigger_setDiaryDateStamp
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
	C_DATE:C307($StampDate)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trigger_setDiaryDateStamp")
//Trigger_SetDiaryDateStamp  `WT-July 2001
//this method will put the date stamp into the field
//this significant date could be the DATE DONE not the DATE TO DO
//so this may need to check a pre-but at the moment it will just
//set them based on the DATE TO DO
Case of 
	: ([DIARY:12]Date_Done_From:5#!00-00-00!)
		$StampDate:=[DIARY:12]Date_Done_From:5
	Else 
		$StampDate:=[DIARY:12]Date_Do_From:4
End case 
[DIARY:12]Date_Stamp:46:=Gen_DateStamp($StampDate)
ERR_MethodTrackerReturn("Trigger_setDiaryDateStamp"; $_t_oldMethodName)