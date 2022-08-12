//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_GetAustralianStateCodes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  29/01/2011 14:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_StateCode; 0)
	ARRAY TEXT:C222($_at_StateNames; 0)
	C_LONGINT:C283($_l_StateRow)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_GetAustralianStateCodes")

ARRAY TEXT:C222($_at_StateNames; 8)
ARRAY TEXT:C222($_at_StateCode; 8)
$_at_StateCode{1}:="ACT"
$_at_StateCode{2}:="NSW"
$_at_StateCode{3}:="NT"
$_at_StateCode{4}:="QLD"
$_at_StateCode{5}:="SA"
$_at_StateCode{6}:="TAS"
$_at_StateCode{7}:="VIC"
$_at_StateCode{8}:="WA"

$_at_StateNames{1}:="Australian Capital Territory"
$_at_StateNames{2}:="New South Wales"
$_at_StateNames{3}:="Northern Territory"
$_at_StateNames{4}:="Queensland"
$_at_StateNames{5}:="South Australia"
$_at_StateNames{6}:="Tasmania"
$_at_StateNames{7}:="Victoria"
$_at_StateNames{8}:="Western Australia"
If (Count parameters:C259>=1)
	$0:=""
	$_l_StateRow:=Find in array:C230($_at_StateNames; $1)
	If ($_l_StateRow>0)
		$0:=$_at_StateCode{$_l_StateRow}
	Else 
		$_l_StateRow:=Find in array:C230($_at_StateCode; $1)
		If ($_l_StateRow>0)
			$0:=$_at_StateNames{$_l_StateRow}
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("GEN_GetAustralianStateCodes"; $_t_oldMethodName)