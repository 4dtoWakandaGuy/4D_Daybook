//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str RemQuote
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str RemQuote")
If (Count parameters:C259>=1)
	$0:=$1
	If (Length:C16($0)>1)
		If (Character code:C91(Substring:C12($0; 1; 1))=34)
			$0:=Substring:C12($0; 2; 32000)
		End if 
		If (Character code:C91(Substring:C12($0; Length:C16($0); 1))=34)
			$0:=Substring:C12($0; 1; Length:C16($0)-1)
		End if 
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str RemQuote"; $_t_oldMethodName)