//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_MiniMacros
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2012 11:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; DB_l_CURRENTDISPLAYEDFORM; SCPT_l_ParentProcess; SCPT_l_ThisWindowPalette)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_MiniMacros")


If (Count parameters:C259>=2)
	SCPT_l_ParentProcess:=$1
End if 
Open window:C153(40; 80; (40+125); (80+50); -1986; "Control "+$2; "SCRPT_EndBox")
DIALOG:C40([COMPANIES:2]; "dRecord")
CLOSE WINDOW:C154
If (SCPT_l_ParentProcess>0)
	SET PROCESS VARIABLE:C370(SCPT_l_ParentProcess; SCPT_l_ThisWindowPalette; 0)
End if 
ERR_MethodTrackerReturn("SCPT_MiniMacros"; $_t_oldMethodName)
