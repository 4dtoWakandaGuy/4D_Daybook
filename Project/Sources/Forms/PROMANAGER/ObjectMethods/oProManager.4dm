If (False:C215)
	//object Name: Object Name:      PROMANAGER.oProManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRO_abo_DataChanged;0)
	//ARRAY BOOLEAN(PRO_lb_Production;0)
	//ARRAY TEXT(PRO_at_AllStageCodes;0)
	//ARRAY TEXT(PRO_at_AllStageNames;0)
	//ARRAY TEXT(PRO_at_StageNames;0)
	//ARRAY TEXT(PRO_at_Stages;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row; $_l_StageRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROMANAGER.oProManager"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(PRO_lb_Production; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			Case of 
				: ($_l_Column=5)
					PRO_abo_DataChanged{$_l_Row}:=True:C214
				: ($_l_Column=4)
					$_l_StageRow:=Find in array:C230(PRO_at_AllStageNames; PRO_at_StageNames{$_l_Row})
					If ($_l_StageRow>0)
						PRO_at_Stages{$_l_Row}:=PRO_at_AllStageCodes{$_l_StageRow}
						PRO_abo_DataChanged{$_l_Row}:=True:C214
					Else 
						PRO_at_StageNames{$_l_Row}:=""
						PRO_at_Stages{$_l_Row}:=""
						PRO_abo_DataChanged{$_l_Row}:=True:C214
					End if 
				: ($_l_Column=4)
					$_l_StageRow:=Find in array:C230(PRO_at_AllStageCodes; PRO_at_Stages{$_l_Row})
					If ($_l_StageRow>0)
						PRO_at_StageNames{$_l_Row}:=PRO_at_AllStageNames{$_l_StageRow}
						PRO_abo_DataChanged{$_l_Row}:=True:C214
					Else 
						PRO_at_StageNames{$_l_Row}:=""
						PRO_at_Stages{$_l_Row}:=""
						PRO_abo_DataChanged{$_l_Row}:=True:C214
					End if 
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ PROMANAGER.oProManager"; $_t_oldMethodName)
