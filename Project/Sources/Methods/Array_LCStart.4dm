//%attributes = {}
If (False:C215)
	//Project Method Name:      Array_LCStart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Array_LCStart")
GEN_at_Identity:=1
GEN_at_Name:=1
GEN_at_RecordCode:=1
If (Count parameters:C259>=1)
	For ($_l_Index; 1; Count parameters:C259)
		${$_l_Index}->:=1
	End for 
End if 
ERR_MethodTrackerReturn("Array_LCStart"; $_t_oldMethodName)
