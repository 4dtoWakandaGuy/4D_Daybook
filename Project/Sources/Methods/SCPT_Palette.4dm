//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_Palette
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2012 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; $1; $2; DB_l_CURRENTDISPLAYEDFORM; SCPT_l_ParentProcess)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_Palette")

If (Count parameters:C259>=2)
	DB_l_CURRENTDISPLAYEDFORM:=$2
	SCPT_l_ParentProcess:=$1
End if 
Open window:C153(40; 80; (40+309+20); (80+536+20); -1986; "Scripts Manager"; "SCRPT_CloseBox")
DIALOG:C40("SCRIPT_FORM")
CLOSE WINDOW:C154
<>SCPT_l_PaletteWIndow:=0
ERR_MethodTrackerReturn("SCPT_Palette"; $_t_oldMethodName)
