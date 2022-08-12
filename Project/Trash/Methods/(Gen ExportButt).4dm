//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_ExportButt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/11/2009 10:26:32If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess)
	C_POINTER:C301($_ptr_table; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_text)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ExportButt")
$_ptr_table:=Table:C252(Table:C252($1))
If ((Not:C34(Locked:C147($_ptr_table->))) & (Not:C34(Read only state:C362($_ptr_table->))))
	If (MOD_l_CurrentModuleAccess=2)
		$_t_text:=$1->
		If ($_t_text<":")
			$1->:="No"
		Else 
			$1->:=Export_Stamp
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ExportButt"; $_t_oldMethodName)