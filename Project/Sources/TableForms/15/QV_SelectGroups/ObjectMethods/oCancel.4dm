If (False:C215)
	//object Name: [USER]QV_SelectGroups.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(QV_ListSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_SelectGroups.Button1"; Form event code:C388)
QV_ListSelected:=False:C215
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].QV_SelectGroups.Button1"; $_t_oldMethodName)