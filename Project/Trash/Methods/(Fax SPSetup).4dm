//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax SPSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(<>FaxServAddr; $e; FAX_Return)
	C_TEXT:C284(<>FaxServName; <>FaxServType; <>FaxServZone; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax SPSetup")
//Fax SPSetup
$0:=True:C214
//#Checking if Server is still valid
PLUGCALL_FAX("SetServer"; 2; ""; -><>FaxServName; -><>FaxServType; -><>FaxServZone; -><>FaxServAddr; ->FAX_Return)

$e:=FAX_Return
//If ($e#0) `already picked if doesn;t work - due to True param above
//  $e:=SPPickServer (◊FaxServName;◊FaxServType;◊FaxServZone;◊FaxServAddr)  `if no
If ($e#0)  //Server is not there, User should check it out
	$0:=False:C215
End if 
//End if
ERR_MethodTrackerReturn("Fax SPSetup"; $_t_oldMethodName)