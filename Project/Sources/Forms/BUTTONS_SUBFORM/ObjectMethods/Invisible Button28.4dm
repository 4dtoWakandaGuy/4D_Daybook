If (False:C215)
	//object Method Name: Object Name:      BUTTONS_SUBFORM.Invisible Button28
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 12:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CallBackProcess; $_l_DiaryPopup; $_l_Event; $_l_FieldNumber; $_l_Index; $_l_MouseButton; $_l_Mousex; $_l_Mousey; $_l_TableNumber; BUT_l_CallBackProcess)
	C_POINTER:C301($_Ptr_Button; $_ptr_Popup)
	C_TEXT:C284($_t_DisplayString; $_t_oldMethodName; $_t_ProcessName; PAL_BUTTON)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ BUTTONS_SUBFORM.Invisible Button28")

$_t_oldMethodName:=ERR_MethodTracker("OBJ BUTTONS_SUBFORM.Invisible Button28"; Form event code:C388)
$_Ptr_Button:=Self:C308
RESOLVE POINTER:C394($_Ptr_Button; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_Event:=Form event code:C388
$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
Case of 
	: ($_l_Event=On Long Click:K2:37)
		GET MOUSE:C468($_l_Mousex; $_l_Mousey; $_l_MouseButton)
		$_ptr_Popup:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10($_l_ButtonNumber))
		PAL_bo_ButtonSubFunction:=True:C214
		$_t_ProcessName:="$PALPOP_"+PAL_BUTTON
		$_l_CallBackProcess:=BUT_l_CallBackProcess
		$_t_DisplayString:=""
		If (Size of array:C274($_ptr_Popup->)>0)
			For ($_l_Index; 1; Size of array:C274($_ptr_Popup->))
				If ($_l_Index=1)
					$_t_DisplayString:=$_ptr_Popup->{$_l_Index}
				Else 
					$_t_DisplayString:=$_t_DisplayString+";"+$_ptr_Popup->{$_l_Index}
				End if 
				
			End for 
			
			$_l_DiaryPopup:=New process:C317("PAL_DisplayPopUp"; 64000; $_t_ProcessName; $_l_CallBackProcess; $_l_ButtonNumber; $_l_Mousex; $_l_Mousey; $_t_DisplayString)
			BRING TO FRONT:C326($_l_DiaryPopup)
		Else 
			
			PAL_bo_ButtonSubFunction:=False:C215
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ BUTTONS_SUBFORM.Invisible Button28"; $_t_oldMethodName)
