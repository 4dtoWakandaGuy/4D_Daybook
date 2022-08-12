If (False:C215)
	//object Name: [COMPONENTS]EDIT_COMPONENT.Field1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2011 08:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PC_bo_ComponentMod)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.Field1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		PC_bo_ComponentMod:=True:C214
		If ([COMPONENTS:86]Optional_Component:11)
			OBJECT SET ENTERABLE:C238([COMPONENTS:86]IncludeOptionalByDefault:22; True:C214)
		Else 
			OBJECT SET ENTERABLE:C238([COMPONENTS:86]IncludeOptionalByDefault:22; False:C215)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.Field1"; $_t_oldMethodName)
