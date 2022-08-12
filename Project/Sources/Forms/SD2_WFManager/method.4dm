If (False:C215)
	//Project Form Method Name: SD2_WFManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 12:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD2_bo_DiaryInited)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM SD2_WFManager"; Form event code:C388)

$_l_event:=Form event code:C388

If (Not:C34(SD2_bo_DiaryInited))
	
End if 
Case of 
	: ($_l_event=On Load:K2:1)
		SD2_InitDiaryVew
		
		SD2_InitSVGCalendar
		
End case 
ERR_MethodTrackerReturn("FM SD2_WFManager"; $_t_oldMethodName)
