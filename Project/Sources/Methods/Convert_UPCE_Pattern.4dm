//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_UPCE_Pattern
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
	C_LONGINT:C283($_l_Index; $_l_NumberofChar; $_PatternRow)
	C_TEXT:C284($_t_BarCode; $_t_Digit; $_t_Helppattern; $_t_oldMethodName; $_t_pattern; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_UPCE_Pattern")

// converts UPC-E to Pattern
// UPC-E barcode only contains chars 0-9
//illegal chars are removed
// length must be 8

// $1 = Text, $0 = Pattern

$_t_BarCode:=""
For ($_l_Index; 1; Length:C16($1))
	$_t_Digit:=$1[[$_l_Index]]
	If (($_t_Digit>="0") & ($_t_Digit<="9"))
		$_t_BarCode:=$_t_BarCode+$_t_Digit
	End if 
End for 

If ($_t_BarCode#"")
	If (($_t_BarCode[[1]]#"0") & ($_t_BarCode[[1]]#"1"))  // UPCE must start with 0 or 1
		$_t_BarCode:=""
	End if 
End if 

If (Length:C16($_t_BarCode)#8)
	$_t_BarCode:=""  // error
	$_t_pattern:=""
Else 
	$_t_pattern:="202"  // 2 = long line
	Create_UPCE_Array
	
	If ($_t_BarCode[[1]]="0")
		$_PatternRow:=0
	Else 
		$_PatternRow:=10
	End if 
	$_PatternRow:=$_PatternRow+Num:C11($_t_BarCode[[8]])  // first digit gives table, check sum gives position in table
	
	$_t_Helppattern:=BARC_at_Patterns{$_PatternRow}
	
	For ($_l_Index; 2; 7)
		$_l_NumberofChar:=Num:C11($_t_BarCode[[$_l_Index]])
		If ($_t_Helppattern[[$_l_Index-1]]="0")
			$_t_pattern:=$_t_pattern+BARC_at_Patterns{$_l_NumberofChar+30}
		Else 
			$_t_pattern:=$_t_pattern+BARC_at_Patterns{$_l_NumberofChar+20}
		End if 
		// $_t_pattern:=$_t_pattern+"_"  ` helps debugging
	End for 
	
	$_t_pattern:=$_t_pattern+"020202"
End if 
$0:=$_t_pattern
ERR_MethodTrackerReturn("Convert_UPCE_Pattern"; $_t_oldMethodName)