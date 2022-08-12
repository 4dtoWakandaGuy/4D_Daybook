//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_LoadAccountLayers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2011 09:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_ApplicableLayerMOD;0)
	//ARRAY BOOLEAN(ACC_lb_LBLayers;0)
	//ARRAY TEXT(ACC_at_ApplicableLayer;0)
	//ARRAY TEXT(ACC_at_ApplicableLayerDel;0)
	//ARRAY TEXT(ACC_at_ApplicableLayerNM;0)
	//ARRAY TEXT(ACC_at_LayerCodeandName;0)
	//ARRAY TEXT(ACC_at_LayerCodes;0)
	//ARRAY TEXT(ACC_at_LayerNames;0)
	C_LONGINT:C283($_l_Index; $_l_LayerRow; $_l_offset; ACC_l_CurrentLayerStatus; ACCal_l_BUT1; ACCal_l_But2; ACCal_l_BUT3; ACCal_l_BUT4; ACCal_l_BUT5; ACCal_l_BUT6; ACCal_l_BUT7)
	C_LONGINT:C283(ACCal_l_BUT8; ACCal_l_BUT9; bACC_l_DeleteLayer; ACC_but_AnalModifyLayer)
	C_TEXT:C284($_t_oldMethodName; ACC_t_curApplicableLayerCode; ACC_t_curApplicableLayerName; ACCal_t_COL1; ACCal_t_COL2; ACCal_t_COL3; ACCal_t_COL4; ACCal_t_COL5; ACCal_t_COL6; ACCal_t_COL7; ACCal_t_COL8)
	C_TEXT:C284(ACCal_t_COL9; ACCal_t_HED1; ACCal_t_HED2; ACCal_t_HED3; ACCal_t_HED4; ACCal_t_HED5; ACCal_t_HED6; ACCal_t_HED7; ACCal_t_HED8; ACCal_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_LoadAccountLayers")

ACC_l_CurrentLayerStatus:=0
//ACC_l_CurrentLayerStatus 0 =`nothing selected
//ACC_l_CurrentLayerStatus 1 =select
//ACC_l_CurrentLayerStatus=2 edit/add


ARRAY TEXT:C222(ACC_at_ApplicableLayer; 0)  //to hold the current subrecords
ARRAY TEXT:C222(ACC_at_ApplicableLayerNM; 0)  //to hold the current subrecords
ARRAY BOOLEAN:C223(ACC_abo_ApplicableLayerMOD; 0)  //to track modified
ARRAY TEXT:C222(ACC_at_ApplicableLayerDel; 0)  //to remember deletions

//```All Layer
ARRAY TEXT:C222(ACC_at_LayerCodes; 0)  //ALL Layer codes
ARRAY TEXT:C222(ACC_at_LayerNames; 0)  //All Layer Name
ARRAY TEXT:C222(ACC_at_LayerCodeandName; 0)  //Combined array for pop-up

OBJECT SET VISIBLE:C603(ACC_but_AnalModifyLayer; True:C214)
OBJECT SET TITLE:C194(ACC_but_AnalModifyLayer; "Add")

OBJECT SET VISIBLE:C603(bACC_l_DeleteLayer; False:C215)
OBJECT SET VISIBLE:C603(ACC_at_LayerCodeandName; False:C215)
OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerCode; False:C215)
OBJECT SET VISIBLE:C603(ACC_t_curApplicableLayerName; False:C215)
READ ONLY:C145([LAYERS:76])
ALL RECORDS:C47([LAYERS:76])
SELECTION TO ARRAY:C260([LAYERS:76]Layer_Code:1; ACC_at_LayerCodes; [LAYERS:76]Layer_Name:2; ACC_at_LayerNames)
ARRAY TEXT:C222(ACC_at_LayerCodeandName; Size of array:C274(ACC_at_LayerNames))
SORT ARRAY:C229(ACC_at_LayerCodes; ACC_at_LayerNames)
For ($_l_Index; 1; Size of array:C274(ACC_at_LayerNames))
	ACC_at_LayerCodeandName{$_l_Index}:=ACC_at_LayerCodes{$_l_Index}+(" "*(10-Length:C16(ACC_at_LayerCodes{$_l_Index})))+ACC_at_LayerNames{$_l_Index}
End for 
If (BLOB size:C605([ACCOUNTS:32]xLayerCodes:11)=0)
	//load from the sub records-note that save will fill the blob)
	QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
	ARRAY TEXT:C222(ACC_at_ApplicableLayer; Records in selection:C76([ACCOUNTS_LAYERS:156]))
	For ($_l_Index; 1; Records in selection:C76([ACCOUNTS_LAYERS:156]))
		ACC_at_ApplicableLayer{$_l_Index}:=[ACCOUNTS_LAYERS:156]Layer_Code:1
		NEXT RECORD:C51([ACCOUNTS_LAYERS:156])
		
	End for 
	ARRAY TEXT:C222(ACC_at_ApplicableLayerNM; Size of array:C274(ACC_at_ApplicableLayer))
	ARRAY BOOLEAN:C223(ACC_abo_ApplicableLayerMOD; Size of array:C274(ACC_at_ApplicableLayer))
	//NG The following is to force an update so the blob gets filled--added Jan 2007
	For ($_l_Index; 1; Size of array:C274(ACC_abo_ApplicableLayerMOD))
		ACC_abo_ApplicableLayerMOD{$_l_Index}:=True:C214
	End for 
	
	For ($_l_Index; Size of array:C274(ACC_at_ApplicableLayer); 1; -1)
		$_l_LayerRow:=Find in array:C230(ACC_at_LayerCodes; ACC_at_ApplicableLayer{$_l_Index})
		If ($_l_LayerRow<0)
			//the Layer does not exist-delete the applicable
			INSERT IN ARRAY:C227(ACC_at_ApplicableLayerDel; Size of array:C274(ACC_at_ApplicableLayerDel)+1; 1)
			ACC_at_ApplicableLayerDel{Size of array:C274(ACC_at_ApplicableLayerDel)}:=ACC_at_ApplicableLayer{$_l_Index}
			DELETE FROM ARRAY:C228(ACC_at_ApplicableLayer; $_l_Index)
			DELETE FROM ARRAY:C228(ACC_at_ApplicableLayerNM; $_l_Index)
			DELETE FROM ARRAY:C228(ACC_abo_ApplicableLayerMOD; $_l_Index)
		Else 
			ACC_at_ApplicableLayerNM{$_l_Index}:=ACC_at_LayerNames{$_l_LayerRow}
		End if 
	End for 
Else 
	//Load from the blob
	ARRAY TEXT:C222(ACC_at_ApplicableLayer; 0)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([ACCOUNTS:32]xLayerCodes:11; ACC_at_ApplicableLayer; $_l_offset)
	ARRAY TEXT:C222(ACC_at_ApplicableLayerNM; Size of array:C274(ACC_at_ApplicableLayer))
	ARRAY BOOLEAN:C223(ACC_abo_ApplicableLayerMOD; Size of array:C274(ACC_at_ApplicableLayer))
	For ($_l_Index; Size of array:C274(ACC_at_ApplicableLayer); 1; -1)
		$_l_LayerRow:=Find in array:C230(ACC_at_LayerCodes; ACC_at_ApplicableLayer{$_l_Index})
		If ($_l_LayerRow<0)
			//the Layer does not exist-delete the applicable
			INSERT IN ARRAY:C227(ACC_at_ApplicableLayerDel; Size of array:C274(ACC_at_ApplicableLayerDel)+1; 1)
			ACC_at_ApplicableLayerDel{Size of array:C274(ACC_at_ApplicableLayerDel)}:=ACC_at_ApplicableLayer{$_l_Index}
			DELETE FROM ARRAY:C228(ACC_at_ApplicableLayer; $_l_Index)
			DELETE FROM ARRAY:C228(ACC_at_ApplicableLayerNM; $_l_Index)
			DELETE FROM ARRAY:C228(ACC_abo_ApplicableLayerMOD; $_l_Index)
		Else 
			ACC_at_ApplicableLayerNM{$_l_Index}:=ACC_at_LayerNames{$_l_LayerRow}
		End if 
	End for 
End if 
ACC_at_LayerCodeandName{0}:=""
ACC_at_ApplicableLayerNM{0}:=""
ACC_at_ApplicableLayer{0}:=""
ACC_at_LayerCodeandName:=0
ACC_at_ApplicableLayerNM:=0
ACC_at_ApplicableLayer:=0
ACC_t_curApplicableLayerCode:=""


LB_SetupListbox(->ACC_lb_LBLayers; "ACCal_t"; "ACCal_L"; 1; ->ACC_at_ApplicableLayer; ->ACC_at_ApplicableLayerNM; ->ACC_abo_ApplicableLayerMOD)

LB_SetColumnHeaders(->ACC_lb_LBLayers; "ACCal_L"; 1; "Code"; "Name")

LB_SetColumnWidths(->ACC_lb_LBLayers; "ACCal_t"; 1; 40; 114)
LB_SetScroll(->ACC_lb_LBLayers; -3; -2)
LB_StyleSettings(->ACC_lb_LBLayers; "Black"; 9; "ACCal_t"; ->[ACCOUNTS:32])
LB_SetEnterable(->ACC_lb_LBLayers; False:C215; 0)
ERR_MethodTrackerReturn("ACC_LoadAccountLayers"; $_t_oldMethodName)
