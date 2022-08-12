If (False:C215)
	//object Method Name: Object Name:      ACC_AccountDetails.oLBAnalysis
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
	//ARRAY BOOLEAN(ACC_lb_Analysis;0)
	//ARRAY TEXT(ACC_at_AnalysesCodes;0)
	//ARRAY TEXT(ACC_at_AnalysesNames;0)
	//ARRAY TEXT(ACC_at_Analysis;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalyses;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalysesNM;0)
	C_LONGINT:C283($_l_ColumnNum; $_l_Event; $_l_ExistingAnalPosition; $_l_FieldNumber; $_l_SelectedRow; $_l_TableNumber)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName; ACC_t_curApplicableAnalNM; ACC_t_curApplicableAnalyses)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_AccountDetails.oLBAnalysis")

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_AccountDetails.oLBAnalysis"; Form event code:C388)
$_l_Event:=Form event code:C388
//Something

Case of 
	: ($_l_Event=On Header Click:K2:40)
	: ($_l_Event=On Clicked:K2:4)
		
		
		
		
		
	: ($_l_Event=On Double Clicked:K2:5)
		
		RESOLVE POINTER:C394(Self:C308; $_t_ColumnName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		$_l_ColumnNum:=LB_GetColumn(->ACC_lb_Analysis; $_t_ColumnName)
		If ($_l_SelectedRow>0)
			LB_SetChoiceList("aACCanal"; ->ACC_at_Analysis; ->ACC_at_ApplicableAnalysesNM)
			LB_GoToCell(->ACC_lb_Analysis; 2; $_l_SelectedRow)
		End if 
	: ($_l_Event=On Data Change:K2:15)
		
		RESOLVE POINTER:C394(Self:C308; $_t_ColumnName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		$_l_ColumnNum:=LB_GetColumn(->ACC_lb_Analysis; $_t_ColumnName)
		If ($_l_SelectedRow>0) & ($_l_ColumnNum=2)
			ACC_at_Analysis:=Find in array:C230(ACC_at_Analysis; ACC_at_ApplicableAnalysesNM{$_l_SelectedRow})
			If (ACC_at_Analysis>0)
				If (ACC_at_AnalysesCodes{ACC_at_Analysis}#ACC_t_curApplicableAnalyses)
					//different item selected
					If (ACC_at_ApplicableAnalyses{0}#"")
						//editing an existing record
						If (ACC_at_AnalysesCodes{ACC_at_Analysis}#ACC_at_ApplicableAnalyses{0})
							//not being set to original value either
							$_l_ExistingAnalPosition:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{ACC_at_Analysis})
							If ($_l_ExistingAnalPosition>0)
								ALERT:C41("There is already an applicable analyses "+ACC_at_AnalysesCodes{ACC_at_Analysis}; "Stop")
							Else 
								ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
								ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
							End if 
						Else 
							//setting back to saved version
							ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
							ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
						End if 
					Else 
						//entering a new one
						$_l_ExistingAnalPosition:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{ACC_at_Analysis})
						If ($_l_ExistingAnalPosition>0)
							ALERT:C41("There is already an applicable analyses "+ACC_at_AnalysesCodes{ACC_at_Analysis}; "Stop")
						Else 
							ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
							ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
						End if 
						
					End if 
				End if   //not selection
				
				
			End if 
			
			OBJECT SET LIST BY NAME:C237(ACC_at_ApplicableAnalysesNM; "")
		End if 
	Else 
		
End case 
ERR_MethodTrackerReturn("OBJ ACC_AccountDetails.oLBAnalysis"; $_t_oldMethodName)
