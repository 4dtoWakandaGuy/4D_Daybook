//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_UTIL_UserIndexTo4DIndex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:07
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

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_UTIL_UserIndexTo4DIndex")


$_l_Index:=$1


Case of 
	: ($_l_Index=1)
		$_l_Index:=4
	: ($_l_Index=2)
		$_l_Index:=5
	: ($_l_Index=3)
		$_l_Index:=6
	: ($_l_Index=4)
		$_l_Index:=7
	: ($_l_Index=5)
		$_l_Index:=8
	: ($_l_Index=6)
		$_l_Index:=9
	: ($_l_Index=7)
		$_l_Index:=10
	: ($_l_Index=8)
		$_l_Index:=11
	: ($_l_Index=9)
		$_l_Index:=14
	: ($_l_Index=10)
		$_l_Index:=(10*16)+13
	: ($_l_Index=11)
		$_l_Index:=(8*16)+13
	: ($_l_Index=12)
		$_l_Index:=(16*16)
End case 

$0:=$_l_Index
ERR_MethodTrackerReturn("Cal4D_UTIL_UserIndexTo4DIndex"; $_t_oldMethodName)