If (False:C215)
	//object Name: Object Name:      LAYOUT_CONFIG.Field2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 12:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified; LAY_bo_RecordEdited)
	C_LONGINT:C283($_l_event; LAY_l_ConfigCancel; LAY_l_ConfigSave)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.Field2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		LAY_bo_RecordEdited:=True:C214
		DB_bo_RecordModified:=True:C214
		OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
		OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
End case 
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Field2"; $_t_oldMethodName)
