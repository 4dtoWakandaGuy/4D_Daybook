If (False:C215)
	//object Name: [COMPANIES]CO_NewsSettings.oSaveSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchConstructs2;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	//ARRAY TEXT(CO_at_SearchOptions2;0)
	C_LONGINT:C283(CO_l_WebTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].CO_NewsSettings.oSaveSettings"; Form event code:C388)


CO_LoadWebsearchPrefs(False:C215; CO_l_WebTable)

//So we never add in to the prefs the following
ARRAY TEXT:C222(CO_at_SearchOptions2; 0)
ARRAY TEXT:C222(CO_at_SearchConstructs2; 0)
COPY ARRAY:C226(CO_at_SearchOptions; CO_at_SearchOptions2)
COPY ARRAY:C226(CO_at_SearchConstructs; CO_at_SearchConstructs2)
If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Designer"))
	APPEND TO ARRAY:C911(CO_at_SearchConstructs2; "")
	APPEND TO ARRAY:C911(CO_at_SearchOptions2; "-")
	APPEND TO ARRAY:C911(CO_at_SearchConstructs2; "")
	APPEND TO ARRAY:C911(CO_at_SearchOptions2; "Edit Websearch Settings")
End if 
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [COMPANIES].CO_NewsSettings.oSaveSettings"; $_t_oldMethodName)