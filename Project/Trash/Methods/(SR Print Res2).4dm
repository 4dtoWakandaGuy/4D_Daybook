//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SR Print Res2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/01/2010 16:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	C_BLOB:C604(SR_blb_ReportDataBLOB)
	C_BOOLEAN:C305(<>DB_bo_TableNamestatesLoaded; <>SRP262)
	C_DATE:C307(SRDate)
	C_LONGINT:C283($_l_CopiesIndex; $_l_NumberOfCopies; $_l_Result; $_l_TableNumber; $0; $3; SRPage; SRRecord)
	C_POINTER:C301($_ptr_SRData; $_ptr_SRReportSource; $_ptr_table; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $1; $2; SR_ReportDataXML)
	C_TIME:C306(SRTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR Print Res2")
//SR Print Res2 - see also SR Print

Load_Fields

//ALERT("$1 "+$1)
//ALERT("$2 "+$2)
//ALERT("String($3) "+String($3))

$0:=0
If (Count parameters:C259>=1)
	$_t_TableName:=$1
	
	$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
	$_l_TableNumber:=<>DB_al_TableNums{$_l_TableNumber}
	
	//ALERT("String($_l_TableNumber) "+String($_l_TableNumber))
	
	If ($_l_TableNumber#0)
		$_ptr_table:=Table:C252($_l_TableNumber)
		
		READ WRITE:C146([DOCUMENTS:7])
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$2)
		//ALERT("String(ris([docs])) "+String(Records in selection([DOCUMENTS])))
		
		If (Records in selection:C76([DOCUMENTS:7])#0)
			If (Count parameters:C259=2)
				$_l_TableNumber:=1
			Else 
				$_l_TableNumber:=$3
			End if 
			OK:=1
			If ([DOCUMENTS:7]SR_PreMacro:16#"")
				Macro([DOCUMENTS:7]SR_PreMacro:16)
			End if 
			
			If ($_l_TableNumber=2)  //print all records
				SR_Iterations
				PRINT SETTINGS:C106
				If (OK=1)
					$_l_NumberOfCopies:=0
					GET PRINT OPTION:C734(Number of copies option:K47:4; $_l_NumberOfCopies)
					If ($_l_NumberOfCopies=0)
						$_l_NumberOfCopies:=1
					End if 
					If (<>SRP262)
						$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						SR_blb_ReportDataBLOB:=[DOCUMENTS:7]SR_DOCUMENT_:4
						$_ptr_SRData:=->SR_blb_ReportDataBLOB
					Else 
						$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
						$_ptr_SRData:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
					End if 
					For ($_l_CopiesIndex; 1; $_l_NumberOfCopies)
						//$res:=SR Print Report ($_ptr_SRReport->;SRP_Print_4DPageSetup;65535)
						$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
						
						
					End for 
				Else 
					$_l_Result:=-1
				End if 
			Else 
				COPY NAMED SELECTION:C331($_ptr_table->; "mSel")
				If (BUT_p_ButtonStringPointer->="O@")
					Userset
				Else 
					ONE RECORD SELECT:C189($_ptr_table->)
				End if 
				PRINT SETTINGS:C106
				If (OK=1)
					If (<>SRP262)
						$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
						SR_blb_ReportDataBLOB:=[DOCUMENTS:7]SR_DOCUMENT_:4
						$_ptr_SRData:=->SR_blb_ReportDataBLOB
					Else 
						$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
						SR_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
						$_ptr_SRData:=->SR_ReportDataXML
					End if 
					//$res:=SR Print Report ($_ptr_SRReport->;SRP_Print_4DPageSetup;65535)
					$_l_Result:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+SRP_Print_4DPageSetup; ""; 0; "")
					
				Else 
					$_l_Result:=-1
				End if 
				USE NAMED SELECTION:C332("mSel")
				CLEAR NAMED SELECTION:C333("mSel")
			End if 
			If (OK=0)
				$0:=1
			End if 
			UNLOAD RECORD:C212([DOCUMENTS:7])
		Else 
			Gen_Alert("Report '"+$2+"' was not found"; "Cancel")
			OK:=0
			$0:=2
		End if 
	Else 
		Gen_Alert("The file '"+$1+"' is not valid"; "Cancel")
		OK:=0
		$0:=3
	End if 
End if 
ERR_MethodTrackerReturn("SR Print Res2"; $_t_oldMethodName)
