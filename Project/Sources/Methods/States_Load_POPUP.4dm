//%attributes = {}
If (False:C215)
	//Project Method Name:      States_Load_POPUP
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
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_Index; $_l_TableNumber)
	C_POINTER:C301($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States_Load_POPUP")
//This loads the file states for this table into a popup
If (Count parameters:C259>=3)
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	
	
	$_l_TableNumber:=Table:C252($1)
	ARRAY TEXT:C222($2->; 0)
	ARRAY TEXT:C222($3->; 0)
	ARRAY TEXT:C222($2->; Size of array:C274(<>SYS_al_RecStateRestriction{$_l_TableNumber}))
	ARRAY TEXT:C222($3->; Size of array:C274(<>SYS_al_RecStateRestriction{$_l_TableNumber}))
	For ($_l_Index; 1; Size of array:C274(<>SYS_al_RecStateRestriction{$_l_TableNumber}))
		$2->{$_l_Index}:=<>SYS_at_RecStateNames{$_l_TableNumber}{$_l_Index}
		$3->{$_l_Index}:=<>SYS_at_RecStateCodes{$_l_TableNumber}{$_l_Index}
	End for 
	
	$4->:=Find in array:C230($3->; $1->)
	If ($4-><0)
		$4->:=0
	End if 
End if 
ERR_MethodTrackerReturn("States_Load_POPUP"; $_t_oldMethodName)
