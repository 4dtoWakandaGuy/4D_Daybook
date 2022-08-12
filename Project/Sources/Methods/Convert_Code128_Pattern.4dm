//%attributes = {}
If (False:C215)
	//Project Method Name:      Convert_Code128_Pattern
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
	//ARRAY TEXT(BARC_at_Patterns;0)
	//ARRAY TEXT(BARC_at_Patterns2;0)
	C_LONGINT:C283($_l_Character; $_l_ChecksumIndex; $_l_Index)
	C_TEXT:C284($_t_BarCode; $_t_BarcodeType; $_t_CurrentPattern; $_t_oldMethodName; $_t_Pattern; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Convert_Code128_Pattern")

// converts Code128 to Pattern
// $1 = Text, $2 = Type (A, B, C), $0 = Pattern
// checksum is mandatory


$_t_BarCode:=$1
$_t_BarcodeType:=$2
$_t_Pattern:=""

Create_Code128_Array  // called already from Calc_Checksum
Case of 
	: ($_t_BarcodeType="Code128A")
		$_t_Pattern:=BARC_at_Patterns{108}
		
	: ($_t_BarcodeType="Code128B")
		$_t_Pattern:=BARC_at_Patterns{109}
		
	: ($_t_BarcodeType="Code128C")
		$_t_Pattern:=BARC_at_Patterns{110}
		If ((Length:C16($_t_BarCode)%2)#0)
			$_t_BarCode:="0"+$_t_BarCode
		End if 
	Else 
		$_t_BarCode:=""
End case 

//  $_t_Pattern:=$_t_Pattern+"_"   ` helps debugging

If ($_t_BarcodeType="Code128C")
	For ($_l_Index; 1; Length:C16($_t_BarCode); 2)
		$_l_ChecksumIndex:=Num:C11($_t_BarCode[[$_l_Index]]+$_t_BarCode[[$_l_Index+1]])
		$_t_Pattern:=$_t_Pattern+BARC_at_Patterns{BARC_al_Checksums{$_l_ChecksumIndex+1}}
		// $_t_Pattern:=$_t_Pattern+"_"
	End for 
Else 
	For ($_l_Index; 1; Length:C16($_t_BarCode))
		$_l_Character:=Character code:C91($_t_BarCode[[$_l_Index]])
		If ($_l_Character<128)
			$_t_CurrentPattern:=""
			Case of 
				: ($_t_BarcodeType="Code128A")
					$_t_CurrentPattern:=BARC_at_Patterns{$_l_Character}
				: ($_t_BarcodeType="Code128B")
					$_t_CurrentPattern:=BARC_at_Patterns2{$_l_Character}
				Else 
					$_t_CurrentPattern:=""
			End case 
			
			$_t_Pattern:=$_t_Pattern+$_t_CurrentPattern
		End if   // nothing for upper ascii chars
		// $_t_Pattern:=$_t_Pattern+"_"
	End for 
End if 
$0:=$_t_Pattern+BARC_at_Patterns{111}  // stop code
ERR_MethodTrackerReturn("Convert_Code128_Pattern"; $_t_oldMethodName)