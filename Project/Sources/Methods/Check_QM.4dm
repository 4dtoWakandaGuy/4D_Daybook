//%attributes = {}
If (False:C215)
	//Project Method Name:      Check QM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>wildCard; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check QM"; 0; $1+"Wildcard"+<>wildCard)

//this method replaces alternative wild cards

If (Length:C16($1)>255)
	$0:=Substring:C12($1; 1; 255)
Else 
	$0:=$1
End if 

If (<>WildCard#"")
	If ((Substring:C12($0; Length:C16($0); 1))=<>WildCard)
		$0:=Substring:C12($0; 1; Length:C16($0)-1)+"@"
	End if 
	If ((Substring:C12($0; 1; 1))=<>WildCard)
		$0:="@"+Substring:C12($0; 2; 32000)
	End if 
End if 
ERR_MethodTrackerReturn("Check QM"; $_t_oldMethodName)
