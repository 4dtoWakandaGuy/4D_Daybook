//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CheckFieldToArray
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 10:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $0)
	C_LONGINT:C283($_l_CountParameters; $_l_HalfParameters; $_l_HalfParameters2; $_l_ParametersIndex; $_l_Type; $_l_Type2)
	C_POINTER:C301($_Ptr_Data; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CheckFieldToArray")

//fieldToArrayOK (->aField;->anArray) -> bool
//_a
$_l_CountParameters:=Count parameters:C259
$_l_HalfParameters:=$_l_CountParameters/2
$_l_HalfParameters2:=$_l_CountParameters/2
If (Count parameters:C259>=2)
	For ($_l_ParametersIndex; 1; $_l_CountParameters; 2)
		
		$_l_Type:=Type:C295(${$_l_ParametersIndex}->)
		
		$_Ptr_Data:=${$_l_ParametersIndex+1}
		$_l_Type2:=Type:C295($_Ptr_Data->)
		If ($_l_Type2=13)  //its a 2D array
			//TRACE
		End if 
		$0:=False:C215
		Case of 
			: ($_l_HalfParameters#$_l_HalfParameters2)
				$_bo_Continue:=False:C215
			: (Not:C34($_l_Type2=21)) & (Not:C34($_l_Type2=18)) & (Not:C34($_l_Type2=14)) & (Not:C34($_l_Type2=15)) & (Not:C34($_l_Type2=16)) & (Not:C34($_l_Type2=17)) & (Not:C34($_l_Type2=22)) & (Not:C34($_l_Type2=19))
				$_bo_Continue:=False:C215
			: (Not:C34($_l_Type=Is alpha field:K8:1)) & (Not:C34($_l_Type=Is text:K8:3)) & (Not:C34($_l_Type=Is real:K8:4)) & (Not:C34($_l_Type=Is integer:K8:5)) & (Not:C34($_l_Type=Is longint:K8:6)) & (Not:C34($_l_Type=Is date:K8:7)) & (Not:C34($_l_Type=Is time:K8:8)) & (Not:C34($_l_Type=Is boolean:K8:9)) & (Not:C34($_l_Type=Is picture:K8:10))
				$_bo_Continue:=False:C215
			Else 
				$0:=True:C214
				Case of 
					: ($_l_Type=Is text:K8:3) & ($_l_Type2=Text array:K8:16)
						
					: ($_l_Type=Is alpha field:K8:1) & (($_l_Type2=String array:K8:15) | ($_l_Type2=Text array:K8:16))
						
					: ($_l_Type=Is integer:K8:5) & ($_l_Type2=Integer array:K8:18)
					: ($_l_Type=Is longint:K8:6) & ($_l_Type2=LongInt array:K8:19)
					: ($_l_Type=Is real:K8:4) & ($_l_Type2=Real array:K8:17)
					: ($_l_Type=Is alpha field:K8:1) & ($_l_Type2=Text array:K8:16)
					: ($_l_Type=Is boolean:K8:9) & ($_l_Type2=Boolean array:K8:21)
					: ($_l_Type=Is date:K8:7) & ($_l_Type2=Date array:K8:20)
					: ($_l_Type=Is time:K8:8) & ($_l_Type2=LongInt array:K8:19)
					: ($_l_Type=Is picture:K8:10) & ($_l_Type2=Picture array:K8:22)
					: ($_l_Type=-1) & ($_l_Type2=LongInt array:K8:19)
						
					Else 
						$0:=False:C215
				End case 
		End case 
	End for 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Gen_CheckFieldToArray"; $_t_oldMethodName)