//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_FileSG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>BAR; <>MENU_l_BarModule; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_FileSG")
If ((DB_GetModuleSettingByNUM(1)=5) & ((<>MENU_l_BarModule=1) | (<>MENU_l_BarModule=30) | (<>Bar=47)))
	$0:=0
Else 
	$0:=0  //Was 1, but Gold now doesn't have 'Statistics'
End if 
ERR_MethodTrackerReturn("Menu_FileSG"; $_t_oldMethodName)