//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_EAN13_Pattern
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
	C_LONGINT:C283($i; $Id)
	C_TEXT:C284($_t_BarCode; $_t_oldMethodName; $0; $1; $digit; $digitOne; $pattern)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_EAN13_Pattern")

// converts EAN13 to Pattern
// EAN13 barcode only contains chars 0-9
//illegal chars are removed
// length must be 12 + 1 (checksum)

// $1 = Text, $0 = Pattern


$_t_BarCode:=""
For ($i; 1; Length:C16($1))
	$digit:=$1[[$i]]
	If (($digit>="0") & ($digit<="9"))
		$_t_BarCode:=$_t_BarCode+$digit
	End if 
End for 

Case of 
	: (Length:C16($_t_BarCode)=13)
		// fine
	: (Length:C16($_t_BarCode)=12)  // checksum is missing
		$_t_BarCode:=$_t_BarCode+Calc_Checksum_EAN13($_t_BarCode)
		
	Else 
		$_t_BarCode:=""  // error
End case 

If ($_t_BarCode#"")
	$pattern:="202"  // 2 = long line
	Create_EAN13_Array
	
	$digitONE:=BARC_at_Patterns{Num:C11($_t_BarCode[[1]])}
	For ($i; 1; 6)
		$id:=Num:C11($_t_BarCode[[$i+1]])
		If ($digitONE[[$i]]="1")
			$pattern:=$pattern+BARC_at_Patterns{$id+10}
		Else 
			$pattern:=$pattern+BARC_at_Patterns{$id+20}
		End if 
		// $pattern:=$pattern+"_"  ` helps debugging
	End for 
	$pattern:=$pattern+"02020"
	For ($i; 8; 13)
		$id:=Num:C11($_t_BarCode[[$i]])
		$pattern:=$pattern+BARC_at_Patterns{$id+30}
		// $pattern:=$pattern+"_"  ` helps debugging
	End for 
	$pattern:=$pattern+"202"
Else 
	$pattern:=""
End if 
$0:=$pattern
ERR_MethodTrackerReturn("Convert_EAN13_Pattern"; $_t_oldMethodName)