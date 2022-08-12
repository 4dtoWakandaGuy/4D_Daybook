If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oDiaryActionFilter6
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
	C_TEXT:C284($_t_oldMethodName; SD2_t_CompanyFilter; SD2_t_CompanyFilterName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oDiaryActionFilter6"; Form event code:C388)
Check_Company(->SD2_t_CompanyFilterName; ->[CONTACTS:1]Contact_Code:2; ->[DIARY:12])
SD2_t_CompanyFilter:=SD2_t_CompanyFilterName
SD2_t_CompanyFilterName:=[COMPANIES:2]Company_Name:2
//************** commented out 03/07/08 -kmw **************
//If (SD2_T_SearchValue#"")
//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
//Else
//SD2_DiaryViewManageSelection
//SD2_DiaryVIewManageView (-1)
//End if
//**************************************************************
SD2_DiaryVIewManageView(-1)  //changed to simply just this, 03/07/08 -kmw (SD2_DiaryVIewManageView does apply filters which now goes back to last search/select set before applying the filter anyway)
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oDiaryActionFilter6"; $_t_oldMethodName)