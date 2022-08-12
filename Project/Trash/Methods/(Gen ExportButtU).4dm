//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_ExportButtU
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
	C_LONGINT:C283(MOD_l_CurrentModuleAccess)
	C_POINTER:C301($_ptr_table; $1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ExportButtU")
$_ptr_table:=Table:C252(Table:C252($1))
If (Count parameters:C259>=1)
	If ((Not:C34(Locked:C147($_ptr_table->))) & (Not:C34(Read only state:C362($_ptr_table->))))
		If (MOD_l_CurrentModuleAccess=2)
			If ($1-><":")
				$1->:="No"+<>PER_t_CurrentUserInitials
			Else 
				$1->:=Export_Stamp3($1->)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ExportButtU"; $_t_oldMethodName)