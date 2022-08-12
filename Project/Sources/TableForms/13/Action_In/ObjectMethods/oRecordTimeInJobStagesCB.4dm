If (False:C215)
	//object Name: [ACTIONS]Action_In.oRecordTimeInJobStagesCB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_JSTypeCodes;0)
	//ARRAY TEXT(SD2_at_JSTypes;0)
	C_LONGINT:C283($_l_event; $_l_JobStageRow; $_l_StageFieldRow; CB_l_RecordTime)
	C_TEXT:C284($_t_JobStageCode; $_t_oldMethodName; SD2_t_JSType; SD2_t_JSTypeNAME)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Check Box1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CB_l_RecordTime=1)
			OBJECT SET VISIBLE:C603(*; "oJSTypeLabel"; True:C214)
			OBJECT SET VISIBLE:C603(SD2_t_JSType; True:C214)
			OBJECT SET VISIBLE:C603(SD2_at_JSTypes; True:C214)
			If (Size of array:C274(SD2_at_JSTypes)=0)
				ALL RECORDS:C47([STAGES:45])
				SELECTION TO ARRAY:C260([STAGES:45]Stage_Code:1; SD2_at_JSTypeCodes; [STAGES:45]Stage_Name:2; SD2_at_JSTypes)
				SORT ARRAY:C229(SD2_at_JSTypes; SD2_at_JSTypeCodes; >)
				$_l_StageFieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Associated Job Stage Type")
				If ($_l_StageFieldRow>0)
					$_t_JobStageCode:=SD2_at_ActionVirtFieldDataTXT{$_l_StageFieldRow}
					$_l_JobStageRow:=Find in array:C230(SD2_at_JSTypeCodes; $_t_JobStageCode)
					If ($_l_JobStageRow>0)
						SD2_t_JSTypeNAME:=SD2_at_JSTypes{$_l_JobStageRow}
						SD2_t_JSType:=$_t_JobStageCode  //Code
					Else 
						SD2_t_JSTypeNAME:=""
						SD2_t_JSType:=""  //Code
					End if 
				Else 
					$_t_JobStageCode:=""
					SD2_t_JSTypeNAME:=""
					SD2_t_JSType:=""  //Code
				End if 
			End if 
		Else 
			OBJECT SET VISIBLE:C603(*; "oJSTypeLabel"; False:C215)
			OBJECT SET VISIBLE:C603(SD2_t_JSType; False:C215)
			OBJECT SET VISIBLE:C603(SD2_at_JSTypes; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Check Box1"; $_t_oldMethodName)
