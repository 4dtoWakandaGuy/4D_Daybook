//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_PictCode11
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

$_t_oldMethodName:=ERR_MethodTracker("Tel_PictCode11")

If ($1="@.@")
	$1:=Substring:C12($0; 1; 12)
Else 
	If (Length:C16($1)>8)
		$0:=Substring:C12($1; 1; 8)+"."+Substring:C12($1; 9; 3)+("X"*(11-Length:C16($1)))
	Else 
		$0:=$1+".VOX"
	End if 
End if 
ERR_MethodTrackerReturn("Tel_PictCode11"; $_t_oldMethodName)