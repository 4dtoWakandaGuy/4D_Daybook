//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Checksum_Industrial
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
	C_LONGINT:C283($_l_Check; $_l_Checksum; $_l_DigitValue; $_l_Index; $_l_Multi)
	C_TEXT:C284($_t_Code; $_t_CodeType; $_t_Digit; $_t_oldMethodName; $_t_Result; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Checksum_Industrial")

// calculates the checksum for Industrial Barcodes
// multpli last digit with 3, previous with 1, previous with 3 and so on
// sum mod 10, if 10 be 0


$_t_Code:=""
For ($_l_Index; 1; Length:C16($1))
	$_t_Digit:=$1
	If (($_t_Digit>="0") & ($_t_Digit<="9"))
		$_t_Code:=$_t_Code+$_t_Digit
	End if 
End for 
$_t_CodeType:=$2

Create_Industrial25_Array

If ($_t_CodeType="Interleaved@")
	If ((Length:C16($_t_Code)%2)#0)
		$_t_Code:="0"+$_t_Code
	End if 
End if 

$_l_Check:=0
$_l_Multi:=3
For ($_l_Index; Length:C16($_t_Code); 1; -1)
	$_t_Digit:=$_t_Code[[$_l_Index]]
	$_l_DigitValue:=Num:C11($_t_Digit)
	$_l_Check:=$_l_Check+($_l_DigitValue*$_l_Multi)
	If ($_l_Multi=3)
		$_l_Multi:=1
	Else 
		$_l_Multi:=3
	End if 
End for 

$_l_Checksum:=(10-($_l_Check%10))%10
$_t_Result:=String:C10($_l_Checksum)

$0:=$_t_Result
ERR_MethodTrackerReturn("Calc_Checksum_Industrial"; $_t_oldMethodName)