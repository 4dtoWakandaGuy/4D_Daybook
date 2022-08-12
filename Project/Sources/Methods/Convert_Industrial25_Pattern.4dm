//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_Industrial25_Pattern
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
	C_LONGINT:C283($digitvalue; $i)
	C_TEXT:C284($_t_BarCode; $_t_oldMethodName; $0; $1; $digit; $pattern)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_Industrial25_Pattern")

// converts Industrial 2 of 5 to Pattern
// Industrial 2 of 5 barcode only contains chars 0-9
//illegal chars are removed

// $1 = Text, $0 = Pattern


$_t_BarCode:=$1
$pattern:="11011010"

Create_Industrial25_Array

For ($i; 1; Length:C16($_t_BarCode))
	$digit:=$_t_BarCode[[$i]]
	If (($digit>="0") & ($digit<="9"))
		$digitvalue:=Num:C11($digit)
		$pattern:=$pattern+BARC_at_Patterns{$digitvalue}
	End if 
End for 
$pattern:=$pattern+"11010110"
$0:=$pattern
ERR_MethodTrackerReturn("Convert_Industrial25_Pattern"; $_t_oldMethodName)