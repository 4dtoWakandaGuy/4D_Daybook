//%attributes = {}
If (False:C215)
	//Project Method Name:      GenExportSubrecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 13:22:15If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ServiceCallsTable; $2; $3)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $1; $4; $5; $6)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("")

If (Count parameters:C259>=6)
	//this not very generic method
	//(it cannot be generic by the nature of subrecord table structures)
	//exports to a document the subrecords in text format
	//beginning of the subrecord export to relate the record
	//back to the header record
	$_l_ServiceCallsTable:=Table:C252(->[SERVICE_CALLS:20])
	$_ti_DocumentRef:=Append document:C265($1)
	$_ptr_Field:=Field:C253($2; $3)
	
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
End if 
ERR_MethodTrackerReturn("GenExportSubrecords"; $_t_oldMethodName)