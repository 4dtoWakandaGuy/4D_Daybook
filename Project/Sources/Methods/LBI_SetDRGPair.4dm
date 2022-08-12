//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_SetDRGPair
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
	//ARRAY LONGINT(<>LBI_al_DragProcess;0)
	//ARRAY LONGINT(<>LBI_al_DropProcess;0)
	//ARRAY TEXT(<>LBI_at_DragArea;0)
	//ARRAY TEXT(<>LBI_at_DragPair;0)
	//ARRAY TEXT(<>LBI_at_DropArea;0)
	C_BOOLEAN:C305(<>LBI_bo_DrgArrays; $_bo_ProcessVisible)
	C_LONGINT:C283($_l_DragPosition; $_l_FieldNumber; $_l_InsertPosition; $_l_ProcessState; $_l_ProcessTime; $_l_TableNumber; $_l_UniqueProcessID)
	C_POINTER:C301($2)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_processName; $_t_VariableName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_SetDRGPair")
//NG THis method replaces the function of AL_SetDrgDst,

While (Semaphore:C143("InitingDragArrays"))
	DelayTicks
End while 

If (Not:C34(<>LBI_bo_DrgArrays))
	ARRAY TEXT:C222(<>LBI_at_DropArea; 0)  //The area name we can drop onto
	ARRAY LONGINT:C221(<>LBI_al_DragProcess; 0)  //The process we can drag from
	ARRAY LONGINT:C221(<>LBI_al_DropProcess; 0)  //The area name we can drag from
	ARRAY TEXT:C222(<>LBI_at_DragArea; 0)  //The area name we can drag from
	ARRAY TEXT:C222(<>LBI_at_DragPair; 0)  // The matching pair name
	<>LBI_bo_DrgArrays:=True:C214
End if 
CLEAR SEMAPHORE:C144("InitingDragArrays")

$_l_DragPosition:=Find in array:C230(<>LBI_at_DragPair; $3)
RESOLVE POINTER:C394($2; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)


If ($_l_DragPosition<0)
	While (Semaphore:C143("$Inserting"+"◊LBI_at_DropArea"))
		DelayTicks
	End while 
	If ($1=1)  // Setup the drop area
		APPEND TO ARRAY:C911(<>LBI_at_DropArea; $_t_VariableName)
		APPEND TO ARRAY:C911(<>LBI_at_DragPair; $3)
		APPEND TO ARRAY:C911(<>LBI_al_DragProcess; 0)
		APPEND TO ARRAY:C911(<>LBI_al_DropProcess; $_l_UniqueProcessID)
		APPEND TO ARRAY:C911(<>LBI_at_DragArea; "")
	Else 
		APPEND TO ARRAY:C911(<>LBI_at_DropArea; "")
		APPEND TO ARRAY:C911(<>LBI_at_DragPair; $3)
		APPEND TO ARRAY:C911(<>LBI_al_DragProcess; $_l_UniqueProcessID)
		APPEND TO ARRAY:C911(<>LBI_at_DragArea; $_t_VariableName)
	End if 
	CLEAR SEMAPHORE:C144("$Inserting"+"◊LBI_at_DropArea")
Else 
	While (Semaphore:C143("$Inserting"+"◊LBI_at_DropArea"))
		DelayTicks
	End while 
	If ($1=1)  // Setup the drop area
		If (Size of array:C274(<>LBI_at_DropArea)<$_l_DragPosition)
			$_l_InsertPosition:=$_l_DragPosition-Size of array:C274(<>LBI_at_DropArea)
			INSERT IN ARRAY:C227(<>LBI_at_DropArea; Size of array:C274(<>LBI_at_DropArea)+1; $_l_InsertPosition)
		End if 
		<>LBI_at_DropArea{$_l_DragPosition}:=$_t_VariableName
		If (Size of array:C274(<>LBI_al_DropProcess)<$_l_DragPosition)
			$_l_InsertPosition:=$_l_DragPosition-Size of array:C274(<>LBI_al_DropProcess)
			INSERT IN ARRAY:C227(<>LBI_al_DropProcess; Size of array:C274(<>LBI_al_DropProcess)+1; $_l_InsertPosition)
		End if 
		<>LBI_al_DropProcess{$_l_DragPosition}:=$_l_UniqueProcessID
	Else 
		If (Size of array:C274(<>LBI_al_DragProcess)<$_l_DragPosition)
			$_l_InsertPosition:=$_l_DragPosition-Size of array:C274(<>LBI_al_DragProcess)
			INSERT IN ARRAY:C227(<>LBI_al_DragProcess; Size of array:C274(<>LBI_al_DragProcess)+1; $_l_InsertPosition)
		End if 
		<>LBI_al_DragProcess{$_l_DragPosition}:=$_l_UniqueProcessID
		If (Size of array:C274(<>LBI_at_DragArea)<$_l_DragPosition)
			$_l_InsertPosition:=$_l_DragPosition-Size of array:C274(<>LBI_at_DragArea)
			INSERT IN ARRAY:C227(<>LBI_at_DragArea; Size of array:C274(<>LBI_at_DragArea)+1; $_l_InsertPosition)
		End if 
		<>LBI_at_DragArea{$_l_DragPosition}:=$_t_VariableName
	End if 
	CLEAR SEMAPHORE:C144("$Inserting"+"◊LBI_at_DropArea")
	
End if 
ERR_MethodTrackerReturn("LBI_SetDRGPair"; $_t_oldMethodName)