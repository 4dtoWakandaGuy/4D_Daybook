//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_AddToAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/06/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_BOOLEAN:C305($_Bo_exit)
	C_LONGINT:C283($_L_CurrentFieldOrderCharacter; $4)
	C_POINTER:C301($_Ptr_PointerTobuiltAddress; $1)
	C_TEXT:C284($_t_AddressFieldOrder; $_t_TextToaddtoAddress; $_Txt_NextAddressOrderCharacter; $2; $3)
End if 
//Code Starts Here
$0:=999999
If (Count parameters:C259>=1)
	$_Ptr_PointerTobuiltAddress:=$1
	$_t_TextToaddtoAddress:=$2
	$_t_AddressFieldOrder:=$3
	$_L_CurrentFieldOrderCharacter:=$4
Else 
	
End if 
If ($_t_AddressFieldOrder#"") & ($_L_CurrentFieldOrderCharacter>0)
	
	$_t_TextToaddtoAddress:=Replace string:C233($_t_TextToaddtoAddress; Char:C90(13); " ")
	$_t_TextToaddtoAddress:=Replace string:C233($_t_TextToaddtoAddress; Char:C90(9); " ")
	$_t_TextToaddtoAddress:=Replace string:C233($_t_TextToaddtoAddress; "  "; " ")  //Double spaces
	$_Bo_exit:=False:C215
	Repeat 
		If ($_t_TextToaddtoAddress#"")
			If ($_t_TextToaddtoAddress[[Length:C16($_t_TextToaddtoAddress)]]=" ")
				$_t_TextToaddtoAddress:=Substring:C12($_t_TextToaddtoAddress; 1; Length:C16($_t_TextToaddtoAddress)-1)
			Else 
				$_Bo_exit:=True:C214
			End if 
		End if 
	Until ($_t_TextToaddtoAddress="") | ($_Bo_exit)
	If ($_t_TextToaddtoAddress>"")
		$_Ptr_PointerTobuiltAddress->:=($_Ptr_PointerTobuiltAddress->)+$_t_TextToaddtoAddress
	End if 
	$_L_CurrentFieldOrderCharacter:=$_L_CurrentFieldOrderCharacter+1
	$_Txt_NextAddressOrderCharacter:=Substring:C12($_t_AddressFieldOrder; $_L_CurrentFieldOrderCharacter; 1)
	While (($_Txt_NextAddressOrderCharacter#"1") & ($_Txt_NextAddressOrderCharacter#"2") & ($_Txt_NextAddressOrderCharacter#"3") & ($_Txt_NextAddressOrderCharacter#"4") & ($_Txt_NextAddressOrderCharacter#"5") & ($_Txt_NextAddressOrderCharacter#"6") & ($_Txt_NextAddressOrderCharacter#"7") & ($_Txt_NextAddressOrderCharacter#"8") & ($_L_CurrentFieldOrderCharacter<=(Length:C16($_t_AddressFieldOrder))))  //..,, adds in carriage returns and commas etc
		IDLE:C311  // 03/04/03 pb
		If ($_t_TextToaddtoAddress>"")
			$_Ptr_PointerTobuiltAddress->:=$_Ptr_PointerTobuiltAddress->+$_Txt_NextAddressOrderCharacter
		End if 
		$_L_CurrentFieldOrderCharacter:=$_L_CurrentFieldOrderCharacter+1
		$_Txt_NextAddressOrderCharacter:=Substring:C12($_t_AddressFieldOrder; $_L_CurrentFieldOrderCharacter; 1)
	End while 
	$0:=$_L_CurrentFieldOrderCharacter
End if 
