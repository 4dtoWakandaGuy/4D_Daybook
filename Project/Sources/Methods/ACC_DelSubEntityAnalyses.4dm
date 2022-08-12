//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_DelSubEntityAnalyses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
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
	//ARRAY TEXT(ACC_at_Analysis;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalDel;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalyses;0)
	//ARRAY TEXT(ACC_at_ApplicableAnalysesNM;0)
	C_LONGINT:C283($_l_AnalysisRow; $_l_Column; $_l_Row; ACC_l_CurrentAnalStatus; bACC_l_Delete; ACC_but_AnalModify)
	C_TEXT:C284($_t_oldMethodName; ACC_t_curApplicableAnalNM; ACC_t_curApplicableAnalyses)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ACC_DelSubEntityAnalyses"; Form event code:C388)

//NG Feb 2004
//The method is only applicable within the form [ACCOUNTS]Accounts_in
//It is the script of the button bACC_l_Delete which adds an analyses(or clears an entry)
//it is in a method so the call can be via an outside call

Case of 
	: (ACC_l_CurrentAnalStatus=0)
		//this button is not visible in this state
		// i am just putting it here for completness
	: (ACC_l_CurrentAnalStatus=1)
		//Item selected not edit
		//just clear back to status 0
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
		
	: (ACC_l_CurrentAnalStatus=2)
		//editing record
		//if existing ask user about clearing
		//else just clear
		//both go to status 0
		If (ACC_at_ApplicableAnalyses{0}#"")
			CONFIRM:C162("Are you sure you wish to delete this applicable analyses?")
			If (OK=1)
				
				$_l_AnalysisRow:=Find in array:C230(ACC_at_ApplicableAnalyses; ACC_at_ApplicableAnalyses{0})
				If ($_l_AnalysisRow>0)
					INSERT IN ARRAY:C227(ACC_at_ApplicableAnalDel; Size of array:C274(ACC_at_ApplicableAnalDel)+1; 1)
					ACC_at_ApplicableAnalDel{Size of array:C274(ACC_at_ApplicableAnalDel)}:=ACC_t_curApplicableAnalyses
					DELETE FROM ARRAY:C228(ACC_at_ApplicableAnalyses; $_l_AnalysisRow; 1)
					DELETE FROM ARRAY:C228(ACC_at_ApplicableAnalysesNM; $_l_AnalysisRow; 1)
					DELETE FROM ARRAY:C228(ACC_abo_ApplicableAnalyseMOD; $_l_AnalysisRow; 1)
					
				Else 
					//error
				End if 
				
			End if 
			
		Else 
			LISTBOX GET CELL POSITION:C971(ACC_lb_Analysis; $_l_Row; $_l_Column)
			If ($_l_Row>0)
				LISTBOX DELETE ROWS:C914(ACC_lb_Analysis; $_l_Row)
			End if 
			//do nothing just clear
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
ERR_MethodTrackerReturn("ACC_DelSubEntityAnalyses"; $_t_oldMethodName)
