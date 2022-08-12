//%attributes = {}
If (False:C215)
	//Project Method Name:      FirstLetterWord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($l)
	C_TEXT:C284($_t_oldMethodName; $0; $1; $w)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FirstLetterWord")
If ($1#"")
	$w:=FirstWord($1)
	$l:=Length:C16($w)
	If (($l#Length:C16($1)) | ($l>3))
		$1:=Substring:C12($1; Length:C16($w)+2; 32000)
		$0:=$0+Substring:C12($w; 1; 1)
		While ($1#"")
			IDLE:C311  // 03/04/03 pb
			$w:=FirstWord($1)
			$1:=Substring:C12($1; Length:C16($w)+2; 32000)
			$0:=$0+Substring:C12($w; 1; 1)
		End while 
	Else 
		$0:=$1
	End if 
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("FirstLetterWord"; $_t_oldMethodName)