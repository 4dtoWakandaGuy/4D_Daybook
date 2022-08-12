//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      STR_CountFields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Count; $_l_DelmiterPosition; $0)
	C_TEXT:C284($_t_Delimiter; $_t_InputString; $_t_MethodName; $_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_CountFields")

If (False:C215)
	//*****************************************************************************
	////
	////  STR_CountFields($_t_InputString;$_t_Delimiter)
	////
	////  Written by root - 12/30/2006, 07:19
	////
	////  Purpose:
	////
	////  $1 - TEXT - Contains the String to be tested
	////  $2 - TEXT - Contains the Delimiter to test with
	////
	//*****************************************************************************
End if 
$_t_MethodName:="CVT_CountFields"
//=====================    Declare Variables    ==================================
//method_parameters_declarations
//--------------------------------------------------------------------------------
//method_wide_constants_declarations
//--------------------------------------------------------------------------------
//local_variable_declarations

//======================    Initialize & Setup    ================================
$_t_InputString:=$1
$_t_Delimiter:=$2
$_l_Count:=0

//========================    Method Actions    ==================================
If (Length:C16($_t_InputString)>0)  // This is a fix for Excel files, since it leaves off the last carriage return.
	$_l_DelmiterPosition:=Position:C15($_t_Delimiter; $_t_InputString)  // Count the record delimiters in the chunk.
	While ($_l_DelmiterPosition#0)
		If (Length:C16($_t_InputString)>0)
			$_t_InputString:=Substring:C12($_t_InputString; $_l_DelmiterPosition+1)
			$_l_Count:=$_l_Count+1
			$_l_DelmiterPosition:=Position:C15($_t_Delimiter; $_t_InputString)
		End if 
	End while 
	
	If (Length:C16($_t_InputString)>0)
		$_l_Count:=$_l_Count+1
	End if 
End if 

//========================    Clean up & Exit    =================================
$0:=$_l_Count
//EOM
ERR_MethodTrackerReturn("STR_CountFields"; $_t_oldMethodName)
