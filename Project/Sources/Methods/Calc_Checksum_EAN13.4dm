//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Checksum_EAN13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/08/2009 16:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Check; $_l_index)
	C_TEXT:C284($_t_CheckSumCode; $_t_oldMethodName; $_t_Result; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Checksum_EAN13")

// calculates the checksum for EAN-13 Barcodes
// get's the value of each char, add it, rest of 43,


$_t_CheckSumCode:=$1

Case of 
	: (Length:C16($_t_CheckSumCode)=13)  // EAN13 must be 13 char - without checksum 12!
		$_t_Result:=""
		$_t_CheckSumCode:=Substring:C12($_t_CheckSumCode; 1; 12)  // checksum already included. remove it
		
	: (Length:C16($_t_CheckSumCode)=12)
		// we have to calculate it
		$_t_Result:=""
		
	Else 
		$_t_Result:="?"
		$_t_CheckSumCode:=""  // wrong length
		
End case 

If ($_t_Result="")
	$_l_Check:=0
	For ($_l_index; 0; 11)
		$_l_Check:=$_l_Check+(Num:C11($_t_CheckSumCode[[$_l_index+1]])*((($_l_index & 1)*2)+1))
	End for 
	$_t_Result:=String:C10((10-($_l_Check%10))%10)
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("Calc_Checksum_EAN13"; $_t_oldMethodName)