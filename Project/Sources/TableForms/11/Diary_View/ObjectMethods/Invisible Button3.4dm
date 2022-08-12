If (False:C215)
	//object Name: [PERSONNEL]Diary_View.Invisible Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; SD_l_AppointmentsortDirection)
	C_PICTURE:C286(SD_Pic_AptSort)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Invisible Button3"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD_l_AppointmentsortDirection:=Abs:C99(SD_l_AppointmentsortDirection-1)
		
		//GET PICTURE FROM LIBRARY(22223-SD_l_AppointmentsortDirection; SD_Pic_AptSort)
		SD_Pic_AptSort:=Get_Picture(22223-SD_l_AppointmentsortDirection)
		SD_HL_Sort(2)
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Invisible Button3"; $_t_oldMethodName)
