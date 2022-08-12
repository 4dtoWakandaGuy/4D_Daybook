If (False:C215)
	//Project Form Method Name:      BUTTONS_SUBFORM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 09:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_ButtonCall; DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; $_l_HorizontalDIfference; $_l_MouseButton; $_l_Mousex; $_l_MouseY; $_l_ScreenHeight; $_l_ScreenWIdth; $_l_VerticalDIfference; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_windowTop; BUT_l_BUTTONWINLEFT; BUT_l_BUTTONWINTOP; BUT_l_CallBackProcess; PAL_BUTTON_1; PAL_BUTTON_11; PAL_BUTTON_13; PAL_BUTTON_14; PAL_BUTTON_15; PAL_BUTTON_18; PAL_BUTTON_2)
	C_LONGINT:C283(PAL_BUTTON_3; PAL_BUTTON_4)
	C_TEXT:C284($_t_CurrentButton; $_t_oldMethodName; BUT_t_ButtonContext; BUT_t_ButtonSettings; PAL_BUTTON; vButtDisO)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/BUTTONS_SUBFORM/{formMethod}"; Form event code:C388)
$_l_Event:=Form event code:C388
SET TIMER:C645(30)
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_ScreenWIdth:=Screen width:C187
		$_l_ScreenHeight:=Screen height:C188
		$_l_HorizontalDIfference:=0
		$_l_VerticalDIfference:=0
		If ($_l_WindowRight>($_l_ScreenWIdth-10))
			$_l_HorizontalDIfference:=($_l_WindowRight-$_l_ScreenWIdth)+10
		End if 
		If ($_l_WindowBottom>($_l_ScreenHeight-10))
			$_l_VerticalDIfference:=($_l_WindowBottom-$_l_ScreenHeight)+10
		End if 
		SET WINDOW RECT:C444($_l_WindowLeft-$_l_HorizontalDIfference; $_l_windowTop-$_l_VerticalDIfference; $_l_WindowRight-$_l_HorizontalDIfference; $_l_WindowBottom-$_l_VerticalDIfference)
		vButtDisO:=BUT_t_ButtonSettings
		If (BUT_t_ButtonContext="Input")
			FORM GOTO PAGE:C247(2)
		Else 
			FORM GOTO PAGE:C247(1)
		End if 
		DB_SetFormButtonOptions(vButtDisO)
		SET TIMER:C645(30)
	: ($_l_Event=On Outside Call:K2:11)
		
		
		If (BUT_t_ButtonContext="Input")
			SET WINDOW RECT:C444(BUT_l_BUTTONWINLEFT; BUT_l_BUTTONWINTOP; BUT_l_BUTTONWINLEFT+450; BUT_l_BUTTONWINTOP+48)
			FORM GOTO PAGE:C247(2)
			
		Else 
			SET WINDOW RECT:C444(BUT_l_BUTTONWINLEFT; BUT_l_BUTTONWINTOP; BUT_l_BUTTONWINLEFT+360; BUT_l_BUTTONWINTOP+48)
			FORM GOTO PAGE:C247(1)
		End if 
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_ScreenWIdth:=Screen width:C187
		$_l_ScreenHeight:=Screen height:C188
		$_l_HorizontalDIfference:=0
		$_l_VerticalDIfference:=0
		If ($_l_WindowRight>($_l_ScreenWIdth-10))
			$_l_HorizontalDIfference:=($_l_WindowRight-$_l_ScreenWIdth)+10
		End if 
		If ($_l_WindowBottom>($_l_ScreenHeight-10))
			$_l_VerticalDIfference:=($_l_WindowBottom-$_l_ScreenHeight)+10
		End if 
		SET WINDOW RECT:C444($_l_WindowLeft-$_l_HorizontalDIfference; $_l_windowTop-$_l_VerticalDIfference; $_l_WindowRight-$_l_HorizontalDIfference; $_l_WindowBottom-$_l_VerticalDIfference)
		
		vButtDisO:=BUT_t_ButtonSettings
		DB_SetFormButtonOptions(vButtDisO)
		SHOW WINDOW:C435
		BRING TO FRONT:C326(Current process:C322)
		
		SET TIMER:C645(30)
	: ($_l_Event=On Clicked:K2:4)
		
		If (BUT_t_ButtonContext="Input")
			$_t_CurrentButton:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_CurrentButton; BUT_l_CallBackProcess)
			
		Else 
			Case of 
					
				: (PAL_BUTTON_2=1)  //accept
					
					
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_2; 1)
					
					PAL_BUTTON_2:=0
				: (PAL_BUTTON_1=1)
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_1; 1)
					
					//Hdere if we are in a transaction we cancel the transaction
					//FSetting_UpdateArray (WIN_t_CurrentOutputform;FS_l_SortDirection;FS_l_SortFieldNUM;FS_l_SortTableNUM;FS_t_SortVariableName;FS_t_SortFieldTXT;WT_t_SortFieldVARNAME)
					PAL_BUTTON_1:=0
				: (PAL_BUTTON_4=1)
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_4; 1)
					
					
				: (PAL_BUTTON_3=1)  //delete
					
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_3; 1)
					PAL_BUTTON_3:=0
					
					
				: (PAL_BUTTON_13=1)  //sort
					
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_13; 1)
					PAL_BUTTON_13:=0
					
					
				: (PAL_BUTTON_18=1)  //calc
					
					
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_18; 1)
					PAL_BUTTON_18:=0
				: (PAL_BUTTON_14=1)  //show/hide selection manager
					
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_14; 1)
					PAL_BUTTON_14:=0
					
				: (PAL_BUTTON_15=1)  //create repor
					
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_15; 1)
					PAL_BUTTON_15:=0
					
				: (PAL_BUTTON_11=1)
					SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; PAL_BUTTON_11; 1)
					
			End case 
			SET PROCESS VARIABLE:C370(BUT_l_CallBackProcess; DB_bo_ButtonCall; True:C214)
			POST OUTSIDE CALL:C329(BUT_l_CallBackProcess)
		End if 
		
		HIDE WINDOW:C436
		SET TIMER:C645(0)
	: ($_l_Event=On Timer:K2:25)
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		GET MOUSE:C468($_l_Mousex; $_l_MouseY; $_l_MouseButton; *)
		If ($_l_Mousex<$_l_WindowLeft) | ($_l_Mousex>$_l_WindowRight) | ($_l_MouseY<$_l_windowTop) | ($_l_MouseY>$_l_WindowBottom)
			//TRACE
			HIDE WINDOW:C436
			SET TIMER:C645(0)
		End if 
		
End case 
ERR_MethodTrackerReturn("FM BUTTONS_SUBFORM"; $_t_oldMethodName)
