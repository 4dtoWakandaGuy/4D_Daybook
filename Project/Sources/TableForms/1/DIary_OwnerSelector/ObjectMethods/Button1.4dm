If (False:C215)
	//object Name: [CONTACTS]DIary_OwnerSelector.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_SelectPersonNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].DIary_OwnerSelector.Button1"; Form event code:C388)
SD_at_SelectPersonNames:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [CONTACTS].DIary_OwnerSelector.Button1"; $_t_oldMethodName)
