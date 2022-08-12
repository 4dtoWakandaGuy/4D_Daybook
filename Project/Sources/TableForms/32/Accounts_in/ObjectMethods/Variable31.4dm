If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.Variable31
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ACC_at_AnalysesCodes;0)
	//ARRAY TEXT(ACC_at_AnalysesNames;0)
	//ARRAY TEXT(ACC_at_Analysis;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalyses;0)
	C_LONGINT:C283($_l_AnalysisRow; $_l_event)
	C_TEXT:C284($_t_oldMethodName; ACC_t_curApplicableAnalNM; ACC_t_curApplicableAnalyses)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.Variable31"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (ACC_at_AnalysesCodes{ACC_at_Analysis}#ACC_t_curApplicableAnalyses)
			//different item selected
			If (ACC_at_ApplicableAnalyses{0}#"")
				//editing an existing record
				If (ACC_at_AnalysesCodes{ACC_at_Analysis}#ACC_at_ApplicableAnalyses{0})
					//not being set to original value either
					$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{ACC_at_Analysis})
					If ($_l_AnalysisRow>0)
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
				$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{ACC_at_Analysis})
				If ($_l_AnalysisRow>0)
					ALERT:C41("There is already an applicable analyses "+ACC_at_AnalysesCodes{ACC_at_Analysis}; "Stop")
				Else 
					ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
					ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
				End if 
				
			End if 
		End if   //not selection
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.Variable31"; $_t_oldMethodName)
