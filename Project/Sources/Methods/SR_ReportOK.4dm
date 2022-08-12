//%attributes = {}
If (False:C215)
	//Project Method Name:      SR_ReportOK
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 16:23`Method: SR_ReportOK
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SR_ReportDataXML)
	C_BLOB:C604($_blb_ReportData)
	C_BOOLEAN:C305(<>SRP262; $_bo_Continue; $_bo_OptionKey; $0)
	C_DATE:C307(SRDate)
	C_LONGINT:C283(<>FormMethod; $_l_CopiesIndex; $_l_NumberOfCopies; $_l_Result; SRPage; SRRecord)
	C_PICTURE:C286(SR_pic_ReportData)
	C_POINTER:C301($_ptr_Report; $_Ptr_ReportField)
	C_TEXT:C284(<>PER_t_UserGroup; <>SYS_t_PlatformSetting; $_t_ErrorMethodName; $_t_oldMethodName; $_t_ReportCode; $1)
	C_TIME:C306(SRTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR_ReportOK")
//SR_ReportOK - checks if relevant then prints an SR
//This now supports platform specific Superreports PSR for mac WSR for PC

If (Count parameters:C259>=1)
	$_bo_OptionKey:=Gen_Option
	$0:=((((<>FormMethod=1) & ($_bo_OptionKey=False:C215)) | (($_bo_OptionKey) & (<>FormMethod=0))) & ($1#""))
	If ($0)
		If (<>PER_t_UserGroup#"")
			$_bo_Continue:=False:C215
			$_t_ReportCode:=<>PER_t_UserGroup+<>SYS_t_PlatformSetting+"SR "+$1
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
			$0:=(Records in selection:C76([DOCUMENTS:7])>0)
			If (Not:C34($0))
				
				$_bo_Continue:=True:C214
				$_t_ReportCode:=<>PER_t_UserGroup+"SR "+$1
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
				$0:=(Records in selection:C76([DOCUMENTS:7])>0)
				If (Not:C34($0))
					$_bo_Continue:=True:C214
				Else 
					$_bo_Continue:=False:C215
					If ([DOCUMENTS:7]SR_PreMacro:16#"")
						Macro([DOCUMENTS:7]SR_PreMacro:16)
					End if 
					
					SR_Iterations
					$_t_ErrorMethodName:=Method called on error:C704
					ON ERR CALL:C155("")
					PRINT SETTINGS:C106
					If (<>SRP262)
						$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						$_blb_ReportData:=[DOCUMENTS:7]SR_DOCUMENT_:4
						$_ptr_Report:=->$_blb_ReportData
					Else 
						$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
						$_ptr_Report:=->SR_pic_ReportData
					End if 
					If (OK=1)
						//$_l_Result:=SR Print Report ($_ptr_Report->;SRP_Print_4DPageSetup;65535)
						$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
						
					Else 
						$_l_Result:=-1
					End if 
					ON ERR CALL:C155($_t_ErrorMethodName)
					UNLOAD RECORD:C212([DOCUMENTS:7])
				End if 
				
			Else 
				If ([DOCUMENTS:7]SR_PreMacro:16#"")
					Macro([DOCUMENTS:7]SR_PreMacro:16)
				End if 
				
				SR_Iterations
				$_t_ErrorMethodName:=Method called on error:C704
				ON ERR CALL:C155("")
				PRINT SETTINGS:C106
				If (OK=1)
					If (<>SRP262)
						$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						$_blb_ReportData:=[DOCUMENTS:7]SR_DOCUMENT_:4
						$_ptr_Report:=->$_blb_ReportData
					Else 
						$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
						$_ptr_Report:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
					End if 
					//$_l_Result:=SR Print Report ($_ptr_Report->;SRP_Print_4DPageSetup;65535)
					$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
					
				Else 
					$_l_Result:=-1
				End if 
				ON ERR CALL:C155($_t_ErrorMethodName)
				UNLOAD RECORD:C212([DOCUMENTS:7])
			End if 
		Else 
			$_bo_Continue:=True:C214
		End if 
		If ($_bo_Continue)
			$_t_ReportCode:=<>SYS_t_PlatformSetting+"SR "+$1
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
			$0:=(Records in selection:C76([DOCUMENTS:7])>0)
			If ($0)
				If ([DOCUMENTS:7]SR_PreMacro:16#"")
					Macro([DOCUMENTS:7]SR_PreMacro:16)
				End if 
				SR_Iterations
				//investigate
				$_t_ErrorMethodName:=Method called on error:C704
				ON ERR CALL:C155("")
				If (<>SRP262)
					$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENT_:4
					$_blb_ReportData:=[DOCUMENTS:7]SR_DOCUMENT_:4
					$_ptr_Report:=->$_blb_ReportData
				Else 
					$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
					SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
					$_ptr_Report:=->SR_pic_ReportData
				End if 
				
				PRINT SETTINGS:C106
				
				If (OK=1)
					$_l_NumberOfCopies:=0
					GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberOfCopies)
					If ($_l_NumberOfCopies=0)
						$_l_NumberOfCopies:=1
					End if 
					For ($_l_CopiesIndex; 1; $_l_NumberOfCopies)
						//$_l_Result:=SR Print Report ($_ptr_Report->;SRP_Print_4DPageSetup;65535)
						$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
						
					End for 
				Else 
					$_l_Result:=-1
				End if 
				//$_l_Result:=SR Print Report ([DOCUMENTS]Write_;2;65535)
				ON ERR CALL:C155($_t_ErrorMethodName)
				UNLOAD RECORD:C212([DOCUMENTS:7])
			Else 
				$_t_ReportCode:="SR "+$1
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_ReportCode)
				$0:=(Records in selection:C76([DOCUMENTS:7])>0)
				If ($0)
					If ([DOCUMENTS:7]SR_PreMacro:16#"")
						Macro([DOCUMENTS:7]SR_PreMacro:16)
					End if 
					
					SR_Iterations
					$_t_ErrorMethodName:=Method called on error:C704
					ON ERR CALL:C155("")
					If (<>SRP262)
						$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						$_blb_ReportData:=[DOCUMENTS:7]SR_DOCUMENT_:4
						$_ptr_Report:=->$_blb_ReportData
					Else 
						$_Ptr_ReportField:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
						$_ptr_Report:=->SR_pic_ReportData
					End if 
					//If (SR Validate (SR_pic_ReportData)=0)
					//`$Set:=SR Page Setup (SR_pic_ReportData)
					//End if
					PRINT SETTINGS:C106
					
					If (OK=1)
						$_l_NumberOfCopies:=0
						GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberOfCopies)
						If ($_l_NumberOfCopies=0)
							$_l_NumberOfCopies:=1
						End if 
						For ($_l_CopiesIndex; 1; $_l_NumberOfCopies)
							//$_l_Result:=SR Print Report ($_ptr_Report->;SRP_Print_4DPageSetup;65535)
							$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
							
						End for 
					Else 
						$_l_Result:=-1
					End if 
					//$_l_Result:=SR Print Report ([DOCUMENTS]Write_;2;65535)
					ON ERR CALL:C155($_t_ErrorMethodName)
				End if 
				UNLOAD RECORD:C212([DOCUMENTS:7])
			End if 
			
		End if 
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("SR_ReportOK"; $_t_oldMethodName)
