If (False:C215)
	//object Name: [JOB_TYPES]types_in.olbusage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_TYPES].types_in.olbusage"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_Row:=Self:C308->
		
		Gen_CUScript($_l_Row)
		
End case 
ERR_MethodTrackerReturn("OBJ [JOB_TYPES].types_in.olbusage"; $_t_oldMethodName)
