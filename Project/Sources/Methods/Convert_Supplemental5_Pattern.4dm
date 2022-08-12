//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_Supplemental5_Pattern
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
	ARRAY TEXT:C222($_at_BarcodePattern3; 0)
	//ARRAY TEXT(BARC_at_Patterns;0)
	C_LONGINT:C283($_l_Check; $_l_ID; $_l_index; $_l_Result)
	C_TEXT:C284($_t_BarCode; $_t_Char; $_t_HelpPattern; $_t_oldMethodName; $_t_Pattern; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_Supplemental5_Pattern")

// converts Supplemental Code with 5 digits to Pattern
// EAN13 barcode only contains chars 0-9
//illegal chars are removed
// length must be 5

// $1 = Text, $0 = Pattern

$_t_BarCode:=""
For ($_l_index; 1; Length:C16($1))
	$_t_Char:=$1[[$_l_index]]
	If (($_t_Char>="0") & ($_t_Char<="9"))
		$_t_BarCode:=$_t_BarCode+$_t_Char
	End if 
End for 

If (Length:C16($_t_BarCode)#5)
	$_t_BarCode:=""  // error
	$_t_Pattern:=""
Else 
	$_t_Pattern:="1011"
	Create_EAN13_Array
	ARRAY TEXT:C222($_at_BarcodePattern3; 10)
	$_at_BarcodePattern3{0}:="00111"
	$_at_BarcodePattern3{1}:="01011"
	$_at_BarcodePattern3{2}:="01101"
	$_at_BarcodePattern3{3}:="01110"
	$_at_BarcodePattern3{4}:="10011"
	$_at_BarcodePattern3{5}:="11001"
	$_at_BarcodePattern3{6}:="11100"
	$_at_BarcodePattern3{7}:="10101"
	$_at_BarcodePattern3{8}:="10110"
	$_at_BarcodePattern3{9}:="11010"
	
	$_l_Check:=0
	For ($_l_index; 0; 4)
		If (($_l_index & 1)=1)
			$_l_Check:=$_l_Check+(Num:C11($_t_BarCode[[$_l_index+1]])*9)
		Else 
			$_l_Check:=$_l_Check+(Num:C11($_t_BarCode[[$_l_index+1]])*3)
		End if 
	End for 
	$_l_Result:=$_l_Check%10
	
	$_t_HelpPattern:=$_at_BarcodePattern3{$_l_Result}
	For ($_l_index; 1; 5)
		$_l_ID:=Num:C11($_t_BarCode[[$_l_index]])
		If ($_t_HelpPattern[[$_l_index]]="1")
			$_t_Pattern:=$_t_Pattern+BARC_at_Patterns{$_l_ID+10}
		Else 
			$_t_Pattern:=$_t_Pattern+BARC_at_Patterns{$_l_ID+20}
		End if 
		// $_t_Pattern:=$_t_Pattern+"_"
		If ($_l_index#5)
			$_t_Pattern:=$_t_Pattern+"01"
		End if 
		// $_t_Pattern:=$_t_Pattern+"_"
	End for 
	
End if 
$0:=$_t_Pattern
ERR_MethodTrackerReturn("Convert_Supplemental5_Pattern"; $_t_oldMethodName)