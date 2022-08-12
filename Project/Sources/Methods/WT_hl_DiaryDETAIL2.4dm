//%attributes = {}
If (False:C215)
	//Project Method Name:      WT_hl_DiaryDETAIL2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(CB_ActionDone)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; COM_t_TelephoneNumberFormat; DOC_t_ActionName; SD_t_DiaryPersonName; dl_ResultT; vCompName; VcompTel; vContName; VcontTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WT_hl_DiaryDETAIL2")
//Diary_InB22

If ([DIARY:12]Company_Code:1#"")
	RELATE ONE:C42([DIARY:12]Company_Code:1)
	vCompName:=[COMPANIES:2]Company_Name:2
	VcompTel:=[COMPANIES:2]Telephone:9
	
Else 
	REDUCE SELECTION:C351([COMPANIES:2]; 0)
	
	//[DIARY]Company Code:=""
	vCompName:=""
	VcompTel:=""
End if 
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
Else 
	COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(vCompTel; COM_t_TelephoneNumberFormat)
End if 
If ([DIARY:12]Contact_Code:2#"")
	RELATE ONE:C42([DIARY:12]Contact_Code:2)
	vContName:=[CONTACTS:1]Contact_Name:31
	VcontTel:=[CONTACTS:1]Extn:9
Else 
	REDUCE SELECTION:C351([CONTACTS:1]; 0)
	//[DIARY]Contact Code:=""
	vContName:=""
	VcontTel:=""
End if 


If ([DIARY:12]Person:8#"")
	RELATE ONE:C42([DIARY:12]Person:8)
	SD_t_DiaryPersonName:=[PERSONNEL:11]Name:2
Else 
	REDUCE SELECTION:C351([PERSONNEL:11]; 0)
	//[DIARY]Person:=""
	SD_t_DiaryPersonName:=""
End if 

If ([DIARY:12]Action_Code:9#"")
	RELATE ONE:C42([DIARY:12]Action_Code:9)
	DOC_t_ActionName:=[ACTIONS:13]Action_Name:2
Else 
	REDUCE SELECTION:C351([ACTIONS:13]; 0)
	//[DIARY]Action Code:=""
	DOC_t_ActionName:=""
	//[DIARY]Action Desc:=""
End if 

If ([DIARY:12]Result_Code:11#"")
	RELATE ONE:C42([DIARY:12]Result_Code:11)
	dl_ResultT:=[RESULTS:14]Result_Name:2
Else 
	REDUCE SELECTION:C351([RESULTS:14]; 0)
	//[DIARY]Result Code:=""
	dl_ResultT:=""
	//[DIARY]Result Desc:=""
End if 
CB_ActionDone:=Num:C11([DIARY:12]Done:14)
Case of 
	: ([DIARY:12]Action_Code:9="EVENT ")
		OBJECT SET TITLE:C194(CB_ActionDone; "Finished")
	: ([DIARY:12]Action_Code:9="TASK")
		OBJECT SET TITLE:C194(CB_ActionDone; "Done")
	Else 
		OBJECT SET TITLE:C194(CB_ActionDone; "Done")
End case 


SD_SetSourceButtons
ERR_MethodTrackerReturn("WT_hl_DiaryDETAIL2"; $_t_oldMethodName)