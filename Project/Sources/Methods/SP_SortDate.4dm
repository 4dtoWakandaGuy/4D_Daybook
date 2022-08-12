//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_SortDate
	//------------------ Method Notes ------------------
	//This method will calculate a so
	//sort date
	//this may be based on the expected date(in the case of pipeline)
	//or on date range in the case of projections
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1; $2)
	C_LONGINT:C283($_l_Num2; $0)
	C_TEXT:C284($_t_NUMSTR; $_t_oldMethodName; $_t_Part1; $_t_Part2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_SortDate")

$_t_NUMSTR:=""
Case of 
	: (Count parameters:C259=1)
		//the first bit is empty
		$_t_Part1:="0"*9
		$_l_Num2:=Gen_DateStamp($1)
		$_t_Part2:="0"*(9-Length:C16(String:C10($_l_Num2)))+String:C10($_l_Num2)
		$_t_NUMSTR:=$_t_Part1+$_t_Part2
		
	: (Count parameters:C259=2)
		//$_t_Part1:="0"*9
		$_l_Num2:=Gen_DateStamp($2)
		$_t_Part1:="0"*(9-Length:C16(String:C10($_l_Num2)))+String:C10($_l_Num2)
		$_t_Part2:="0"*(9-Length:C16(String:C10($_l_Num2)))+String:C10($_l_Num2)
		$_t_NUMSTR:=$_t_Part1+$_t_Part2
	Else 
		$_t_NUMSTR:=""
End case 
$0:=Num:C11($_t_NUMSTR)
ERR_MethodTrackerReturn("SP_SortDate"; $_t_oldMethodName)
