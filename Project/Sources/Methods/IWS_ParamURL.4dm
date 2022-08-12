//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ParamURL
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
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2; $3; $t)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ParamURL")
// IWS_ParamURL
// read out data from URL (request string)
// $0 -> value found or default
// $1 -> text to search in
// $2 -> parameter name to look for
// $3 -> default


$0:=$3

$i:=Position:C15(($2+"="); $1)  // look for parameter
If ($i>0)  // did we find something ??
	$t:=Substring:C12($1; $i+Length:C16($2)+1)  // cut off begining part
	$i:=Position:C15(" "; $t)  // look for a space (end of URL)
	$j:=Position:C15("&"; $t)  // look for seperator to next parameter
	If (($j<$i) & ($j#0))  // we found seperator and before end of url ??
		$i:=$j  // swap values
	End if 
	If ($i>0)  // added 27-Mar-98, Ju
		$0:=Substring:C12($t; 1; $i-1)  // copy string for return
	Else 
		$0:=$t
	End if 
End if 
ERR_MethodTrackerReturn("IWS_ParamURL"; $_t_oldMethodName)