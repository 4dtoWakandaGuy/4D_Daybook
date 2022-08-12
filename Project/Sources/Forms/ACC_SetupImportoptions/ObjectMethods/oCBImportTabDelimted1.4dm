If (False:C215)
	//object Method Name: Object Name:      ACC_SetupImportoptions.oCBImportTabDelimted1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/07/2013 12:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_ab_TemplateSelected;0)
	C_BOOLEAN:C305(ACC_CB_ImportTab; ACC_CB_ImportXLS)
	C_LONGINT:C283($_l_Event; $_l_TemplateRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_SetupImportoptions.oCBImportTabDelimted1"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		If (Self:C308->)
			$_l_TemplateRow:=Find in array:C230(ACC_ab_TemplateSelected; True:C214)
			If ($_l_TemplateRow>0)
				ACC_ab_TemplateSelected{$_l_TemplateRow}:=False:C215
			End if 
			ACC_CB_ImportTab:=False:C215
		End if 
End case 
ERR_MethodTrackerReturn("OBJ ACC_SetupImportoptions.oCBImportTabDelimted1"; $_t_oldMethodName)
