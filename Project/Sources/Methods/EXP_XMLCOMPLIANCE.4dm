//%attributes = {}
If (False:C215)
	//Project Method Name:      EXP_XMLCOMPLIANCE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/07/2009 15:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Escapes; 0)
	//ARRAY LONGINT(EXP_al_Escapes;0)
	ARRAY TEXT:C222($_at_Replacements; 0)
	//ARRAY TEXT(EXP_at_Replacements;0)
	C_BOOLEAN:C305(EXP_bo_ReplacesDefined)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index)
	C_TEXT:C284($_t_CurrentChar; $_t_oldMethodName; $_t_Text; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EXP_XMLCOMPLIANCE")
If (Count parameters:C259>=1)
	ARRAY LONGINT:C221($_al_Escapes; 0)
	ARRAY TEXT:C222($_at_Replacements; 0)
	$_t_Text:=$1
	If (Not:C34(EXP_bo_ReplacesDefined))
		
		ARRAY LONGINT:C221($_al_Escapes; 99)
		ARRAY TEXT:C222($_at_Replacements; 99)
		$_al_Escapes{3}:=Character code:C91("<")
		$_at_Replacements{3}:="&lt;"
		$_al_Escapes{2}:=Character code:C91(">")
		$_at_Replacements{2}:="&gt;"
		$_al_Escapes{1}:=Character code:C91("&")
		$_at_Replacements{1}:="&amp;"
		$_al_Escapes{4}:=39
		$_at_Replacements{4}:="&#39;"
		$_al_Escapes{5}:=34
		$_at_Replacements{5}:="&quot;"
		$_al_Escapes{6}:=13
		$_at_Replacements{6}:="&#13;"
		//nasties
		$_al_Escapes{7}:=1
		$_at_Replacements{7}:=" "
		$_al_Escapes{8}:=2
		$_at_Replacements{8}:=" "
		$_al_Escapes{9}:=3
		$_at_Replacements{9}:=" "
		$_al_Escapes{10}:=4
		$_at_Replacements{10}:=" "
		$_al_Escapes{11}:=5
		$_at_Replacements{11}:=" "
		$_al_Escapes{12}:=6
		$_at_Replacements{12}:=" "
		$_al_Escapes{13}:=7
		$_at_Replacements{13}:=" "
		$_al_Escapes{14}:=8
		$_at_Replacements{14}:=" "
		$_al_Escapes{15}:=11
		$_at_Replacements{15}:=" "
		$_al_Escapes{16}:=12
		$_at_Replacements{16}:=" "
		$_l_CurrentRow:=17
		For ($_l_Index; 14; 31)
			$_al_Escapes{$_l_CurrentRow}:=$_l_Index
			$_at_Replacements{$_l_CurrentRow}:=" "
			$_l_CurrentRow:=$_l_CurrentRow+1
		End for 
		$_al_Escapes{$_l_CurrentRow}:=10
		$_at_Replacements{$_l_CurrentRow}:="&#10;"
		ARRAY LONGINT:C221($_al_Escapes; $_l_CurrentRow)
		ARRAY TEXT:C222($_at_Replacements; $_l_CurrentRow)
		ARRAY LONGINT:C221(EXP_al_Escapes; 0)
		ARRAY TEXT:C222(EXP_at_Replacements; 0)
		COPY ARRAY:C226($_al_Escapes; EXP_al_Escapes)
		COPY ARRAY:C226($_at_Replacements; EXP_at_Replacements)
		EXP_bo_ReplacesDefined:=True:C214
	Else 
		COPY ARRAY:C226(EXP_al_Escapes; $_al_Escapes)
		COPY ARRAY:C226(EXP_at_Replacements; $_at_Replacements)
	End if 
	For ($_l_Index; 1; Size of array:C274($_al_Escapes))
		$_t_CurrentChar:=Char:C90($_al_Escapes{$_l_Index})
		$_t_Text:=Replace string:C233($_t_Text; $_t_CurrentChar; $_at_Replacements{$_l_Index})
	End for 
	$0:=$_t_Text
End if 
ERR_MethodTrackerReturn("EXP_XMLCOMPLIANCE"; $_t_oldMethodName)