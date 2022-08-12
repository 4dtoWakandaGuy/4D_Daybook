//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_In2
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
	C_BOOLEAN:C305(vMod2)
	C_LONGINT:C283(vItemNum)
	C_TEXT:C284($_t_oldMethodName; vConfName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_In2")
vItemNum:=0
vConfName:=""
vMod2:=False:C215
Products_In
ERR_MethodTrackerReturn("Products_In2"; $_t_oldMethodName)