If (False:C215)
	//object Name: [USER]Template_manager.o4dWriteArea
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Template_manager.o4dWriteArea"; Form event code:C388)
[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [USER].Template_manager.o4dWriteArea"; $_t_oldMethodName)