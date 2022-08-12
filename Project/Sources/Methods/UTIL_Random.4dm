//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      UTIL_Random
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Cal_bo_RandomWarmed)
	C_LONGINT:C283($_l_Index; $_l_JIndex; $_l_KIndex; $_l_Maximum; $_l_Minimum; $_l_Random; $0; $1; $2)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTIL_Random")


If (Not:C34(<>Cal_bo_RandomWarmed))
	$_l_KIndex:=(Milliseconds:C459%(32768-10+1))+10
	For ($_l_Index; 1; $_l_KIndex)
		$_l_JIndex:=Random:C100
	End for 
	<>Cal_bo_RandomWarmed:=True:C214
End if 

$_l_Minimum:=$1
$_l_Maximum:=$2

//========================    Method Actions    ==================================

If ($_l_Maximum<$_l_Minimum)
	$_l_Index:=$_l_Maximum
	$_l_Maximum:=$_l_Minimum
	$_l_Minimum:=$_l_Index
End if 

If (($_l_Minimum=0) & ($_l_Maximum=0))  // inf = sup = 0
	$_l_JIndex:=0
	$_l_KIndex:=32767
	$_l_Index:=$_l_KIndex-$_l_JIndex
	$_l_Random:=$_l_JIndex+(Int:C8(((Random:C100/32768)*$_l_Index)+1))
	$_l_Random:=$_l_Random/32767
Else 
	$_l_JIndex:=$_l_Minimum-1
	$_l_KIndex:=$_l_Maximum
	If ($_l_Maximum=MAXLONG:K35:2)
		$_l_Maximum:=$_l_Maximum-1
	End if 
	$_l_Index:=$_l_KIndex-$_l_JIndex
	$_l_Random:=$_l_JIndex+(Int:C8(((Random:C100/32768)*$_l_Index)+1))
End if 

//========================    Clean up and Exit    =================================

$0:=$_l_Random
ERR_MethodTrackerReturn("UTIL_Random"; $_t_oldMethodName)
