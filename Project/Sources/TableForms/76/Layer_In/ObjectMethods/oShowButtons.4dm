If (False:C215)
	//object Name: [LAYERS]Layer_In.oShowButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 13:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop)
	C_TEXT:C284($_t_oldMethodName; vButtDis)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [LAYERS].Layer_In.oShowButtons"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Mouse Enter:K2:33)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663(*; "oShowButtons"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		
		DB_ShowFloatingButtons(Current process:C322; vButtDis; $_l_WindowLeft+$_l_MouseX; $_l_windowTop+$_l_MouseY; "input")
		
		
		
	: ($_l_event=On Mouse Leave:K2:34)
		//DB_HideFloatingButtons
End case 
ERR_MethodTrackerReturn("OBJ [LAYERS].Layer_In.oShowButtons"; $_t_oldMethodName)
