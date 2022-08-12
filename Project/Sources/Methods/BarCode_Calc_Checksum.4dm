//%attributes = {}
If (False:C215)
	//Project Method Name:      BarCode_Calc_Checksum
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 08:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BARcode_Calc_Checksum")
// all parameters are text
// $Checksum = "?" for unknown barcodes


If ($2#"")
	
	Case of 
		: ($1="Code39")
			$0:=Calc_Checksum_Code39($2)
			
		: ($1="Code128@")
			$0:=Calc_Checksum_Code128($2; $1)
			
		: (($1="Industrial 2 of 5") | ($1="Interleaved 2 of 5"))
			$0:=Calc_Checksum_Industrial($2; $1)
			
		: ($1="EAN13")
			$0:=Calc_Checksum_EAN13($2)
			
		: ($1="EAN8")
			$0:=Calc_Checksum_EAN13("00000"+$2)
			
		: ($1="UPC-A")
			$0:=Calc_Checksum_UPCA($2)
			
		: ($1="UPC-E")
			$0:=""
			// nothing can be done here, this needs to replace the whole code
			
		Else 
			$0:="?"
	End case 
	
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("BARcode_Calc_Checksum"; $_t_oldMethodName)