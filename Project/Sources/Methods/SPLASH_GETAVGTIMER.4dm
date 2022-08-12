//%attributes = {}
If (False:C215)
	//Project Method Name:      SPLASH_GETAVGTIMER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_SplashVariables)
	C_LONGINT:C283(<>_l_AvgStartTimeInSec; $_l_AvgStartTimeInSec; $_l_offset; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_SplashDoc)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_GETAVGTIMER")

$_t_SplashDoc:=Temporary folder:C486+"db_splash_variables.txt"
If (Test path name:C476($_t_SplashDoc)=Is a document:K24:1)
	$_ti_DocumentRef:=DB_OpenDocument($_t_SplashDoc)  // Select the document of your choice
	If (OK=1)  // If a document has been chosen
		CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
		DOCUMENT TO BLOB:C525(Document; $_blb_SplashVariables)  // Load the document
		If (OK=1)
			$_l_offset:=0
			BLOB TO VARIABLE:C533($_blb_SplashVariables; $_l_AvgStartTimeInSec; $_l_offset)
		Else 
			// Handle error
		End if 
	End if 
End if 

If ($_l_AvgStartTimeInSec=0)
	$_l_AvgStartTimeInSec:=60  //seconds
End if 

<>_l_AvgStartTimeInSec:=BP_Timestamp

$0:=$_l_AvgStartTimeInSec
ERR_MethodTrackerReturn("SPLASH_GETAVGTIMER"; $_t_oldMethodName)
