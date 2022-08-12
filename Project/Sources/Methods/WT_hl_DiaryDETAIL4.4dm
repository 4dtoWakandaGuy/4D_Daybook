//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_hl_DiaryDETAIL4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SD_d_DiaryDateFrom; SD_d_DiaryDateTo)
	C_TEXT:C284($_t_oldMethodName; dl_Action; dl_ActionDescrip; dl_CompInfo; dl_CompInfoT; dl_ContactInfo; dl_ContactInfoT; dl_Person; dl_Result; dl_ResultDescrip; dl_ResultT)
	C_TEXT:C284(DOC_t_ActionName; SD_t_DiaryPersonName)
	C_TIME:C306(dl_TimeFrom; dl_TimeTo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_hl_DiaryDETAIL4")
//WT_hl_DiaryDETAIL4

dl_CompInfo:=""
dl_CompInfoT:=""

dl_ContactInfo:=""
dl_ContactInfoT:=""

SD_d_DiaryDateFrom:=!00-00-00!
SD_d_DiaryDateTo:=!00-00-00!
dl_TimeFrom:=?00:00:00?
dl_TimeTo:=?00:00:00?

dl_Person:=""
SD_t_DiaryPersonName:=""

dl_Action:=""
DOC_t_ActionName:=""
dl_ActionDescrip:=""
dl_Result:=""
dl_ResultT:=""
dl_ResultDescrip:=""
ERR_MethodTrackerReturn("WT_hl_DiaryDETAIL4"; $_t_oldMethodName)