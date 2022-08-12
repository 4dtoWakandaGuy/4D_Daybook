//%attributes = {}
If (False:C215)
	//Project Method Name:      VCDC_XMLCOMPLIANCE2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_Escapes; 0)
	ARRAY TEXT:C222($_at_Replacements; 0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_Character; $_t_oldMethodName; $_t_Text; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VCDC_XMLCOMPLIANCE2")
$0:=$1
If (Count parameters:C259>=1)
	$_t_Text:=$1
	ARRAY LONGINT:C221($_al_Escapes; 32)
	ARRAY TEXT:C222($_at_Replacements; 32)
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
	For ($_l_Index; 14; 31)
		$_al_Escapes{$_l_Index}:=$_l_Index
		$_at_Replacements{$_l_Index}:=" "
	End for 
	$_al_Escapes{32}:=10
	$_at_Replacements{32}:="&#10;"
	For ($_l_Index; 1; Size of array:C274($_al_Escapes))
		$_t_Character:=Char:C90($_al_Escapes{$_l_Index})
		$_t_Text:=Replace string:C233($_t_Text; $_t_Character; $_at_Replacements{$_l_Index})
	End for 
	$0:=$_t_Text
End if 
ERR_MethodTrackerReturn("VCDC_XMLCOMPLIANCE2"; $_t_oldMethodName)
