If (False:C215)
	//Table Form Method Name: [PICTURES]dPicture_Any
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PICTURES].dPicture_Any"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[PICTURES:85])
End case 
ERR_MethodTrackerReturn("FM [PICTURES].dPicture_Any"; $_t_oldMethodName)
