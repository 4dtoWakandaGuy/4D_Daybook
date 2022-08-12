//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_PPChkStSing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 18:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	C_BOOLEAN:C305($0; $3; $4)
	C_LONGINT:C283($_l_UsageRow; $2)
	C_POINTER:C301($1; $5; $6)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PPChkStSing")
//Gen PPCheckStateSingle
If (Count parameters:C259<4)
	
	States_CUArr($1)
	
Else 
	If ($4) | (Count parameters:C259<6)
		States_CUArr($1)
	Else 
		States_CUArr($1; $5; $6)
	End if 
End if 
If (Count parameters:C259<6)
	$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; $2)
	If ($_l_UsageRow<1)
		If (Count parameters:C259=2)
			Gen_Alert("The current record State does not allow access to this Function"; "Cancel")
		Else 
			If ($3)
				Gen_Alert("The current record State does not allow access to this Function"; "Cancel")
			End if 
		End if 
		$0:=False:C215
	Else 
		$0:=True:C214
	End if 
Else 
	//use the array pointed to in $6
	$_l_UsageRow:=Find in array:C230($6->; $2)
	If ($_l_UsageRow<1)
		If ($3)
			Gen_Alert("The current record State does not allow access to this Function"; "Cancel")
		End if 
		$0:=False:C215
	Else 
		$0:=True:C214
	End if 
	
End if 
ERR_MethodTrackerReturn("Gen_PPChkStSing"; $_t_oldMethodName)