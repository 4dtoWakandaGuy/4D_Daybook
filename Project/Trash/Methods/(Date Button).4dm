//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Date Button
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($2)
	C_POINTER:C301($_ptr_table; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date Button")
$_ptr_table:=Table:C252(Table:C252($1))
If ((Not:C34(Locked:C147($_ptr_table->))) & (Not:C34(Read only state:C362($_ptr_table->))))
	If ($1->=!00-00-00!)
		$1->:=<>DB_d_CurrentDate
	Else 
		$1->:=$1->+$2
	End if 
End if 
ERR_MethodTrackerReturn("Date Button"; $_t_oldMethodName)