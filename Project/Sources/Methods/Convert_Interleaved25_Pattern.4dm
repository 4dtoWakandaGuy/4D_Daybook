//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_Interleaved25_Pattern
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
	C_LONGINT:C283($_l_DigitPosition; $_l_DigitValue; $_l_Index; $_l_Position1; $_l_Position2)
	C_TEXT:C284($_t_BarCode; $_t_digit; $_t_DigitPattern; $_t_oldMethodName; $_t_Pattern; $_t_pattern1; $_t_pattern2; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_Interleaved25_Pattern")

// converts Interleaved 2 of 5 to Pattern
// Industrial 2 of 5 barcode only contains chars 0-9
//illegal chars are removed

// $1 = Text, $0 = Pattern


$_t_BarCode:=""
For ($_l_Index; 1; Length:C16($1))
	$_t_digit:=$1[[$_l_Index]]
	If (($_t_digit>="0") & ($_t_digit<="9"))
		$_t_BarCode:=$_t_BarCode+$_t_digit
	End if 
End for 

If ((Length:C16($_t_BarCode)%2)#0)
	$_t_BarCode:="0"+$_t_BarCode
End if 
$_t_Pattern:="1010"

Create_Industrial25_Array  // same pattern for Interleaved

For ($_l_Index; 1; Length:C16($_t_BarCode); 2)
	$_t_digit:=$_t_BarCode[[$_l_Index]]
	$_l_DigitValue:=Num:C11($_t_digit)
	$_t_pattern1:=BARC_at_Patterns{$_l_DigitValue}
	
	$_t_digit:=$_t_BarCode[[$_l_Index+1]]
	$_l_DigitValue:=Num:C11($_t_digit)
	$_t_pattern2:=BARC_at_Patterns{$_l_DigitValue}
	
	$_l_Position1:=1
	$_l_Position2:=1
	$_l_DigitPosition:=1
	$_t_DigitPattern:=""
	// $_t_Pattern:=$_t_Pattern+"_"  ` helps debugging
	
	While ($_l_Position2<12)  //  barcode has 12 lines
		If ($_l_DigitPosition=1)
			While ($_t_pattern1[[$_l_Position1]]="1")
				$_t_DigitPattern:=$_t_DigitPattern+"1"
				$_l_Position1:=$_l_Position1+1
			End while 
			$_l_DigitPosition:=2
			$_l_Position1:=$_l_Position1+1
		Else   //white pos filled with digit 2
			While ($_t_pattern2[[$_l_Position2]]="1")
				$_t_DigitPattern:=$_t_DigitPattern+"0"
				$_l_Position2:=$_l_Position2+1
			End while 
			$_l_DigitPosition:=1
			$_l_Position2:=$_l_Position2+1
		End if 
	End while 
	$_t_Pattern:=$_t_Pattern+$_t_DigitPattern
	// $_t_Pattern:=$_t_Pattern+"_"  ` helps debugging
	
End for 
$_t_Pattern:=$_t_Pattern+"1101"
$0:=$_t_Pattern
ERR_MethodTrackerReturn("Convert_Interleaved25_Pattern"; $_t_oldMethodName)