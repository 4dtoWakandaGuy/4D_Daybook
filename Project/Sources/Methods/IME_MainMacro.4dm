//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_MainMacro
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
	C_BOOLEAN:C305($2; $bCheckDirectSecurity)
	C_TEXT:C284($_t_oldMethodName; $1; $tDirect; IME_t_Result)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_MainMacro")
//IME_MainMacro
//Rollo 2/6/2004

//Deliver an IMA Macro as a web page



$tDirect:=$1
If ($tDirect#"IMA @")
	$tDirect:="IMA "+Substring:C12($tDirect; 1; 25)
End if 

If (Count parameters:C259>1)
	$bCheckDirectSecurity:=$2
Else 
	$bCheckDirectSecurity:=True:C214
End if 

If ($bCheckDirectSecurity)  //only allow macros that have D for Direct in their Keystroke field
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$tDirect; *)
	QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Keystroke:3="D")
	
	If (Records in selection:C76([SCRIPTS:80])>0)
		Macro2($tDirect)
	Else 
		Macro2("IMA Error2")
	End if 
	
Else 
	Macro2($tDirect)
End if 


If (IME_t_Result="")
	Macro2("IMA Error3")
End if 
ERR_MethodTrackerReturn("IME_MainMacro"; $_t_oldMethodName)