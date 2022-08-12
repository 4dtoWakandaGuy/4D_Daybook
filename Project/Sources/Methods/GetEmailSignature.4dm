//%attributes = {}
If (False:C215)
	//Project Method Name:      GetEmailSignature
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>DefSignature; <>Per_at_PersonnelNames_EmailSign; <>UserGr_EmailSig; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GetEmailSignature")
Case of   //Reply To address
	: (<>Per_at_PersonnelNames_EmailSign#"")
		$0:=<>Per_at_PersonnelNames_EmailSign
	: (<>UserGr_EmailSig#"")
		$0:=<>UserGr_EmailSig
	Else 
		$0:=<>DefSignature
End case 
ERR_MethodTrackerReturn("GetEmailSignature"; $_t_oldMethodName)