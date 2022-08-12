//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_IPAddressToLongint
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
	ARRAY TEXT:C222($_at_AddressParts; 0)
	C_LONGINT:C283($_t_OutputString; $0)
	C_TEXT:C284($_t_Address; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_IPAddressToLongint")

// (PM) IWS_IPAddressToLongint
// Converts an IP address into a longint
// $1 = IP address
// $0 = Address as a longint


$_t_Address:=$1

ARRAY TEXT:C222($_at_AddressParts; 0)
STR_Text2Array($_t_Address; ->$_at_AddressParts; ".")

If (Size of array:C274($_at_AddressParts)=4)
	$_t_OutputString:=(Num:C11($_at_AddressParts{1}) << 24)+(Num:C11($_at_AddressParts{2}) << 16)+(Num:C11($_at_AddressParts{3}) << 8)+Num:C11($_at_AddressParts{4})
End if 


$0:=$_t_OutputString
ERR_MethodTrackerReturn("IWS_IPAddressToLongint"; $_t_oldMethodName)