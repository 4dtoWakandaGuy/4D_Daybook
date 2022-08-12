//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Checksum_UPCE
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
	C_TEXT:C284($_t_CheckSumCode; $_t_MenuFactor; $_t_NewCode; $_t_oldMethodName; $_t_Product; $_t_Result; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Checksum_UPCE")

// calculates the checksum for UPC-E Barcodes

// an UPC-E is a reduced UPC-A with removed digits
// at the end it is the 1st digits, the converted 6 digits and the original (!) check sum digit
// this makes it a little more complicated to calculate


$_t_CheckSumCode:=$1

Case of 
	: (Length:C16($_t_CheckSumCode)=8)
		$_t_Result:=$_t_CheckSumCode  // we are done
		
	: (Length:C16($_t_CheckSumCode)=12)  // fully UPC-A, we have to calculate it
		$_t_Result:=""
		
	: (Length:C16($_t_CheckSumCode)=11)  //  UPC-A without checksum
		$_t_CheckSumCode:=$_t_CheckSumCode+Calc_Checksum_UPCA($_t_CheckSumCode)
		$_t_Result:=""
		
	Else 
		$_t_Result:="?"
		$_t_CheckSumCode:=""  // wrong length
End case 

If ($_t_Result="")
	$_t_MenuFactor:=Substring:C12($_t_CheckSumCode; 2; 5)
	$_t_Product:=Substring:C12($_t_CheckSumCode; 7; 5)
	Case of 
		: ((($_t_MenuFactor="@000") | ($_t_MenuFactor="@100") | ($_t_MenuFactor="@200")) & ($_t_Product="00@"))
			$_t_NewCode:=Substring:C12($_t_MenuFactor; 1; 2)+Substring:C12($_t_Product; 3; 3)+Substring:C12($_t_MenuFactor; 3; 1)
			
		: (($_t_MenuFactor="@00") & ($_t_Product="000@"))
			$_t_NewCode:=Substring:C12($_t_MenuFactor; 1; 3)+Substring:C12($_t_Product; 4; 2)+"3"
			
		: (($_t_MenuFactor="@0") & ($_t_Product="0000@"))
			$_t_NewCode:=Substring:C12($_t_MenuFactor; 1; 4)+Substring:C12($_t_Product; 5; 1)+"4"
			
		: (($_t_Product>="00005") & ($_t_Product<="00009"))
			$_t_NewCode:=$_t_MenuFactor+Substring:C12($_t_Product; 5; 1)
			
		Else 
			$_t_NewCode:="?"
	End case 
	
	If ($_t_NewCode#"?")
		$_t_Result:=$_t_CheckSumCode[[1]]+$_t_NewCode+$_t_CheckSumCode[[12]]
	Else 
		$_t_Result:=$_t_NewCode
	End if 
	
End if 

$0:=$_t_Result
ERR_MethodTrackerReturn("Calc_Checksum_UPCE"; $_t_oldMethodName)