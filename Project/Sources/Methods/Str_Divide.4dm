//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_Divide
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
	C_LONGINT:C283($_l_Divide; $_l_LengthParam1; $_l_LengthParam2; $_l_Minimum; $_l_Multiply; $_l_Number1; $_l_Number1Offset; $_l_Number2)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_Divide")
//Str_Divide - does long division by hand on strings
//NB: Param 2, the one being divided by, is assumed to be short enough
//used to avoid 15 digit limit on Windows!!!!
//NB: only pass integers - decimals are not handled
If (Count parameters:C259>=2)
	$_l_LengthParam1:=Length:C16($1)
	$_l_LengthParam2:=Length:C16($2)
	$_l_Number2:=Num:C11($2)
	
	If (($_l_LengthParam1<12) | ($_l_LengthParam2>=$_l_LengthParam1))
		$0:=String:C10(Num:C11($1)/Num:C11($2))
	Else 
		
		$_l_Number1:=Num:C11(Substring:C12($1; $_l_Number1Offset-$_l_LengthParam2+1; $_l_LengthParam2))
		$_l_Minimum:=$_l_Number1
		$_l_Number1Offset:=$_l_LengthParam2
		While ($_l_Number1Offset<=$_l_LengthParam1)
			IDLE:C311  // 7/04/03 pb
			$_l_Divide:=Int:C8($_l_Number1/$_l_Number2)
			While (($_l_Divide<1) & ($_l_Number1Offset#$_l_LengthParam1))
				IDLE:C311  // 7/04/03 pb
				$_l_Number1Offset:=$_l_Number1Offset+1
				$0:=$0+"0"
				$_l_Number1:=Num:C11(String:C10($_l_Number1)+Substring:C12($1; $_l_Number1Offset; 1))
				$_l_Divide:=Int:C8($_l_Number1/$_l_Number2)
			End while 
			$0:=$0+String:C10($_l_Divide)
			$_l_Multiply:=Int:C8($_l_Divide*$_l_Number2)
			$_l_Minimum:=Int:C8($_l_Number1-$_l_Multiply)
			$_l_Number1Offset:=$_l_Number1Offset+1
			$_l_Number1:=Num:C11(String:C10($_l_Minimum)+Substring:C12($1; $_l_Number1Offset; 1))
		End while 
		
		If ($0="")
			$0:="0"
		End if 
		If ($0#"0")
			While (Substring:C12($0; 1; 1)="0")
				IDLE:C311  // 7/04/03 pb
				$0:=Substring:C12($0; 2; 32000)
			End while 
		End if 
		
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str_Divide"; $_t_oldMethodName)
