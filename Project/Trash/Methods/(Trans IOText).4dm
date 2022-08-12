//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_IOText
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 17:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_TaxName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_IOText")
$0:=""
Case of 
	: ($1="I")
		$0:="Input"
	: ($1="O")
		$0:="Output"
	: ($1="N")
		$_t_TaxName:=Term VATWT("VAT")
		If ($_t_TaxName#"VAT")
			$0:="Neither S nor P"
		Else 
			$0:="Neither I nor O"
		End if 
	: ($1="S")
		$0:="Sales"
	: ($1="P")
		$0:="Purchase"
End case 
ERR_MethodTrackerReturn("Trans_IOText"; $_t_oldMethodName)
