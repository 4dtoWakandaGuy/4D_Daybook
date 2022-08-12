//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      VER_DBDeveloper
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_DBDeveloper")

If (Is macOS:C1572)
	
	$0:=Test path name:C476(Get 4D folder:C485+"dbdeveloper")=Is a document:K24:1
	If (Not:C34($0))
		$0:=Test path name:C476(Get 4D folder:C485+"dbdeveloper.txt")=Is a document:K24:1
	End if 
Else 
	$0:=Test path name:C476(Get 4D folder:C485+"dbdeveloper.txt")=Is a document:K24:1
End if 
ERR_MethodTrackerReturn("VER_DBDeveloper"; $_t_oldMethodName)