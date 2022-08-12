//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetPointerType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isArray; $0)
	C_LONGINT:C283($_l_DataType)
	C_POINTER:C301($_ptr_Variable; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetPointerType")

$_bo_isArray:=False:C215

If (Count parameters:C259>0)
	$_ptr_Variable:=$1
	
	If (Not:C34(Is nil pointer:C315($_ptr_Variable)))
		
		$_l_DataType:=Type:C295($_ptr_Variable->)
		
		$_bo_isArray:=True:C214
		
		Case of 
			: ($_l_DataType=Boolean array:K8:21)
			: ($_l_DataType=Integer array:K8:18)
			: ($_l_DataType=LongInt array:K8:19)
			: ($_l_DataType=Real array:K8:17)
			: ($_l_DataType=Date array:K8:20)
				//: ($_l_DataType=Time array)
			: ($_l_DataType=String array:K8:15)
			: ($_l_DataType=Text array:K8:16)
			: ($_l_DataType=Picture array:K8:22)
				//: ($_l_DataType=BLOB array )
			: ($_l_DataType=Pointer array:K8:23)
			: ($_l_DataType=Array 2D:K8:24)
				
			Else 
				$_bo_isArray:=False:C215
				
		End case 
		
	End if 
	
End if 

$0:=$_bo_isArray
ERR_MethodTrackerReturn("DB_GetPointerType"; $_t_oldMethodName)