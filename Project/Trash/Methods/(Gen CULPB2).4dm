//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_CULPB2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CU_abo_CodeUsed;0)
	ARRAY INTEGER:C220($_ai_CodesUses; 0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	C_LONGINT:C283($_l_Index; $2; vAdd)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_UniqueCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CULPB2")
//Gen_CULPB2 - repeat of middle section of Gen_CULPB

$_t_UniqueCode:=String:C10(Table:C252($1))
$_t_UniqueCode:=("0"*(3-Length:C16($_t_UniqueCode)))+$_t_UniqueCode+$1->
QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_UniqueCode)
If (Records in selection:C76([CODE_USES:91])>0)
	ARRAY INTEGER:C220($_ai_CodesUses; Records in selection:C76([CODE_USES:91]))
	SELECTION TO ARRAY:C260([CODE_USES:91]Use:2; $_ai_CodesUses)
	For ($_l_Index; 1; $2)
		If (Find in array:C230($_ai_CodesUses; $_l_Index)>0)
			CU_ai_CodeUsed{$_l_Index}:=1
			CU_abo_CodeUsed{$_l_Index}:=True:C214
		Else 
			CU_ai_CodeUsed{$_l_Index}:=0
			CU_abo_CodeUsed{$_l_Index}:=False:C215
		End if 
	End for 
Else 
	If (vAdd=1)
		For ($_l_Index; 1; $2)
			CU_ai_CodeUsed{$_l_Index}:=1
			CU_abo_CodeUsed{$_l_Index}:=True:C214
		End for 
	Else 
		For ($_l_Index; 1; $2)
			CU_ai_CodeUsed{$_l_Index}:=0
			CU_abo_CodeUsed{$_l_Index}:=False:C215
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_CULPB2"; $_t_oldMethodName)
