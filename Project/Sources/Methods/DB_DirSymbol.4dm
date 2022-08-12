//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DirSymbol
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DirSymbol")
$0:=Folder separator:K24:12
If (False:C215)
	If (Is macOS:C1572)
		$0:=":"
	Else 
		$0:="\\"
	End if 
End if 
ERR_MethodTrackerReturn("DB_DirSymbol"; $_t_oldMethodName)