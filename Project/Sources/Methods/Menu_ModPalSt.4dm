//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_ModPalSt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("Menu_ModPalSt")
If ((<>MENU_l_BarModule=1) | (<>MENU_l_BarModule=30) | (<>Bar=47) | (<>Bar=89) | (<>Bar=90))  //If using Silver or Silver Plus
	$0:=9
Else 
	$0:=17  //25
End if 
ERR_MethodTrackerReturn("Menu_ModPalSt"; $_t_oldMethodName)