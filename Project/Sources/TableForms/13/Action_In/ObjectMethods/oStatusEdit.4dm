If (False:C215)
	//object Name: [ACTIONS]Action_In.oStatusEdit
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
	//ARRAY LONGINT(SD2_al_ActionDisplayColour;0)
	//ARRAY LONGINT(SD2_al_ActionDIsplayStatusID;0)
	//ARRAY LONGINT(SD2_al_ActionDisplaytime;0)
	//ARRAY LONGINT(SD2_al_ActionDisplayTimeType;0)
	//ARRAY LONGINT(SD2_al_WorkflowStatus;0)
	//ARRAY PICTURE(SD2_apic_ActionDisplayPictures;0)
	//ARRAY TEXT(SD2_at_ActionDisplayName;0)
	//ARRAY TEXT(SD2_at_ActionDisplayTiming;0)
	//ARRAY TEXT(SD2_at_TimeType;0)
	//ARRAY TEXT(SD2_at_WorkflowStatus;0)
	C_LONGINT:C283($_l_SizeofArray; $_l_StatusIndex; $_l_WorkflowStatusRow)
	C_TEXT:C284($_t_oldMethodName; $_t_TimeType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oStatusEdit"; Form event code:C388)

SD2_EditworkflowStatusSettings([ACTIONS:13]Action_Code:1; ->SD2_al_ActionDIsplayStatusID; ->SD2_al_ActionDisplayColour; ->SD2_al_ActionDisplaytime; ->SD2_al_ActionDisplayTimeType; True:C214)
$_l_SizeofArray:=Size of array:C274(SD2_al_ActionDIsplayStatusID)

ARRAY TEXT:C222(SD2_at_ActionDisplayName; $_l_SizeofArray)
ARRAY PICTURE:C279(SD2_apic_ActionDisplayPictures; $_l_SizeofArray)
ARRAY TEXT:C222(SD2_at_ActionDisplayTiming; $_l_SizeofArray)
For ($_l_StatusIndex; 1; $_l_SizeofArray)
	$_l_WorkflowStatusRow:=Find in array:C230(SD2_al_WorkflowStatus; SD2_al_ActionDIsplayStatusID{$_l_StatusIndex})
	SD2_at_ActionDisplayName{$_l_StatusIndex}:=SD2_at_WorkflowStatus{$_l_WorkflowStatusRow}
	SD2_apic_ActionDisplayPictures{$_l_StatusIndex}:=SD2_PicMakeSVGcircle(SD2_al_ActionDisplayColour{$_l_StatusIndex}; 18; 12)
	
	Case of 
		: (SD2_al_ActionDisplayTimeType{$_l_StatusIndex}=2)
			$_t_TimeType:=SD2_at_TimeType{3}
		: (SD2_al_ActionDisplayTimeType{$_l_StatusIndex}=1)
			$_t_TimeType:=SD2_at_TimeType{2}
		Else 
			$_t_TimeType:=SD2_at_TimeType{1}
	End case 
	
	If (SD2_al_ActionDisplaytime{$_l_StatusIndex}<0)
		SD2_at_ActionDisplayTiming{$_l_StatusIndex}:=(String:C10(Abs:C99(SD2_al_ActionDisplaytime{$_l_StatusIndex}))+" "+$_t_TimeType+" "+"before due(start) time")
	Else 
		SD2_at_ActionDisplayTiming{$_l_StatusIndex}:=(String:C10(SD2_al_ActionDisplaytime{$_l_StatusIndex}))+" "+$_t_TimeType+" "+"before due(start) time"
	End if 
End for 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oStatusEdit"; $_t_oldMethodName)
