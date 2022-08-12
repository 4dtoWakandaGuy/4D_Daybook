//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MultiSortArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/01/2010 20:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Index; $_l_Type)
	C_POINTER:C301($_ptr_Array; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MultiSortArray")

If (Count parameters:C259>=2)
	For ($_l_Index; 1; Size of array:C274($1->))
		$_ptr_Array:=$1->{$_l_Index}
		$_l_Type:=Type:C295($_ptr_Array->)
		Case of 
			: ($_l_Type=LongInt array:K8:19) | ($_l_Type=String array:K8:15) | ($_l_Type=Text array:K8:16) | ($_l_Type=Boolean array:K8:21) | ($_l_Type=Date array:K8:20) | ($_l_Type=Integer array:K8:18) | ($_l_Type=Real array:K8:17)
				$_bo_OK:=True:C214
			Else 
				$_bo_OK:=False:C215
				$_l_Index:=Size of array:C274($1->)
		End case 
	End for 
	If ($_bo_OK)
		MULTI SORT ARRAY:C718($1->; $2->)
		
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_MultiSortArray"; $_t_oldMethodName)