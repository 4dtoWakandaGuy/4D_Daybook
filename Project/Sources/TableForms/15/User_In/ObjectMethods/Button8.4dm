If (False:C215)
	//object Name: [USER]User_In.Button8
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
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_BOOLEAN:C305($_bo_Accept)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button8"; Form event code:C388)


If (DM_al_BKModelIDS{DM_at_BKModelNames}>0)
	$_bo_Accept:=EW_FieldMapSave(DM_al_BKModelIDS{DM_at_BKModelNames})
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button8"; $_t_oldMethodName)
