//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Str FolderDiv
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str FolderDiv")
//Str FolderDiv - adds a : or \ to a path name if the path name is there & is nec
If (Count parameters:C259>=1)
	If ($1="")
		$0:=""
	Else 
		If (Is macOS:C1572)
			
			If (Substring:C12($1; Length:C16($1); 1)#":")
				$0:=$1+":"
			Else 
				$0:=$1
			End if 
		Else 
			If (Substring:C12($1; Length:C16($1); 1)#"\\")
				$0:=$1+"\\"
			Else 
				$0:=$1
			End if 
		End if 
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str FolderDiv"; $_t_oldMethodName)