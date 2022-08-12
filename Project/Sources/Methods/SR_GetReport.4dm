//%attributes = {}
If (False:C215)
	//Project Method Name:      SR_GetReport
	//------------------ Method Notes ------------------
	//NG This new method will get an SR Based Report
	//note that the addition to existing functionality here is that if no existing documents record exists
	//this will look in the resources for a default template and if that exists then it will use that
	//note that some existing printouts from Daybook that do not have SR as an option will be able to use this and if there is no SR template created will drop back to the existing print method
	//they will drop back to the current mechanism
	//note that this is based on SRProOK
	
	//------------------ Revision Control ----------------
	//Date Created: 14/01/2014 14:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($1)
	//C_UNKNOWN(SR_LoadReport)
	//C_UNKNOWN(SR_SaveReport)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OptionKey; $_bo_Return; $0; $_bo_Continue; $_bo_OptionKey; $_bo_Return)
	C_LONGINT:C283($_l_Result; $_l_Table; DB_l_SRAREA; <>FormMethod; $_l_Result; $_l_Table; DB_l_SRAREA)
	C_POINTER:C301($_ptr_table; $1; $_ptr_table)
	C_TEXT:C284(<>PER_t_UserGroup; <>SYS_t_PlatformSetting; $_t_AnalysisCode; $_t_DocumentHeadingName; $_t_DocumentName; $_t_oldMethodName; $_t_ReportCode; $_t_ReportName; $_t_ReportsPath; $_t_StructurePath; $_t_Version)
	C_TEXT:C284($2; $4; SR_t_ReportDataXML; <>PER_t_UserGroup; <>SYS_t_PlatformSetting; $_t_AnalysisCode; $_t_DocumentHeadingName; $_t_DocumentName; $_t_oldMethodName; $_t_ReportCode; $_t_ReportName)
	C_TEXT:C284($_t_ReportsPath; $_t_StructurePath; $_t_Version; $2; $3; $4; SR_t_ReportDataXML)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR_GetReport")
If (Count parameters:C259>=1)
	
	$_t_DocumentHeadingName:=""
	
	If (Count parameters:C259>=2)
		
		
		$_t_ReportName:=$2
		
	Else 
		$_t_ReportName:="InvoiceMY"
	End if 
	If (Count parameters:C259>=3)
		
		$_t_AnalysisCode:=$3
	Else 
		$_t_AnalysisCode:=""
	End if 
	If (Count parameters:C259>=4)
		$_t_DocumentHeadingName:=$4
	End if 
	
	
	
	
	$_bo_OptionKey:=Gen_Option
	$_bo_Return:=((((<>FormMethod=1) & ($_bo_OptionKey=False:C215)) | (($_bo_OptionKey) & (<>FormMethod=0))) & ($_t_ReportName#"") & (($_t_ReportName="Invoice@") | ($_t_ReportName="Invoice_DT@") | ($_t_ReportName="Statement@") | ($_t_ReportName="Purch_Order@") | ($_t_ReportName="Movement@") | ($_t_ReportName="Order_Ack@") | ($_t_ReportName="Order_Quote@") | ($_t_ReportName="Order Auth@") | ($_t_ReportName="Delivery@") | ($_t_ReportName="Contract@") | ($_t_ReportName="Remittance@") | ($_t_ReportName="Cheque@") | ($_t_ReportName="Call_Sheet@") | ($_t_ReportName="Diary_@") | ($_t_ReportName="PackingLabels@") | ($_t_ReportName#"")))
	//Sun, Feb 12, 2006 bwalia: bref added
	
	If ($_bo_Return)
		If (<>PER_t_UserGroup#"")
			$_bo_Continue:=False:C215
			$_t_ReportCode:=<>PER_t_UserGroup+<>SYS_t_PlatformSetting+"SR "+$_t_ReportName
			
			If ($_t_AnalysisCode#"")
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode+"@"; *)
				QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Analysis_Code:12=$_t_AnalysisCode; *)
				If ($_t_ReportName="Invoice")
					QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#"SR_Invoice_DT@"; *)
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
						QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#"SR_Invoice_DT@"; *)
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
					QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#"SR_Invoice_DT@"; *)
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
						QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Code:1#"SR_Invoice_DT@"; *)
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
					$_ptr_table:=->[DOCUMENTS:7]
					If (Test path name:C476($_t_ReportsPath)=Is a document:K24:1)
						REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
						READ WRITE:C146([DOCUMENTS:7])
						SET CHANNEL:C77(10; $_t_ReportsPath)
						RECEIVE VARIABLE:C81($_l_Table)
						RECEIVE VARIABLE:C81($_t_Version)
						
						
						If ($_l_Table=Table:C252(->[DOCUMENTS:7]))
							CREATE RECORD:C68($_ptr_table->)
							RECEIVE RECORD:C79($_ptr_table->)
							[DOCUMENTS:7]Document_Code:1:=$_t_ReportCode
							[DOCUMENTS:7]Document_Class:14:=SuperReportReport Template
							[DOCUMENTS:7]Document_Status:15:=-100
							//[DOCUMENTS]Table_Number:=$_l_Table
							
							
							[DOCUMENTS:7]Standard:9:=True:C214
							DB_SaveRecord($_ptr_table)
							QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
						End if 
						SET CHANNEL:C77(11)
						
					End if 
					
					
				End if 
				
				$_bo_Return:=(Records in selection:C76([DOCUMENTS:7])>0)
			End if 
		End if 
	End if 
	If ($_bo_Return=False:C215)
		$_t_DocumentName:="SR_"+$_t_ReportName+".Txt"  ///this would just be the SR template without the rest of the record
		
		
		$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)
		If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Default_Reports")=Is a folder:K24:2))
			If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
				
				
				
				CREATE FOLDER:C475($_t_StructurePath+"Resources")
			End if 
			If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Default_Reports")=Is a folder:K24:2))
				CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"Default_Reports")
				
				
			End if 
		End if 
		
		If ((Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Default_Reports"+Folder separator:K24:12+$_t_DocumentName)=Is a document:K24:1))
			
			CREATE RECORD:C68([DOCUMENTS:7])
			
			
			
			[DOCUMENTS:7]Document_Code:1:="SR "+$_t_ReportName
			
			[DOCUMENTS:7]Document_Class:14:=SuperReportReport Template
			//$_l_Result:=SR Doc 2 Report ($_t_StructurePath+"Resources"+Folder separator+"Default_Reports"+Folder separator+$_t_DocumentName;pReportData)
			//
			//investigate
			$_l_Result:=SR_LoadReport(DB_l_SRAREA; $_t_StructurePath+"Resources"+Folder separator:K24:12+"Default_Reports"+Folder separator:K24:12+$_t_DocumentName; 0)
			
			//If ($_l_Result=0)
			//[DOCUMENTS]Write_:=pReportData
			//End if
			$_l_Result:=SR_SaveReport(DB_l_SRAREA; SR_t_ReportDataXML)
			[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
			
			//$_l_Result:=SR_SaveReport (DB_l_SRAREA;[DOCUMENTS]SR_DOCUMENTXML;0)
			[DOCUMENTS:7]Table_Number:11:=Table:C252($1)
			
			[DOCUMENTS:7]Heading:2:=$_t_DocumentHeadingName
			DB_SaveRecord(->[DOCUMENTS:7])
			
			
			
			
		End if 
		
		
		
		Case of 
			: ($_t_ReportName="DIARY@") & (Length:C16($_t_ReportName)>5)
				
				$_bo_Return:=(Form_SRProOK("Diary"; $_t_AnalysisCode))
		End case 
	End if 
	
	
	
	
	$0:=$_bo_Return
	
	
	
End if 
ERR_MethodTrackerReturn("SR_GetReport"; $_t_oldMethodName)
