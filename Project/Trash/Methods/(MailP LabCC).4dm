//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MailP_LabCC
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
	C_LONGINT:C283(cNAA)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_LabCC")

If (cNAA=1)
	$1->:=[COMPANIES:2]Company_Code:1
	$2->:=[CONTACTS:1]Contact_Code:2
	If ([CONTACTS:1]Status:14#"")
		$2->:=$2->+"   "+[CONTACTS:1]Status:14
	Else 
		$2->:=$2->+"   "+[COMPANIES:2]Status:12
	End if 
End if 
ERR_MethodTrackerReturn("MailP_LabCC"; $_t_oldMethodName)