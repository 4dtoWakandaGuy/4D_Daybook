//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_HistSrchSD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:11:24If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SD3_at_HistoryType;0)
	C_TEXT:C284($_l_event; $_t_CompanyCode; $_t_ContCode; $_t_DiaryActionCode; $_t_DiaryCallCode; $_t_DiaryDocumentCode; $_t_DiaryOrderCode; $_t_HistoryType; $_t_Job; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_HistSrchSD")
If (Count parameters:C259>=1)
	$_t_HistoryType:=$1
Else 
	$_t_HistoryType:=<>SD3_at_HistoryType{<>SD3_at_HistoryType}
End if 
$_t_CompanyCode:=[DIARY:12]Company_Code:1
$_t_ContCode:=[DIARY:12]Contact_Code:2
$_t_Job:=[DIARY:12]Job_Code:19
$_t_DiaryOrderCode:=[DIARY:12]Order_Code:26

$_t_DiaryCallCode:=[DIARY:12]Call_Code:25
$_t_DiaryActionCode:=[DIARY:12]Action_Code:9
$_t_DiaryDocumentCode:=[DIARY:12]Document_Code:15
Case of 
	: ($_t_HistoryType="Company")
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$_t_CompanyCode)
		SET WINDOW TITLE:C213("Diary: Company History")
	: ($_t_HistoryType="Contact")
		QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$_t_ContCode)
		SET WINDOW TITLE:C213("Diary: Contact History")
	: ($_t_HistoryType="Job")
		QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$_t_Job)
		SET WINDOW TITLE:C213("Diary: Job History")
	: ($_t_HistoryType="Order")
		QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$_t_DiaryOrderCode)
		SET WINDOW TITLE:C213("Diary: Order History")
	: ($_t_HistoryType="Call")
		QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=$_t_DiaryCallCode)
		SET WINDOW TITLE:C213("Diary: Service Call History")
	: ($_t_HistoryType="Comp & Action")
		QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=$_t_CompanyCode; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=$_t_DiaryActionCode)
		SET WINDOW TITLE:C213("Diary: Company & Action History")
	: ($_t_HistoryType="Cont & Action")
		QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=$_t_ContCode; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=$_t_DiaryActionCode)
		SET WINDOW TITLE:C213("Diary: Contact & Action History")
	: ($_t_HistoryType="Job & Action")
		QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=$_t_Job; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=$_t_DiaryActionCode)
		SET WINDOW TITLE:C213("Diary: Job & Action History")
		
	: ($_t_HistoryType="Order & Act")
		QUERY:C277([DIARY:12]; [DIARY:12]Order_Code:26=$_t_DiaryOrderCode; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=$_t_DiaryActionCode)
		SET WINDOW TITLE:C213("Diary: Order & Action History")
	: ($_t_HistoryType="Call & Action")
		QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=$_t_DiaryCallCode; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=$_t_DiaryActionCode)
		SET WINDOW TITLE:C213("Diary: Call & Action History")
	: ($_t_HistoryType="Document")
		QUERY:C277([DIARY:12]; [DIARY:12]Document_Code:15=$_t_DiaryDocumentCode)
		SET WINDOW TITLE:C213("Diary: Document History")
End case 
ERR_MethodTrackerReturn("Diary_HistSrchSD"; $_t_oldMethodName)