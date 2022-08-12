//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Checksum_Code128
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
	//ARRAY INTEGER(BARC_al_Checksums2;0)
	//ARRAY LONGINT(BARC_al_Checksums;0)
	C_LONGINT:C283($_l_CHarPosition; $_l_Check; $_l_CheckSum; $_l_Index)
	C_TEXT:C284($_t_Code; $_t_CodeType; $_t_oldMethodName; $_t_Result; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Checksum_Code128")

// Creates Checksum for Code 128
// the checksum is mandatory !!!
// Type = 128A, B or C
// the first char must be the Codetype, it is part of the checksum
// add all chars, use the double value for the 2nd char, trippe for 3rd and so on
// use mod 103 for the checksum


$_t_Code:=$1
$_t_CodeType:=$2
Create_Code128_Array

$_l_Check:=0
Case of 
	: ($_t_CodeType="Code128A")
		$_l_Check:=103
		
	: ($_t_CodeType="Code128B")
		$_l_Check:=104
		
	: ($_t_CodeType="Code128C")
		$_l_Check:=105
		If ((Length:C16($_t_Code)%2)#0)
			$_t_Code:="0"+$_t_Code
		End if 
	Else 
		$_t_Code:=""
End case 

Case of 
	: ($_t_CodeType="Code128C")
		For ($_l_Index; 1; Length:C16($_t_Code); 2)
			$_l_CHarPosition:=Num:C11($_t_Code[[$_l_Index]]+$_t_Code[[$_l_Index+1]])
			$_l_Check:=$_l_Check+($_l_CHarPosition*(($_l_Index+1)/2))
		End for 
		
	: ($_t_CodeType="Code128B")
		For ($_l_Index; 1; Length:C16($_t_Code))
			// we cannot use Find in array because we need to decide between uppercase and lowercase
			$_l_CHarPosition:=Find in array:C230(BARC_al_Checksums2; Character code:C91($_t_Code[[$_l_Index]]))-1  // array starts with element 1
			$_l_Check:=$_l_Check+($_l_CHarPosition*$_l_Index)
		End for 
	Else   // 128A, this is easy, we can use Find in array, it will be faster interpreted
		For ($_l_Index; 1; Length:C16($_t_Code))
			$_l_CHarPosition:=Find in array:C230(BARC_al_Checksums; Character code:C91($_t_Code[[$_l_Index]]))-1  // array starts with element 1
			$_l_Check:=$_l_Check+($_l_CHarPosition*$_l_Index)
		End for 
End case 


$_l_CheckSum:=$_l_Check%103  // checksum

Case of 
	: ($_t_CodeType="Code128A")
		$_t_Result:=Char:C90(BARC_al_Checksums{$_l_CheckSum+1})
		
	: ($_t_CodeType="Code128B")
		$_t_Result:=Char:C90(BARC_al_Checksums2{$_l_CheckSum+1})
		
	: ($_t_CodeType="Code128C")
		$_t_Result:=String:C10($_l_CheckSum; "00")
	Else 
		$_t_Code:=""
End case 


$0:=$_t_Result
ERR_MethodTrackerReturn("Calc_Checksum_Code128"; $_t_oldMethodName)