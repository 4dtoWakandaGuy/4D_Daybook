//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetViewsOption
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/01/2011 13:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_SETINPUTPREF; DB_bo_ViewsOption)
	C_OBJECT:C1216($_obj_Save)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetViewsOption")

DB_bo_ViewsOption:=Not:C34(DB_bo_ViewsOption)
If (DB_bo_ViewsOption)
	DB_MenuAction("View"; "Open Views In New Window"; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
Else 
	DB_MenuAction("View"; "Open Views In New Window"; 4; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
End if 
//DB_bo_SETINPUTPREF:=True
//DB_SetInputOpeninNewWindow:=DB_bo_ViewsOption
$_obj_Save:=New object:C1471("SetInputOpeninNewWindow"; DB_bo_ViewsOption)
DB_SaveWindowPrefs($_obj_Save)

ERR_MethodTrackerReturn("DB_SetViewsOption"; $_t_oldMethodName)
