If (False:C215)
	//object Name: Object Name:      SD2_ActionStatus.oStatusListbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_StatusSettings;0)
	//ARRAY LONGINT(SD2_al_StatusRGB;0)
	//ARRAY PICTURE(SD2_apic_StatusColour;0)
	C_BOOLEAN:C305(SD2_ab_EditedSettings)
	C_LONGINT:C283($_l_Colour; $_l_Column; $_l_event; $_l_RGBCurrent; $_l_RGBNew; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_ActionStatus.oStatusListbox"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(SD2_lb_StatusSettings; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=3)
				//we clicked on a row of the status colour
				If ($_l_Row>0)
					$_l_RGBCurrent:=SD2_al_StatusRGB{$_l_Row}
					$_l_RGBNew:=Select RGB color:C956($_l_RGBCurrent; "Select Color for this status")
					SD2_al_StatusRGB{$_l_Row}:=$_l_RGBNew
					$_l_Colour:=-(0+(256*(SD2_al_StatusRGB{$_l_Row})))
					SD2_apic_StatusColour{$_l_Row}:=SD2_PicMakeSVGcircle(SD2_al_StatusRGB{$_l_Row}; 88; 12)
					
					//SET COLOR(;$_l_Colour)
				End if 
		End case 
	: ($_l_event=On After Edit:K2:43)
		SD2_ab_EditedSettings:=True:C214
	: ($_l_event=On Double Clicked:K2:5)
End case 
ERR_MethodTrackerReturn("OBJ SD2_ActionStatus.oStatusListbox"; $_t_oldMethodName)
