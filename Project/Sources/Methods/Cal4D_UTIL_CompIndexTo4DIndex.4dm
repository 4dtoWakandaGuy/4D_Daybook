//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_UTIL_CompIndexTo4DIndex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:04
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

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_UTIL_CompIndexTo4DIndex")

$_l_Index:=$1


Case of 
	: ($_l_Index=1)
		$_l_Index:=193
	: ($_l_Index=2)
		$_l_Index:=193
	: ($_l_Index=3)
		$_l_Index:=209
	: ($_l_Index=4)
		$_l_Index:=225
	: ($_l_Index=5)
		$_l_Index:=193
	: ($_l_Index=6)
		$_l_Index:=195
	: ($_l_Index=7)
		$_l_Index:=197
	: ($_l_Index=8)
		$_l_Index:=225
	: ($_l_Index=9)
		$_l_Index:=177
	: ($_l_Index=10)
		$_l_Index:=131
	: ($_l_Index=11)
		$_l_Index:=225
	: ($_l_Index=12)
		$_l_Index:=161
End case 


$0:=$_l_Index
ERR_MethodTrackerReturn("Cal4D_UTIL_CompIndexTo4DIndex"; $_t_oldMethodName)