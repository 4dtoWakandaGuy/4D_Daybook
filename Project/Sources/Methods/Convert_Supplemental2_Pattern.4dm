//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_Supplemental2_Pattern
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
	C_LONGINT:C283($i; $id; $remainder)
	C_TEXT:C284($_t_BarCode; $_t_oldMethodName; $0; $1; $digit; $digitONE; $pattern)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_Supplemental2_Pattern")

// converts Supplemental Code with 2 digits to Pattern
// EAN13 barcode only contains chars 0-9
//illegal chars are removed
// length must be 2

// $1 = Text, $0 = Pattern

$_t_BarCode:=""
For ($i; 1; Length:C16($1))
	$digit:=$1[[$i]]
	If (($digit>="0") & ($digit<="9"))
		$_t_BarCode:=$_t_BarCode+$digit
	End if 
End for 

If (Length:C16($_t_BarCode)#2)
	$_t_BarCode:=""  // error
	$pattern:=""
Else 
	$pattern:="1011"
	Create_EAN13_Array
	
	$remainder:=Num:C11($_t_BarCode)%4
	Case of 
		: ($remainder=0)
			$digitONE:="11"
		: ($remainder=1)
			$digitONE:="10"
		: ($remainder=2)
			$digitONE:="01"
		: ($remainder=3)
			$digitONE:="00"
	End case 
	
	For ($i; 1; 2)
		$id:=Num:C11($_t_BarCode[[$i]])
		If ($digitONE[[$i]]="1")
			$pattern:=$pattern+BARC_at_Patterns{$id+10}
		Else 
			$pattern:=$pattern+BARC_at_Patterns{$id+20}
		End if 
		If ($i=1)
			$pattern:=$pattern+"01"
		End if 
	End for 
	
End if 
$0:=$pattern
ERR_MethodTrackerReturn("Convert_Supplemental2_Pattern"; $_t_oldMethodName)