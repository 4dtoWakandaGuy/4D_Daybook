//%attributes = {}

If (False:C215)
	//Project Method Name:      AA_GetNextIDinMethod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $3)
	C_LONGINT:C283($_l_Maximum; $_l_Minimum; $_l_TableNumber; $0; $2)
	C_POINTER:C301($_ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_GetNextIDinMethod")

//$_t_oldMethodName:=ERR_MethodTracker ("AA_GetNextIDinMethod")
//AA_Getnextidinmethod
//call this method when you are calling AA_getNextID not in a trigger.
//Make sure that the calling method CLEARS the semphore that this sets.

If (In transaction:C397)
	//TRACE
	READ ONLY:C145([IDENTIFIERS:16])
	READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
End if 

$0:=0
If (Not:C34(<>SYS_bo_QuitCalled))
	Case of 
		: (Count parameters:C259=1)
			$0:=AA_GetNextID($1)
		: (Count parameters:C259=2)
			$0:=AA_GetNextID($1; $2)
		: (Count parameters:C259=3)
			$0:=AA_GetNextID($1; $2; $3)
		: (Count parameters:C259=4)
			//TRACE
			
			$0:=AA_GetNextID($1; $2; $3)
		Else 
			Gen_Alert("This method has been called with an incorrect number of parameters")
			$0:=0
	End case 
	
	AA_CheckFileUnlocked($1)
Else 
	
	//(Random%(End–Start+1))+Start
	
	$_l_TableNumber:=Table:C252($1)
	$_ptr_Table:=Table:C252($_l_TableNumber)
	$_l_Minimum:=Records in table:C83($_ptr_Table->)
	If ($_l_Minimum=0)
		$_l_Minimum:=1
	End if 
	$_l_Maximum:=$_l_Minimum+1000000
	$0:=Random:C100%($_l_Maximum-$_l_Minimum)+$_l_Minimum
	
End if 
//ERR_MethodTrackerReturn ("AA_GetNextIDinMethod";$_t_oldMethodName)
