//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen CULPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/02/2010 19:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CU_abo_CodeUsed;0)
	ARRAY INTEGER:C220($_ai_CodesUses; 0)
	//ARRAY INTEGER(CU_ai_CodeNo;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	C_LONGINT:C283($_l_Index; $2; $CodeNo; vAdd)
	C_POINTER:C301($1; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_UniqueCode; $4; $5; $6; $7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen CULPB")


//C_TEXT(${})
ARRAY TEXT:C222(CU_at_CodeUse; 0)
ARRAY INTEGER:C220(CU_ai_CodeUsed; 0)
ARRAY BOOLEAN:C223(CU_abo_CodeUsed; 0)
ARRAY INTEGER:C220(CU_ai_CodeNo; 0)
For ($_l_Index; 4; Count parameters:C259)
	$CodeNo:=$3->{$_l_Index-3}
	
	APPEND TO ARRAY:C911(CU_at_CodeUse; ${$_l_Index})
	APPEND TO ARRAY:C911(CU_ai_CodeNo; $CodeNo)
	
	Case of 
		: (${$_l_Index}="Contacts")
			//CU_ai_CodeNo{Size of array(CU_ai_CodeNo)}:=1
		: (${$_l_Index}="Companies")
			//CU_ai_CodeNo{Size of array(CU_ai_CodeNo)}:=2
		: (${$_l_Index}="Orders")
			//CU_ai_CodeNo{Size of array(CU_ai_CodeNo)}:=4
	End case 
	
End for 
ARRAY INTEGER:C220(CU_ai_CodeUsed; Size of array:C274(CU_at_CodeUse))
ARRAY BOOLEAN:C223(CU_abo_CodeUsed; Size of array:C274(CU_at_CodeUse))
//Repeated in Gen_CULPB2 down to the Sort
$_t_UniqueCode:=String:C10(Table:C252($1))
$_t_UniqueCode:=("0"*(3-Length:C16($_t_UniqueCode)))+$_t_UniqueCode+$1->
QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UniqueCode)
If (Records in selection:C76([CODE_USES:91])>0)
	ARRAY INTEGER:C220($_ai_CodesUses; 0)
	SELECTION TO ARRAY:C260([CODE_USES:91]Use:2; $_ai_CodesUses)
	For ($_l_Index; 1; Size of array:C274(CU_ai_CodeNo))
		If (Find in array:C230($_ai_CodesUses; CU_ai_CodeNo{$_l_Index})>0)
			CU_ai_CodeUsed{$_l_Index}:=1
			CU_abo_CodeUsed{$_l_Index}:=True:C214
		Else 
			CU_ai_CodeUsed{$_l_Index}:=0
			CU_abo_CodeUsed{$_l_Index}:=False:C215
		End if 
	End for 
Else 
	If (vAdd=1)
		For ($_l_Index; 1; Size of array:C274(CU_ai_CodeNo))
			CU_ai_CodeUsed{$_l_Index}:=1
			CU_abo_CodeUsed{$_l_Index}:=True:C214
		End for 
	Else 
		For ($_l_Index; 1; Size of array:C274(CU_ai_CodeNo))
			CU_ai_CodeUsed{$_l_Index}:=0
			CU_abo_CodeUsed{$_l_Index}:=False:C215
		End for 
	End if 
End if 
SORT ARRAY:C229(CU_at_CodeUse; CU_ai_CodeNo; CU_ai_CodeUsed; CU_abo_CodeUsed; >)
ERR_MethodTrackerReturn("Gen CULPB"; $_t_oldMethodName)
