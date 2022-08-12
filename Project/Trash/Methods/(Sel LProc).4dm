//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel LProc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 08:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>NAL)
	C_LONGINT:C283(ch1; ch2; SRCH_l_And; SRCH_l_Not; SRCH_l_or)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel LProc")
//Sel LProc see also Sel_LProc2
SRCH_l_And:=0
SRCH_l_or:=0
SRCH_l_Not:=0
cNAL:=Num:C11(<>NAL)
ch1:=0
ch2:=0
If ((DB_GetModuleSettingByNUM(1))=5)
	DB_MenuAction("Functions"; "Calculations"; 3; "")
	//Calculations …
	//DISABLE MENU ITEM(2050;21)
End if 
ERR_MethodTrackerReturn("Sel LProc"; $_t_oldMethodName)