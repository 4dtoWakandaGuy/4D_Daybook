//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_Mod2AL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SYS_bo_StatsView)
	C_POINTER:C301($2; $4)
	C_TEXT:C284($_t_oldMethodName; $1; $3; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Mod2AL")
//Gen_Mod2AL
If (SYS_bo_StatsView)
	StatsView_Disp($1; $2; $3)
Else 
	DIALOG:C40($4->; $5)
End if 
ERR_MethodTrackerReturn("Gen_Mod2AL"; $_t_oldMethodName)