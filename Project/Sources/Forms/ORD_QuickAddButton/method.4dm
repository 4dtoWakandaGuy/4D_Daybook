If (False:C215)
	//Project Form Method Name: ORD_QuickAddButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2012 15:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; ORD_l_CallBackProcess; ORD_l_quickaddprocess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/ORD_QuickAddButton/{formMethod}"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1)
		BRING TO FRONT:C326(ORD_l_CallBackProcess)
		
	: ($_l_event=On Outside Call:K2:11)
		SET PROCESS VARIABLE:C370(ORD_l_CallBackProcess; ORD_l_quickaddprocess; 0)
		CANCEL:C270
End case 
ERR_MethodTrackerReturn("FM ORD_QuickAddButton"; $_t_oldMethodName)
