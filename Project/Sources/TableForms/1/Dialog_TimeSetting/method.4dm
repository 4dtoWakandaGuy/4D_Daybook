If (False:C215)
	//Table Form Method Name: [CONTACTS]Dialog_TimeSetting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_TimeSettingTypes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; SD_l_TIMESCALE; SD_l_TimeSetting; SD_l_TIMETYPE)
	C_TEXT:C284($_t_oldMethodName; SD_t_TimeSettingType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].Dialog_TimeSetting"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "Dialog_TimeSetting")
		ARRAY TEXT:C222(SD_at_TimeSettingTypes; 3)
		
		SD_at_TimeSettingTypes{1}:="Minutes"
		SD_at_TimeSettingTypes{2}:="Hours"
		SD_at_TimeSettingTypes{3}:="Days"
		Case of 
			: (SD_l_Timescale>3600) & (SD_l_TimeType=3)
				SD_t_TimeSettingType:="Days"
			: (SD_l_Timescale>60) & (SD_l_TimeType=3)
				SD_t_TimeSettingType:="Hours"
			Else 
				SD_t_TimeSettingType:="Minutes"
				SD_l_TimeSetting:=SD_l_Timescale
				If (SD_l_TimeType=1)
					ARRAY TEXT:C222(SD_at_TimeSettingTypes; 0)
				End if 
				
		End case 
		WS_AutoscreenSize(3; 99; 300)
		INT_SetDialog
End case 
ERR_MethodTrackerReturn("FM [CONTACTS].Dialog_TimeSetting"; $_t_oldMethodName)
