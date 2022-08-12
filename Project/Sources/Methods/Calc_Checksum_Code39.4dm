//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Checksum_Code39
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
	//ARRAY LONGINT(BARC_al_Checksums;0)
	C_LONGINT:C283($_l_CharPosition; $_l_Check; $_l_CheckSum; $_l_Index)
	C_TEXT:C284($_t_Code; $_t_oldMethodName; $_t_Result; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Checksum_Code39")

// calculates the checksum for Code 39 Barcodes
// get's the value of each char, add it, rest of 43,


$_t_Code:=$1
If ($_t_Code="*@")
	$_t_Code:=Substring:C12($_t_Code; 2)
End if 
If ($_t_Code="@*")
	$_t_Code:=Substring:C12($_t_Code; 1; Length:C16($_t_Code)-1)
End if 
If (Length:C16($_t_Code)>29)  // code 39 has a limit of 30 char including checksum
	$_t_Code:=Substring:C12($_t_Code; 1; 29)
End if 

Create_Code39_Array

$_l_Check:=0
For ($_l_Index; 1; Length:C16($_t_Code))
	$_l_CharPosition:=Find in array:C230(BARC_al_Checksums; Character code:C91($_t_Code[[$_l_Index]]))-1  // array starts with element 1
	$_l_Check:=$_l_Check+$_l_CharPosition
End for 
$_l_CheckSum:=$_l_Check%43  // checksum
If (($_l_CheckSum>0) & ($_l_CheckSum<Size of array:C274(BARC_al_Checksums)))
	$_t_Result:=Char:C90(BARC_al_Checksums{$_l_CheckSum+1})
Else 
	$_t_Result:=Char:C90(0)
End if 
$0:=$_t_Result
ERR_MethodTrackerReturn("Calc_Checksum_Code39"; $_t_oldMethodName)