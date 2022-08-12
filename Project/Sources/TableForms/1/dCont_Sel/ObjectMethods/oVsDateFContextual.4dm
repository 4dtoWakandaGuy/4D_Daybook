If (False:C215)
	//object Name: [CONTACTS]dCont_Sel.oVsDateFContextual
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CallBackProcess; $_l_CharacterPosition; $_l_DatesProcess; $_l_event; $_l_FieldNumber; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_windowTop)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_ObjectName; $_t_oldMethodName; $_t_ProcessName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dCont_Sel.oVsDateFContextual"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (Form event code:C388=On Long Click:K2:37)
		$_ptr_Variable:=OBJECT Get pointer:C1124(Object current:K67:2)
		$_t_ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
		RESOLVE POINTER:C394($_ptr_Variable; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If ($_t_VariableName#"")
			$_l_CharacterPosition:=Position:C15("PopBar"; $_t_VariableName)
			If ($_l_CharacterPosition>0)
				$_t_VariableName:=Substring:C12($_t_VariableName; 1; $_l_CharacterPosition-1)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
				$_t_ProcessName:="Context Date Pick"
				$_l_CallBackProcess:=Current process:C322
				$_l_DatesProcess:=New process:C317("BAR_DisplayDates"; 64000; $_t_ProcessName; $_l_CallBackProcess; $_l_WindowLeft+$_l_MouseX; $_l_windowTop+$_l_MouseY; $_t_VariableName)
				$_l_CharacterPosition:=Position:C15("Contextual"; $_t_ObjectName)
				If ($_l_CharacterPosition>0)
					$_t_ObjectName:=Substring:C12($_t_ObjectName; 1; $_l_CharacterPosition-1)
					If ($_t_ObjectName#"")
						If (($_t_ObjectName[[Length:C16($_t_ObjectName)]])="F")
							$_t_ObjectName:=Substring:C12($_t_ObjectName; 1; Length:C16($_t_ObjectName)-1)
							$_t_ObjectName:=$_t_ObjectName+"T"
							OBJECT SET VISIBLE:C603(*; $_t_ObjectName+"@"; True:C214)
						End if 
					End if 
					
				End if 
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dCont_Sel.oVsDateFContextual"; $_t_oldMethodName)
