//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_DeleteCheckStateSingle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 18:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_TableNumber; $_l_UsageRow)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_DeleteCheckStateSingle")
//Gen DeleteCheckStateSingle

$0:=True:C214
$_l_TableNumber:=Table:C252($1)
$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 10)
If ($_l_UsageRow>0)
	Gen_Alert("This record State does not allow Deletions"; "Cancel")
	$0:=False:C215
Else 
	If ((((<>SYS_al_RecStateRestriction{$_l_TableNumber}{vStPos}\4)%2)=1) | (((<>SYS_al_RecStateRestriction{$_l_TableNumber}{vStPos}\2)%2)=1))
		Gen_Alert("You do not have access to Delete records with this record State"; "Cancel")
		$0:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("Gen_DeleteCheckStateSingle"; $_t_oldMethodName)