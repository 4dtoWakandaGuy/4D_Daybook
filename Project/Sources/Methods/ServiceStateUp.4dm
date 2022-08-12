//%attributes = {}
If (False:C215)
	//Project Method Name:      ServiceStateUp
	//------------------ Method Notes ------------------
	//service calls TitUp
	//C_LONGINT($1)
	//$1=Current State Code
	//$2:=Variable to put state name into
	//`$3=pointer to resolved status variable or field
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 12:56`Method: ServiceStateUp
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_State; $_t_StateNEW)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ServiceStateUp")

If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Count parameters:C259>=1)
	$_t_State:=$1->
Else 
	$_t_State:=[SERVICE_CALLS:20]Table_State:29
End if 
$_t_StateNEW:=servicesettablestate(1; $_t_State)
$1->:=$_t_StateNEW
//Here set the title
// use preference to set the 'resolved' status
$3->:=SVS_SetResolved($_t_StateNEW)
$2->:=SVS_GetStateName(->$_t_StateNEW; $3->)
ERR_MethodTrackerReturn("ServiceStateUp"; $_t_oldMethodName)
