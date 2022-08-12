If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oselectAll
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	C_BOOLEAN:C305(DB_bo_ShowArrayBased)
	C_LONGINT:C283(DB_l_LBOutputForm)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oselectAll"; Form event code:C388)

If (DB_bo_ShowArrayBased)
	
	LISTBOX SELECT ROW:C912(DB_lb_OutputArrays; 0; 0)
	
	
Else 
	
	LISTBOX SELECT ROW:C912(DB_l_LBOutputForm; 0; 0)
	
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oselectAll"; $_t_oldMethodName)
