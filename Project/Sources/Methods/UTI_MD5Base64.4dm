//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_MD5Base64
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
	C_BLOB:C604($_blb_Digest)
	C_LONGINT:C283($_l_OffsetIndex; $_l_Position)
	C_TEXT:C284($_t_DigestText; $_t_oldMethodName; $_t_OriginalText; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_MD5Base64")

//UTI_MD5Base64


$_t_OriginalText:=$1
$_t_DigestText:=Generate digest:C1147($_t_OriginalText; MD5 digest:K66:1)

//$_t_DigestText:=MD5 Text($_t_OriginalText)

// Convert the hexadecimal string to a 16 byte unsigned char
SET BLOB SIZE:C606($_blb_Digest; 16)

$_l_Position:=1
For ($_l_OffsetIndex; 0; 15)
	$_blb_Digest{$_l_OffsetIndex}:=UTI_HexToDecimal(Substring:C12($_t_DigestText; $_l_Position; 2))
	$_l_Position:=$_l_Position+2
End for 
//
// Convert the blob to a base 64 encoded string
BASE64 ENCODE:C895($_blb_Digest)

// Convert the base 64 encoded blob back to a string
$_t_DigestText:=BLOB to text:C555($_blb_Digest; Mac text without length:K22:10)  //v11 Mac Text without length

// Remove the padding characters added by 4D
$_l_Position:=Position:C15("="; $_t_DigestText)
If ($_l_Position>0)
	$_t_DigestText:=Substring:C12($_t_DigestText; 1; $_l_Position-1)
End if 

$0:=$_t_DigestText
ERR_MethodTrackerReturn("UTI_MD5Base64"; $_t_oldMethodName)
