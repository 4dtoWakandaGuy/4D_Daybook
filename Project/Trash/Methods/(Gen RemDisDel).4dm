//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen RemDisDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:36:33If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284(<>SYS_t_MainorRemote; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen RemDisDel")
If ((DB_GetModuleSettingByNUM(21))>0)
	If (<>SYS_t_MainorRemote="R")
		If ((DB_t_CurrentFormUsage#"Select") & (DB_t_CurrentFormUsage#"Print"))
			$1->:=Substring:C12($1->; 1; 2)+"D"+Substring:C12($1->; 4; 99)
			//$1»≤3≥:="D"
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Gen RemDisDel"; $_t_oldMethodName)