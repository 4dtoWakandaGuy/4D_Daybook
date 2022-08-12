//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PersonGr_InLPA
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
	C_BOOLEAN:C305(vMod2; vMod3)
	C_LONGINT:C283($J)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PersonGr_InLPA")

Cat_SavePerGroupPrefs
SD_SavePrefs(-([PERSONNEL_GROUPS:92]x_ID:12)*10)

If (vMod2)
	PersonGr_InLPA2
End if 
If (vMod3)
	Modules_ArrApp("^G"+[PERSONNEL_GROUPS:92]Group_Code:1)
End if 
ERR_MethodTrackerReturn("PersonGr_InLPA"; $_t_oldMethodName)