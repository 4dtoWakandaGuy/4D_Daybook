//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_CloseWIndow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>QV_isHidden; QV_bo_AlPopulated; QV_bo_Modified)
	C_LONGINT:C283($_l_Save; QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID; QV_l_SelectedQualityID)
	C_TEXT:C284($_t_oldMethodName; QV_T_MultiADD; QV_t_QualitiesGroupName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_CloseWIndow")
If (QV_l_DisplayedOwnerID>0)
	$_l_Save:=0
	Case of 
		: (FORM Get current page:C276=2)
			If (QV_T_MultiADD#"")
				QV_SaveFromMultiAdd
			End if 
		: (FORM Get current page:C276=3)
			If (QV_bo_AlPopulated)
				$_l_Save:=1
				//the al was already populated so save it first
				CONFIRM:C162("Save "+QV_t_QualitiesGroupName+"?"; "Yes"; "No")
				If (OK=1)
					QV_SaveFromPowerview
					$_l_Save:=2
				End if 
			End if 
			
	End case 
	Case of 
		: ($_l_Save=2)
			QV_SaveQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID; True:C214)
		: ($_l_Save=1)  //user chose not to save the last entry...do the want to save the rest?
			Gen_Confirm("Save Information"; "Yes"; "No")
			If (OK=1)
				QV_SaveQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID; False:C215)
			End if 
		: ($_l_Save=0)
			If (QV_bo_Modified)
				Gen_Confirm("Save Information"; "Yes"; "No")
				If (OK=1)
					QV_SaveQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID; False:C215)
				End if 
			End if 
	End case 
	QV_bo_Modified:=False:C215
	HIDE PROCESS:C324(Current process:C322)
	<>QV_isHidden:=True:C214
Else 
	//If (QV_l_DisplayedOwnerID<0)
	HIDE PROCESS:C324(Current process:C322)
	<>QV_isHidden:=True:C214
	
	
	
	//End if
End if 
ERR_MethodTrackerReturn("QV_CloseWIndow"; $_t_oldMethodName)
