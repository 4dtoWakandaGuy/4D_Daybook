//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      STR_PositionR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_LastPosition; $_l_NextPosition; $0)
	C_TEXT:C284($_t_Find; $_t_Marker; $_t_MethodName; $_t_oldMethodName; $_t_String; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_PositionR")



$_t_Find:=$1
$_t_String:=$2


$_t_Marker:=Char:C90(1)*Length:C16($_t_Find)
If ($_t_Find=$_t_Marker)
	$_t_Marker:=Char:C90(2)*Length:C16($_t_Find)
End if 

$_l_LastPosition:=0
Repeat 
	$_l_NextPosition:=Position:C15($_t_Find; $_t_String)
	If ($_l_NextPosition>0)
		$_l_LastPosition:=$_l_NextPosition
		$_t_String:=Replace string:C233($_t_String; $_t_Find; $_t_Marker; 1)
	End if 
Until ($_l_NextPosition=0)

$0:=$_l_LastPosition
ERR_MethodTrackerReturn("STR_PositionR"; $_t_oldMethodName)
