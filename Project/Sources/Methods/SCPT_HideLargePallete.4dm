//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_HideLargePallete
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 16:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_HideLargePallete")
//This method will hide the script pallet-and release it
If (Count parameters:C259>=1)
	If ($1>0)
		HIDE PROCESS:C324($1)
	End if 
Else 
	If (<>SCPT_l_PaletteWIndow>0)
		HIDE PROCESS:C324(<>SCPT_l_PaletteWIndow)
	End if 
End if 
ERR_MethodTrackerReturn("SCPT_HideLargePallete"; $_t_oldMethodName)
