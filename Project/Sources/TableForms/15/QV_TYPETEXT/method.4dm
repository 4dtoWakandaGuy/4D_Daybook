If (False:C215)
	//Table Form Method Name: [USER]QV_TYPETEXT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; QV_T_MultiADD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].QV_TYPETEXT"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "QV_TYPETEXT")
		QV_T_MultiADD:=""
		WS_AutoscreenSize(2; 136; 275)
		INT_SetDialog
	: ($_l_event=On Resize:K2:27)
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM [USER].QV_TYPETEXT"; $_t_oldMethodName)
