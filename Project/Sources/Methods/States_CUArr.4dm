//%attributes = {}
If (False:C215)
	//Project Method Name:      States_CUArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: States_CUArr
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_TableNumber; vStPos)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_StatusCode; vStPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States_CUArr")
If (Count parameters:C259<2)
	$_l_TableNumber:=Table:C252($1)
Else 
	$_l_TableNumber:=Table:C252($2)
End if 
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Undefined:C82(ST_ai_StatusUsage))
	ARRAY INTEGER:C220(ST_ai_StatusUsage; 0)
End if 

If ($1->="")
	If (Count parameters:C259<2)
		States_Start($1)
		
	Else 
		States_Start($1; $2)
	End if 
End if 
If (Count parameters:C259<3)
	If ([TABLE_RECORD_STATES:90]State_Reference:4#$1->)
		RELATE ONE:C42($1->)
	End if 
	If (vStPrev#[TABLE_RECORD_STATES:90]State_Reference:4)
		QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=("090"+[TABLE_RECORD_STATES:90]State_Reference:4))
		SELECTION TO ARRAY:C260([CODE_USES:91]Use:2; ST_ai_StatusUsage)
		vStPrev:=[TABLE_RECORD_STATES:90]State_Reference:4
		//$_t_StatusCode:=Substring($1->;4;5)  ```<<<<
		$_t_StatusCode:=Substring:C12($1->; 4; Length:C16($1->))
		vStPos:=Find in array:C230(<>SYS_at_RecStateCodes{$_l_TableNumber}; $_t_StatusCode)
	Else 
		vStPrev:=[TABLE_RECORD_STATES:90]State_Reference:4
		//$_t_StatusCode:=Substring($1->;4;5)
		$_t_StatusCode:=Substring:C12($1->; 4; Length:C16($1->))
		vStPos:=Find in array:C230(<>SYS_at_RecStateCodes{$_l_TableNumber}; $_t_StatusCode)
	End if 
	If (vStPos<0)
		vStPos:=0
	End if 
Else 
	If ([TABLE_RECORD_STATES:90]State_Reference:4#$1->)
		QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=$1->)
		
	End if 
	
	//we are getting information relating to a state
	QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=("090"+[TABLE_RECORD_STATES:90]State_Reference:4))
	SELECTION TO ARRAY:C260([CODE_USES:91]Use:2; $3->)
	
	//$_t_StatusCode:=Substring($1->;4;5)  ```<<<<
	$_t_StatusCode:=Substring:C12($1->; 4)
	//vStPos:=Find in array(◊aStCode{$_l_TableNumber};$_t_StatusCode)
	
End if 
ERR_MethodTrackerReturn("States_CUArr"; $_t_oldMethodName)
