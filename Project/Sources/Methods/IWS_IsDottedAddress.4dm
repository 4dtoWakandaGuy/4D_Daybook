//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_IsDottedAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_asOctet; 0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_AddressLength; $_l_CharacterIndex; $_l_Size)
	C_TEXT:C284($_t_Address; $_t_oldMethodName; $1; IWS_t_CurrentMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_IsDottedAddress")
//******************************************************************************
//
//Method: IWS_IsDottedAddress
//
//Written by  John Moore on 10/22/98
//
//Purpose: Returns whether an address passed as $1 is a
//dotted address
//
//$1 - text, address
//$0, boolean, is it in dotted form or not

IWS_t_CurrentMethodName:="IWS_IsDottedAddress"
//
//******************************************************************************



$_t_Address:=$1
$_l_AddressLength:=Length:C16($_t_Address)
$0:=True:C214
If ($_l_AddressLength>15) | ($_l_AddressLength<7)
	$0:=False:C215
Else 
	$_l_Size:=1
	ARRAY TEXT:C222($_at_asOctet; $_l_Size)
	For ($_l_CharacterIndex; 1; $_l_AddressLength)
		Case of 
			: ($_t_Address[[$_l_CharacterIndex]]=".")
				$_l_Size:=Size of array:C274($_at_asOctet)+1
				If ($_l_Size<=4)
					ARRAY TEXT:C222($_at_asOctet; $_l_Size)
				Else 
					$0:=False:C215
				End if 
			: (Position:C15($_t_Address[[$_l_CharacterIndex]]; "0123456789")>0)
				$_at_asOctet{$_l_Size}:=$_at_asOctet{$_l_Size}+$_t_Address[[$_l_CharacterIndex]]
				If (Length:C16($_at_asOctet{$_l_Size})>3)
					$0:=False:C215
				End if 
			Else 
				$0:=False:C215
		End case 
		If ($0=False:C215)
			$_l_CharacterIndex:=$_l_AddressLength+1
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("IWS_IsDottedAddress"; $_t_oldMethodName)