//%attributes = {}
If (False:C215)
	//Project Method Name:      PREF_GetPrefVariables
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2012 08:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_VariableType; 0)
	ARRAY TEXT:C222($_at_VariableNames; 0)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName; $1; DM_T_AdminName; DM_T_UserAddress1; DM_T_UserAddress2; DM_T_UserCountry; DM_T_UserCounty; DM_T_UserFAX; DM_T_UserName; DM_t_UserOfficeCode; DM_T_UserPostCode)
	C_TEXT:C284(DM_t_UserScreenTitle; DM_T_UserTelephone; DM_T_Uservat; DM_T_UservatPrefix)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PREF_GetPrefVariables")
ARRAY TEXT:C222($_at_VariableNames; 0)  //note that the variables must be declared
ARRAY LONGINT:C221($_al_VariableType; 0)
Case of 
	: ($1="Configuration Owner")
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_AdminName")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserName")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserAddress1")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserAddress2")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserTown")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserCounty")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserPostCode")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserCountry")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserTelephone")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UserFAX")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_UservatPrefix")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_T_Uservat")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_t_UserScreenTitle")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		APPEND TO ARRAY:C911($_at_VariableNames; "DM_t_UserOfficeCode")
		APPEND TO ARRAY:C911($_al_VariableType; Is text:K8:3)
		
End case 
COPY ARRAY:C226($_at_VariableNames; $2->)
COPY ARRAY:C226($_al_VariableType; $3->)
ERR_MethodTrackerReturn("PREF_GetPrefVariables"; $_t_oldMethodName)
