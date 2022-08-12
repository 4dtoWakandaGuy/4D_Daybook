If (False:C215)
	//Table Form Method Name: [USER]ORDERITEMLABELADMIN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(LAB_ai_IncludeLine;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; LAB_l_Continue)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].ORDERITEMLABELADMIN"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "ORDERITEMLABELADMIN")
		LAB_l_Continue:=0
		WS_AutoscreenSize(3; 290; 520)
		INT_SetLongintCheckFormat(->LAB_ai_IncludeLine)
		
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:ORDERITEMLABELADMIN"; $_t_oldMethodName)
