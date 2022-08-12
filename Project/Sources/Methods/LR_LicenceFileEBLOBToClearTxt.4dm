//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_LicenceFileEBLOBToClearTxt
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
	C_BLOB:C604($_blb_LicenceFile; $_blb_LicenceFilePlusKey; $_blb_PublicKey)
	C_LONGINT:C283($_l_DelmiterStart)
	C_POINTER:C301($_ptr_LicenceFileEncryptedBLOB; $1)
	C_TEXT:C284(<>KeyDelim; $_t_DelmiterKey; $_t_LicenceFileBLOBText; $_t_LicenceFileClearText; $_t_LicenceFilePlusKeyText; $_t_oldMethodName; $_t_PublicKeyText; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_LicenceFileEBLOBToClearTxt")

<>KeyDelim:="Wp4=md%y'Aoh8}#f$4he*6R1qL"
LR_Custom  //added 10/01/07 -kmw
//
$_ptr_LicenceFileEncryptedBLOB:=$1
//
//
//
//
$_blb_LicenceFilePlusKey:=$_ptr_LicenceFileEncryptedBLOB->
//
If (BLOB size:C605($_blb_LicenceFilePlusKey)=0)
	$_t_LicenceFileClearText:=""
Else 
	EXPAND BLOB:C535($_blb_LicenceFilePlusKey)
	//
	//
	$_t_LicenceFilePlusKeyText:=BLOB to text:C555($_blb_LicenceFilePlusKey; Mac text without length:K22:10)
	//
	$_t_DelmiterKey:=<>KeyDelim
	//
	$_l_DelmiterStart:=Position:C15($_t_DelmiterKey; $_t_LicenceFilePlusKeyText)
	//
	$_t_PublicKeyText:=Substring:C12($_t_LicenceFilePlusKeyText; 1; ($_l_DelmiterStart-1))
	$_t_LicenceFileBLOBText:=Substring:C12($_t_LicenceFilePlusKeyText; ($_l_DelmiterStart+Length:C16($_t_DelmiterKey)))
	//
	//
	TEXT TO BLOB:C554($_t_LicenceFileBLOBText; $_blb_LicenceFile; Mac text without length:K22:10)
	TEXT TO BLOB:C554($_t_PublicKeyText; $_blb_PublicKey; Mac text without length:K22:10)
	//
	DECRYPT BLOB:C690($_blb_LicenceFile; $_blb_PublicKey)
	//
	$_t_LicenceFileClearText:=BLOB to text:C555($_blb_LicenceFile; Mac text without length:K22:10)
	//
End if 


$0:=$_t_LicenceFileClearText
ERR_MethodTrackerReturn("LR_LicenceFileEBLOBToClearTxt"; $_t_oldMethodName)
