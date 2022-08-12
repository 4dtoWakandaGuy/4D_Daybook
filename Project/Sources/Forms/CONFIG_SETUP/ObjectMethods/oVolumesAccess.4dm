If (False:C215)
	//object Method Name: Object Name:      CONFIG_SETUP.oVolumesAccess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/09/2012 14:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DM_abo_DisableModule;0)
	//ARRAY BOOLEAN(DM_abo_ModuleDisabled;0)
	//ARRAY LONGINT(DM_al_ModuleNUM;0)
	//ARRAY LONGINT(DM_al_ModuleNumbers;0)
	C_BOOLEAN:C305(DB_bo_LicenceOverRidesSave)
	C_LONGINT:C283($_l_Column; $_l_Event; $_l_ModuleRow; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oVolumesAccess"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(*; "oVolumesAccess"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=1)
				$_l_ModuleRow:=Find in array:C230(DM_al_ModuleNumbers; DM_al_ModuleNUM{$_l_Row})
				If ($_l_ModuleRow<0)
					APPEND TO ARRAY:C911(DM_al_ModuleNumbers; DM_al_ModuleNUM{$_l_Row})
					APPEND TO ARRAY:C911(DM_abo_DisableModule; DM_abo_ModuleDisabled{$_l_Row})
				Else 
					DM_abo_DisableModule{$_l_ModuleRow}:=DM_abo_ModuleDisabled{$_l_Row}
				End if 
				SORT ARRAY:C229(DM_al_ModuleNumbers; DM_abo_DisableModule)
				DB_bo_LicenceOverRidesSave:=True:C214
		End case 
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oVolumesAccess"; $_t_oldMethodName)
