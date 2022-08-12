//%attributes = {}
If (False:C215)
	//Project Method Name:      Macros_ModInt
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
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_Name; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_ModInt")
Start_Process
Macros_File
//$f:=Find in array(◊PRC_al_ProcessNum;Current process)
//If ($f>0)
//$_t_Name:=◊PRC_at_ProcessName{$f}
//QUERY([MACROS];[MACROS]Macro Code=Substring($_t_Name;6;3)+" @")

//Rollo 9/3/2004 `no longer 3 separate windows - all in one
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="IMA @"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITX @"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ITO @")
ORDER BY:C49([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1; >)

If (Records in table:C83([SCRIPTS:80])>0)
	CREATE SET:C116([SCRIPTS:80]; "Master")
	CREATE EMPTY SET:C140([SCRIPTS:80]; "Userset")
	vNo:=Records in selection:C76([SCRIPTS:80])
	MESSAGES OFF:C175
	ORDER BY:C49([SCRIPTS:80]Script_Group:9; >; [SCRIPTS:80]Script_Code:1; >)
	MESSAGES ON:C181
	$_t_Name:=[SCRIPTS:80]Script_Name:2
	Open_Pro_Window($_t_Name; 0; 1; ->[SCRIPTS:80]; WIN_t_CurrentOutputform)
	FS_SetFormSort(WIN_t_CurrentOutputform)
	WIn_SetFormSize(1; ->[SCRIPTS:80]; WIN_t_CurrentOutputform)
	MODIFY SELECTION:C204([SCRIPTS:80]; *)
	Close_ProWin
End if 
//End if
Process_End
ERR_MethodTrackerReturn("Macros_ModInt"; $_t_oldMethodName)
