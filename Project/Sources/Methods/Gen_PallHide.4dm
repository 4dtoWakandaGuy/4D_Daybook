//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PallHide
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2012 14:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>BUTTPROC; <>ButtProcV; <>ProcProc; <>SCPT_l_PaletteWIndow; $_l_BarProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PallHide")
If (<>ButtProc>0)
	HIDE PROCESS:C324(<>ButtProc)
End if 
If (<>ButtProcV>0)
	HIDE PROCESS:C324(<>ButtProcV)
End if 
$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
If ($_l_BarProcess>0)
	HIDE PROCESS:C324($_l_BarProcess)
End if 
If (<>SCPT_l_PaletteWIndow>0)
	HIDE PROCESS:C324(<>SCPT_l_PaletteWIndow)
End if 
If (<>ProcProc>0)
	HIDE PROCESS:C324(<>ProcProc)
End if 
ERR_MethodTrackerReturn("Gen_PallHide"; $_t_oldMethodName)
