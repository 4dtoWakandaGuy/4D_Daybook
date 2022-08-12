If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.Check Box1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/05/2012 11:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRT_at_DateFormat;0)
	C_BOOLEAN:C305(PRT_bo_IncludeDateTime; PRT_bo_IncludeTime; PRT_bo_TwentyFour)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/PRT_DymoLabelProject/Check Box1"; Form event code:C388)
$_l_event:=Form event code:C388
//TRACE
Case of 
	: ($_l_event=On Clicked:K2:4)
		OBJECT SET ENABLED:C1123(PRT_bo_TwentyFour; PRT_bo_IncludeDateTime)
		OBJECT SET ENABLED:C1123(PRT_bo_IncludeTime; PRT_bo_IncludeDateTime)
		OBJECT SET ENABLED:C1123(PRT_at_DateFormat; PRT_bo_IncludeDateTime)
		OBJECT SET ENTERABLE:C238(*; "oDateTime@"; PRT_bo_IncludeDateTime)
		If (PRT_bo_IncludeDateTime)
			GOTO OBJECT:C206(PRT_bo_TwentyFour)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.Check Box1"; $_t_oldMethodName)
