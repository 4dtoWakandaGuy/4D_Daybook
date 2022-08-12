//%attributes = {}
If (False:C215)
	//Project Method Name: 
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 07:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyNum; 0)
	ARRAY TEXT:C222($_at_PropertyName; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	C_LONGINT:C283($_l_Offset; $_l_PropertyNamePosition)
	C_POINTER:C301($_ptr_PropertyNum; $_ptr_PropertySTR; $2; $3)
	C_TEXT:C284($_t_NUL; $_t_oldMethodName; $_t_PropertyName; $1)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_GetListItemProperty")
//This method loads the properties from the CURRENT list itemrecord
//It then finds the property name passed in $1
//sets the $2(pointer) to the number and $3(pointer to the string

//C_LONGINT($0)\`4/11/2009

If (Count parameters:C259>=2)
	$_t_PropertyName:=$1
	$_ptr_PropertyNum:=$2
	$_t_NUL:=""
	If (Count parameters:C259>=3)
		$_ptr_PropertySTR:=$3
	Else 
		$_ptr_PropertySTR:=->$_t_NUL
	End if 
	ARRAY TEXT:C222($_at_PropertyName; 0)
	
	ARRAY LONGINT:C221($_al_PropertyNum; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	$_l_Offset:=0
	BLOB TO VARIABLE:C533([LIST_ITEMS:95]X_Revised_Attributes:9; $_at_PropertyName; $_l_Offset)
	BLOB TO VARIABLE:C533([LIST_ITEMS:95]X_Revised_Attributes:9; $_al_PropertyNum; $_l_Offset)
	BLOB TO VARIABLE:C533([LIST_ITEMS:95]X_Revised_Attributes:9; $_at_PropertyValue; $_l_Offset)
	$_l_PropertyNamePosition:=Find in array:C230($_at_PropertyName; $_t_PropertyName)
	
	If ($_l_PropertyNamePosition>0)
		
		$_ptr_PropertyNum->:=$_al_PropertyNum{$_l_PropertyNamePosition}
		If (Count parameters:C259>=3)
			$_ptr_PropertySTR->:=$_at_PropertyValue{$_l_PropertyNamePosition}
		End if 
		
	Else 
	End if 
End if 
ERR_MethodTrackerReturn("AA_GetListItemProperty"; $_t_oldMethodName)