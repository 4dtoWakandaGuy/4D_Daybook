//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_appendPointers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/01/2015 22:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY TEXT(DB_at_ContextNames;0)
	//ARRAY TEXT(DB_at_ContextUsage;0)
	C_LONGINT:C283($_l_SizeofArray; $0; $2)
	C_POINTER:C301($1; $4; $5; $6)
	C_TEXT:C284($_t_oldMethodName; $_t_TableContext; $3; DB_t_FormUsage)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DB_appendPointers")
If (Count parameters:C259>=5)
	APPEND TO ARRAY:C911(DB_aptr_ContextPointers; $1)
	APPEND TO ARRAY:C911(DB_al_ContextTableNumber; $2)
	If (Count parameters:C259>=2)
		$_t_TableContext:=$3
	Else 
		$_t_TableContext:=""
	End if 
	If ($3#"USER@")
		APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext)
		APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
	Else 
		APPEND TO ARRAY:C911(DB_at_ContextNames; $_t_TableContext+"_"+String:C10($2))
		APPEND TO ARRAY:C911(DB_at_ContextUsage; DB_t_FormUsage)
	End if 
	
	$_l_SizeofArray:=Size of array:C274(DB_at_ContextNames)
	$0:=$_l_SizeofArray
	$5->:=True:C214
	//$6->:=0
	If (Count parameters:C259>=6)
		$6->:=DB_aptr_ContextPointers{$_l_SizeofArray}
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_appendPointers"; $_t_oldMethodName)