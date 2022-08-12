//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_OutputUpdateColumns
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    17/03/2011 22:07 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY TEXT(DB_at_ContextNames;0)
	C_BOOLEAN:C305($_bo_LoadSetup; $_bo_UseContext; DB_bo_RootTabDefined; DB_bo_ShowArrayBased)
	C_LONGINT:C283($_l_ContextRow; $_l_TableNumber; DB_l_RootTabTable)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_REAL:C285($1)
	C_TEXT:C284($_t_Context; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_OutputUpdateColumns")
If (Count parameters:C259>=2)
	$_t_Context:=$2
	$_l_TableNumber:=$1
	If ($_t_Context#"")
		$_bo_UseContext:=True:C214
		If (DB_bo_RootTabDefined)
			$_bo_UseContext:=False:C215
			If (DB_l_RootTabTable=$_l_TableNumber)
				$_bo_UseContext:=True:C214
			End if 
		End if 
		If ($_bo_UseContext)
			//TRACE
			$_l_ContextRow:=Find in array:C230(DB_at_ContextNames; $_t_Context+"_"+String:C10($_l_TableNumber))
			If ($_l_ContextRow<0)
				$_l_ContextRow:=Find in array:C230(DB_at_ContextNames; $_t_Context)
			End if 
			
		Else 
			$_l_ContextRow:=Find in array:C230(DB_al_ContextTableNumber; $_l_TableNumber)
		End if 
	Else 
		$_l_ContextRow:=Find in array:C230(DB_al_ContextTableNumber; $_l_TableNumber)
	End if 
	
	//TRACE
	//$ref Should always be greater than 0
	If ($_l_ContextRow>0)
		
		$_bo_LoadSetup:=True:C214
		$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_ContextRow}
		
		LBi_InclFields($_ptr_ListBoxSetup; True:C214; True:C214)
	End if 
	If (DB_bo_ShowArrayBased)
		OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; True:C214)
		
	Else 
		OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
		If ($_bo_LoadSetup)
			LBi_LoadSetup($_ptr_ListBoxSetup)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_OutputUpdateColumns"; $_t_oldMethodName)