//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_WDAV_EncodeB64
	//------------------ Method Notes ------------------
	// Method: WDAV_EncodeB64
	//---------------------------------------------------
	// Description:
	// Encode to Base64
	//
	//---------------------------------------------------
	// Parameters:
	// $0 - Base 64 Encoded string
	// $1 - Source string
	//---------------------------------------------------
	// By: Julien Feasson - 4D, Inc.
	//---------------------------------------------------
	
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:29`Method: Cal4D_iCal_WDAV_EncodeB64
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($i; $j)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $Buff)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_WDAV_EncodeB64")

$i:=1
$Buff:=Substring:C12($1; $i)

While ($i<=Length:C16($1))
	
	$0:=$0+Char:C90(Cal4D_iCal_WDAV_base64enc(Character code:C91($Buff[[$i]]) >> 2))
	If (Length:C16($1)-$i>0)
		$0:=$0+Char:C90(Cal4D_iCal_WDAV_base64enc(((Character code:C91($Buff[[$i]]) & 0x0003) << 4) | (Character code:C91($Buff[[$i+1]]) >> 4)))
	Else 
		$0:=$0+Char:C90(Cal4D_iCal_WDAV_base64enc((Character code:C91($Buff[[$i]]) & 0x0003) << 4))
	End if 
	If (Length:C16($1)-$i>=1)
		If (Length:C16($1)-$i>1)
			$0:=$0+Char:C90(Cal4D_iCal_WDAV_base64enc(((Character code:C91($Buff[[$i+1]]) & 0x000F) << 2) | (Character code:C91($Buff[[$i+2]]) >> 6)))
		Else 
			$0:=$0+Char:C90(Cal4D_iCal_WDAV_base64enc((Character code:C91($Buff[[$i+1]]) & 0x000F) << 2))
		End if 
		If (Length:C16($1)-$i>=2)
			$0:=$0+Char:C90(Cal4D_iCal_WDAV_base64enc(Character code:C91($Buff[[$i+2]]) & 0x003F))
		Else 
			$0:=$0+"="
		End if 
	Else 
		$0:=$0+"=="
	End if 
	$i:=$i+3
End while 
ERR_MethodTrackerReturn("Cal4D_iCal_WDAV_EncodeB64"; $_t_oldMethodName)