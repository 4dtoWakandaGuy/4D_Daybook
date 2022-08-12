//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DIffArrayResize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentSize; $_l_NewSIze; $2)
	C_POINTER:C301($_Ptr_Array; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DIffArrayResize")
// ----------------------------------------------------
// User name (OS): ddancy
// Date and time: 31/01/08, 13:30:23
// ----------------------------------------------------
// Method: _ARRAY_Resize
// Description
//
//
// Parameters
// ----------------------------------------------------

$_Ptr_Array:=$1
$_l_NewSIze:=$2

$_l_CurrentSize:=Size of array:C274($_Ptr_Array->)

Case of 
	: ($_l_CurrentSize<$_l_NewSIze)
		
		INSERT IN ARRAY:C227($_Ptr_Array->; $_l_CurrentSize+1; $_l_NewSIze-$_l_CurrentSize)
		
	: ($_l_CurrentSize>$_l_NewSIze)
		
		DELETE FROM ARRAY:C228($_Ptr_Array->; $_l_NewSIze+1; $_l_CurrentSize-$_l_NewSIze)
		
	Else 
		//...
		
End case 
ERR_MethodTrackerReturn("DB_DIffArrayResize"; $_t_oldMethodName)