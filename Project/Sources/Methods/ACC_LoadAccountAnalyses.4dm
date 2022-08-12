//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_LoadAccountAnalyses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 14:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_abo_ApplicableAnalyseMOD;0)
	//ARRAY BOOLEAN(ACC_lb_Analysis;0)
	//ARRAY TEXT(ACC_at_AnalysesCodes;0)
	//ARRAY TEXT(ACC_at_AnalysesNames;0)
	//ARRAY TEXT(ACC_at_Analysis;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalDel;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalyses;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalysesNM;0)
	C_LONGINT:C283($_l_AnalysisCodeRow; $_l_Index; $_l_offset; ACC_l_CurrentAnalStatus; ACCan_l_BUT1; ACCan_l_But2; ACCan_l_BUT3; ACCan_l_BUT4; ACCan_l_BUT5; ACCan_l_BUT6; ACCan_l_BUT7)
	C_LONGINT:C283(ACCan_l_BUT8; ACCan_l_BUT9; bACC_l_Delete; ACC_but_AnalModify)
	C_TEXT:C284($_t_oldMethodName; ACC_t_curApplicableAnalNM; ACC_t_curApplicableAnalyses; ACCan_t_COL1; ACCan_t_COL2; ACCan_t_COL3; ACCan_t_COL4; ACCan_t_COL5; ACCan_t_COL6; ACCan_t_COL7; ACCan_t_COL8)
	C_TEXT:C284(ACCan_t_COL9; ACCan_t_HED1; ACCan_t_HED2; ACCan_t_HED3; ACCan_t_HED4; ACCan_t_HED5; ACCan_t_HED6; ACCan_t_HED7; ACCan_t_HED8; ACCan_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_LoadAccountAnalyses")

ACC_l_CurrentAnalStatus:=0
//ACC_l_CurrentAnalStatus 0 =`nothing selected
//ACC_l_CurrentAnalStatus 1 =select
//ACC_l_CurrentAnalStatus=2 edit/add


ARRAY TEXT:C222(ACC_at_ApplicableAnalyses; 0)  //to hold the current subrecords
ARRAY TEXT:C222(ACC_at_ApplicableAnalysesNM; 0)  //to hold the current subrecords
ARRAY BOOLEAN:C223(ACC_abo_ApplicableAnalyseMOD; 0)  //to track modified
ARRAY TEXT:C222(ACC_at_ApplicableAnalDel; 0)  //to remember deletions

//```All ANALYSES
ARRAY TEXT:C222(ACC_at_AnalysesCodes; 0)  //ALL analysis codes
ARRAY TEXT:C222(ACC_at_AnalysesNames; 0)  //All Analysis Name
ARRAY TEXT:C222(ACC_at_Analysis; 0)  //Combined array for pop-up

OBJECT SET VISIBLE:C603(ACC_but_AnalModify; True:C214)
OBJECT SET TITLE:C194(ACC_but_AnalModify; "Add")

OBJECT SET VISIBLE:C603(bACC_l_Delete; False:C215)
OBJECT SET VISIBLE:C603(ACC_at_Analysis; False:C215)
OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalyses; False:C215)
OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalNM; False:C215)
READ ONLY:C145([ANALYSES:36])
ALL RECORDS:C47([ANALYSES:36])
SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; ACC_at_AnalysesCodes; [ANALYSES:36]Analysis_Name:2; ACC_at_AnalysesNames)
ARRAY TEXT:C222(ACC_at_Analysis; Size of array:C274(ACC_at_AnalysesNames))
SORT ARRAY:C229(ACC_at_AnalysesCodes; ACC_at_AnalysesNames)
For ($_l_Index; 1; Size of array:C274(ACC_at_AnalysesNames))
	ACC_at_Analysis{$_l_Index}:=ACC_at_AnalysesCodes{$_l_Index}+(" "*(10-Length:C16(ACC_at_AnalysesCodes{$_l_Index})))+ACC_at_AnalysesNames{$_l_Index}
End for 
If (BLOB size:C605([ACCOUNTS:32]xAnalysisCodes:12)=0)
	If ([ACCOUNTS:32]Account_Code:2#"")
		QUERY:C277([ACCOUNTS_ANALYSES:157]; [ACCOUNTS_ANALYSES:157]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
	Else 
		REDUCE SELECTION:C351([ACCOUNTS_ANALYSES:157]; 0)
	End if 
	ARRAY TEXT:C222(ACC_at_ApplicableAnalyses; Records in selection:C76([ACCOUNTS_ANALYSES:157]))
	For ($_l_Index; 1; Records in selection:C76([ACCOUNTS_ANALYSES:157]))
		ACC_at_ApplicableAnalyses{$_l_Index}:=[ACCOUNTS_ANALYSES:157]Analysis_Code:1
		NEXT RECORD:C51([ACCOUNTS_ANALYSES:157])
		
	End for 
	ARRAY TEXT:C222(ACC_at_ApplicableAnalysesNM; Size of array:C274(ACC_at_ApplicableAnalyses))
	ARRAY BOOLEAN:C223(ACC_abo_ApplicableAnalyseMOD; Size of array:C274(ACC_at_ApplicableAnalyses))
	For ($_l_Index; Size of array:C274(ACC_at_ApplicableAnalyses); 1; -1)
		$_l_AnalysisCodeRow:=Find in array:C230(ACC_at_AnalysesCodes; ACC_at_ApplicableAnalyses{$_l_Index})
		If ($_l_AnalysisCodeRow<0)
			//the analysis does not exist-delete the applicable
			
			APPEND TO ARRAY:C911(ACC_at_ApplicableAnalDel; ACC_at_ApplicableAnalyses{$_l_Index})
			DELETE FROM ARRAY:C228(ACC_at_ApplicableAnalyses; $_l_Index)
			DELETE FROM ARRAY:C228(ACC_at_ApplicableAnalysesNM; $_l_Index)
			DELETE FROM ARRAY:C228(ACC_abo_ApplicableAnalyseMOD; $_l_Index)
		Else 
			ACC_at_ApplicableAnalysesNM{$_l_Index}:=ACC_at_AnalysesNames{$_l_AnalysisCodeRow}
		End if 
	End for 
Else 
	ARRAY TEXT:C222(ACC_at_ApplicableAnalyses; 0)
	$_l_offset:=0
	BLOB TO VARIABLE:C533([ACCOUNTS:32]xAnalysisCodes:12; ACC_at_ApplicableAnalyses; $_l_offset)
	ARRAY TEXT:C222(ACC_at_ApplicableAnalysesNM; Size of array:C274(ACC_at_ApplicableAnalyses))
	ARRAY BOOLEAN:C223(ACC_abo_ApplicableAnalyseMOD; Size of array:C274(ACC_at_ApplicableAnalyses))
	
	For ($_l_Index; Size of array:C274(ACC_at_ApplicableAnalyses); 1; -1)
		$_l_AnalysisCodeRow:=Find in array:C230(ACC_at_AnalysesCodes; ACC_at_ApplicableAnalyses{$_l_Index})
		If ($_l_AnalysisCodeRow<0)
			//the analysis does not exist-delete the applicable
			APPEND TO ARRAY:C911(ACC_at_ApplicableAnalDel; ACC_at_ApplicableAnalyses{$_l_Index})
			DELETE FROM ARRAY:C228(ACC_at_ApplicableAnalyses; $_l_Index)
			DELETE FROM ARRAY:C228(ACC_at_ApplicableAnalysesNM; $_l_Index)
			DELETE FROM ARRAY:C228(ACC_abo_ApplicableAnalyseMOD; $_l_Index)
		Else 
			ACC_at_ApplicableAnalysesNM{$_l_Index}:=ACC_at_AnalysesNames{$_l_AnalysisCodeRow}
		End if 
	End for 
	
End if 

ACC_at_Analysis{0}:=""
ACC_at_ApplicableAnalysesNM{0}:=""
ACC_at_ApplicableAnalyses{0}:=""
ACC_at_Analysis:=0
ACC_at_ApplicableAnalysesNM:=0
ACC_at_ApplicableAnalyses:=0
ACC_t_curApplicableAnalyses:=""

//```
If (Size of array:C274(ACC_at_ApplicableAnalyses)>0)
	
End if 

LB_SetupListbox(->ACC_lb_Analysis; "ACCan_t"; "ACCan_L"; 1; ->ACC_at_ApplicableAnalyses; ->ACC_at_ApplicableAnalysesNM)

LB_SetColumnHeaders(->ACC_lb_Analysis; "ACCan_L"; 1; "Code"; "Name")

LB_SetColumnWidths(->ACC_lb_Analysis; "ACCan_t"; 1; 40; 114)
LB_SetScroll(->ACC_lb_Analysis; -3; -2)
LB_StyleSettings(->ACC_lb_Analysis; "Black"; 9; "ACCan_t"; ->[ACCOUNTS:32])
LB_SetEnterable(->ACC_lb_Analysis; False:C215; 0)

//````
ERR_MethodTrackerReturn("ACC_LoadAccountAnalyses"; $_t_oldMethodName)
