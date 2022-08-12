If (False:C215)
	//object Name: [ORDERS]dOrders_Sel.oDropDownContextualPeriods
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/08/2012 10:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_FromDates; 0)
	//ARRAY LONGINT(ACC_al_ContextualPeriodF;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(ACC_at_ContextualPeriodF;0)
	C_LONGINT:C283($_l_event; $_l_NumberofPeriods; $_l_offset; ACC_l_PeriodFromOffset)
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodFrom)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].dOrders_Sel.oDropDownContextualPeriods"; Form event code:C388)

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
					ACC_t_PeriodFrom:=$_at_PeriodCodes{$_l_offset+1}
				Else 
					ACC_t_PeriodFrom:=$_at_PeriodCodes{1}
				End if 
				ACC_l_PeriodFromOffset:=$_l_offset
				OBJECT SET VISIBLE:C603(*; "ovPeriodT@"; True:C214)
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].dOrders_Sel.oDropDownContextualPeriods"; $_t_oldMethodName)
