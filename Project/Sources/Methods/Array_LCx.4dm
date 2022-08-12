//%attributes = {}
If (False:C215)
	//Project Method Name:      Array_LCx
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
	C_LONGINT:C283($_l_ArraySetSize; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Array_LCx"; $1)

$_l_ArraySetSize:=$1



ARRAY TEXT:C222(GEN_at_RecordCode; $_l_ArraySetSize)
ARRAY TEXT:C222(GEN_at_Name; $_l_ArraySetSize)
ARRAY TEXT:C222(GEN_at_Identity; $_l_ArraySetSize)  //see also Array_CopyFiles
ERR_MethodTrackerReturn("Array_LCx"; $_t_oldMethodName)
