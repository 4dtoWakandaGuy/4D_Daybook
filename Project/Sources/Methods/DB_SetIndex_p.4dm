//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetIndex_p
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
	C_LONGINT:C283($_l_FIeldNumber; $_l_IndexProcess; $_l_TableNumber)
	C_POINTER:C301($_ptr_Field; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetIndex_p")
//$1 field pointer

If (Count parameters:C259>0)
	If (Not:C34(Is nil pointer:C315($1)))
		$_ptr_Field:=$1
		$_l_TableNumber:=Table:C252($_ptr_Field)
		$_l_FIeldNumber:=Field:C253($_ptr_Field)
		If ((Not:C34(Is nil pointer:C315($_ptr_Field))) & ($_l_TableNumber>0) & ($_l_FIeldNumber>0))
			$_t_ProcName:="Db-Set-Index_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FIeldNumber)
			If (False:C215)  //bsw 19/12/03 stack->32*1024
				$_l_IndexProcess:=New process:C317("AA_IndexoneField"; 64*1024; $_t_ProcName; $_l_TableNumber; $_l_FIeldNumber; *)
			End if 
			$_l_IndexProcess:=New process:C317("AA_IndexoneField"; 32*1024; $_t_ProcName; $_l_TableNumber; $_l_FIeldNumber; *)  //bsw 19/12/03 stack->32*1024
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetIndex_p"; $_t_oldMethodName)