//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Form SRProOK
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OptionKey; $_bo_Return; $0)
	C_LONGINT:C283(<>FormMethod; $_l_TableNumber; $_t_Field)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284(<>PER_t_UserGroup; <>SYS_t_PlatformSetting; $_t_AnalysisCode; $_t_oldMethodName; $_t_ReportCode; $_t_ReportName; $_t_ReportsPath; $_t_Version; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Form SRProOK")

If (Count parameters:C259>=1)
	$_t_ReportName:=$1
Else 
	$_t_ReportName:="InvoiceMY"
End if 
If (Count parameters:C259>=2)
	$_t_AnalysisCode:=$2
Else 
	$_t_AnalysisCode:=""
End if 




$_bo_OptionKey:=Gen_Option
$_bo_Return:=((((<>FormMethod=1) & ($_bo_OptionKey=False:C215)) | (($_bo_OptionKey) & (<>FormMethod=0))) & ($_t_ReportName#"") & (($_t_ReportName="Invoice@") | ($_t_ReportName="Invoice DT@") | ($_t_ReportName="Statement@") | ($_t_ReportName="Purch Order@") | ($_t_ReportName="Movement@") | ($_t_ReportName="Order Ack@") | ($_t_ReportName="Order Quote@") | ($_t_ReportName="Order Auth@") | ($_t_ReportName="Delivery@") | ($_t_ReportName="Contract@") | ($_t_ReportName="Remittance@") | ($_t_ReportName="Cheque@") | ($_t_ReportName="Call Sheet@") | ($_t_ReportName="Diary @") | ($_t_ReportName="PackingLabels@")))  //Sun, Feb 12, 2006 bwalia: bref added
If ($_bo_Return)
	If (<>PER_t_UserGroup#"")
		$_bo_Continue:=False:C215
		$_t_ReportCode:=<>PER_t_UserGroup+<>SYS_t_PlatformSetting+"SR "+$_t_ReportName
		
		If ($_t_AnalysisCode#"")
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode+"@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Analysis_Code:12=$_t_AnalysisCode; *)
			If ($_t_ReportName="Invoice")
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#"SR Invoice DT@"; *)
			End if 
			QUERY:C277([DOCUMENTS:7])
			If (Records in selection:C76([DOCUMENTS:7])=0)
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
			End if 
		Else 
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode+"@")
		End if 
		
		$_bo_Return:=(Records in selection:C76([DOCUMENTS:7])>0)
		If (Not:C34($_bo_Return))
			$_bo_Continue:=True:C214
		Else 
			$_t_ReportCode:=<>PER_t_UserGroup+"SR "+$_t_ReportName
			
			If ($_t_AnalysisCode#"")
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode+"@"; *)
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Analysis_Code:12=$_t_AnalysisCode; *)
				If ($_t_ReportName="Invoice")
					QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#"SR Invoice DT@"; *)
				End if 
				QUERY:C277([DOCUMENTS:7])
				If (Records in selection:C76([DOCUMENTS:7])=0)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
				End if 
			Else 
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode+"@")
			End if 
			$_bo_Return:=(Records in selection:C76([DOCUMENTS:7])>0)
			If (Not:C34($_bo_Return))
				$_bo_Continue:=True:C214
			End if 
		End if 
		
	Else 
		$_bo_Continue:=True:C214
	End if 
	//In the section above here we dontlook on disk..because on disk is just the basic report..
	If ($_bo_Continue)
		$_t_ReportCode:=<>SYS_t_PlatformSetting+"SR "+$_t_ReportName
		
		If ($_t_AnalysisCode#"")
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode+"@"; *)
			QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Analysis_Code:12=$_t_AnalysisCode; *)
			If ($_t_ReportName="Invoice")
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#"SR Invoice DT@"; *)
			End if 
			QUERY:C277([DOCUMENTS:7])
			If (Records in selection:C76([DOCUMENTS:7])=0)
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
			End if 
		Else 
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode+"@")
			
		End if 
		
		
		$_bo_Return:=(Records in selection:C76([DOCUMENTS:7])>0)
		If (Not:C34($_bo_Return))
			//It is only in the section below here that we look on disk...
			$_t_ReportCode:="SR "+$_t_ReportName
			If ($_t_AnalysisCode#"")
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=($_t_ReportCode+"@"); *)
				If ($_t_ReportName="Invoice")
					QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#"SR Invoice DT@"; *)
				End if 
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Analysis_Code:12=$_t_AnalysisCode)
				If (Records in selection:C76([DOCUMENTS:7])=0)
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
				End if 
			Else 
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
			End if 
			If (Records in selection:C76([DOCUMENTS:7])=0)
				$_t_ReportsPath:=Get 4D folder:C485(Current resources folder:K5:16)
				$_t_ReportsPath:=$_t_ReportsPath+"Default_Reports"+Folder separator:K24:12
				$_t_ReportsPath:=$_t_ReportsPath+$_t_ReportName+".txt"
				$_ptr_Table:=->[DOCUMENTS:7]
				If (Test path name:C476($_t_ReportsPath)=Is a document:K24:1)
					REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
					READ WRITE:C146([DOCUMENTS:7])
					SET CHANNEL:C77(10; $_t_ReportsPath)
					RECEIVE VARIABLE:C81($_l_TableNumber)
					RECEIVE VARIABLE:C81($_t_Version)
					RECEIVE VARIABLE:C81($_t_Field)
					If ($_l_TableNumber=Table:C252(->[DOCUMENTS:7]))
						CREATE RECORD:C68($_ptr_Table->)
						RECEIVE RECORD:C79($_ptr_Table->)
						[DOCUMENTS:7]Document_Code:1:=$_t_ReportCode
						[DOCUMENTS:7]Document_Class:14:=SuperReportReport Template
						[DOCUMENTS:7]Document_Status:15:=-100
						[DOCUMENTS:7]Table_Number:11:=39
						[DOCUMENTS:7]Standard:9:=True:C214
						
						DB_SaveRecord($_ptr_Table)
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
					End if 
					
				End if 
				
				
			End if 
			
			$_bo_Return:=(Records in selection:C76([DOCUMENTS:7])>0)
		End if 
	End if 
End if 
If ($_bo_Return=False:C215)
	Case of 
		: ($_t_ReportName="DIARY@") & (Length:C16($_t_ReportName)>5)
			
			$_bo_Return:=(Form SRProOK("Diary"; $_t_AnalysisCode))
	End case 
End if 
$0:=$_bo_Return
ERR_MethodTrackerReturn("Form SRProOK"; $_t_oldMethodName)