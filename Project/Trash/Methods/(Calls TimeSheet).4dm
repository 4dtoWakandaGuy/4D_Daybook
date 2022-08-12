//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls TimeSheet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls TimeSheet")
$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Time Sheet")
If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
	If ($_l_OK=1)  //if COntinue=0 the print settings were displayed in Print_SetSize
		PRINT SETTINGS:C106
		$_l_OK:=OK
	Else 
		$_l_OK:=1
	End if 
Else 
	$_l_OK:=0
End if 

If ($_l_OK=1)
	Print form:C5([SERVICE_CALLS:20]; "Time Sheet")
	PAGE BREAK:C6
	PRT_SetPrinterPaperOptions("Time Sheet")
	
End if 
ERR_MethodTrackerReturn("Calls TimeSheet"; $_t_oldMethodName)