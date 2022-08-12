//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_AddSubEntityAnalyses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/03/2010 10:21
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
	//ARRAY TEXT(ACC_at_ApplicableAnalyses;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalysesNM;0)
	C_LONGINT:C283($_l_AnalysisRow; $_l_ArraySize; ACC_l_CurrentAnalStatus; bACC_l_Delete; ACC_but_AnalModify)
	C_TEXT:C284($_t_oldMethodName; $1; ACC_t_curApplicableAnalNM; ACC_t_curApplicableAnalyses)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_AddSubEntityAnalyses")

//NG Feb 2004
//The method is only applicable within the form [ACCOUNTS]Accounts_in
//It is the script of the button ACC_but_AnalModify which adds a new analyses(or set a highlighted one to edit)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("ACC_AddSubEntityAnalyses"; Form event code:C388)


Case of 
	: (ACC_l_CurrentAnalStatus=0)
		OBJECT SET VISIBLE:C603(bACC_l_Delete; True:C214)
		OBJECT SET VISIBLE:C603(ACC_at_Analysis; True:C214)
		OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalyses; True:C214)
		OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalNM; True:C214)
		ACC_t_curApplicableAnalyses:=""
		ACC_t_curApplicableAnalNM:=""
		ACC_at_Analysis:=0
		ACC_at_ApplicableAnalyses{0}:=""
		ACC_at_ApplicableAnalyses:=0
		ACC_at_AnalysesCodes{0}:=""
		ACC_at_AnalysesCodes:=0
		OBJECT SET TITLE:C194(bACC_l_Delete; "Clear")
		OBJECT SET TITLE:C194(ACC_but_AnalModify; "Save")
		ACC_l_CurrentAnalStatus:=2
		If (Count parameters:C259>=1)
			If ($1="Listbox")
				OBJECT SET VISIBLE:C603(bACC_l_Delete; False:C215)
				OBJECT SET VISIBLE:C603(ACC_at_Analysis; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalyses; False:C215)
				OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalNM; False:C215)
				LB_SetEnterable(->ACC_lb_Analysis; True:C214; 2)
				GOTO OBJECT:C206(ACC_lb_Analysis)
				$_l_ArraySize:=Size of array:C274(ACC_at_ApplicableAnalyses)
				//LISTBOX INSERT ROW(ACC_lb_Analysis;1)
				INSERT IN ARRAY:C227(ACC_at_ApplicableAnalyses; 1; 1)
				INSERT IN ARRAY:C227(ACC_at_ApplicableAnalysesNM; 1; 1)
				ACC_at_ApplicableAnalyses{0}:=""
				ACC_at_ApplicableAnalysesNM{0}:=""
				GOTO OBJECT:C206(ACC_lb_Analysis)
				LB_SetChoiceList("aACCanal"; ->ACC_at_Analysis; ->ACC_at_ApplicableAnalysesNM)
				LB_GoToCell(->ACC_lb_Analysis; 2; 1)
				OBJECT SET VISIBLE:C603(ACC_but_AnalModify; False:C215)
			End if 
		End if 
		
	: (ACC_l_CurrentAnalStatus=1)
		//item is selected not in edit mode
		//(Button text will say 'Edit')
		OBJECT SET VISIBLE:C603(ACC_at_Analysis; True:C214)
		OBJECT SET VISIBLE:C603(bACC_l_Delete; True:C214)
		ACC_l_CurrentAnalStatus:=2
		OBJECT SET TITLE:C194(ACC_but_AnalModify; "Save")
		OBJECT SET TITLE:C194(bACC_l_Delete; "Delete")
	: (ACC_l_CurrentAnalStatus=2)
		//editing (button text says save)
		
		If (ACC_at_AnalysesCodes{0}#ACC_t_curApplicableAnalyses)
			//item is modified
			//NOTE: the code in the pop-up prevents selection of an existing value
			Case of 
				: (ACC_at_AnalysesCodes{0}#"")
					//editing an existing entry
					CONFIRM:C162("Change "+ACC_at_AnalysesCodes{0}+" to "+ACC_t_curApplicableAnalyses)
					If (OK=1)
						$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_AnalysesCodes{0})
						If ($_l_AnalysisRow>0)
							ACC_at_ApplicableAnalyses{$_l_AnalysisRow}:=ACC_t_curApplicableAnalyses
							$_l_AnalysisRow:=Find in array:C230(ACC_at_AnalysesCodes; ACC_t_curApplicableAnalyses)
							ACC_at_ApplicableAnalysesNM{$_l_AnalysisRow}:=ACC_at_AnalysesNames{$_l_AnalysisRow}
							ACC_abo_ApplicableAnalyseMOD{$_l_AnalysisRow}:=True:C214
						Else 
							//error
						End if 
						
					End if 
				: (ACC_at_AnalysesCodes{0}="")
					//entering a new one
					CONFIRM:C162("Save additional applicable analysis "+ACC_t_curApplicableAnalyses+"?")
					If (OK=1)
						INSERT IN ARRAY:C227(ACC_at_ApplicableAnalyses; Size of array:C274(ACC_at_ApplicableAnalyses)+1; 1)  //to hold the current subrecords
						INSERT IN ARRAY:C227(ACC_at_ApplicableAnalysesNM; Size of array:C274(ACC_at_ApplicableAnalysesNM)+1; 1)  //to hold the current subrecords
						INSERT IN ARRAY:C227(ACC_abo_ApplicableAnalyseMOD; Size of array:C274(ACC_abo_ApplicableAnalyseMOD)+1; 1)  //to track modified
						ACC_at_ApplicableAnalyses{Size of array:C274(ACC_at_ApplicableAnalyses)}:=ACC_t_curApplicableAnalyses
						$_l_AnalysisRow:=Find in array:C230(ACC_at_AnalysesCodes; ACC_t_curApplicableAnalyses)
						ACC_at_ApplicableAnalysesNM{Size of array:C274(ACC_at_ApplicableAnalysesNM)}:=ACC_at_AnalysesNames{$_l_AnalysisRow}
						ACC_abo_ApplicableAnalyseMOD{Size of array:C274(ACC_abo_ApplicableAnalyseMOD)}:=True:C214
						
						
						
					End if 
					
			End case 
			
			
		End if 
		OBJECT SET TITLE:C194(bACC_l_Delete; "Clear")
		OBJECT SET VISIBLE:C603(bACC_l_Delete; False:C215)
		OBJECT SET TITLE:C194(ACC_but_AnalModify; "Add")
		ACC_l_CurrentAnalStatus:=0
		OBJECT SET VISIBLE:C603(ACC_at_Analysis; False:C215)
		OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalyses; False:C215)
		OBJECT SET VISIBLE:C603(ACC_t_curApplicableAnalNM; False:C215)
		ACC_t_curApplicableAnalyses:=""
		ACC_t_curApplicableAnalNM:=""
		ACC_at_Analysis:=0
		ACC_at_ApplicableAnalyses{0}:=""
		ACC_at_ApplicableAnalyses:=0
		ACC_at_AnalysesCodes{0}:=""
		ACC_at_AnalysesCodes:=0
End case 
ERR_MethodTrackerReturn("ACC_AddSubEntityAnalyses"; $_t_oldMethodName)
