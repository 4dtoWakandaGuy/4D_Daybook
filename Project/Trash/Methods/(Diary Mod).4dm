//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_LONGINT:C283(vD)
	C_TEXT:C284($_t_ContractCodeFind; $_t_oldMethodName; $1; $2; $DIA_t_DiaryCodeFind)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary Mod")
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	$_t_ContractCodeFind:=$1
End if 
Gen_Mod("View Diary"; "Diary_File"; "DMaster"; ->[DIARY:12]; ->vD; "Diary_Sel"; "Diary Items"; $_bo_AutoFind; $_t_ContractCodeFind)

Comp_Unload
ERR_MethodTrackerReturn("Diary Mod"; $_t_oldMethodName)