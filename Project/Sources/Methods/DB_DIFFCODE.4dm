//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DIFFCODE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_Hash; $_l_HashCount; $_l_Index; $_l_Type)
	C_POINTER:C301($_ptr_Array; $_ptr_DiffCode; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DIFFCODE")
// ----------------------------------------------------
// User name (OS): ddancy
// Date and time: 18/02/08, 11:57:51
// ----------------------------------------------------
// Method: _DIFF_DiffCode
// Description
//
//
// Parameters
// ----------------------------------------------------

$_ptr_Array:=$1
$_ptr_DiffCode:=$2

$_l_Type:=Type:C295($_ptr_Array->)


$_bo_Continue:=True:C214

Case of 
	: (DB_GetPointerType($_ptr_Array))
		$_l_HashCount:=Size of array:C274($_ptr_Array->)
		
	: ($_l_Type=Is text:K8:3)
		
		$_l_HashCount:=Length:C16($_ptr_Array->)
		
	Else 
		ALERT:C41("Type "+String:C10($_l_Type)+" not supported for diff.")
		$_bo_Continue:=False:C215
		
End case 

If ($_bo_Continue)
	
	DB_DIffArrayResize($_ptr_DiffCode; $_l_HashCount-1)  //make this a 0-indexed array
	
	Case of 
		: ($_l_Type=Is text:K8:3)
			
			For ($_l_Hash; 0; $_l_HashCount-1)
				$_ptr_DiffCode->{$_l_Hash}:=DB_DIFFHashText($_ptr_Array->[[$_l_Hash+1]])
			End for 
			
		: ($_l_Type=Text array:K8:16)
			
			For ($_l_Hash; 0; $_l_HashCount-1)
				$_ptr_DiffCode->{$_l_Hash}:=DB_DIFFHashText($_ptr_Array->{$_l_Hash+1})
			End for 
			
		: (($_l_Type=Integer array:K8:18) | ($_l_Type=LongInt array:K8:19))
			
			For ($_l_Hash; 0; $_l_HashCount-1)
				$_ptr_DiffCode->{$_l_Hash}:=$_ptr_Array->{$_l_Hash+1}
			End for 
			
		Else 
			
			ALERT:C41("Type "+String:C10($_l_Type)+" not supported for diff.")
			
	End case 
	
End if 
ERR_MethodTrackerReturn("DB_DIFFCODE"; $_t_oldMethodName)