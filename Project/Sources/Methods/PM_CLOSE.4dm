//%attributes = {}
If (False:C215)
	//Project Method Name:      PM_CLOSE
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
	C_LONGINT:C283(<>ProcProc)
	C_REAL:C285(<>_l_ProcPaletteWinSizeState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PM_CLOSE")
If ((Macintosh option down:C545) | (Windows Alt down:C563))
	<>ProcProc:=0
End if 

If (<>_l_ProcPaletteWinSizeState=0)  //minimize proc palette
	<>_l_ProcPaletteWinSizeState:=1
Else 
	<>_l_ProcPaletteWinSizeState:=0
End if 
CANCEL:C270
ERR_MethodTrackerReturn("PM_CLOSE"; $_t_oldMethodName)