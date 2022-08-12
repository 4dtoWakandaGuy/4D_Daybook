//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Directory Symbol
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:03
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


$_t_oldMethodName:=ERR_MethodTracker("Directory Symbol")
$0:=Folder separator:K24:12  //DB_DirSymbol 

If (False:C215)
	If (Is macOS:C1572)
		$0:=":"
	Else 
		
		$0:="\\"
	End if 
End if 
ERR_MethodTrackerReturn("Directory Symbol"; $_t_oldMethodName)