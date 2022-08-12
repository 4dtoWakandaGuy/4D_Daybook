//%attributes = {}
If (False:C215)
	//Project Method Name:      Barcode_Convert_Pattern
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 08:07
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

$_t_oldMethodName:=ERR_MethodTracker("BARcode_Convert_Pattern")


// all parameters are text
// $Pattern = "" for unknown barcodes


$0:=""

If ($2#"")
	
	Case of 
		: ($1="Code39")
			$0:=Convert_Code39_Pattern($2)
			
		: ($1="Code128@")
			$0:=Convert_Code128_Pattern($2; $1)
			
		: ($1="Industrial 2 of 5")
			$0:=Convert_Industrial25_Pattern($2)
			
		: ($1="Interleaved 2 of 5")
			$0:=Convert_Interleaved25_Pattern($2)
			
		: ($1="EAN13")
			$0:=Convert_EAN13_Pattern($2)
			
		: ($1="EAN8")
			$0:=Convert_EAN8_Pattern($2)
			
		: ($1="UPC-A")
			$0:=Convert_UPCA_Pattern($2)
			
		: ($1="UPC-E")
			$0:=Convert_UPCE_Pattern($2)
			
		: ($1="Supplemental2")
			$0:=Convert_Supplemental2_Pattern($2)
			
		: ($1="Supplemental5")
			$0:=Convert_Supplemental5_Pattern($2)
		Else 
			// ALERT("Unknown Barcode Type")
			$0:=""
	End case 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("BARcode_Convert_Pattern"; $_t_oldMethodName)