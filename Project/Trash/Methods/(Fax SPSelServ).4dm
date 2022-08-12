//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax SPSelServ
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
	C_LONGINT:C283(<>FaxServAddr; $e; FAX_Return)
	C_TEXT:C284(<>FaxServName; <>FaxServType; <>FaxServZone; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax SPSelServ")
//Fax SPSelServ
PLUGCALL_FAX("PickServer"; 2; ""; -><>FaxServName; -><>FaxServType; -><>FaxServZone; -><>FaxServAddr; ->FAX_Return)

$e:=FAX_Return
If ($e=0)
	[USER:15]Fax Server Name:220:=<>FaxServName
	[USER:15]Fax Server Type:221:=<>FaxServType
	[USER:15]Fax Server Zone:222:=<>FaxServZone
	[USER:15]Fax Server Addr:223:=<>FaxServAddr
Else 
	If (Fax_SPHandleErr($e))  //if fatal error
		Gen_Alert("The 4-Sight Fax software is not responding")
		[USER:15]Fax Server Name:220:=""
		[USER:15]Fax Server Type:221:=""
		[USER:15]Fax Server Zone:222:=""
		[USER:15]Fax Server Addr:223:=0
	Else 
		Gen_Confirm("Delete the previous Server settings?"; "Yes"; "No")
		If (OK=1)
			[USER:15]Fax Server Name:220:=""
			[USER:15]Fax Server Type:221:=""
			[USER:15]Fax Server Zone:222:=""
			[USER:15]Fax Server Addr:223:=0
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Fax SPSelServ"; $_t_oldMethodName)