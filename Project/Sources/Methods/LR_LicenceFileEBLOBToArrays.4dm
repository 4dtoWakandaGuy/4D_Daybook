//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_LicenceFileEBLOBToArrays
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
	C_BLOB:C604($_blb_LicenceFileBLOB; $_blb_LicenceFIlePlusKey; $_blb_PublicKey)
	C_LONGINT:C283($_l_DelimiterStart; $_l_Offset)
	C_POINTER:C301($_ptr_LicenceFileEncrypted; $_ptr_LicNonStdAttribNameArray; $_ptr_LicNonStdAttribValueArray; $_ptr_LicStdAttribNameArray; $_ptr_LicStdAttribValueArray; $_ptr_ModNonStdAttribNameArray; $_ptr_ModNonStdAttribValueArray; $_ptr_ModStdAttribNameArray; $_ptr_ModStdAttribValueArray; $1; $2)
	C_POINTER:C301($3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Delimiter; $_t_LicenceFileBLOBTEXT; $_t_LicenceFileClearText; $_t_LicenceFilePlusKeyText; $_t_oldMethodName; $_t_PublicKeyText; KeyDelim; vErrorMessage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_LicenceFileEBLOBToArrays")

//
LR_Custom  //added 10/01/07 -kmw
//
vErrorMessage:=""
//
$_ptr_LicenceFileEncrypted:=$1
//
//
$_ptr_LicStdAttribNameArray:=$2
$_ptr_LicStdAttribValueArray:=$3
//
$_ptr_LicNonStdAttribNameArray:=$4
$_ptr_LicNonStdAttribValueArray:=$5
//
$_ptr_ModStdAttribNameArray:=$6
$_ptr_ModStdAttribValueArray:=$7
//
$_ptr_ModNonStdAttribNameArray:=$8
$_ptr_ModNonStdAttribValueArray:=$9
//
//
$_blb_LicenceFIlePlusKey:=$_ptr_LicenceFileEncrypted->
//
If (BLOB size:C605($_blb_LicenceFIlePlusKey)=0)
	$_t_LicenceFileClearText:=""
Else 
	EXPAND BLOB:C535($_blb_LicenceFIlePlusKey)
	//
	//
	$_t_LicenceFilePlusKeyText:=BLOB to text:C555($_blb_LicenceFIlePlusKey; Mac text without length:K22:10)
	//
	$_t_Delimiter:=KeyDelim
	//
	$_l_DelimiterStart:=Position:C15($_t_Delimiter; $_t_LicenceFilePlusKeyText)
	//
	$_t_PublicKeyText:=Substring:C12($_t_LicenceFilePlusKeyText; 1; ($_l_DelimiterStart-1))
	$_t_LicenceFileBLOBTEXT:=Substring:C12($_t_LicenceFilePlusKeyText; ($_l_DelimiterStart+Length:C16($_t_Delimiter)))
	//
	//
	TEXT TO BLOB:C554($_t_LicenceFileBLOBTEXT; $_blb_LicenceFileBLOB; Mac text without length:K22:10)
	TEXT TO BLOB:C554($_t_PublicKeyText; $_blb_PublicKey; Mac text without length:K22:10)
	//
	DECRYPT BLOB:C690($_blb_LicenceFileBLOB; $_blb_PublicKey)
	//
	//$_t_LicenceFileClearText:=BLOB to text($_blb_LicenceFileBLOB;Text without length )
	
	$_l_Offset:=0
	
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; $_ptr_LicStdAttribNameArray->; $_l_Offset)
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; $_ptr_LicStdAttribValueArray->; $_l_Offset)
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; $_ptr_LicNonStdAttribNameArray->; $_l_Offset)
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; $_ptr_LicNonStdAttribValueArray->; $_l_Offset)
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; $_ptr_ModStdAttribNameArray->; $_l_Offset)
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; $_ptr_ModStdAttribValueArray->; $_l_Offset)
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; $_ptr_ModNonStdAttribNameArray->; $_l_Offset)
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; $_ptr_ModNonStdAttribValueArray->; $_l_Offset)
	
	BLOB TO VARIABLE:C533($_blb_LicenceFileBLOB; vErrorMessage; $_l_Offset)
	//
End if 
ERR_MethodTrackerReturn("LR_LicenceFileEBLOBToArrays"; $_t_oldMethodName)
