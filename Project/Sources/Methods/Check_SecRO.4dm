//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_SecRO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(<>SYS_at_RecStateCodes;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($n)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $NewOrd; $ns; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_SecRO")
//Check_Sec Read Only only
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (DB_t_CurrentFormUsage="Job")
	$n:=26
Else 
	$n:=24
End if 
$ns:=("0"*(3-Length:C16(String:C10($n))))+String:C10($n)

If (Size of array:C274(<>SYS_at_RecStateCodes{$n})>2)
	$NewOrd:=$ns+<>SYS_at_RecStateCodes{$n}{3}
Else 
	$NewOrd:=$ns+"nZZZ"
End if 
If (((<>SYS_al_RecStateRestriction{$n}{vStPos}\2)%2)=1)
	Gen_Alert("You cannot modify this field"; "Cancel")
	$1->:=Old:C35($1->)
	OK:=0
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("Check_SecRO"; $_t_oldMethodName)