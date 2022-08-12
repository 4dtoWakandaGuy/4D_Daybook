//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_TableTriggerEnabled
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TriggerTable;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState; $_bo_TriggerEnabled; $0)
	C_LONGINT:C283($_l_event; $_l_FieldCount; $_l_RecordNumber; $_l_TableNumber; $_l_TriggerEvent)
	C_POINTER:C301($_ptr_Array2Populate; $1)
	C_TEXT:C284($_t_oldMethodName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_TableTriggerEnabled")
DB_t_Methodname:=Current method name:C684
$_l_TableNumber:=0

$_bo_TriggerEnabled:=False:C215
$_l_event:=Trigger event:C369

If (Not:C34(Undefined:C82(<>DB_al_TriggerTable)))
	If (Count parameters:C259>0)
		If (GenValidatePointer($1))
			$_ptr_Array2Populate:=$1
			If (Not:C34(Is nil pointer:C315($_ptr_Array2Populate)))
				$_l_TableNumber:=Table:C252($_ptr_Array2Populate)
				If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
					$_bo_TriggerEnabled:=<>DB_al_TriggerTable{$_l_TableNumber}=0
					$_bo_ReadOnlyState:=Read only state:C362($_ptr_Array2Populate->)
				End if 
			End if 
		Else 
			$_bo_TriggerEnabled:=False:C215
		End if 
	Else 
		TRIGGER PROPERTIES:C399(Trigger level:C398; $_l_TriggerEvent; $_l_TableNumber; $_l_RecordNumber)
		If ($_l_TableNumber>0)
			If (Size of array:C274(<>DB_al_TriggerTable)>=$_l_TableNumber)
				$_bo_TriggerEnabled:=(<>DB_al_TriggerTable{$_l_TableNumber}=0)
			Else 
				$_bo_TriggerEnabled:=True:C214
			End if 
			
			$_bo_ReadOnlyState:=Read only state:C362(Table:C252($_l_TableNumber)->)
			
		End if 
	End if 
Else 
	$_bo_TriggerEnabled:=True:C214
	
End if 
If ($_l_event=On Saving New Record Event:K3:1)
	//The table CAN be in read only state when saving a new record!!!!!!!!!
	$0:=$_bo_TriggerEnabled
Else 
	
	$0:=$_bo_TriggerEnabled & (Not:C34($_bo_ReadOnlyState))  // NG april 2004
End if 
ERR_MethodTrackerReturn("DB_TableTriggerEnabled"; $_t_oldMethodName)