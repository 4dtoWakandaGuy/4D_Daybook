//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Menu DisComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu DisComp")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If ((DB_GetModuleSettingByNUM(14))<2)
	DB_MenuAction("Companies"; "View Information"; 3; ""; <>MenuProc; False:C215)
	//DISABLE MENU ITEM(3;7;◊MenuProc)
End if 
ERR_MethodTrackerReturn("Menu DisComp"; $_t_oldMethodName)