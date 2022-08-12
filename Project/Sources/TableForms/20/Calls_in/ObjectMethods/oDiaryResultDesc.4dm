If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oDiaryResultDesc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_LONGINT:C283(SD_l_DescriptionSplitter)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oDiaryResultDesc"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Getting Focus:K2:7)
		SD_SetSplitter(->SD_l_DescriptionSplitter; 1)
End case 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oDiaryResultDesc"; $_t_oldMethodName)
