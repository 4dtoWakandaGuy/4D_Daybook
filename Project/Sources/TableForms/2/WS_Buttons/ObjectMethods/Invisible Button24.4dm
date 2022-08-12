If (False:C215)
	//object Name: [COMPANIES]WS_Buttons.Invisible Button24
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_CallBackProcess; $_l_event; $_l_FieldNumber; $_l_Index; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_PopUpProcess; $_l_TableNumber)
	C_POINTER:C301($_ptr_PalletButton; $_Ptr_PopUpNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_PopupMenu; $_t_ProcessName; PAL_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].WS_Buttons.Invisible Button24"; Form event code:C388)
$_ptr_PalletButton:=Self:C308
RESOLVE POINTER:C394($_ptr_PalletButton; PAL_BUTTON; $_l_TableNumber; $_l_FieldNumber)
$_l_event:=Form event code:C388
$_l_ButtonNumber:=Num:C11(PAL_BUTTON)
Case of 
	: ($_l_event=On Long Click:K2:37)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$_Ptr_PopUpNumber:=Get pointer:C304("PAL_at_PopUpMenu"+String:C10($_l_ButtonNumber))
		PAL_bo_ButtonSubFunction:=True:C214
		$_t_ProcessName:="$PALPOP_"+PAL_BUTTON
		$_l_CallBackProcess:=Current process:C322
		$_t_PopupMenu:=""
		If (Size of array:C274($_Ptr_PopUpNumber->)>0)
			For ($_l_Index; 1; Size of array:C274($_Ptr_PopUpNumber->))
				If ($_l_Index=1)
					$_t_PopupMenu:=$_Ptr_PopUpNumber->{$_l_Index}
				Else 
					$_t_PopupMenu:=$_t_PopupMenu+";"+$_Ptr_PopUpNumber->{$_l_Index}
				End if 
				
			End for 
			
			$_l_PopUpProcess:=New process:C317("PAL_DisplayPopUp"; 64000; $_t_ProcessName; $_l_CallBackProcess; $_l_ButtonNumber; $_l_MouseX; $_l_MouseY; $_t_PopupMenu)
			BRING TO FRONT:C326($_l_PopUpProcess)
		Else 
			
			PAL_bo_ButtonSubFunction:=False:C215
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].WS_Buttons.Invisible Button24"; $_t_oldMethodName)
