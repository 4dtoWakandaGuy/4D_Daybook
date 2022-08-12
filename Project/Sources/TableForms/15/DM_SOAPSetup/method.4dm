If (False:C215)
	//Table Form Method Name: [USER]DM_SOAPSetup
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
	//ARRAY TEXT(DM_at_SoapPages;0)
	//ARRAY TEXT(DM_at_SoapMethods;0)
	//ARRAY TEXT(DM_at_SoapTYPE;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].DM_SOAPSetup"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "DM_SOAPSetup")
		ARRAY TEXT:C222(DM_at_SoapPages; 2)
		DM_at_SoapPages{1}:="Default Settings"
		DM_at_SoapPages{2}:="Sources"
		//SSI_LoadMethods
		ARRAY TEXT:C222(DM_at_SoapTYPE; 99)
		ARRAY TEXT:C222(DM_at_SoapMethods; 99)
End case 
ERR_MethodTrackerReturn("FM [USER].DM_SOAPSetup"; $_t_oldMethodName)
