//%attributes = {}
If (False:C215)
	//Project Method Name:      CDP_1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2012 17:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DL; 0)
	ARRAY LONGINT:C221($_al_DP; 0)
	ARRAY LONGINT:C221($_al_HL; 0)
	ARRAY LONGINT:C221($_al_HP; 0)
	ARRAY LONGINT:C221($_al_SL; 0)
	ARRAY LONGINT:C221($_al_SP; 0)
	ARRAY TEXT:C222($_at_D; 0)
	ARRAY TEXT:C222($_at_H; 0)
	ARRAY TEXT:C222($_at_S; 0)
	ARRAY TEXT:C222($_at_SU; 0)
	C_LONGINT:C283($_l_Index; $_l_Index2)
	C_POINTER:C301($_Ptr_LongintArrayL; $_Ptr_LongintArrayP; $_Ptr_TextArray)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CDP_1")
ARRAY TEXT:C222($_at_H; 13)
ARRAY LONGINT:C221($_al_HL; 13)
ARRAY LONGINT:C221($_al_HP; 13)

ARRAY TEXT:C222($_at_D; 13)
ARRAY LONGINT:C221($_al_DL; 13)
ARRAY LONGINT:C221($_al_DP; 13)

ARRAY TEXT:C222($_at_S; 13)
ARRAY LONGINT:C221($_al_SL; 13)
ARRAY LONGINT:C221($_al_SP; 13)


ARRAY TEXT:C222($_at_S; 13)
ARRAY LONGINT:C221($_al_SL; 13)
ARRAY LONGINT:C221($_al_SP; 13)

ARRAY TEXT:C222($_at_SU; 4)
$_at_SU{1}:="H"
$_at_SU{2}:="S"
$_at_SU{3}:="D"
$_at_SU{4}:="C"

For ($_l_Index2; 1; 4)
	$_Ptr_TextArray:=Get pointer:C304("$_at_"+$_at_SU{$_l_Index2})
	$_Ptr_LongintArrayL:=Get pointer:C304("$_al_"+$_at_SU{$_l_Index2}+"L")
	$_Ptr_LongintArrayP:=Get pointer:C304("$_al_"+$_at_SU{$_l_Index2}+"P")
	For ($_l_Index; 1; 13)
		If ($_l_Index<11) & ($_l_Index>1)
			$_Ptr_TextArray->{$_l_Index}:=String:C10($_l_Index)+$_at_SU{$_l_Index2}
			$_Ptr_LongintArrayL->{$_l_Index}:=$_l_Index
		Else 
			Case of 
				: ($_l_Index=1)
					$_Ptr_TextArray->{$_l_Index}:="A"+$_at_SU{$_l_Index2}
					$_Ptr_LongintArrayL->{$_l_Index}:=14
					$_Ptr_LongintArrayP->{$_l_Index}:=4
				: ($_l_Index=11)
					$_Ptr_TextArray->{$_l_Index}:="J"+$_at_SU{$_l_Index2}
					$_Ptr_LongintArrayL->{$_l_Index}:=$_l_Index
					$_Ptr_LongintArrayP->{$_l_Index}:=1
				: ($_l_Index=12)
					$_Ptr_TextArray->{$_l_Index}:="Q"+$_at_SU{$_l_Index2}
					$_Ptr_LongintArrayL->{$_l_Index}:=$_l_Index
					$_Ptr_LongintArrayP->{$_l_Index}:=2
				: ($_l_Index=13)
					$_Ptr_TextArray->{$_l_Index}:="K"+$_at_SU{$_l_Index2}
					$_Ptr_LongintArrayL->{$_l_Index}:=$_l_Index
					$_Ptr_LongintArrayP->{$_l_Index}:=3
			End case 
		End if 
		
	End for 
End for 
ERR_MethodTrackerReturn("CDP_1"; $_t_oldMethodName)