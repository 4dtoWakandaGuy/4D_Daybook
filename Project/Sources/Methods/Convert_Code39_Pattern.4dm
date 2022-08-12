//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_Code39_Pattern
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/08/2009 16:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(BARC_at_Patterns;0)
	C_LONGINT:C283($i; $id)
	C_TEXT:C284($_t_BarCode; $_t_oldMethodName; $0; $1; $pattern)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_Code39_Pattern")

// converts Code39 to Pattern
// A Code39 barcode only contains chars 0-9, A-Z, -. $/+%
//illegal chars are removed

// $1 = Text, $0 = Pattern


$_t_BarCode:=$1
$pattern:=""

Create_Code39_Array

If ($_t_BarCode#"*@")
	$_t_BarCode:="*"+$_t_BarCode
End if 
If ($_t_BarCode#"@*")
	$_t_BarCode:=$_t_BarCode+"*"
End if 
If (Length:C16($_t_BarCode)>32)  // code 39 has a limit of 30 characters
	$_t_BarCode:=Substring:C12($_t_BarCode; 1; 31)+"*"
End if 

For ($i; 1; Length:C16($_t_BarCode))
	$id:=Character code:C91($_t_BarCode[[$i]])
	If ($id<128)
		$pattern:=$pattern+BARC_at_Patterns{$id}
	End if   // nothing for upper ascii chars
End for 
$0:=$pattern
ERR_MethodTrackerReturn("Convert_Code39_Pattern"; $_t_oldMethodName)