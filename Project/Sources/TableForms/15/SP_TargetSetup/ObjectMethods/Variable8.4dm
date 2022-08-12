If (False:C215)
	//object Name: [USER]SP_TargetSetup.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SP_ad_PeriodFromDate;0)
	//ARRAY DATE(SP_ad_PeriodToDate;0)
	//ARRAY LONGINT(SP_al_PeriodIDs;0)
	C_DATE:C307($_d_DateFrom; $_d_DateFrom2; $_d_DateTo; $_d_DateTo2)
	C_LONGINT:C283($_l_OK; $_l_PeriodRow; $_l_PeriodRow2; SP_l_BasePeriod; SP_l_Continue; SP_l_SPeriodFromID; SP_l_SPeriodToID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_TargetSetup.Variable8"; Form event code:C388)
$_l_OK:=0
If (SP_l_SPeriodFromID>0) & (SP_l_SPeriodToID>0)
	If (SP_l_BasePeriod>0)
		//Check_Period is included
		$_l_PeriodRow:=Find in array:C230(SP_al_PeriodIDs; SP_l_BasePeriod)
		$_d_DateFrom:=SP_ad_PeriodFromDate{$_l_PeriodRow}
		$_d_DateTo:=SP_ad_PeriodToDate{$_l_PeriodRow}
		$_l_PeriodRow2:=Find in array:C230(SP_al_PeriodIDs; SP_l_SPeriodFromID)
		$_d_DateFrom2:=SP_ad_PeriodFromDate{$_l_PeriodRow2}
		$_d_DateTo2:=SP_ad_PeriodToDate{$_l_PeriodRow2}
		If ($_d_DateFrom2<=$_d_DateFrom)
			$_l_PeriodRow2:=Find in array:C230(SP_al_PeriodIDs; SP_l_SPeriodToID)
			$_d_DateFrom2:=SP_ad_PeriodFromDate{$_l_PeriodRow2}
			$_d_DateTo2:=SP_ad_PeriodToDate{$_l_PeriodRow2}
			If ($_d_DateTo2>=$_d_DateTo)
				$_l_OK:=1
			Else 
				Gen_Confirm("The range of periods does not include the original record"; "Continue"; "Cancel")
				If (OK=1)
					$_l_OK:=1
				End if 
			End if 
		Else 
			Gen_Confirm("The range of periods does not include the original record"; "Continue"; "Cancel")
			If (OK=1)
				$_l_OK:=1
			End if 
		End if 
		
		
	Else 
		$_l_OK:=1
	End if 
	
Else 
	$_l_OK:=0
	Gen_Alert("You must select from and to periods")
End if 
If ($_l_OK>0)
	SP_l_Continue:=1
	CANCEL:C270
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SP_TargetSetup.Variable8"; $_t_oldMethodName)
