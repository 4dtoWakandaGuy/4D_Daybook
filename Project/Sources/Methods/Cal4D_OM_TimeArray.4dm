//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_TimeArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_Max; $_l_SelectedIndex)
	C_POINTER:C301($_ptr_Self; $1)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
	C_TIME:C306($_ti_CurrentTime; $_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_TimeArray")

$_ptr_Self:=$1
$_ti_Time:=?00:00:00?
$_ti_CurrentTime:=Current time:C178
$_l_Max:=98
ARRAY TEXT:C222($_ptr_Self->; $_l_Max)
$_ptr_Self->{1}:="Start Time"
$_ptr_Self->{2}:="-"


For ($_l_Index; 3; $_l_Max)
	$_ptr_Self->{$_l_Index}:=String:C10($_ti_Time; HH MM AM PM:K7:5)
	$_ti_Time:=$_ti_Time+900
	If ($_ti_Time<$_ti_CurrentTime)
		$_l_SelectedIndex:=$_l_Index+1
	End if 
End for 
If ($_l_SelectedIndex>$_l_Max)
	$_l_SelectedIndex:=$_l_Max
End if 


$_ptr_Self->:=$_l_SelectedIndex
ERR_MethodTrackerReturn("Cal4D_OM_TimeArray"; $_t_oldMethodName)