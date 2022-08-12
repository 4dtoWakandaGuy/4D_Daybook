//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_CheckSum
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
	C_BOOLEAN:C305($_bo_Double; $0)
	C_LONGINT:C283($_l_CheckNum; $_l_Index)
	C_REAL:C285($_r_SumNumber)
	C_TEXT:C284($_t_CalcString; $_t_CCString; $_t_CheckSum; $_t_LastChar; $_t_oldMethodName; $_t_SumString; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_CheckSum")
$0:=False:C215

If (Count parameters:C259>=1)
	
	$_t_CCString:=Substring:C12($1; 1; Length:C16($1)-1)
	$_t_CheckSum:=$1[[Length:C16($1)]]
Else 
	$_t_CCString:=""
	$_t_CheckSum:=""
End if 
$_bo_Double:=True:C214
$_t_CalcString:=""
For ($_l_Index; Length:C16($_t_CCString); 1; -1)
	If ($_t_CCString[[$_l_Index]]#" ")
		If ($_bo_Double)
			$_t_CalcString:=String:C10(2*(Num:C11($_t_CCString[[$_l_Index]])))+$_t_CalcString
			$_bo_Double:=False:C215
		Else 
			$_t_CalcString:=$_t_CCString[[$_l_Index]]+$_t_CalcString
			$_bo_Double:=True:C214
		End if 
	End if 
End for 
$_r_SumNumber:=0
For ($_l_Index; 1; Length:C16($_t_CalcString))
	$_r_SumNumber:=$_r_SumNumber+Num:C11($_t_CalcString[[$_l_Index]])
End for 
$_t_SumString:=String:C10($_r_SumNumber)
$_t_LastChar:=$_t_SumString[[Length:C16($_t_SumString)]]
If ($_t_LastChar="0")
	$_l_CheckNum:=Num:C11($_t_LastChar)
Else 
	$_l_CheckNum:=10-(Num:C11($_t_LastChar))
End if 
If ($_l_CheckNum=Num:C11($_t_CheckSum))
	$0:=True:C214
	
End if 
ERR_MethodTrackerReturn("CCM_CheckSum"; $_t_oldMethodName)