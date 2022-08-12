//%attributes = {}
If (False:C215)
	//Project Method Name:      In_SetManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MenuProc; <>newSetsProcess; $selection; $_l_MonitorCall; $_l_TableNumber; SM_l_CallBack; SM_l_MonitorCall; SM_Recordsinselection; SM_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("In_SetManager")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>=1)
	//$_l_TableNumber
Else 
	//$_l_TableNumber:=Current default table
End if 
If (<>newSetsProcess>0)
	HIDE PROCESS:C324(<>newSetsProcess)
	DB_MenuAction(Get localized string:C991("Menu_Volumes"); Get localized string:C991("MenuItem_DatListsPal"); 4; ""; <>MenuProc; False:C215)
	DB_MenuAction(Get localized string:C991("Menu_Volumes"); DB_GetIndexedString(20000; 41); 4; ""; <>menuProc; False:C215)
End if 
ERR_MethodTrackerReturn("In_SetManager"; $_t_oldMethodName)