//%attributes = {}
If (False:C215)
	//Project Method Name:      DocNameFromPath
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 14:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Char; $_l_Length; $_l_Position)
	C_TEXT:C284($_t_DirectorySymbol; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DocNameFromPath")
//this method will extract a document name from a path

//$_t_DirectorySymbol:=DB_DirSymbol 


$_l_Length:=Length:C16($1)
$_l_Position:=0
For ($_l_Char; $_l_Length; 1; -1)
	If (Character code:C91($1[[$_l_Char]])=Character code:C91($_t_DirectorySymbol))
		$_l_Position:=$_l_Char
		$_l_Char:=0
	End if 
End for 
If ($_l_Position>0)
	$0:=Substring:C12($1; $_l_Position+1)
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("DocNameFromPath"; $_t_oldMethodName)