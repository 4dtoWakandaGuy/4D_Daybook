//%attributes = {}

If (False:C215)
	//Project Method Name:      Get_ProcessNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/08/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessNumber; $_l_State; $0)
	C_TEXT:C284($_t_ProcessName; $1)
End if 
//Code Starts Here
If (Count parameters:C259>=1)
	$_t_ProcessName:=$1
	$_l_ProcessNumber:=Process number:C372($_t_ProcessName)
	If ($_l_ProcessNumber>0)
		$_l_State:=Process state:C330($_l_ProcessNumber)
		If ($_l_State<0)
			$_l_ProcessNumber:=0
		End if 
	End if 
	$0:=$_l_ProcessNumber
	
End if 
