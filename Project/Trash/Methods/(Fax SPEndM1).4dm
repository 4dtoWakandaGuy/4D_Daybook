//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax_SPEndM1
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
	C_LONGINT:C283($e; FAX_Return)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax_SPEndM1")
//Fax_SPEndM1 see alsp Fax_SPEnd

//$e:=SPSwitchPrinter(1)
PLUGCALL_FAX("SetDriver"; 2; ""; ->FAX_Return)
$e:=FAX_Return
If ($e#0)
	Gen_Alert("4-Sight Fax Error: Please use Chooser to reselect your printer")
End if 
ERR_MethodTrackerReturn("Fax_SPEndM1"; $_t_oldMethodName)