//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL_DisplayPopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2011 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_PopupSelected; $1; $2; $3; $4; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(PAL_l_PopUpID)
	C_TEXT:C284($_t_MenuString; $_t_oldMethodName; $_t_ReturnValue; $5; PAL_t_PopUpSelected)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("CAL_DisplayPopUp")
// MY SPEED MENU project method
If (Count parameters:C259>=5)
	//C_TEXT(${5})
	//;$6;$7;$8;$9;$10;$11;$12;$13;$14;$15;$16;$17;$18;$19;$20;$21;$22;$23;$24;$25)
	GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
	$_t_MenuString:=$5
	
	If ($_t_MenuString#"")
		$_l_PopupSelected:=Pop up menu:C542($_t_MenuString; 1; $3; $4)
		Case of 
			: ($_l_PopupSelected>0)
				SET PROCESS VARIABLE:C370($1; PAL_l_PopUpID; $2)  //Tell it which pop up
				$_t_ReturnValue:=""
				For ($_l_Index; 1; $_l_PopupSelected)
					$_l_CharacterPosition:=Position:C15(";"; $_t_MenuString)
					If ($_l_CharacterPosition>0)
						$_t_ReturnValue:=Substring:C12($_t_MenuString; 1; $_l_CharacterPosition-1)
						$_t_MenuString:=Substring:C12($_t_MenuString; $_l_CharacterPosition+1; Length:C16($_t_MenuString))
						
					Else 
						$_t_ReturnValue:=$_t_MenuString
					End if 
				End for 
				
				SET PROCESS VARIABLE:C370($1; PAL_t_PopUpSelected; $_t_ReturnValue)  // pass the string
				SET PROCESS VARIABLE:C370($1; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Subfunction"))
				POST OUTSIDE CALL:C329($1)
			Else 
				SET PROCESS VARIABLE:C370($1; PAL_l_PopUpID; 0)  //Tell it which pop up(none)
				SET PROCESS VARIABLE:C370($1; PAL_t_PopUpSelected; "")  // pass the string(blank)
				SET PROCESS VARIABLE:C370($1; DB_l_ButtonClickedFunction; DB_GetButtonFunction("Subfunction"))
				POST OUTSIDE CALL:C329($1)
		End case 
		
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("CAL_DisplayPopUp"; $_t_oldMethodName)