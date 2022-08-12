If (False:C215)
	//Table Form Method Name: [USER]SD_Thermo
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
	C_REAL:C285(<>SD_Thermo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD_Thermo"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Outside Call:K2:11)
		If (<>SD_Thermo=100)
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("FM [USER].SD_Thermo"; $_t_oldMethodName)
