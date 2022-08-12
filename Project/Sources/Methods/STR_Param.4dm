//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_Param
	//------------------ Method Notes ------------------
	//Method: STR_Param
	//
	//Written by  John Moore on 10/21/98
	//
	//Purpose: obtain parameter as specified
	//
	// $1 -> text, text to search in
	// $2 -> longint, parameter number
	// $3 -> string 1, optional delimiter
	
	// $0 <- text, value found or empty string
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharPosition; $_l_Index; $_l_Number; $2)
	C_TEXT:C284(<>STR_s_TAB; $_t_Data; $_t_DelimiterChar; $_t_oldMethodName; $_t_Value; $0; $1; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_Param")
//******************************************************************************
//

//
//******************************************************************************


If (Count parameters:C259>=2)
	$_t_Data:=$1
	$_l_Number:=$2
	
	If (Count parameters:C259=3)
		$_t_DelimiterChar:=$3
	Else 
		$_t_DelimiterChar:=<>STR_s_TAB
	End if 
	$_t_Value:=""
	
	$_l_CharPosition:=1  // start at parameter 1
	For ($_l_Index; 1; Length:C16($_t_Data))  // go through all elements
		IDLE:C311
		If (($_l_CharPosition=$_l_Number) & ($_t_Data[[$_l_Index]]#$_t_DelimiterChar))  // already wanted element reached ?
			$_t_Value:=$_t_Value+$_t_Data[[$_l_Index]]  // add character
		End if 
		If ($_t_Data[[$_l_Index]]=$_t_DelimiterChar)  // do we have the delimiter ?
			$_l_CharPosition:=$_l_CharPosition+1  // increase counter value for parameter
			If ($_l_CharPosition>$_l_Number)  // already end reached ?
				$_l_Index:=Length:C16($_t_Data)+1  // then exit loop
			End if 
		End if 
	End for 
End if 
$0:=$_t_Value  // return value
ERR_MethodTrackerReturn("STR_Param"; $_t_oldMethodName)
