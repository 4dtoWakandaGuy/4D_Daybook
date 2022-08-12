//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_LinkMess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/05/2011 16:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordsinSelection)
	C_POINTER:C301($_ptr_SourceTable; $1)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_LinkMess")
$_ptr_SourceTable:=$1

$_l_RecordsinSelection:=Records in selection:C76($_ptr_SourceTable->)
OK:=1
If ($_l_RecordsinSelection>100000)
	If (DB_t_CurrentFormUsage="None")
		OK:=1
	Else 
		Gen_Confirm("There are "+String:C10($_l_RecordsinSelection)+" records to link, which may take some time.  Proceed?"; "Yes"; "No")
	End if 
End if 
ERR_MethodTrackerReturn("Sel_LinkMess"; $_t_oldMethodName)
