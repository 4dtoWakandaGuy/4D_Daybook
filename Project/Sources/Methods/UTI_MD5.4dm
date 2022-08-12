//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_MD5
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
	C_TEXT:C284($_t_oldMethodName; $0; $1; $tDigestText; $tOriginalText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_MD5")

//UTI_MD5


$_t_OriginalText:=$1
$_t_DigestText:=Generate digest:C1147($_t_OriginalText; MD5 digest:K66:1)

//$tDigestText:=MD5 Text($tOriginalText)

$0:=$tDigestText
ERR_MethodTrackerReturn("UTI_MD5"; $_t_oldMethodName)
