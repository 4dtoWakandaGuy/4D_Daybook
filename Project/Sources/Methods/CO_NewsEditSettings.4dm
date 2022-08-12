//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_NewsEditSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; CO_l_WebTable; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_NewsEditSettings")

//This will let us edit the settings.
//By definition this must be called within a screen which has the current setttings loaded into
If (Count parameters:C259=0)
	ARRAY TEXT:C222(CO_at_SearchOptions; 0)
	ARRAY TEXT:C222(CO_at_SearchConstructs; 0)
	CO_LoadWebsearchPrefs
Else 
	ARRAY TEXT:C222(CO_at_SearchOptions; 0)
	ARRAY TEXT:C222(CO_at_SearchConstructs; 0)
	CO_LoadWebsearchPrefs(True:C214; Table:C252($1))
	
End if 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 5)
If (Count parameters:C259=0)
	CO_l_WebTable:=Table:C252(->[COMPANIES:2])
Else 
	CO_l_WebTable:=Table:C252($1)
End if 
DIALOG:C40([COMPANIES:2]; "CO_NewsSettings")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("CO_NewsEditSettings"; $_t_oldMethodName)