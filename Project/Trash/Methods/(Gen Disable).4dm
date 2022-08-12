//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen Disable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 12:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $4; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen Disable")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 


If (Count parameters:C259=3)
	If ((DB_GetModuleSettingByNUM($1))<2)
		DISABLE MENU ITEM:C150($2; $3; <>MenuProc)
	Else 
		ENABLE MENU ITEM:C149($2; $3; <>MenuProc)
	End if 
Else 
	If ((DB_GetModuleSettingByNUM($1))<2)
		DB_MenuAction($4; $5; 3; ""; <>MenuProc; False:C215)
		// DISABLE MENU ITEM($2;$3;◊MenuProc)
	Else 
		DB_MenuAction($4; $5; 2; ""; <>MenuProc; False:C215)
		//    ENABLE MENU ITEM($2;$3;◊MenuProc)
	End if 
End if 
ERR_MethodTrackerReturn("Gen Disable"; $_t_oldMethodName)