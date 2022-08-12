//%attributes = {}
If (False:C215)
	//Project Method Name:      BLD_FIXEDLENGTH
	//------------------ Method Notes ------------------
	//This method will build
	//a fixed length value padded out
	//the length of each component is passed in $1
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Parameter; $0; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BLD_FIXEDLENGTH")

If (Count parameters:C259>=2)
	$0:=""
	For ($_l_Index; 2; Count parameters:C259)
		If (Length:C16(${$_l_Index})<=$1)
			$_t_Parameter:=" "*($1-(Length:C16(${$_l_Index})))+${$_l_Index}
		Else 
			$_t_Parameter:=Substring:C12(${$_l_Index}; 1; $1)
		End if 
		$0:=$0+$_t_Parameter
	End for 
End if 
ERR_MethodTrackerReturn("BLD_FIXEDLENGTH"; $_t_oldMethodName)
