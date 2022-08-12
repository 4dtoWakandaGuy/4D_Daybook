If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.3D Check Box1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/01/2013 15:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD2_bo_FiltersOn)
	C_LONGINT:C283($_l_event; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.3D Check Box1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_bo_FiltersOn=False:C215)
			OBJECT SET VISIBLE:C603(*; "OFilter@"; True:C214)
			SD2_bo_FiltersOn:=True:C214
			OBJECT GET COORDINATES:C663(*; "oFilterGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(*; "oFilterGroupBox"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+313; $_l_ObjectTop+43; *)
			OBJECT GET COORDINATES:C663(*; "OFilterStatusValue"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			OBJECT MOVE:C664(*; "oFilterStatusPOP"; $_l_ObjectLeft; $_l_ObjectTop-2; $_l_ObjectLeft+41; $_l_ObjectBottom+2; *)
		Else 
			OBJECT SET VISIBLE:C603(*; "OFilter@"; False:C215)
			SD2_bo_FiltersOn:=False:C215
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.3D Check Box1"; $_t_oldMethodName)
