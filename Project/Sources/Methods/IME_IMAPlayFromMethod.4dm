//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_IMAPlayFromMethod
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
	C_LONGINT:C283($i; $iCP)
	C_TEXT:C284($_t_oldMethodName; $1; $sDQ; vMTitle2; vMTitle3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_IMAPlayFromMethod")
//IME_IMAPlayFromMethod
//Rollo 8/10/2004

//Allow an IMA Macro to be played from within a method
//Note that IME_IMAPlay expects vMTitle vars to have been set, so doesn't work


$iCP:=Count parameters:C259
vMTitle2:=""
$sDQ:=Char:C90(34)

If ($iCP>0)
	vMTitle2:=vMTitle2+"("
	For ($i; 1; $iCP)
		If ($i<$iCP)
			vMTitle2:=vMTitle2+$sDQ+${$iCP-1}+$sDQ+";"
		Else 
			vMTitle2:=vMTitle2+$sDQ+${$iCP-1}+$sDQ
		End if 
	End for 
	vMTitle2:=vMTitle2+")"
End if 
vMTitle3:=vMTitle2

IME_IMAPlay($1)
ERR_MethodTrackerReturn("IME_IMAPlayFromMethod"; $_t_oldMethodName)