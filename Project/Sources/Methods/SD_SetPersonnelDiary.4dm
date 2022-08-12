//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetPersonnelDiary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/11/2010 15:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>PER_l_CurrentUserID; PER_l_Context)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetPersonnelDiary")
//This method will open the current LOGGED IN person Personnel Record on the dairy page

//READ WRITE([PERSONNEL])
//QUERY([PERSONNEL];[PERSONNEL]Personnel_ID=◊UserID)
//$ViewLists:=◊ViewLists  ` Disable so we always get an input form
//PER_l_Context:=1
//◊ViewLists:=False
DBI_DisplayRecord(Current process:C322; Table:C252(->[PERSONNEL:11]); "Set Diary Preferences"; String:C10(<>PER_l_CurrentUserID); "Diary Settings")

//Gen_Mod ("View Personnel";"Personnel_File";"Master";->[PERSONNEL];->vP;"";"Diary Settings")
//◊ViewLists:=$ViewLists
ERR_MethodTrackerReturn("SD_SetPersonnelDiary"; $_t_oldMethodName)