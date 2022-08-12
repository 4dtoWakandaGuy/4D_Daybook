//%attributes = {}
If (False:C215)
	//Project Method Name:      MailP_Ready
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
	_O_C_INTEGER:C282($n)
	C_LONGINT:C283(bd1; bd2; cEnvelopes; cExport; ch5; cLabels; cLetters; cList; cMerged; cOC; cPreview)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MailP_Ready")
$n:=0
If (ch5=1)
	$n:=$n+2
End if 
If (cEnvelopes=1)
	$n:=$n+1
End if 
If (cExport=1)
	$n:=$n+1
End if 
If (cLabels=1)
	$n:=$n+1
End if 
If (cPreview=1)
	$n:=$n+1
End if 
If (cOC=1)
	$n:=$n+1
End if 
If (cLetters=1)
	$n:=$n+1
End if 
If (cMerged=1)
	$n:=$n+1
End if 
If (cList=1)
	$n:=$n+1
End if 
If (bd1=1)
	$n:=$n+1
End if 
If (bd2=1)
	$n:=$n+1
End if 
If ($n>1)
	Gen_Confirm($1; "Yes"; "No")
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("MailP_Ready"; $_t_oldMethodName)