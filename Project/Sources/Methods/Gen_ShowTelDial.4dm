//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ShowTelDial
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
	C_BOOLEAN:C305(<>DialSynch)
	C_LONGINT:C283($i; $Line1; $s)
	C_TEXT:C284($_t_oldMethodName; $1; $n)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ShowTelDial")
//Gen TelDial or something like that accessed from the [DIAL] button on the show t
$1:=Str_TelPrefStri($1)
PLUGCALL_Telephony("SCDD"; 2)


If ($s=0)
	$Line1:=-1
	Case of 
		: ($Line1=0)
			Gen_Alert("Please raise the handset and try again")
		: ($Line1=1)
			PLUGCALL_Telephony("SCDD"; 3)
			
		: ($Line1=2)
			Gen_Alert("Dialer not ready - Please try again")
			//Actually means the following but was unpredictable
			//Gen_Alert ("This phone is ringing.  Please answer it first.")
	End case 
Else 
	For ($i; 1; Length:C16($1))
		$n:=Substring:C12($1; $i; 1)
		If (($n#" ") & ($n#"-") & ($n#"/") & ($n#"(") & ($n#")"))
			If (<>DialSynch)
				PLUGCALL_Telephony("play"; 1)
				
			Else 
				PLUGCALL_Telephony("play"; 2)
			End if 
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("Gen_ShowTelDial"; $_t_oldMethodName)