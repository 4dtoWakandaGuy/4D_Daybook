If (False:C215)
	//object Name: [ACCOUNTS]Accounts_in.oLBAnalysis1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/10/2012 06:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_lb_Analysis;0)
	//ARRAY BOOLEAN(DIA_LB_MailRecipients;0)
	//ARRAY TEXT(ACC_at_AnalysesCodes;0)
	//ARRAY TEXT(ACC_at_AnalysesNames;0)
	//ARRAY TEXT(ACC_at_Analysis;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalyses;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalysesNM;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_AnalysisIndex; $_l_AnalysisRow; $_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; ACC_l_CurrentAnalStatus; bACC_l_Delete; ACC_but_AnalModify)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; ACC_t_curApplicableAnalNM; ACC_t_curApplicableAnalyses)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_in.oLBAnalysis1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->DIA_LB_MailRecipients; $_t_VariableName)
		
		
		If ($_l_Row>0)
			LB_SetChoiceList("aACCanal"; ->ACC_at_Analysis; ->ACC_at_ApplicableAnalysesNM)
			LB_GoToCell(->ACC_lb_Analysis; 2; $_l_Row)
			
		End if 
		
		
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_Analysis; $_t_VariableName)
		If ($_l_Row>0)
			LB_SetChoiceList("aACCanal"; ->ACC_at_Analysis; ->ACC_at_ApplicableAnalysesNM)
			LB_GoToCell(->ACC_lb_Analysis; 2; $_l_Row)
			OBJECT SET TITLE:C194(bACC_l_Delete; "Delete")
			OBJECT SET VISIBLE:C603(bACC_l_Delete; True:C214)
			ACC_l_CurrentAnalStatus:=2
		End if 
	: ($_l_event=On Data Change:K2:15)  //| ($_l_event=On Mouse Leave)
		//TRACE
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_bo_OK:=True:C214
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_Analysis; $_t_VariableName)
		If ($_l_Row>0) & ($_l_ColumnNumber=2)
			ACC_at_Analysis:=Find in array:C230(ACC_at_Analysis; ACC_at_ApplicableAnalysesNM{$_l_Row})
			If (ACC_at_Analysis<0)
				For ($_l_AnalysisIndex; 1; Size of array:C274(ACC_at_Analysis))
					If (Position:C15(ACC_at_ApplicableAnalysesNM{$_l_Row}; ACC_at_AnalysesNames{$_l_AnalysisIndex})=1)
						ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_at_Analysis{$_l_AnalysisIndex}
						ACC_at_Analysis:=$_l_AnalysisIndex
						$_l_AnalysisIndex:=Size of array:C274(ACC_at_Analysis)+1
					End if 
				End for 
			End if 
			If (ACC_at_Analysis>0)
				If (ACC_at_AnalysesCodes{ACC_at_Analysis}#ACC_t_curApplicableAnalyses)
					//different item selected
					If (ACC_at_ApplicableAnalyses{0}#"")
						//editing an existing record
						If (ACC_at_AnalysesCodes{ACC_at_Analysis}#ACC_at_ApplicableAnalyses{0})
							//not being set to original value either
							$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{ACC_at_Analysis})
							If ($_l_AnalysisRow>0) & ($_l_AnalysisRow#$_l_Row)
								
								ALERT:C41("There is already an applicable analyses "+ACC_at_AnalysesCodes{ACC_at_Analysis}; "Stop")
								ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_at_ApplicableAnalysesNM{0}
								ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_at_ApplicableAnalyses{0}
								$_bo_OK:=False:C215
							Else 
								ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
								ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
								ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_t_curApplicableAnalNM
								ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_t_curApplicableAnalyses
								
							End if 
						Else 
							//setting back to saved version
							ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
							ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
							ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_t_curApplicableAnalNM
							ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_t_curApplicableAnalyses
							
						End if 
					Else 
						//entering a new one
						$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{ACC_at_Analysis})
						If ($_l_AnalysisRow>0)
							ALERT:C41("There is already an applicable analyses "+ACC_at_AnalysesCodes{ACC_at_Analysis}; "Stop")
							ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_at_ApplicableAnalysesNM{0}
							ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_at_ApplicableAnalyses{0}
							$_bo_OK:=False:C215
						Else 
							ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
							ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
							ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_t_curApplicableAnalNM
							ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_t_curApplicableAnalyses
							
						End if 
						
					End if 
				End if   //not selection
			Else 
				$_bo_OK:=False:C215
				ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_at_ApplicableAnalysesNM{0}
				
			End if 
			If ($_bo_OK)
				OBJECT SET LIST BY NAME:C237(ACC_at_ApplicableAnalysesNM; "")
				//Here save and set the button back to add
				OBJECT SET TITLE:C194(bACC_l_Delete; "Clear")
				OBJECT SET VISIBLE:C603(bACC_l_Delete; False:C215)
				OBJECT SET TITLE:C194(ACC_but_AnalModify; "Add")
				ACC_l_CurrentAnalStatus:=0
				OBJECT SET VISIBLE:C603(ACC_at_Analysis; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalyses; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalNM; False:C215)
				OBJECT SET VISIBLE:C603(ACC_but_AnalModify; True:C214)
				ACC_t_curApplicableAnalyses:=""
				ACC_t_curApplicableAnalNM:=""
				ACC_at_Analysis:=0
				ACC_at_ApplicableAnalyses{0}:=""
				ACC_at_ApplicableAnalyses:=0
				ACC_at_AnalysesCodes{0}:=""
				ACC_at_AnalysesCodes:=0
			End if 
		End if 
	: ($_l_event=On Mouse Enter:K2:33)
	: ($_l_event=On Mouse Move:K2:35)
	: ($_l_event=On Mouse Leave:K2:34)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_bo_OK:=True:C214
		$_l_ColumnNumber:=LB_GetColumn(->ACC_lb_Analysis; $_t_VariableName)
		If ($_l_Row>0) & (Size of array:C274(ACC_at_ApplicableAnalysesNM)>=$_l_Row)
			
			ACC_at_Analysis:=Find in array:C230(ACC_at_Analysis; ACC_at_ApplicableAnalysesNM{$_l_Row})
			If (ACC_at_Analysis>0)
				If (ACC_at_AnalysesCodes{ACC_at_Analysis}#ACC_t_curApplicableAnalyses)
					//different item selected
					If (ACC_at_ApplicableAnalyses{0}#"")
						//editing an existing record
						If (ACC_at_AnalysesCodes{ACC_at_Analysis}#ACC_at_ApplicableAnalyses{0})
							//not being set to original value either
							$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{ACC_at_Analysis})
							If ($_l_AnalysisRow>0) & ($_l_AnalysisRow#$_l_Row)
								
								ALERT:C41("There is already an applicable analyses "+ACC_at_AnalysesCodes{ACC_at_Analysis}; "Stop")
								ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_at_ApplicableAnalysesNM{0}
								ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_at_ApplicableAnalyses{0}
								$_bo_OK:=False:C215
							Else 
								ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
								ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
								ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_t_curApplicableAnalNM
								ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_t_curApplicableAnalyses
								
							End if 
						Else 
							//setting back to saved version
							ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
							ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
							ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_t_curApplicableAnalNM
							ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_t_curApplicableAnalyses
							
						End if 
					Else 
						//entering a new one
						$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{ACC_at_Analysis})
						If ($_l_AnalysisRow>0)
							ALERT:C41("There is already an applicable analyses "+ACC_at_AnalysesCodes{ACC_at_Analysis}; "Stop")
							ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_at_ApplicableAnalysesNM{0}
							ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_at_ApplicableAnalyses{0}
							$_bo_OK:=False:C215
						Else 
							ACC_t_curApplicableAnalyses:=ACC_at_AnalysesCodes{ACC_at_Analysis}
							ACC_t_curApplicableAnalNM:=ACC_at_AnalysesNames{ACC_at_Analysis}
							ACC_at_ApplicableAnalysesNM{$_l_Row}:=ACC_t_curApplicableAnalNM
							ACC_at_ApplicableAnalyses{$_l_Row}:=ACC_t_curApplicableAnalyses
							
						End if 
						
					End if 
				End if   //not selection
			Else 
				$_bo_OK:=False:C215
			End if 
			If ($_bo_OK)
				OBJECT SET LIST BY NAME:C237(ACC_at_ApplicableAnalysesNM; "")
				//Here save and set the button back to add
				OBJECT SET TITLE:C194(bACC_l_Delete; "Clear")
				OBJECT SET VISIBLE:C603(bACC_l_Delete; False:C215)
				OBJECT SET TITLE:C194(ACC_but_AnalModify; "Add")
				ACC_l_CurrentAnalStatus:=0
				OBJECT SET VISIBLE:C603(ACC_at_Analysis; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalyses; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalNM; False:C215)
				OBJECT SET VISIBLE:C603(ACC_but_AnalModify; True:C214)
				ACC_t_curApplicableAnalyses:=""
				ACC_t_curApplicableAnalNM:=""
				ACC_at_Analysis:=0
				ACC_at_ApplicableAnalyses{0}:=""
				ACC_at_ApplicableAnalyses:=0
				ACC_at_AnalysesCodes{0}:=""
				ACC_at_AnalysesCodes:=0
			End if 
		End if 
		
	Else 
		//TRACE
		
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_in.oLBAnalysis1"; $_t_oldMethodName)
