//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str StripDocNam
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($l)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str StripDocNam")
//Str StripDocName - removes the Document name from the path leaving just the path
If (Count parameters:C259>=1)
	$l:=Length:C16($1)
	If (Is macOS:C1572)
		While ((Substring:C12($1; $l; 1)#":") & ($l>0))
			IDLE:C311  // 7/04/03 pb
			$l:=$l-1
		End while 
	Else 
		While ((Substring:C12($1; $l; 1)#"\\") & ($l>0))
			IDLE:C311  // 7/04/03 pb
			$l:=$l-1
		End while 
	End if 
	$0:=Substring:C12($1; 1; $l-1)
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str StripDocNam"; $_t_oldMethodName)