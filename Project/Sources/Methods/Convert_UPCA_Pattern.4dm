//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_UPCA_Pattern
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
	C_LONGINT:C283($i)
	C_TEXT:C284($_t_BarCode; $_t_oldMethodName; $0; $1; $digit; $pattern)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_UPCA_Pattern")

// converts UPCA to Pattern
// UPCA barcode only contains chars 0-9
//illegal chars are removed
// length must be 11 + 1 (checksum)
// pattern in similar to EAN-13, leading 0 must be added

// $1 = Text, $0 = Pattern


$_t_BarCode:=""
For ($i; 1; Length:C16($1))
	$digit:=$1[[$i]]
	If (($digit>="0") & ($digit<="9"))
		$_t_BarCode:=$_t_BarCode+$digit
	End if 
End for 

Case of 
	: (Length:C16($_t_BarCode)=12)
		// fine
	: (Length:C16($_t_BarCode)=11)  // checksum is missing
		$_t_BarCode:=$_t_BarCode+Calc_Checksum_UPCA($_t_BarCode)
		
	Else 
		$_t_BarCode:=""  // error
End case 

If ($_t_BarCode#"")
	$pattern:=Convert_EAN13_Pattern("0"+$_t_BarCode)
Else 
	$pattern:=""
End if 
$0:=$pattern
ERR_MethodTrackerReturn("Convert_UPCA_Pattern"; $_t_oldMethodName)