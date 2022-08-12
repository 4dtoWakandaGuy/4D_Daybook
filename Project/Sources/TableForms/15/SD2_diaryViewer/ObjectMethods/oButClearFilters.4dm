If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oButClearFilters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SD2_D_DateFromFilter; SD2_D_DatetoFilter)
	C_LONGINT:C283($_l_event; SD2_l_IncludeCompleted)
	C_TEXT:C284($_t_oldMethodName; SD_t_ActionFilterCode; SD_t_ResultsFilterCode; SD_t_ContactFilter; SD_t_ActionFilter; SD_t_ContactFilterName; SD_t_PersonFilterName; SD_t_ResultsFilter; SD2_t_CompanyFilter; SD2_t_Document; SD2_S5_PriorityFIlter)
	C_TEXT:C284(SD2_t_CompanyFilterName; SD2_t_DocumentName; SD2_t_StatusFIlter)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oButClearFilters"; Form event code:C388)
$_l_event:=Form event code:C388

//SD2_l_ClearFilters button added 03/07/08 -kmw

Case of 
	: ($_l_event=On Clicked:K2:4)
		//Regardless of which page we're on, clear all filters (theoretically it's unneccessary/redundant if we're on a lower page to clear filters on higher page but this is easiest)
		
		//Clear page one filters
		SD_t_PersonFilterName:="ALL"
		SD2_S5_PriorityFIlter:="ALL"
		SD2_l_IncludeCompleted:=1
		
		//Clear page two filters
		SD_t_ActionFilter:="ALL"
		SD_t_ActionFilterCode:=""
		SD_t_ResultsFilter:="ALL"
		SD_t_ResultsFilterCode:=""
		SD2_t_StatusFIlter:="ALL"
		SD2_D_DateFromFilter:=!00-00-00!
		SD2_D_DatetoFilter:=!00-00-00!
		
		//Clear page three filters
		SD_t_ContactFilter:=""
		SD2_t_CompanyFilter:=""
		SD2_t_Document:=""
		SD2_t_CompanyFilterName:=""
		SD_t_ContactFilterName:=""
		SD2_t_DocumentName:=""
		
		//Apply current filters (ie none) to most recent search/select (in other words revert back to most recent search/select)
		SD2_DiaryVIewManageView(-1)
	Else 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oButClearFilters"; $_t_oldMethodName)
