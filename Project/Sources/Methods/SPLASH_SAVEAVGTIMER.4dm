//%attributes = {}

If (False:C215)
	//Project Method Name:      SPLASH_SAVEAVGTIMER
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_SplashVariables)
	C_LONGINT:C283(<>_l_AvgStartTimeInSec; $_l_AvgStartTimeInSec; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_SplashDoc)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SPLASH_SAVEAVGTIMER")

//$_t_oldMethodName:=ERR_MethodTracker ("SPLASH_SAVEAVGTIMER") ` to spped up login

If (Count parameters:C259>0)
	$_l_AvgStartTimeInSec:=$1
Else 
	$_l_AvgStartTimeInSec:=BP_Timestamp-<>_l_AvgStartTimeInSec
End if 

$_t_SplashDoc:=Temporary folder:C486+"db_splash_variables.txt"

If (Test path name:C476($_t_SplashDoc)=Is a document:K24:1)
	$_ti_DocumentRef:=DB_OpenDocument($_t_SplashDoc)  // Select the document of your choice
	If (OK=1)  // If a document has been chosen
		CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
	End if 
Else 
	$_ti_DocumentRef:=DB_CreateDocument($_t_SplashDoc)
	If (OK=1)  // If a document has been chosen
		CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
	End if 
End if 

SET BLOB SIZE:C606($_blb_SplashVariables; 0)
VARIABLE TO BLOB:C532($_l_AvgStartTimeInSec; $_blb_SplashVariables; *)
If (BLOB size:C605($_blb_SplashVariables)>0)
	BLOB TO DOCUMENT:C526(Document; $_blb_SplashVariables)  // Load the document with new blob
End if 
If (OK=1)
	//OK
Else   // Handle error
	
End if 
//ERR_MethodTrackerReturn ("SPLASH_SAVEAVGTIMER";$_t_oldMethodName)
