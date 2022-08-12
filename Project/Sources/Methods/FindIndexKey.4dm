//%attributes = {}
If (False:C215)
	//Project Method Name:      FindIndexKey
	//------------------ Method Notes ------------------
	// FindIndexKey
	// Use this method instead of the Find Index Key function
	// It checks to make sure that the field is  indexed first,
	// and indexes it if necessary
	// otherwise it will generate an error if the field isn't indexed
	// parameters: $1 = pointer to the field
	//                    $2 = pointer to the query value - must not be a local variab
	// 18/09/03 PB
	//Modified by BSW 16/04/04
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_DoQuery; $_bo_FieldIndexed)
	C_LONGINT:C283($_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_IndexProcess; $_l_tableNumber; $0)
	C_POINTER:C301($_ptr_Query; $_Ptr_Table; $1; $2)
	C_TEXT:C284($_t_IndexingSemaphore; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FindIndexKey")

GET FIELD PROPERTIES:C258($1; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
$_Ptr_Table:=Table:C252(Table:C252($1))
$_t_IndexingSemaphore:="◊Index"+String:C10(Table:C252($1); "000")+String:C10(Field:C253($1); "000")
$_bo_DoQuery:=False:C215
$_ptr_Query:=$2
$0:=0

Case of 
	: ($_bo_FieldIndexed)  // it is indexed so OK to proceed
		$0:=Find in field:C653($1->; $_ptr_Query->)
	: (Test semaphore:C652($_t_IndexingSemaphore))  // the index is currently being built
		$_bo_DoQuery:=True:C214
	Else   // it needs to be indexed
		$_l_tableNumber:=Table:C252($1)
		$_l_FieldNumber:=Field:C253($1)
		$_l_IndexProcess:=New process:C317("BuildIndexAsynch"; DB_ProcessMemoryinit(1); "Rebuilding Index"; $_l_tableNumber; $_l_FieldNumber; $_t_IndexingSemaphore)
		$_bo_DoQuery:=True:C214
End case 

If ($_bo_DoQuery)
	SET QUERY LIMIT:C395(1)
	CREATE EMPTY SET:C140($_Ptr_Table->; "$result")
	SET QUERY DESTINATION:C396(Into set:K19:2; "$result")
	QUERY:C277($_Ptr_Table->; $1->=$2->)
	If (Records in set:C195("$result")=1)
		COPY NAMED SELECTION:C331($_Ptr_Table->; "$use")
		USE SET:C118("$result")
		$0:=Record number:C243($_Ptr_Table->)
		USE NAMED SELECTION:C332("$use")
	Else 
		$0:=-1
	End if 
	SET QUERY DESTINATION:C396(0)
	SET QUERY LIMIT:C395(0)
	CLEAR SET:C117("$result")
End if 
ERR_MethodTrackerReturn("FindIndexKey"; $_t_oldMethodName)