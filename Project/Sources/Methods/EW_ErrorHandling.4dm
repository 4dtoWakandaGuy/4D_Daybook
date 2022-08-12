//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ErrorHandling
	//------------------ Method Notes ------------------
	// EW_ErrorHandling
	// 24/10/02 PB
	// Tracks errors in the Expoer Wizard
	// parameters: $1=True if it is a fatal error (i.e., exporting cannot continue
	//            for the current export -- not necessarily for the entire project)
	//            False if it is a non-fatal error
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($1; EW_bo_Continue; yFatalError)
	C_LONGINT:C283(EW_iErrorcount)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ErrorHandling")

EW_iErrorcount:=EW_iErrorcount+1


If ((EW_iErrorcount>[EW_ExportProjects:117]NonFatalErrorsAllowed:27) | ($1=True:C214))
	EW_bo_Continue:=False:C215
	If ($1)
		yFatalError:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("EW_ErrorHandling"; $_t_oldMethodName)