If (False:C215)
	//object Name: [TYPES]types_in.oLBusage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2012 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CU_abo_CodeUsed;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TYPES].types_in.oLBusage"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		CU_abo_CodeUsed:=Self:C308->
		Gen_CUScript
End case 
ERR_MethodTrackerReturn("OBJ [TYPES].types_in.oLBusage"; $_t_oldMethodName)
