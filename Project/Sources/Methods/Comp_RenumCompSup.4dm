//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_RenumCompSup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/11/2009 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $NewSuperiorCompanyCode; $OldSuperiorCompanyCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_RenumCompSup")

//Comp_RenumCompSup
//Added 25/02/09 -kmw

//Resets company superiors.

//At time of writing only called from "Comp_RenumApp" in a new process (to ensure current company record and selection not effected).


$NewSuperiorCompanyCode:=$1

$OldSuperiorCompanyCode:=$2

READ WRITE:C146([COMPANIES:2])
QUERY:C277([COMPANIES:2]; [COMPANIES:2]Superior:34=$OldSuperiorCompanyCode)

Gen_AppToSel(->[COMPANIES:2]; ->[COMPANIES:2]Superior:34; $NewSuperiorCompanyCode)

UNLOAD RECORD:C212([COMPANIES:2])
READ ONLY:C145([COMPANIES:2])
ERR_MethodTrackerReturn("Comp_RenumCompSup"; $_t_oldMethodName)