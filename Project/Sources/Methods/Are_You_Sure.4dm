//%attributes = {}
If (False:C215)
	//Project Method Name:      Are_You_Sure
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/09/2010 08:06
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

$_t_oldMethodName:=ERR_MethodTracker("Are_You_Sure")
//Are_You_Sure?
Gen_Confirm(Get localized string:C991("Text_Areyousure")+"?"; Get localized string:C991("Text_No"); Get localized string:C991("Text_Yes"))
If (OK=1)
	OK:=0
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("Are_You_Sure"; $_t_oldMethodName)
