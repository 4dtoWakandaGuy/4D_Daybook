//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Mod_Selection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2010 10:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($DIA_bo_AutoFind)
	C_LONGINT:C283(vD)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $DIA_t_DiaryCodeFind)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Mod_Selection")

If (Count parameters:C259>=2)
	$DIA_bo_AutoFind:=($2="TRUE")
	$DIA_t_DiaryCodeFind:=$1
End if 
//znot call-called from old ag diary screen
Gen_Mod("View Diary"; "Diary_File"; "DMaster"; ->[DIARY:12]; ->vD; "SD_DiarySel"; "Diary Items"; $DIA_bo_AutoFind; $DIA_t_DiaryCodeFind)
Comp_Unload
ERR_MethodTrackerReturn("Diary_Mod_Selection"; $_t_oldMethodName)