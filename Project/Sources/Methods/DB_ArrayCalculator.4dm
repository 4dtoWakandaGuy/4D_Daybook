//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ArrayCalculator
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountParameters; $_l_ParameterIndex; $_l_Type; $_l_Type2; $0; $1; $2)
	C_REAL:C285($_l_Bytes; $_l_TotalBytes)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ArrayCalculator")
//DB_ArrayCalculator
//NG January 28 2004
//This method will calculate the amount of memory for arrays
//NOTE THE ARRAYS MUST BE DECLARED ALEADY
$_l_CountParameters:=Count parameters:C259
For ($_l_ParameterIndex; 3; $_l_CountParameters)
	$_l_Type:=Type:C295(${$_l_ParameterIndex}->)
	Case of 
			
		: ($_l_Type=Boolean array:K8:21)
			$_l_Bytes:=(31+$1)\8
		: ($_l_Type=Date array:K8:20)
			$_l_Bytes:=(31+$1)*6
		: ($_l_Type=String array:K8:15)
			
			$_l_Bytes:=((1+$1)*255)+2
		: ($_l_Type=Integer array:K8:18)
			
			$_l_Bytes:=(1+$1)*2
		: ($_l_Type=LongInt array:K8:19)
			
			$_l_Bytes:=(1+$1)*4
		: ($_l_Type=Picture array:K8:22)
			//the 1000 is an abitary picture size
			$_l_Bytes:=(1+$1)*(4+(1000*$1))
		: ($_l_Type=Pointer array:K8:23)
			$_l_Bytes:=(1+$1)*16
		: ($_l_Type=Real array:K8:17)
			$_l_Bytes:=(1+$1)*8
		: ($_l_Type=Text array:K8:16)
			$_l_Bytes:=(1+$1)*(6*(1000*$1))
		: ($_l_Type=Array 2D:K8:24)
			$_l_Bytes:=((1+$1)*12)+(((1+$2)*(255+2)))
			If (False:C215)
				$_l_Type2:=Type:C295(${$_l_ParameterIndex}->{0}{0})
				Case of 
					: ($_l_Type2=Is boolean:K8:9)
						$_l_Bytes:=((1+$1)*12)+((31+$2)\8)
					: ($_l_Type2=Is date:K8:7)
						$_l_Bytes:=((1+$1)*12)+((1+$2)*6)
					: ($_l_Type2=Is string var:K8:2)
						$_l_Bytes:=((1+$1)*12)+((1+$2)*(255+2))
					: ($_l_Type2=Is integer:K8:5)
						$_l_Bytes:=((1+$1)*12)+((1+$2)*2)
					: ($_l_Type2=Is longint:K8:6)
						$_l_Bytes:=((1+$1)*12)+((1+$2)*4)
					: ($_l_Type2=Is picture:K8:10)
						$_l_Bytes:=((1+$1)*12)+((1+$2)*(4+(1000*$2)))
					: ($_l_Type2=Is pointer:K8:14)
						$_l_Bytes:=((1+$1)*12)+((1+$2)*16)
					: ($_l_Type2=Is real:K8:4)
						$_l_Bytes:=((1+$1)*12)+((1+$2)*8)
					: ($_l_Type2=Is text:K8:3)
						$_l_Bytes:=((1+$1)*12)+((1+$2)*(4*1000*$2))
						
				End case 
			End if 
			
	End case 
	$_l_TotalBytes:=$_l_TotalBytes+$_l_Bytes
End for 
ERR_MethodTrackerReturn("DB_ArrayCalculator"; $_t_oldMethodName)