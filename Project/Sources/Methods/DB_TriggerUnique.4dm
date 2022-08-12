//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_TriggerUnique
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
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldUnique)
	C_LONGINT:C283($_l_event; $_l_FieldIndex; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_TableNumber)
	C_POINTER:C301($_ptr_FieldPointer; $1)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(MunDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_TriggerUnique")
//NG FEB 2004
//This is a 'catch all' method which can go into triggers in the save new and save existing sections
//this will find the unique fields and check them
//NOTE the intention is that individual calls to DB_CheckMyUnique are made
//`as this method would be relatively slow
$_l_event:=Trigger event:C369
//$1 is a pointer to the table
For ($_l_FieldIndex; 1; Get last field number:C255($1))
	$_l_TableNumber:=Table:C252($1)
	$_l_FieldNumber:=Field:C253($1)
	GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique)
	If ($_bo_FieldUnique)
		ERASE WINDOW:C160
		MESSAGE:C88("Table "+Table name:C256($1)+"FIeld "+Field name:C257(Field:C253($_l_TableNumber; $_l_FieldIndex))+" Record "+String:C10(Record number:C243($1->))+" Of "+String:C10(Records in selection:C76($1->)))
		
		$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldIndex)
		Case of 
			: ($_l_event=On Saving New Record Event:K3:1)
				db_CheckMyUnique($_ptr_FieldPointer; 0)
			: ($_l_event=On Saving Existing Record Event:K3:2)
				db_CheckMyUnique($_ptr_FieldPointer; 1)
			Else 
				If (MunDoc#?00:00:00?)
					SEND PACKET:C103(MunDoc; "["+Table name:C256($1)+"]"+Field name:C257(Field:C253($_l_TableNumber; $_l_FieldIndex))+Char:C90(13))
				End if 
				
		End case 
		
	End if 
	
	
End for 
ERR_MethodTrackerReturn("DB_TriggerUnique"; $_t_oldMethodName)