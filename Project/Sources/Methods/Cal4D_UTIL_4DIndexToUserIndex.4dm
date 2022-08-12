//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_UTIL_4DIndexToUserIndex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $0; $1)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_UTIL_4DIndexToUserIndex")


$_l_Index:=$1


Case of 
	: ($_l_Index=199)
		$_l_Index:=1
	: ($_l_Index=99)
		$_l_Index:=2
	: ($_l_Index=108)
		$_l_Index:=3
	: ($_l_Index=114)
		$_l_Index:=4
	: ($_l_Index=79)
		$_l_Index:=5
	: ($_l_Index=202)
		$_l_Index:=6
	: ($_l_Index=205)
		$_l_Index:=7
	: ($_l_Index=231)
		$_l_Index:=8
	: ($_l_Index=183)
		$_l_Index:=9
	: ($_l_Index=138)
		$_l_Index:=10
	: ($_l_Index=126)
		$_l_Index:=11
	: ($_l_Index=167)
		$_l_Index:=12
	Else 
		//TRACE
End case 

$0:=$_l_Index
ERR_MethodTrackerReturn("Cal4D_UTIL_4DIndexToUserIndex"; $_t_oldMethodName)