If (False:C215)
	//object Name: Object Name:      DB_OutputForm.oFilterDD2Object
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/06/2013 13:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_FromDates; 0)
	//ARRAY DATE(ACC_ad_PeriodFromFromDate;0)
	//ARRAY DATE(ACC_ad_PeriodFromToDate;0)
	//ARRAY DATE(ACC_ad_PeriodToFromDate;0)
	//ARRAY DATE(ACC_ad_PeriodToToDate;0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(ACC_at_ContextualPeriodF;0)
	//ARRAY TEXT(ACC_at_PeriodFromCode;0)
	//ARRAY TEXT(ACC_at_PeriodFromName;0)
	//ARRAY TEXT(ACC_at_PeriodToCode;0)
	//ARRAY TEXT(ACC_at_PeriodToName;0)
	C_BOOLEAN:C305(LAY_bo_FiltersActive; Lay_bo_UpdateFilters)
	C_LONGINT:C283($_l_event; $_l_NumberofPeriods; $_l_offset; $_l_PeriodRow; ACC_l_ContextualFilterFrom; ACC_l_ContextualFilterTo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oAccDateFromContextualPeriods"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (ACC_at_ContextualPeriodF>0)
			If (ACC_at_ContextualPeriodF=Size of array:C274(ACC_at_ContextualPeriodF))
				$_l_NumberofPeriods:=Gen_RequestAmount("Enter the number of periods before the current period"; Is longint:K8:6; 0; "Continue"; "Cancel")
				ACC_al_ContextualPeriodF{ACC_at_ContextualPeriodF}:=$_l_NumberofPeriods
			End if 
			$_l_offset:=ACC_al_ContextualPeriodF{ACC_at_ContextualPeriodF}
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
			If (Records in selection:C76([PERIODS:33])>0)
				SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
				SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
				If (($_l_offset+1)<Size of array:C274($_ad_FromDates))
					If (Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_offset+1})>0)
						ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{$_l_offset+1})
					Else 
						QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_at_PeriodCodes{$_l_offset+1})
						INSERT IN ARRAY:C227(ACC_at_PeriodFromName; 1; 1)
						ACC_at_PeriodFromName{1}:=[PERIODS:33]Period_Name:2
						INSERT IN ARRAY:C227(ACC_at_PeriodFromCode; 1; 1)
						ACC_at_PeriodFromCode{1}:=[PERIODS:33]Period_Code:1
						INSERT IN ARRAY:C227(ACC_ad_PeriodFromFromDate; 1; 1)
						ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]From_Date:3
						INSERT IN ARRAY:C227(ACC_ad_PeriodFromToDate; 1; 1)
						ACC_ad_PeriodFromFromDate{1}:=[PERIODS:33]To_Date:4
						ACC_at_PeriodFromCode:=1
					End if 
					
					
				Else 
					ACC_at_PeriodFromCode:=Find in array:C230(ACC_at_PeriodFromCode; $_at_PeriodCodes{1})
				End if 
				ACC_at_PeriodFromCode{0}:=ACC_at_PeriodFromCode{ACC_at_PeriodFromCode}
				ACC_l_ContextualFilterFrom:=$_l_offset
				$_l_PeriodRow:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodToCode{0})
				If ($_l_PeriodRow>0)
					If (ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode}>ACC_ad_PeriodToFromDate{$_l_PeriodRow})
						$_l_PeriodRow:=Find in array:C230(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
						If ($_l_PeriodRow<0)
							APPEND TO ARRAY:C911(ACC_at_PeriodToName; ACC_at_PeriodFromName{ACC_at_PeriodFromCode})
							APPEND TO ARRAY:C911(ACC_at_PeriodToCode; ACC_at_PeriodFromCode{ACC_at_PeriodFromCode})
							APPEND TO ARRAY:C911(ACC_ad_PeriodToFromDate; ACC_ad_PeriodFromFromDate{ACC_at_PeriodFromCode})
							APPEND TO ARRAY:C911(ACC_ad_PeriodToToDate; ACC_ad_PeriodFromToDate{ACC_at_PeriodFromCode})
							$_l_PeriodRow:=Size of array:C274(ACC_ad_PeriodToToDate)
							
						End if 
						ACC_at_PeriodToCode:=$_l_PeriodRow
						ACC_at_PeriodToCode{0}:=ACC_at_PeriodToCode{ACC_at_PeriodToCode}
						ACC_l_ContextualFilterTo:=$_l_offset
					End if 
					
				End if 
			End if 
			LAY_bo_FiltersActive:=True:C214
			Lay_bo_UpdateFilters:=True:C214
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oAccDateFromContextualPeriods"; $_t_oldMethodName)
