//%attributes = {}
If (False:C215)
	//Project Method Name:      CAL4D_STR_Parse
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 13:46`Method: CAL4D_STR_Parse
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Success)
	C_LONGINT:C283($_l_CharstoFind; $_l_Index; $_l_Length; $_l_Params; $_l_Position; $_l_Start; $2)
	C_POINTER:C301($_ptr_Truncate; $4)
	C_TEXT:C284($_t_inputString; $_t_MethodName; $_t_oldMethodName; $_t_Result; $_t_Search; $0; $1; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAL4D_STR_Parse")
$_t_MethodName:=Current method name:C684

$_t_inputString:=$1
$_l_CharstoFind:=$2  //the number of the character to find
$_t_Result:=""


If ($_l_CharstoFind>0)  //if the number wanted is > 0 find instance
	$_l_Params:=Count parameters:C259
	If ($_l_Params=2)  //if this is looking just for tabs
		$_t_Search:="\t"
	Else   //assign passed string
		$_t_Search:=$3
		If ($_l_Params=4)
			$_ptr_Truncate:=$4  //pointer to value to truncate
		End if 
	End if 
	
	$_l_Start:=1
	$_l_Position:=1
	
	//========================    Method Actions    ==================================
	If ($_t_inputString#"")
		For ($_l_Index; 1; $_l_CharstoFind)
			$_bo_Success:=Match regex:C1019($_t_Search; $_t_inputString; $_l_Start; $_l_Position; $_l_Length)
			Case of 
				: ($_bo_Success) & ($_l_Index=$_l_CharstoFind)
					If ($_l_Params<4)
						$_t_Result:=Substring:C12($_t_inputString; $_l_Start; $_l_Position-$_l_Start)
					Else 
						$_ptr_Truncate->:=Substring:C12($_t_inputString; 1; $_l_Start)  //replace the incomming string with the truncated version (found removed)
					End if 
					
				: ($_l_Index=$_l_CharstoFind)
					If ($_l_Params<4)
						$_t_Result:=Substring:C12($_t_inputString; $_l_Start)
					Else 
						$_ptr_Truncate->:=Substring:C12($_t_inputString; 1; $_l_Start)  //replace the incomming string with the truncated version (found removed)
					End if 
					
				Else 
					$_l_Start:=$_l_Position+$_l_Length
					
			End case 
		End for 
	Else 
		$_t_Result:=$_t_inputString
	End if 
	
End if 
$0:=$_t_Result
ERR_MethodTrackerReturn("CAL4D_STR_Parse"; $_t_oldMethodName)