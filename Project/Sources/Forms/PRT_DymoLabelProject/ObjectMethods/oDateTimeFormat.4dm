If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.oDateTimeFormat
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/05/2012 15:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRT_at_DateFormat;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; PRT_T_DateFormat)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PRT_DymoLabelProject.oDateTimeFormat"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		PRT_T_DateFormat:=PRT_at_DateFormat{PRT_at_DateFormat}
End case 
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.oDateTimeFormat"; $_t_oldMethodName)
