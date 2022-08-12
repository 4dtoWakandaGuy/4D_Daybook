//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Checksum_UPCA
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
	C_TEXT:C284($_t_CheckSumCode; $_t_oldMethodName; $_t_Result; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Checksum_UPCA")

// calculates the checksum for UPC-A Barcodes
// identical to EAN-13, just one digit less


$_t_CheckSumCode:=$1

Case of 
	: (Length:C16($_t_CheckSumCode)=12)  // UPC-A must be 12 char - without checksum 11!
		$_t_CheckSumCode:=Substring:C12($_t_CheckSumCode; 1; 11)  // checksum already included. Remove it
		$_t_Result:=""
		
	: (Length:C16($_t_CheckSumCode)=11)
		// we have to calculate it
		$_t_Result:=""
		
	Else 
		$_t_Result:="?"
		$_t_CheckSumCode:=""  // wrong length
		
End case 

If ($_t_Result="")
	$_t_Result:=Calc_Checksum_EAN13("0"+$_t_CheckSumCode)
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("Calc_Checksum_UPCA"; $_t_oldMethodName)