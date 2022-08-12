//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_FindFieldName
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
	//ARRAY TEXT(EW_at_FieldLabels;0)
	//ARRAY TEXT(EW_at_FieldNames;0)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_FindFieldName")
// EW_FindFieldName
// Matches up default field names to data model field names
// 30/10/03 pb
// Parameters: $1 = the field name to match up

If (Find in array:C230(EW_at_FieldNames; $1)>0)
	$0:=EW_at_FieldLabels{Find in array:C230(EW_at_FieldNames; $1)}+" "+$1
Else   // shouldn't happen ...
	$0:=$1
End if 
ERR_MethodTrackerReturn("EW_FindFieldName"; $_t_oldMethodName)