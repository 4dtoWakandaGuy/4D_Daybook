//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name: Object Name:      DB_OutputForm.oAccDateTo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($CurrentText)
	//C_UNKNOWN($Len)
	//C_UNKNOWN($Len2)
	//C_UNKNOWN($oldMethodName)
	//C_UNKNOWN($pos)
	//C_UNKNOWN($sE)
	//C_UNKNOWN($TablePtr)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	//ARRAY TEXT(ACC_at_PeriodtoCode;0)
	C_BOOLEAN:C305(LAY_b_FiltersActive; Lay_b_UpdateFilters)
	C_LONGINT:C283($_l_FormEvent; DB_L_ClearFiltersButton; DB_l_CurrentDisplayedForm)
	C_TEXT:C284(DB_t_CurrentContext)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("___Orphan___4291")

$oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oAccDateTo"; Form event code:C388)

$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On After Keystroke:K2:26)
		$sE:=Keystroke:C390
		If (Character code:C91($sE)#Backspace:K15:36)
			$CurrentText:=Get edited text:C655
			$Len:=Length:C16($CurrentText)
			$pos:=Find in array:C230(ACC_at_PeriodtoCode; $CurrentText+"@")
			If ($Pos>0)
				ACC_at_PeriodtoCode{0}:=ACC_at_PeriodtoCode{$Pos}
				$Len2:=Length:C16(ACC_at_PeriodtoCode{0})
				HIGHLIGHT TEXT:C210(ACC_at_PeriodtoCode{0}; $Len+1; $Len2+1)
				LAY_b_FiltersActive:=True:C214
				Lay_b_UpdateFilters:=True:C214
				$pos:=Find in array:C230(ACC_at_PeriodFromCode; $CurrentText)
				If ($Pos>0)
					//Lay_b_UpdateFilters:=False
					SEL_CurrentRecordSelection
					$TablePtr:=Table:C252(DB_l_CurrentDisplayedForm)
					SRCH_Applyfilterstoselection($TablePtr)
					DB_SetWindowTitle(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
					OBJECT SET VISIBLE:C603(*; "OFILTERSACTIVETEXT"; True:C214)
					OBJECT SET ENABLED:C1123(DB_L_ClearFiltersButton; True:C214)
				End if 
			Else 
				ACC_at_PeriodtoCode{0}:=Substring:C12($CurrentText; 1; $Len-1)
				
			End if 
		End if 
	: ($_l_FormEvent=On Losing Focus:K2:8)
		If (ACC_at_PeriodtoCode{0}="")
			ACC_at_PeriodtoCode{0}:=ACC_at_PeriodtoCode{1}
		End if 
		LAY_b_FiltersActive:=True:C214
		Lay_b_UpdateFilters:=True:C214
	: ($_l_FormEvent=On Clicked:K2:4)
		If (ACC_at_PeriodtoCode{0}="")
			ACC_at_PeriodtoCode{0}:=ACC_at_PeriodtoCode{1}
		End if 
		LAY_b_FiltersActive:=True:C214
		Lay_b_UpdateFilters:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oAccDateTo"; $OldMethodName)