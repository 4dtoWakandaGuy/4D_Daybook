//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetRecordID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_idFIeldNumber; $0; $1; $2)
	C_POINTER:C301($_ptr_Field; $_ptr_ReturnFIeld; $_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetRecordID")

//This method will return the record ID if there is an ID field for the RECORD CODE passed in $3
If (Count parameters:C259>=3)
	$_ptr_Table:=Table:C252($1)
	$_ptr_Field:=Field:C253($1; $2)
	If ($_ptr_Field->#$3)
		QUERY:C277($_ptr_Table->; $_ptr_Field->=$3)
	End if 
	$_l_idFIeldNumber:=AA_GetIDFieldNum($1)
	If ($_l_idFIeldNumber>0)
		$_ptr_ReturnFIeld:=Field:C253($1; $_l_idFIeldNumber)
		$0:=$_ptr_ReturnFIeld->
	Else 
		$0:=0
	End if 
	
Else 
	$0:=0
	
End if 
ERR_MethodTrackerReturn("SD2_GetRecordID"; $_t_oldMethodName)
