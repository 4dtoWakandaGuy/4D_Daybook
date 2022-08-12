//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ParamFORM
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
	C_LONGINT:C283($i; $j)
	C_TEXT:C284(<>STR_t_CR; $_t_oldMethodName; $0; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ParamFORM")
// IWS_ParamFORM
// read out data from FORM (request string)
// $0 -> parameter found or default
// $1 -> text to search in
// $2 -> parameter name to look for
// $3 -> default value


$0:=$3
$i:=Position:C15(($2+"="); $1)  // look for parameter
If ($i>0)  // did we found something ??
	$1:=Substring:C12($1; $i+Length:C16($2)+1)  // cut off begining part
	$i:=Position:C15("&"; $1)  // look for a space (end of URL)
	$j:=Position:C15(<>STR_t_CR; $1)  // look for seperator to next parameter
	If (($i<$j) & ($i>0))
		$j:=$i
	End if 
	//$0:=ITK_URL2Text (Substring($1;1;$j-1))  ` copy string for return
	$0:=STR_URLDecode(Substring:C12($1; 1; $j-1))  // copy string for return
End if 
ERR_MethodTrackerReturn("IWS_ParamFORM"; $_t_oldMethodName)