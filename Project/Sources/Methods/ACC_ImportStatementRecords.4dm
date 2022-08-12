//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_ImportStatementRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2012 17:43
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_TransactionDate; 0)
	ARRAY LONGINT:C221($_al_CSVFields; 0)
	ARRAY LONGINT:C221($_al_TransactionTimeStamp; 0)
	ARRAY POINTER:C280($_aptr_DaybookFieldPointers; 0)
	ARRAY REAL:C219($_ar_TransactionAccountBalance; 0)
	ARRAY REAL:C219($_ar_TransactionCreditAmount; 0)
	ARRAY REAL:C219($_ar_TransactionDebitAmount; 0)
	ARRAY TEXT:C222($_at_CellNames; 0)
	ARRAY TEXT:C222($_at_DocText; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_Messages; 0)
	ARRAY TEXT:C222($_at_RowsText; 0)
	ARRAY TEXT:C222($_at_TransactionAccountCode; 0)
	ARRAY TEXT:C222($_at_TransactionDescription; 0)
	ARRAY TEXT:C222($_at_TransactionID; 0)
	ARRAY TEXT:C222($_at_TransactionReference; 0)
	ARRAY TEXT:C222($_at_TransactionType; 0)
	//ARRAY TEXT(ACC_at_DaybookFields;0)
	//ARRAY TEXT(ACC_at_FieldNames;0)
	//ARRAY TEXT(ACC_at_QIFDBFields;0)
	//ARRAY TEXT(ACC_at_QIFFields;0)
	//ARRAY TEXT(ACC_at_StatementFields;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_DoNotVerifyBalance; $_bo_HasCCPointer; $_bo_RowAdded; $_bo_Save; ACC_bo_CSVhasHeader)
	C_DATE:C307($_d_BaseDate; $_d_Date; $_d_LastDateStamp; $_d_SIGNONMSGSRSV1SDATE; $_d_SIGNONMSGSRSV1SUpdateDATE; $_d_TransactsionMessagesendDate; $_d_TransactsionMessagesStartDat; ACC_D_OpeningBalanceDate)
	C_LONGINT:C283($_l_AccountPreferenceID; $_l_AddDays; $_l_AddMonths; $_l_ArraySize; $_l_creditAccountFieldPos; $_l_dateFieldPos; $_l_DebitAccountFieldPos; $_l_DebitAccountIdentCell; $_l_FieldPosition; $_l_Index; $_l_Index2)
	C_LONGINT:C283($_l_LastTimeStamp; $_l_Offset; $_l_OpenStringPosition; $_l_Position; $_l_SIGNONMSGSRSV1STATUSCODE; $_l_SlashPosition; $_l_SpacePos; $_l_StartAtRow; $_l_TestPosition; $_l_TimeNum; $_l_TransAmountFieldPosition)
	C_LONGINT:C283($_l_TransDateFieldPosition; ACC_l_LoadPreferencesID)
	C_REAL:C285($_r_Amount; ACC_r_OpeningBalance)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_Account; $_t_AccountCode; $_t_AmountString; $_t_Before; $_t_CellName; $_t_Code; $_t_DateStartString; $_t_DateString; $_t_DateTimeString; $_t_DayString)
	C_TEXT:C284($_t_DocumentName; $_t_DocumentPath; $_t_DocumentText; $_t_FirstCell; $_t_FIrstChar; $_t_FIrstRow; $_t_Header; $_t_HRString; $_t_ImportAccountCode; $_t_ImportDebitAccountIdentifier; $_t_ImportType)
	C_TEXT:C284($_t_MinString; $_t_MonthString; $_t_oldMethodName; $_t_Record; $_t_Reference; $_t_Seconds; $_t_SGMLTEXT; $_t_SignOn; $_t_SIGNONMSGSRSTRNUID; $_t_SIGNONMSGSRSV1FIID; $_t_SIGNONMSGSRSV1FIUSERID)
	C_TEXT:C284($_t_SIGNONMSGSRSV1SFI; $_t_SIGNONMSGSRSV1SFIBID; $_t_SIGNONMSGSRSV1STATUSLanguage; $_t_SIGNONMSGSRSV1STATUSSeverity; $_t_SignOnMsgSrsVSSTAUSCODE; $_t_SIGNONMSGSRSVSSTAUSSEVERITY; $_t_SubDescription; $_t_text; $_t_TimeString; $_t_TransactionID; $_t_YearString)
	C_TEXT:C284($1)
	C_TIME:C306($_ti_Doc; $_ti_SIGNONMSGSRSV1TIME; $_ti_SIGNONMSGSRSV1UpdateTIME; $_ti_TransactionsMessageSendTime; $_ti_TransactionsMessagesStartTi)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_ImportStatementRecords")
If (Count parameters:C259>=1)
	$_t_ImportAccountCode:=$1
Else 
	$_t_ImportAccountCode:=Gen_Request("Enter the Account to import for"; "")
End if 


If ($_t_ImportAccountCode#"")
	$_l_AccountPreferenceID:=PREF_GetPreferenceID("Bank Account"+String:C10($_t_ImportAccountCode))
	ACC_r_OpeningBalance:=0
	ACC_D_OpeningBalanceDate:=!00-00-00!
	ARRAY TEXT:C222(ACC_at_StatementFields; 0)
	ARRAY TEXT:C222(ACC_at_DaybookFields; 0)
	ARRAY TEXT:C222(ACC_at_QIFFields; 0)
	ARRAY TEXT:C222(ACC_at_QIFDBFields; 0)
	$_l_Offset:=0
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_AccountPreferenceID)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_D_OpeningBalanceDate; $_l_Offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_r_OpeningBalance; $_l_Offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_StatementFields; $_l_Offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_DaybookFields; $_l_Offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_bo_CSVhasHeader; $_l_Offset)  //QIF Format Fields
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_QIFFields; $_l_Offset)  //QIF Format Fields
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_QIFDBFields; $_l_Offset)  //QIF map to 4D
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
	
	
	//Note that for any account we can only have one CSV format and one QIF format. The QBO format is hard coded so settings are not user
	$_ti_Doc:=Open document:C264(""; "*"; 2)
	CLOSE DOCUMENT:C267($_ti_Doc)
	$_t_DocumentPath:=document
	//have to do it that way because .qif not understood
	$_t_ImportType:=Substring:C12($_t_DocumentPath; Length:C16($_t_DocumentPath)-2)
	ARRAY TEXT:C222($_at_TransactionAccountCode; 0)
	ARRAY TEXT:C222($_at_TransactionReference; 0)
	ARRAY TEXT:C222($_at_TransactionType; 0)
	ARRAY DATE:C224($_ad_TransactionDate; 0)
	ARRAY TEXT:C222($_at_TransactionDescription; 0)
	ARRAY REAL:C219($_ar_TransactionDebitAmount; 0)
	ARRAY REAL:C219($_ar_TransactionCreditAmount; 0)
	ARRAY LONGINT:C221($_al_TransactionTimeStamp; 0)
	ARRAY REAL:C219($_ar_TransactionAccountBalance; 0)
	ARRAY TEXT:C222($_at_TransactionID; 0)
	READ WRITE:C146([ACC_Bank_Statements:198])
	QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionID:13="@"+"<CHECKNUM>"+"@")
	If (Records in selection:C76([ACC_Bank_Statements:198])>0)
		For ($_l_Index; 1; Records in selection:C76([ACC_Bank_Statements:198]))
			$_t_TransactionID:=[ACC_Bank_Statements:198]Bank_TransactionID:13
			$_l_OpenStringPosition:=Position:C15("<"; $_t_TransactionID)
			If ($_l_OpenStringPosition>0)
				$_t_TransactionID:=Substring:C12($_t_TransactionID; 1; $_l_OpenStringPosition-1)
			End if 
			$_t_TransactionID:=Replace string:C233($_t_TransactionID; Char:C90(13); "")
			$_t_TransactionID:=SCPT_StripTrailingSPACES($_t_TransactionID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
			$_t_TransactionID:=SCPT_StripLeadingSpaces($_t_TransactionID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
			[ACC_Bank_Statements:198]Bank_TransactionID:13:=$_t_TransactionID
			AA_CheckUUID(Table:C252(->[ACC_Bank_Statements:198]))
			<>SYS_t_LastSavedTableName:="ACC_Bank_Statements"
			SAVE RECORD:C53([ACC_Bank_Statements:198])
			NEXT RECORD:C51([ACC_Bank_Statements:198])
			
		End for 
	End if 
	Case of 
		: ($_t_ImportType="QBO")
			$_ti_Doc:=Open document:C264($_t_DocumentPath)
			RECEIVE PACKET:C104($_ti_Doc; $_t_DocumentText; 2000000)
			$_t_DocumentText:=Replace string:C233($_t_DocumentText; Char:C90(10); Char:C90(13))
			
			$_t_DocumentText:=Replace string:C233($_t_DocumentText; Char:C90(Line feed:K15:40); Char:C90(13))
			$_t_DocumentText:=Replace string:C233($_t_DocumentText; Char:C90(9); Char:C90(13))
			
			CLOSE DOCUMENT:C267($_ti_Doc)
			$_l_SlashPosition:=Position:C15("<OFX>"; $_t_DocumentText)
			If ($_l_SlashPosition>0)
				$_t_Before:=Substring:C12($_t_DocumentText; 1; $_l_SlashPosition-1)
				$_t_SGMLTEXT:=Substring:C12($_t_DocumentText; $_l_SlashPosition)
				$_l_SIGNONMSGSRSV1STATUSCODE:=0
				$_t_SIGNONMSGSRSV1STATUSSeverity:=""
				$_d_SIGNONMSGSRSV1SDATE:=!00-00-00!
				$_ti_SIGNONMSGSRSV1TIME:=?00:00:00?
				$_t_SIGNONMSGSRSV1STATUSLanguage:=""
				$_d_SIGNONMSGSRSV1SUpdateDATE:=!00-00-00!
				$_ti_SIGNONMSGSRSV1UpdateTIME:=?00:00:00?
				$_t_SIGNONMSGSRSV1SFI:=""
				$_t_SIGNONMSGSRSV1FIID:=""
				$_t_SIGNONMSGSRSV1SFIBID:=""
				$_t_SIGNONMSGSRSV1FIUSERID:=""
				$_t_SIGNONMSGSRSTRNUID:=""
				$_t_SignOnMsgSrsVSSTAUSCODE:=""
				$_t_SIGNONMSGSRSVSSTAUSSEVERITY:=""
				$_t_AccountCode:=""
				$_d_TransactsionMessagesStartDat:=!00-00-00!
				$_ti_TransactionsMessagesStartTi:=?00:00:00?
				$_d_TransactsionMessagesendDate:=!00-00-00!
				$_ti_TransactionsMessageSendTime:=?00:00:00?
				
				
				ARRAY TEXT:C222($_at_Messages; 0)
				$_l_SlashPosition:=Position:C15("<STMTRS>"; $_t_SGMLTEXT)
				If ($_l_SlashPosition>0)
					$_t_Header:=Substring:C12($_t_SGMLTEXT; 1; $_l_SlashPosition-1)
					$_t_SGMLTEXT:=Substring:C12($_t_SGMLTEXT; $_l_SlashPosition)
					$_l_SlashPosition:=Position:C15("</SIGNONMSGSRSV1>"; $_t_Header)
					If ($_l_SlashPosition>0)
						$_t_SignOn:=Substring:C12($_t_Header; 1; $_l_SlashPosition+Length:C16("</SIGNONMSGSRSV1>"))
						$_t_Header:=Substring:C12($_t_Header; $_l_SlashPosition+Length:C16("</SIGNONMSGSRSV1>"))
						$_l_SlashPosition:=Position:C15("<STATUS>"; $_t_SignOn)
						If ($_l_SlashPosition>0)
							$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<STATUS>"))
							$_l_SlashPosition:=Position:C15("<SEVERITY>"; $_t_SignOn)
							$_t_Code:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
							$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<SEVERITY>"))
							$_l_SIGNONMSGSRSV1STATUSCODE:=Num:C11(Replace string:C233($_t_Code; "<CODE>"; ""))
							
							$_l_SlashPosition:=Position:C15("</STATUS>"; $_t_SignOn)
							If ($_l_SlashPosition>0)
								$_t_SIGNONMSGSRSV1STATUSSeverity:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
								$_t_SIGNONMSGSRSV1STATUSSeverity:=Replace string:C233($_t_SIGNONMSGSRSV1STATUSSeverity; Char:C90(13); "")
								$_t_SIGNONMSGSRSV1STATUSSeverity:=SCPT_StripTrailingSPACES($_t_SIGNONMSGSRSV1STATUSSeverity; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
								$_t_SIGNONMSGSRSV1STATUSSeverity:=SCPT_StripLeadingSpaces($_t_SIGNONMSGSRSV1STATUSSeverity; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
								
								$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("</STATUS>"))
								$_l_SlashPosition:=Position:C15("<LANGUAGE>"; $_t_SignOn)
								If ($_l_SlashPosition>0)
									$_t_DateTimeString:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
									$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<LANGUAGE>"))
									$_t_DateString:=Substring:C12($_t_DateTimeString; 1; 8)
									$_t_YearString:=Substring:C12($_t_DateString; 1; 4)
									$_t_MonthString:=Substring:C12($_t_DateString; 5; 2)
									$_t_DayString:=Substring:C12($_t_DateString; 7; 2)
									$_t_TimeString:=Substring:C12($_t_DateTimeString; 9)
									$_t_HRString:=Substring:C12($_t_TimeString; 1; 2)
									$_t_MinString:=Substring:C12($_t_TimeString; 3; 2)
									$_t_Seconds:=Substring:C12($_t_TimeString; 5; 2)
									$_l_AddMonths:=(Num:C11($_t_MonthString)-1)
									$_l_AddDays:=(Num:C11($_t_DayString)-1)
									$_d_SIGNONMSGSRSV1SDATE:=Date:C102("01/01/"+$_t_YearString)
									$_d_SIGNONMSGSRSV1SDATE:=Add to date:C393($_d_SIGNONMSGSRSV1SDATE; 0; $_l_AddMonths; $_l_AddDays)
									$_ti_SIGNONMSGSRSV1TIME:=Time:C179($_t_HRString+":"+$_t_MinString+":"+$_t_Seconds)
									$_l_SlashPosition:=Position:C15("<DTPROFUP>"; $_t_SignOn)
									If ($_l_SlashPosition>0)
										$_t_SIGNONMSGSRSV1STATUSLanguage:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
										$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<DTPROFUP>"))
										$_l_SlashPosition:=Position:C15("<FI>"; $_t_SignOn)
										If ($_l_SlashPosition>0)
											$_t_DateTimeString:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
											$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<FI>"))
											$_t_DateString:=Substring:C12($_t_DateTimeString; 1; 8)
											$_t_YearString:=Substring:C12($_t_DateString; 1; 4)
											$_t_MonthString:=Substring:C12($_t_DateString; 5; 2)
											$_t_DayString:=Substring:C12($_t_DateString; 7; 2)
											$_t_TimeString:=Substring:C12($_t_DateTimeString; 9)
											$_t_HRString:=Substring:C12($_t_TimeString; 1; 2)
											$_t_MinString:=Substring:C12($_t_TimeString; 3; 2)
											$_t_Seconds:=Substring:C12($_t_TimeString; 5; 2)
											$_l_AddMonths:=(Num:C11($_t_MonthString)-1)
											$_l_AddDays:=(Num:C11($_t_DayString)-1)
											$_d_SIGNONMSGSRSV1SUpdateDATE:=Date:C102("01/01/"+$_t_YearString)
											$_d_SIGNONMSGSRSV1SUpdateDATE:=Add to date:C393($_d_SIGNONMSGSRSV1SDATE; 0; $_l_AddMonths; $_l_AddDays)
											$_ti_SIGNONMSGSRSV1UpdateTIME:=Time:C179($_t_HRString+":"+$_t_MinString+":"+$_t_Seconds)
											$_l_SlashPosition:=Position:C15("<FID>"; $_t_SignOn)
											
											If ($_l_SlashPosition>0)
												$_t_SIGNONMSGSRSV1SFI:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
												$_t_SIGNONMSGSRSV1SFI:=Replace string:C233($_t_SIGNONMSGSRSV1SFI; "<ORG>"; "")
												$_t_SIGNONMSGSRSV1SFI:=SCPT_StripTrailingSPACES($_t_SIGNONMSGSRSV1SFI; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
												$_t_SIGNONMSGSRSV1SFI:=SCPT_StripLeadingSpaces($_t_SIGNONMSGSRSV1SFI; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
												
												$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<FID>"))
												$_l_SlashPosition:=Position:C15("</FI>"; $_t_SignOn)
												
												If ($_l_SlashPosition>0)
													$_t_SIGNONMSGSRSV1FIID:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
													$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("</FI>"))
													$_t_SIGNONMSGSRSV1FIID:=SCPT_StripTrailingSPACES($_t_SIGNONMSGSRSV1FIID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
													$_t_SIGNONMSGSRSV1FIID:=SCPT_StripLeadingSpaces($_t_SIGNONMSGSRSV1FIID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
													
													$_l_SlashPosition:=Position:C15("<INTU.USERID>"; $_t_SignOn)
													If ($_l_SlashPosition>0)
														$_t_SIGNONMSGSRSV1SFIBID:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
														$_t_SIGNONMSGSRSV1SFIBID:=Replace string:C233($_t_SIGNONMSGSRSV1SFIBID; "<INTU.BID>"; "")
														$_t_SIGNONMSGSRSV1SFIBID:=SCPT_StripTrailingSPACES($_t_SIGNONMSGSRSV1SFIBID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
														$_t_SIGNONMSGSRSV1SFIBID:=SCPT_StripLeadingSpaces($_t_SIGNONMSGSRSV1SFIBID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
														
														$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<INTU.USERID>"))
														$_l_SlashPosition:=Position:C15("</SONRS>"; $_t_SignOn)
														If ($_l_SlashPosition>0)
															$_t_SIGNONMSGSRSV1FIUSERID:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
															$_t_SIGNONMSGSRSV1FIUSERID:=SCPT_StripTrailingSPACES($_t_SIGNONMSGSRSV1FIUSERID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
															$_t_SIGNONMSGSRSV1FIUSERID:=SCPT_StripLeadingSpaces($_t_SIGNONMSGSRSV1FIUSERID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
															
															
															$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("</SONRS>"))
															//`
															$_l_SlashPosition:=Position:C15("</SIGNONMSGSRSV1>"; $_t_SignOn)  //```
															If ($_l_SlashPosition>0)
																$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("</SIGNONMSGSRSV1>"))
																
																$_l_SlashPosition:=Position:C15("<BANKMSGSRSV1>"; $_t_Header)  //
																If ($_l_SlashPosition>0)
																	$_t_SignOn:=Substring:C12($_t_Header; $_l_SlashPosition+Length:C16("<BANKMSGSRSV1>"))
																	$_l_SlashPosition:=Position:C15("<STMTTRNRS>"; $_t_SignOn)  //
																	If ($_l_SlashPosition>0)
																		$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<STMTTRNRS>"))
																		$_l_SlashPosition:=Position:C15("<STATUS>"; $_t_SignOn)  //
																		If ($_l_SlashPosition>0)
																			$_t_SIGNONMSGSRSTRNUID:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
																			$_t_SIGNONMSGSRSTRNUID:=Replace string:C233($_t_SIGNONMSGSRSTRNUID; "<TRNUID>"; "")
																			$_t_SIGNONMSGSRSTRNUID:=Replace string:C233($_t_SIGNONMSGSRSTRNUID; Char:C90(13); "")
																			$_t_SIGNONMSGSRSTRNUID:=SCPT_StripTrailingSPACES($_t_SIGNONMSGSRSTRNUID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																			$_t_SIGNONMSGSRSTRNUID:=SCPT_StripLeadingSpaces($_t_SIGNONMSGSRSTRNUID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																			
																			$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<STATUS>"))
																			$_l_SlashPosition:=Position:C15("<SEVERITY>"; $_t_SignOn)  //
																			If ($_l_SlashPosition>0)
																				$_t_SignOnMsgSrsVSSTAUSCODE:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
																				$_t_SignOnMsgSrsVSSTAUSCODE:=Replace string:C233($_t_SignOnMsgSrsVSSTAUSCODE; "<CODE>"; "")
																				$_t_SignOnMsgSrsVSSTAUSCODE:=Replace string:C233($_t_SignOnMsgSrsVSSTAUSCODE; Char:C90(13); "")
																				$_t_SignOnMsgSrsVSSTAUSCODE:=SCPT_StripTrailingSPACES($_t_SignOnMsgSrsVSSTAUSCODE; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																				$_t_SignOnMsgSrsVSSTAUSCODE:=SCPT_StripLeadingSpaces($_t_SignOnMsgSrsVSSTAUSCODE; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																				
																				$_t_SignOn:=Substring:C12($_t_SignOn; $_l_SlashPosition+Length:C16("<SEVERITY>"))
																				$_l_SlashPosition:=Position:C15("</STATUS>"; $_t_SignOn)  //
																				If ($_l_SlashPosition>0)
																					$_t_SIGNONMSGSRSVSSTAUSSEVERITY:=Substring:C12($_t_SignOn; 1; $_l_SlashPosition-1)
																					$_t_SIGNONMSGSRSVSSTAUSSEVERITY:=Replace string:C233($_t_SIGNONMSGSRSVSSTAUSSEVERITY; Char:C90(13); "")
																					$_t_SIGNONMSGSRSVSSTAUSSEVERITY:=SCPT_StripTrailingSPACES($_t_SIGNONMSGSRSVSSTAUSSEVERITY; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																					$_t_SIGNONMSGSRSVSSTAUSSEVERITY:=SCPT_StripLeadingSpaces($_t_SIGNONMSGSRSVSSTAUSSEVERITY; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																					
																					$_l_SlashPosition:=Position:C15("<STMTTRN>"; $_t_SGMLTEXT)
																					$_t_Before:=Substring:C12($_t_SGMLTEXT; 1; $_l_SlashPosition-1)
																					$_t_SGMLTEXT:=Substring:C12($_t_SGMLTEXT; $_l_SlashPosition)
																					$_l_SlashPosition:=Position:C15("<ACCTTYPE>"; $_t_Before)
																					$_t_Account:=Substring:C12($_t_Before; 1; $_l_SlashPosition-1)
																					$_t_Account:=Replace string:C233($_t_Account; Char:C90(13); "")
																					$_t_Account:=SCPT_StripTrailingSPACES($_t_Account; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																					$_t_Account:=SCPT_StripLeadingSpaces($_t_Account; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																					
																					$_l_SlashPosition:=Position:C15("<ACCTID>"; $_t_Account)
																					$_t_AccountCode:=Substring:C12($_t_Account; $_l_SlashPosition+Length:C16("<ACCTID>"))
																					$_l_SlashPosition:=Position:C15("<DTEND>"; $_t_Before)
																					$_t_DateStartString:=Substring:C12($_t_Before; 1; $_l_SlashPosition-1)
																					$_l_SlashPosition:=Position:C15("<DTSTART>"; $_t_DateStartString)
																					$_t_DateStartString:=Substring:C12($_t_DateStartString; $_l_SlashPosition+Length:C16("<DTSTART>"))
																					$_t_DateString:=Substring:C12($_t_DateStartString; 1; 8)
																					$_t_YearString:=Substring:C12($_t_DateString; 1; 4)
																					$_t_MonthString:=Substring:C12($_t_DateString; 5; 2)
																					$_t_DayString:=Substring:C12($_t_DateString; 7; 2)
																					$_t_TimeString:=Substring:C12($_t_DateStartString; 9)
																					$_t_HRString:=Substring:C12($_t_TimeString; 1; 2)
																					$_t_MinString:=Substring:C12($_t_TimeString; 3; 2)
																					$_t_Seconds:=Substring:C12($_t_TimeString; 5; 2)
																					$_l_AddMonths:=(Num:C11($_t_MonthString)-1)
																					$_l_AddDays:=(Num:C11($_t_DayString)-1)
																					$_d_TransactsionMessagesStartDat:=Date:C102("01/01/"+$_t_YearString)
																					$_d_TransactsionMessagesStartDat:=Add to date:C393($_d_SIGNONMSGSRSV1SDATE; 0; $_l_AddMonths; $_l_AddDays)
																					$_ti_TransactionsMessagesStartTi:=Time:C179($_t_HRString+":"+$_t_MinString+":"+$_t_Seconds)
																					$_l_SlashPosition:=Position:C15("<DTEND>"; $_t_Before)
																					$_t_DateStartString:=Substring:C12($_t_DateStartString; $_l_SlashPosition+Length:C16("<DTEND>"))
																					$_t_DateString:=Substring:C12($_t_DateStartString; 1; 8)
																					$_t_YearString:=Substring:C12($_t_DateString; 1; 4)
																					$_t_MonthString:=Substring:C12($_t_DateString; 5; 2)
																					$_t_DayString:=Substring:C12($_t_DateString; 7; 2)
																					$_t_TimeString:=Substring:C12($_t_DateStartString; 9)
																					$_t_HRString:=Substring:C12($_t_TimeString; 1; 2)
																					$_t_MinString:=Substring:C12($_t_TimeString; 3; 2)
																					$_t_Seconds:=Substring:C12($_t_TimeString; 5; 2)
																					$_l_AddMonths:=(Num:C11($_t_MonthString)-1)
																					$_l_AddDays:=(Num:C11($_t_DayString)-1)
																					$_d_TransactsionMessagesendDate:=Date:C102("01/01/"+$_t_YearString)
																					$_d_TransactsionMessagesendDate:=Add to date:C393($_d_SIGNONMSGSRSV1SDATE; 0; $_l_AddMonths; $_l_AddDays)
																					$_ti_TransactionsMessageSendTime:=Time:C179($_t_HRString+":"+$_t_MinString+":"+$_t_Seconds)
																					Repeat 
																						$_l_SlashPosition:=Position:C15("/STMTTRN>"; $_t_SGMLTEXT)
																						If ($_l_SlashPosition>0)
																							$_t_Record:=Substring:C12($_t_SGMLTEXT; 1; $_l_SlashPosition+Length:C16("/STMTTRN>"))
																							$_t_SGMLTEXT:=Substring:C12($_t_SGMLTEXT; $_l_SlashPosition+Length:C16("/STMTTRN>"))
																							APPEND TO ARRAY:C911($_at_Messages; $_t_Record)
																							
																						End if 
																					Until ($_l_SlashPosition=0)
																					$_l_ArraySize:=Size of array:C274($_at_Messages)
																					ARRAY TEXT:C222($_at_TransactionAccountCode; $_l_ArraySize)
																					ARRAY TEXT:C222($_at_TransactionType; $_l_ArraySize)
																					ARRAY DATE:C224($_ad_TransactionDate; $_l_ArraySize)
																					ARRAY TEXT:C222($_at_TransactionDescription; $_l_ArraySize)
																					ARRAY REAL:C219($_ar_TransactionDebitAmount; $_l_ArraySize)
																					ARRAY REAL:C219($_ar_TransactionCreditAmount; $_l_ArraySize)
																					ARRAY LONGINT:C221($_al_TransactionTimeStamp; $_l_ArraySize)
																					ARRAY TEXT:C222($_at_TransactionReference; $_l_ArraySize)
																					ARRAY TEXT:C222($_at_TransactionID; $_l_ArraySize)
																					For ($_l_Index; 1; Size of array:C274($_at_Messages))
																						$_t_Record:=$_at_Messages{$_l_Index}
																						
																						$_t_Record:=Replace string:C233($_t_Record; "<STMTTRN>"; "")
																						$_t_Record:=Replace string:C233($_t_Record; "</STMTTRN>"; "")
																						$_at_TransactionAccountCode{$_l_Index}:=$_t_AccountCode
																						$_l_SlashPosition:=Position:C15("<MEMO>"; $_t_Record)
																						If ($_l_SlashPosition>0)
																							$_at_TransactionDescription{$_l_Index}:=Substring:C12($_t_Record; $_l_SlashPosition+Length:C16("<MEMO>"))
																							$_at_TransactionDescription{$_l_Index}:=Replace string:C233($_at_TransactionDescription{$_l_Index}; Char:C90(13); "")
																							$_at_TransactionDescription{$_l_Index}:=SCPT_StripTrailingSPACES($_at_TransactionDescription{$_l_Index}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							$_at_TransactionDescription{$_l_Index}:=SCPT_StripLeadingSpaces($_at_TransactionDescription{$_l_Index}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							
																							$_t_Record:=Substring:C12($_t_Record; 1; $_l_SlashPosition-1)
																						End if 
																						
																						$_l_SlashPosition:=Position:C15("<NAME>"; $_t_Record)
																						If ($_l_SlashPosition>0)
																							$_at_TransactionDescription{$_l_Index}:=Substring:C12($_t_Record; $_l_SlashPosition+Length:C16("<NAME>"))+", "+$_at_TransactionDescription{$_l_Index}
																							$_at_TransactionDescription{$_l_Index}:=Replace string:C233($_at_TransactionDescription{$_l_Index}; Char:C90(13); "")
																							$_at_TransactionDescription{$_l_Index}:=SCPT_StripTrailingSPACES($_at_TransactionDescription{$_l_Index}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							$_at_TransactionDescription{$_l_Index}:=SCPT_StripLeadingSpaces($_at_TransactionDescription{$_l_Index}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							
																							$_t_Record:=Substring:C12($_t_Record; 1; $_l_SlashPosition-1)
																						End if 
																						$_l_SlashPosition:=Position:C15("<FITID>"; $_t_Record)
																						If ($_l_SlashPosition>0)
																							$_t_TransactionID:=Substring:C12($_t_Record; $_l_SlashPosition+Length:C16("<FITID>"))
																							$_l_OpenStringPosition:=Position:C15("<"; $_t_TransactionID)
																							If ($_l_OpenStringPosition>0)
																								$_t_TransactionID:=Substring:C12($_t_TransactionID; 1; $_l_OpenStringPosition-1)
																							End if 
																							$_t_TransactionID:=Replace string:C233($_t_TransactionID; Char:C90(13); "")
																							$_t_TransactionID:=SCPT_StripTrailingSPACES($_t_TransactionID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							$_t_TransactionID:=SCPT_StripLeadingSpaces($_t_TransactionID; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							$_at_TransactionID{$_l_Index}:=$_t_TransactionID
																							$_at_TransactionDescription{$_l_Index}:=Substring:C12($_t_Record; $_l_SlashPosition+Length:C16("<FITID>"))+", "+$_at_TransactionDescription{$_l_Index}
																							$_at_TransactionDescription{$_l_Index}:=Replace string:C233($_at_TransactionDescription{$_l_Index}; Char:C90(13); "")
																							$_at_TransactionDescription{$_l_Index}:=SCPT_StripTrailingSPACES($_at_TransactionDescription{$_l_Index}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							$_at_TransactionDescription{$_l_Index}:=SCPT_StripLeadingSpaces($_at_TransactionDescription{$_l_Index}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							
																							$_t_Record:=Substring:C12($_t_Record; 1; $_l_SlashPosition-1)
																						End if 
																						
																						$_l_SlashPosition:=Position:C15("<TRNAMT>"; $_t_Record)
																						If ($_l_SlashPosition>0)
																							$_t_AmountString:=Substring:C12($_t_Record; $_l_SlashPosition+Length:C16("<TRNAMT>"))
																							$_t_Record:=Substring:C12($_t_Record; 1; $_l_SlashPosition-1)
																							$_r_Amount:=Num:C11($_t_AmountString)
																							If ($_r_Amount<0)
																								$_ar_TransactionDebitAmount{$_l_Index}:=Abs:C99($_r_Amount)
																							Else 
																								$_ar_TransactionCreditAmount{$_l_Index}:=$_r_Amount
																							End if 
																							
																							$_l_SlashPosition:=Position:C15("<DTPOSTED>"; $_t_Record)
																							$_t_DateStartString:=Substring:C12($_t_Record; $_l_SlashPosition+Length:C16("<DTPOSTED>"))
																							$_t_Record:=Substring:C12($_t_Record; 1; $_l_SlashPosition-1)
																							
																							$_t_DateString:=Substring:C12($_t_DateStartString; 1; 8)
																							$_t_YearString:=Substring:C12($_t_DateString; 1; 4)
																							$_t_MonthString:=Substring:C12($_t_DateString; 5; 2)
																							$_t_DayString:=Substring:C12($_t_DateString; 7; 2)
																							$_t_TimeString:=Substring:C12($_t_DateStartString; 9)
																							$_t_HRString:=Substring:C12($_t_TimeString; 1; 2)
																							$_t_MinString:=Substring:C12($_t_TimeString; 3; 2)
																							$_t_Seconds:=Substring:C12($_t_TimeString; 5; 2)
																							$_l_AddMonths:=(Num:C11($_t_MonthString)-1)
																							$_l_AddDays:=(Num:C11($_t_DayString)-1)
																							$_ad_TransactionDate{$_l_Index}:=Date:C102("01/01/"+$_t_YearString)
																							$_ad_TransactionDate{$_l_Index}:=Add to date:C393($_ad_TransactionDate{$_l_Index}; 0; $_l_AddMonths; $_l_AddDays)
																							$_al_TransactionTimeStamp{$_l_Index}:=(Time:C179($_t_HRString+":"+$_t_MinString+":"+$_t_Seconds))*1
																							
																							$_l_SlashPosition:=Position:C15("<TRNTYPE>"; $_t_Record)
																							$_at_TransactionType{$_l_Index}:=Substring:C12($_t_Record; $_l_SlashPosition+Length:C16("<TRNTYPE>"))
																							$_at_TransactionType{$_l_Index}:=Replace string:C233($_at_TransactionType{$_l_Index}; Char:C90(13); "")
																							$_at_TransactionType{$_l_Index}:=SCPT_StripTrailingSPACES($_at_TransactionType{$_l_Index}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							$_at_TransactionType{$_l_Index}:=SCPT_StripLeadingSpaces($_at_TransactionType{$_l_Index}; Char:C90(32); Char:C90(9); Char:C90(0); Char:C90(1); Char:C90(2); Char:C90(3); Char:C90(4); Char:C90(5); Char:C90(6); Char:C90(7); Char:C90(8); Char:C90(10); Char:C90(11); Char:C90(12); Char:C90(14); Char:C90(15); Char:C90(16); Char:C90(202))
																							
																							
																							
																						End if 
																						
																					End for 
																					
																					
																					
																				End if 
																			End if 
																		End if 
																	End if 
																End if 
															End if 
														End if 
														
														
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				
			End if 
			
		: ($_t_ImportType="csv")
			$_ti_Doc:=Open document:C264($_t_DocumentPath; "*"; 2)
			ARRAY TEXT:C222($_at_DocText; 0)
			Repeat 
				RECEIVE PACKET:C104($_ti_Doc; $_t_text; 32000)
				If ($_t_text#"")
					APPEND TO ARRAY:C911($_at_DocText; $_t_text)
				End if 
			Until ($_t_text="")
			ARRAY TEXT:C222($_at_RowsText; 0)
			For ($_l_Index; 1; Size of array:C274($_at_DocText))
				Repeat 
					$_l_SlashPosition:=Position:C15(Char:C90(13); $_at_DocText{$_l_Index})
					If ($_l_SlashPosition=0)
						$_l_SlashPosition:=Position:C15(Char:C90(10); $_at_DocText{$_l_Index})
					End if 
					If ($_l_SlashPosition=0)
						If ($_l_Index<Size of array:C274($_at_DocText))
							$_at_DocText{$_l_Index+1}:=$_at_DocText{$_l_Index}
						End if 
					Else 
						$_t_Record:=Substring:C12($_at_DocText{$_l_Index}; 1; $_l_SlashPosition-1)
						$_at_DocText{$_l_Index}:=Substring:C12($_at_DocText{$_l_Index}; $_l_SlashPosition+1)
						APPEND TO ARRAY:C911($_at_RowsText; $_t_Record)
					End if 
				Until ($_l_SlashPosition=0)
			End for 
			$_bo_Continue:=False:C215
			//TRACE
			If (Size of array:C274($_at_RowsText)>0)
				$_t_FIrstRow:=$_at_RowsText{1}
				$_l_Position:=Position:C15(","; $_t_FIrstRow)
				If ($_l_Position>0)  //else not valid csv
					$_t_FirstCell:=Substring:C12($_t_FIrstRow; 1; $_l_Position-1)
					ARRAY TEXT:C222($_at_CellNames; 0)
					ARRAY TEXT:C222($_at_FieldNames; 0)
					If (Date:C102($_t_FirstCell)=!00-00-00!)
						APPEND TO ARRAY:C911($_at_CellNames; $_t_FirstCell)
						$_t_FIrstRow:=Substring:C12($_t_FIrstRow; $_l_Position+1)
						Repeat 
							$_l_Position:=Position:C15(","; $_t_FIrstRow)
							If ($_l_Position>0)
								$_t_CellName:=Substring:C12($_t_FIrstRow; 1; $_l_Position-1)
								$_t_CellName:=Replace string:C233($_t_CellName; Char:C90(34); "")
								$_t_FIrstRow:=Substring:C12($_t_FIrstRow; $_l_Position+1)
								APPEND TO ARRAY:C911($_at_CellNames; $_t_CellName)
							Else 
								If ($_t_FIrstRow#"")
									$_t_FIrstRow:=Replace string:C233($_t_FIrstRow; Char:C90(34); "")
									APPEND TO ARRAY:C911($_at_CellNames; $_t_FIrstRow)
								End if 
							End if 
						Until ($_l_Position=0)
						$_l_StartAtRow:=2
						//$_bo_Continue:=True
						If (Size of array:C274($_at_CellNames)#Size of array:C274(ACC_at_StatementFields))
							If (Size of array:C274(ACC_at_StatementFields)>0)
								$_bo_Continue:=True:C214
								
							Else 
								//first time
								$_bo_Continue:=False:C215
								ACC_bo_CSVhasHeader:=True:C214
								Gen_Confirm("The definition of the CSV format for account "+$_t_ImportAccountCode+" Is not setup. Do you want to set it up now. The import cannot proceed without a setup"; "Setup"; "Cancel")
								If (Ok=1)
									COPY ARRAY:C226($_at_CellNames; ACC_at_StatementFields)
									ACC_EditImportSettings($_t_ImportAccountCode; "CSV"; False:C215; ->$_at_CellNames)
									If (OK=1)
										$_bo_Continue:=True:C214
									End if 
								End if 
							End if 
						Else 
							$_bo_Continue:=True:C214
						End if 
						
					Else 
						//No header row
						//$_t_FIrstRow:=Substring($_t_FIrstRow;$_l_Position+1)
						ARRAY TEXT:C222($_at_CellNames; 0)
						ARRAY TEXT:C222($_at_FieldNames; 0)
						If (Date:C102($_t_FirstCell)#!00-00-00!)
							APPEND TO ARRAY:C911($_at_CellNames; $_t_FirstCell)
							$_t_FIrstRow:=Substring:C12($_t_FIrstRow; $_l_Position+1)
							Repeat 
								$_l_Position:=Position:C15(","; $_t_FIrstRow)
								If ($_l_Position>0)
									$_t_CellName:=Substring:C12($_t_CellName; 1; $_l_Position-1)
									$_t_CellName:=Replace string:C233($_t_CellName; Char:C90(34); "")
									$_t_FIrstRow:=Substring:C12($_t_FIrstRow; $_l_Position+1)
									APPEND TO ARRAY:C911($_at_CellNames; $_t_CellName)
								Else 
									If ($_t_FIrstRow#"")
										$_t_FIrstRow:=Replace string:C233($_t_FIrstRow; Char:C90(34); "")
										APPEND TO ARRAY:C911($_at_CellNames; $_t_FIrstRow)
									End if 
								End if 
							Until ($_l_Position=0)
							$_l_StartAtRow:=1
							If (Size of array:C274($_at_CellNames)#Size of array:C274(ACC_at_StatementFields))
								If (Size of array:C274(ACC_at_StatementFields)>0)
									$_bo_Continue:=True:C214
									
								Else 
									//first time
									$_bo_Continue:=False:C215
									Gen_Confirm("The definition of the CSV format for account "+$_t_ImportAccountCode+" Is not setup. Do you want to set it up now. The import cannot proceed without a setup"; "Setup"; "Cancel")
									If (Ok=1)
										COPY ARRAY:C226($_at_CellNames; ACC_at_StatementFields)
										ACC_EditImportSettings($_t_ImportAccountCode; "CSV"; False:C215; ->$_at_CellNames)
										If (OK=1)
											$_bo_Continue:=True:C214
										End if 
									End if 
								End if 
							Else 
								$_bo_Continue:=True:C214
							End if 
							
						Else 
							Gen_Alert("This CSV file does not look correct!")
							
						End if 
						
					End if 
				End if 
			End if 
			//For ($_l_Index;$_l_StartAtRow;Size of array
			If ($_bo_Continue)
				$_bo_Continue:=False:C215
				If ([PREFERENCES:116]IDNumber:1#ACC_l_LoadPreferencesID)
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=ACC_l_LoadPreferencesID)
				End if 
				$_l_Offset:=0
				ARRAY TEXT:C222(ACC_at_FieldNames; 0)
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Account Code")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Bank Transaction Reference")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Date")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Type")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Description")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Amount")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Debit Amount")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Transaction Credit Amount")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Debit Amount Identifier")
				APPEND TO ARRAY:C911(ACC_at_FieldNames; "Account Balance")
				
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_D_OpeningBalanceDate; $_l_Offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_r_OpeningBalance; $_l_Offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_StatementFields; $_l_Offset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_DaybookFields; $_l_Offset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_bo_CSVhasHeader; $_l_Offset)  //QIF Format Fields
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_QIFFields; $_l_Offset)  //QIF Format Fields
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_at_QIFDBFields; $_l_Offset)  //QIF map to 4D
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
				If (Size of array:C274(ACC_at_DaybookFields)=Size of array:C274($_at_CellNames))  //first validation
					$_l_DebitAccountFieldPos:=Find in array:C230(ACC_at_DaybookFields; "Transaction Debit Amount")
					If ($_l_DebitAccountFieldPos>0)
						//if we have a field assigned to debit amount then we must also have one to credit amount
						$_l_creditAccountFieldPos:=Find in array:C230(ACC_at_DaybookFields; "Transaction Credit Amount")
						If ($_l_creditAccountFieldPos>0)
							$_l_dateFieldPos:=Find in array:C230(ACC_at_DaybookFields; "Transaction Date")
							If ($_l_dateFieldPos>0)
								$_bo_Continue:=True:C214
							Else 
								$_bo_Continue:=False:C215
								Gen_Alert("The import cannot continue because you have not identified Which cell contains the transaction date!")
							End if 
						Else 
							$_bo_Continue:=False:C215
							Gen_Alert("The import cannot continue because you have not identified Which cell contains the transaction credit amount!")
						End if 
					Else 
						$_l_TransAmountFieldPosition:=Find in array:C230(ACC_at_DaybookFields; "Transaction Amount")
						If ($_l_TransAmountFieldPosition>0)
							$_l_TransDateFieldPosition:=Find in array:C230(ACC_at_DaybookFields; "Transaction Date")
							If ($_l_TransDateFieldPosition>0)
								$_bo_Continue:=True:C214
							Else 
								$_bo_Continue:=False:C215
								Gen_Alert("The import cannot continue because you have not identified Which cell contains the transaction date!")
							End if 
						Else 
							$_bo_Continue:=False:C215
							Gen_Alert("The import cannot continue because you have not identified Which cell contains the transaction amount!")
						End if 
					End if 
				Else 
					$_bo_Continue:=False:C215
					//Gen_Alert ("The import cannot continue because the corresponding Daybook fields have not been identified!")
					//Gen_Confirm ("You do not have the Corresponding Daybook Fields setup for this Import";"Setup";"Stop")
					//If (OK=1)
					
					//Else
					//end if
				End if 
				ARRAY POINTER:C280($_aptr_DaybookFieldPointers; 0)
				ARRAY LONGINT:C221($_al_CSVFields; 0)
				If ($_bo_Continue)
					
					
					For ($_l_Index; 1; Size of array:C274(ACC_at_StatementFields))
						Case of 
							: (ACC_at_DaybookFields{$_l_Index}="Account Code")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Daybook_Account_Code:3)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
							: (ACC_at_DaybookFields{$_l_Index}="Bank Transaction Reference")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Bank_TransactionReference:4)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
							: (ACC_at_DaybookFields{$_l_Index}="Transaction Date")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Bank_TransactionDate:5)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
							: (ACC_at_DaybookFields{$_l_Index}="Transaction Type")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Bank_TransactionType:6)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
							: (ACC_at_DaybookFields{$_l_Index}="Transaction Description")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Bank_Transaction_Details:7)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
							: (ACC_at_DaybookFields{$_l_Index}="Transaction Amount")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Bank_DebitAmount:8)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
								//note that although we point this at the debit amount if there is nothing pointing at the debit/credit amounts then +=credit and -debit
							: (ACC_at_DaybookFields{$_l_Index}="Transaction Debit Amount")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Bank_DebitAmount:8)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
							: (ACC_at_DaybookFields{$_l_Index}="Transaction Debit Amount")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Bank_CreditAmount:9)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
							: (ACC_at_DaybookFields{$_l_Index}="Debit Amount Identifier")
								$_t_ImportDebitAccountIdentifier:=ACC_at_StatementFields{$_l_Index}
								$_l_DebitAccountIdentCell:=$_l_Index
								//`the name of the import cell must be the name of the value in that cell that=a flag indicating debit amount
							: (ACC_at_DaybookFields{$_l_Index}="Account Balance")
								APPEND TO ARRAY:C911($_aptr_DaybookFieldPointers; ->[ACC_Bank_Statements:198]Bank_Balance:10)
								APPEND TO ARRAY:C911($_al_CSVFields; $_l_Index)
								$_bo_DoNotVerifyBalance:=True:C214
						End case 
					End for 
					
					For ($_l_Index; 1; Size of array:C274($_at_RowsText))
						ARRAY TEXT:C222($_at_CellNames; 0)
						$_t_FIrstRow:=$_at_RowsText{$_l_Index}
						Repeat 
							$_l_Position:=Position:C15(","; $_t_FIrstRow)
							If ($_l_Position>0)
								$_t_CellName:=Substring:C12($_t_FIrstRow; 1; $_l_Position-1)
								$_t_CellName:=Replace string:C233($_t_CellName; Char:C90(34); "")
								$_t_FIrstRow:=Substring:C12($_t_FIrstRow; $_l_Position+1)
								APPEND TO ARRAY:C911($_at_CellNames; $_t_CellName)
							Else 
								If ($_t_FIrstRow#"")
									$_t_FIrstRow:=Replace string:C233($_t_FIrstRow; Char:C90(34); "")
									APPEND TO ARRAY:C911($_at_CellNames; $_t_FIrstRow)
								End if 
							End if 
						Until ($_l_Position=0)
						APPEND TO ARRAY:C911($_at_TransactionAccountCode; "")
						APPEND TO ARRAY:C911($_at_TransactionType; "")
						APPEND TO ARRAY:C911($_ad_TransactionDate; !00-00-00!)
						APPEND TO ARRAY:C911($_at_TransactionReference; "")
						APPEND TO ARRAY:C911($_at_TransactionDescription; "")
						APPEND TO ARRAY:C911($_ar_TransactionDebitAmount; 0)
						APPEND TO ARRAY:C911($_ar_TransactionCreditAmount; 0)
						APPEND TO ARRAY:C911($_al_TransactionTimeStamp; 0)
						APPEND TO ARRAY:C911($_ar_TransactionAccountBalance; 0)
						$_l_ArraySize:=Size of array:C274($_ar_TransactionAccountBalance)
						For ($_l_Index; 1; Size of array:C274($_at_CellNames))
							$_l_FieldPosition:=Find in array:C230($_al_CSVFields; $_l_Index)
							If ($_l_FieldPosition>0)
								Case of 
									: (Field:C253($_aptr_DaybookFieldPointers{$_l_FieldPosition})=Field:C253(->[ACC_Bank_Statements:198]Bank_Balance:10))
										$_ar_TransactionAccountBalance{$_l_ArraySize}:=Num:C11($_at_CellNames{$_l_Index})
									: (Field:C253($_aptr_DaybookFieldPointers{$_l_FieldPosition})=Field:C253(->[ACC_Bank_Statements:198]Bank_CreditAmount:9))
										$_ar_TransactionCreditAmount{$_l_ArraySize}:=Num:C11($_at_CellNames{$_l_Index})
									: (Field:C253($_aptr_DaybookFieldPointers{$_l_FieldPosition})=Field:C253(->[ACC_Bank_Statements:198]Bank_DebitAmount:8))
										$_r_Amount:=Num:C11($_at_CellNames{$_l_Index})
										If ($_r_Amount<0)
											$_ar_TransactionDebitAmount{$_l_ArraySize}:=Abs:C99(Num:C11($_at_CellNames{$_l_Index}))
										Else 
											//its a positive amount so if there is another cell with the credit amounts this is positive amount goes on the debit amount
											//if there is not Credit amount cell then this is a credit amount...
											$_bo_HasCCPointer:=False:C215
											For ($_l_Index2; 1; Size of array:C274($_aptr_DaybookFieldPointers))
												If (Field:C253($_aptr_DaybookFieldPointers{$_l_Index2})=Field:C253(->[ACC_Bank_Statements:198]Bank_CreditAmount:9))
													$_bo_HasCCPointer:=True:C214
													$_l_Index2:=9999
												End if 
											End for 
											If ($_bo_HasCCPointer)
												$_ar_TransactionDebitAmount{$_l_ArraySize}:=Abs:C99(Num:C11($_at_CellNames{$_l_Index}))
											Else 
												$_ar_TransactionCreditAmount{$_l_ArraySize}:=Num:C11($_at_CellNames{$_l_Index})
											End if 
										End if 
									: (Field:C253($_aptr_DaybookFieldPointers{$_l_FieldPosition})=Field:C253(->[ACC_Bank_Statements:198]Bank_Transaction_Details:7))
										
										If ($_at_TransactionDescription{$_l_ArraySize}="")
											$_at_TransactionDescription{$_l_ArraySize}:=$_at_CellNames{$_l_Index}
										Else 
											$_at_TransactionDescription{$_l_ArraySize}:=$_at_TransactionDescription{$_l_ArraySize}+" "+$_at_CellNames{$_l_Index}
										End if 
									: (Field:C253($_aptr_DaybookFieldPointers{$_l_FieldPosition})=Field:C253(->[ACC_Bank_Statements:198]Bank_TransactionType:6))
										$_at_TransactionType{$_l_ArraySize}:=$_at_CellNames{$_l_Index}
									: (Field:C253($_aptr_DaybookFieldPointers{$_l_FieldPosition})=Field:C253(->[ACC_Bank_Statements:198]Bank_TransactionDate:5))
										//temp problem here becaue i am importing from a US sheet onto a system with UK date formats..
										$_l_SlashPosition:=Position:C15("/"; $_at_CellNames{$_l_Index})
										$_t_MonthString:=Substring:C12($_at_CellNames{$_l_Index}; 1; $_l_SlashPosition-1)
										$_at_CellNames{$_l_Index}:=Substring:C12($_at_CellNames{$_l_Index}; $_l_SlashPosition+1)
										$_l_SlashPosition:=Position:C15("/"; $_at_CellNames{$_l_Index})
										$_t_DayString:=Substring:C12($_at_CellNames{$_l_Index}; 1; $_l_SlashPosition-1)
										$_t_YearString:=Substring:C12($_at_CellNames{$_l_Index}; $_l_SlashPosition+1)
										$_d_BaseDate:=Date:C102("01/01/"+$_t_YearString)
										$_d_Date:=Add to date:C393($_d_BaseDate; 0; Num:C11($_t_MonthString)-1; Num:C11($_t_DayString)-1)
										$_ad_TransactionDate{$_l_ArraySize}:=$_d_Date
									: (Field:C253($_aptr_DaybookFieldPointers{$_l_FieldPosition})=Field:C253(->[ACC_Bank_Statements:198]Bank_TransactionReference:4))
										$_at_TransactionReference{$_l_ArraySize}:=$_at_CellNames{$_l_Index}
									: (Field:C253($_aptr_DaybookFieldPointers{$_l_FieldPosition})=Field:C253(->[ACC_Bank_Statements:198]Daybook_Account_Code:3))
										$_at_TransactionReference{$_l_ArraySize}:=$_at_CellNames{$_l_Index}
								End case 
								
							End if 
							
						End for 
						If ($_ad_TransactionDate{$_l_ArraySize}=!00-00-00!)
							//TRACE
						End if 
						
					End for 
					
				End if 
				
			End if 
			
			
		: ($_t_ImportType="qif")
			$_l_Position:=Position:C15("_"; $_t_DocumentPath)
			$_t_DocumentName:=FileNamefromPath($_t_DocumentPath)
			$_l_Position:=Position:C15("_"; $_t_DocumentName)
			$_t_AccountCode:=Substring:C12($_t_DocumentName; 1; $_l_Position-1)
			
			$_ti_Doc:=Open document:C264($_t_DocumentPath; ".qif"; 2)
			ARRAY TEXT:C222($_at_DocText; 0)
			Repeat 
				RECEIVE PACKET:C104($_ti_Doc; $_t_text; 32000)
				If ($_t_text#"")
					APPEND TO ARRAY:C911($_at_DocText; $_t_text)
				End if 
			Until ($_t_text="")
			ARRAY TEXT:C222($_at_RowsText; 0)
			For ($_l_Index; 1; Size of array:C274($_at_DocText))
				Repeat 
					$_l_SlashPosition:=Position:C15("^"; $_at_DocText{$_l_Index})
					If ($_l_SlashPosition=0)
						If ($_l_Index<Size of array:C274($_at_DocText))
							$_at_DocText{$_l_Index+1}:=$_at_DocText{$_l_Index}
						End if 
					Else 
						$_t_Record:=Substring:C12($_at_DocText{$_l_Index}; 1; $_l_SlashPosition-1)
						$_at_DocText{$_l_Index}:=Substring:C12($_at_DocText{$_l_Index}; $_l_SlashPosition+1)
						APPEND TO ARRAY:C911($_at_RowsText; $_t_Record)
					End if 
				Until ($_l_SlashPosition=0)
			End for 
			ARRAY TEXT:C222($_at_TransactionAccountCode; 0)
			ARRAY TEXT:C222($_at_TransactionType; 0)
			ARRAY DATE:C224($_ad_TransactionDate; 0)
			ARRAY TEXT:C222($_at_TransactionDescription; 0)
			ARRAY REAL:C219($_ar_TransactionDebitAmount; 0)
			ARRAY REAL:C219($_ar_TransactionCreditAmount; 0)
			For ($_l_Index; 1; Size of array:C274($_at_RowsText))
				If ($_l_Index=1)  //discard the First_Field
					$_l_Position:=Position:C15(Char:C90(13); $_at_RowsText{$_l_Index})
					If ($_l_Position=0)
						$_l_Position:=Position:C15(Char:C90(10); $_at_RowsText{$_l_Index})
					End if 
					If ($_l_Position>0)
						$_at_RowsText{$_l_Index}:=Substring:C12($_at_RowsText{$_l_Index}; $_l_Position)
					End if 
				End if 
				$_bo_RowAdded:=False:C215
				Repeat 
					$_l_Position:=Position:C15(Char:C90(13); $_at_RowsText{$_l_Index})
					If ($_l_Position=0)
						$_l_Position:=Position:C15(Char:C90(10); $_at_RowsText{$_l_Index})
					End if 
					If ($_l_Position>0)
						$_t_text:=Substring:C12($_at_RowsText{$_l_Index}; 1; $_l_Position-1)
						$_at_RowsText{$_l_Index}:=Substring:C12($_at_RowsText{$_l_Index}; $_l_Position+1)
						If ($_t_text#"")
							$_t_FIrstChar:=Substring:C12($_t_text; 1; 1)
							$_t_text:=Substring:C12($_t_text; 2)
							Case of 
								: ($_t_FIrstChar="D")
									If (Not:C34($_bo_RowAdded))
										APPEND TO ARRAY:C911($_at_TransactionAccountCode; $_t_AccountCode)
										APPEND TO ARRAY:C911($_at_TransactionType; "")
										APPEND TO ARRAY:C911($_ad_TransactionDate; Date:C102($_t_text))
										APPEND TO ARRAY:C911($_at_TransactionDescription; "")
										APPEND TO ARRAY:C911($_ar_TransactionDebitAmount; 0)
										APPEND TO ARRAY:C911($_ar_TransactionCreditAmount; 0)
										$_bo_RowAdded:=True:C214
									Else 
										$_ad_TransactionDate{Size of array:C274($_ad_TransactionDate)}:=Date:C102($_t_text)
									End if 
								: ($_t_FIrstChar="T")
									If (Not:C34($_bo_RowAdded))
										APPEND TO ARRAY:C911($_at_TransactionAccountCode; $_t_AccountCode)
										APPEND TO ARRAY:C911($_at_TransactionType; "")
										APPEND TO ARRAY:C911($_ad_TransactionDate; !00-00-00!)
										APPEND TO ARRAY:C911($_at_TransactionDescription; "")
										If (Num:C11($_t_text)<0)
											APPEND TO ARRAY:C911($_ar_TransactionDebitAmount; Abs:C99(Num:C11($_t_text)))
											APPEND TO ARRAY:C911($_ar_TransactionCreditAmount; 0)
										Else 
											APPEND TO ARRAY:C911($_ar_TransactionDebitAmount; 0)
											APPEND TO ARRAY:C911($_ar_TransactionCreditAmount; Num:C11($_t_text))
										End if 
										$_bo_RowAdded:=True:C214
									Else 
										
										If (Num:C11($_t_text)<0)
											$_ar_TransactionDebitAmount{Size of array:C274($_ar_TransactionDebitAmount)}:=Abs:C99(Num:C11($_t_text))
										Else 
											$_ar_TransactionCreditAmount{Size of array:C274($_ar_TransactionCreditAmount)}:=Abs:C99(Num:C11($_t_text))
										End if 
									End if 
								: ($_t_FIrstChar="P")
									If (Not:C34($_bo_RowAdded))
										APPEND TO ARRAY:C911($_at_TransactionAccountCode; $_t_AccountCode)
										APPEND TO ARRAY:C911($_at_TransactionType; "")
										APPEND TO ARRAY:C911($_ad_TransactionDate; !00-00-00!)
										APPEND TO ARRAY:C911($_at_TransactionDescription; $_t_text)
										APPEND TO ARRAY:C911($_ar_TransactionDebitAmount; 0)
										APPEND TO ARRAY:C911($_ar_TransactionCreditAmount; 0)
										$_bo_RowAdded:=True:C214
									Else 
										$_at_TransactionDescription{Size of array:C274($_at_TransactionDescription)}:=($_t_text)
									End if 
							End case 
						End if 
					End if 
					
				Until ($_l_Position=0)
				
				
			End for 
			
			
			
			
			
	End case 
	$_l_ArraySize:=Size of array:C274($_at_TransactionAccountCode)
	ARRAY TEXT:C222($_at_TransactionAccountCode; $_l_ArraySize)
	ARRAY TEXT:C222($_at_TransactionReference; $_l_ArraySize)
	ARRAY TEXT:C222($_at_TransactionType; $_l_ArraySize)
	ARRAY DATE:C224($_ad_TransactionDate; $_l_ArraySize)
	ARRAY TEXT:C222($_at_TransactionDescription; $_l_ArraySize)
	ARRAY REAL:C219($_ar_TransactionDebitAmount; $_l_ArraySize)
	ARRAY REAL:C219($_ar_TransactionCreditAmount; $_l_ArraySize)
	ARRAY LONGINT:C221($_al_TransactionTimeStamp; $_l_ArraySize)
	ARRAY REAL:C219($_ar_TransactionAccountBalance; $_l_ArraySize)
	ARRAY TEXT:C222($_at_TransactionID; $_l_ArraySize)
	
	
	
	If (Size of array:C274($_at_TransactionAccountCode)>0)
		For ($_l_Index; 1; Size of array:C274($_at_TransactionAccountCode))
			QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=$_at_TransactionAccountCode{$_l_Index}; *)
			QUERY:C277([ACC_Bank_Statements:198];  & ; [ACC_Bank_Statements:198]Bank_TransactionDate:5=$_ad_TransactionDate{$_l_Index})
			If ($_al_TransactionTimeStamp{$_l_Index}#0) & ($_al_TransactionTimeStamp{$_l_Index}#43200)
				
				QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12=$_al_TransactionTimeStamp{$_l_Index})
			Else 
				CREATE SET:C116([ACC_Bank_Statements:198]; "$Temp")
				If ($_at_TransactionID{$_l_Index}#"")
					//TRACE
					QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionID:13=$_at_TransactionID{$_l_Index})
					If (Records in selection:C76([ACC_Bank_Statements:198])=0)
						USE SET:C118("$Temp")
						QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Transaction_Details:7=$_at_TransactionID{$_l_Index}+Char:C90(Tab:K15:37)+"@")
						If (Records in selection:C76([ACC_Bank_Statements:198])=0)
							//Take the last word off the description and search again
							$_l_SpacePos:=0
							$_t_SubDescription:=$_at_TransactionDescription{$_l_Index}
							$_l_TestPosition:=Length:C16($_at_TransactionDescription{$_l_Index})
							Repeat 
								If ($_l_TestPosition>0)
									If ($_at_TransactionDescription{$_l_Index}[[$_l_TestPosition]]=" ")
										$_t_SubDescription:=Substring:C12($_at_TransactionDescription{$_l_Index}; 1; $_l_TestPosition-1)
										$_l_SpacePos:=$_l_TestPosition
									End if 
								End if 
								$_l_TestPosition:=$_l_TestPosition-1
							Until ($_l_SpacePos>0) | ($_l_TestPosition<1)
							
							USE SET:C118("$Temp")
							QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Transaction_Details:7=$_t_SubDescription)
							If (Records in selection:C76([ACC_Bank_Statements:198])>0)
								//TRACE
							End if 
						End if 
					End if 
				Else 
					QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Transaction_Details:7=$_at_TransactionDescription{$_l_Index})
					If (Records in selection:C76([ACC_Bank_Statements:198])=0)
						//TRACE
						//Take the last word off the description and search again
						$_l_SpacePos:=0
						$_t_SubDescription:=$_at_TransactionDescription{$_l_Index}
						$_l_TestPosition:=Length:C16($_at_TransactionDescription{$_l_Index})
						Repeat 
							If ($_l_TestPosition>0)
								If ($_at_TransactionDescription{$_l_Index}[[$_l_TestPosition]]=" ")
									$_t_SubDescription:=Substring:C12($_at_TransactionDescription{$_l_Index}; 1; $_l_TestPosition-1)
									$_l_SpacePos:=$_l_TestPosition
								End if 
							End if 
							$_l_TestPosition:=$_l_TestPosition-1
						Until ($_l_SpacePos>0) | ($_l_TestPosition<1)
						USE SET:C118("$Temp")
						QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Transaction_Details:7=$_t_SubDescription)
						If (Records in selection:C76([ACC_Bank_Statements:198])>0)
							//TRACE
						End if 
					End if 
				End if 
			End if 
			
			$_l_LastTimeStamp:=0
			$_d_LastDateStamp:=!00-00-00!
			If (Records in selection:C76([ACC_Bank_Statements:198])=0)
				CREATE RECORD:C68([ACC_Bank_Statements:198])
				[ACC_Bank_Statements:198]x_ID:1:=AA_GetNextID(->[ACC_Bank_Statements:198]x_ID:1)
				
				[ACC_Bank_Statements:198]Bank_Account_Number:2:=$_at_TransactionAccountCode{$_l_Index}
				If ($_at_TransactionAccountCode{$_l_Index}="")
					[ACC_Bank_Statements:198]Bank_Account_Number:2:=$_t_ImportAccountCode
				End if 
				[ACC_Bank_Statements:198]Bank_TransactionID:13:=$_at_TransactionID{$_l_Index}
				[ACC_Bank_Statements:198]Daybook_Account_Code:3:=""
				[ACC_Bank_Statements:198]Bank_Balance:10:=0
				[ACC_Bank_Statements:198]Bank_CreditAmount:9:=$_ar_TransactionCreditAmount{$_l_Index}
				[ACC_Bank_Statements:198]Bank_DebitAmount:8:=$_ar_TransactionDebitAmount{$_l_Index}
				[ACC_Bank_Statements:198]Bank_TransactionReference:4:=$_at_TransactionReference{$_l_Index}
				[ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12:=$_al_TransactionTimeStamp{$_l_Index}
				[ACC_Bank_Statements:198]Bank_ReconciledAmount:11:=0
				[ACC_Bank_Statements:198]Bank_Transaction_Details:7:=$_at_TransactionDescription{$_l_Index}
				[ACC_Bank_Statements:198]Bank_TransactionDate:5:=$_ad_TransactionDate{$_l_Index}
				[ACC_Bank_Statements:198]Bank_TransactionType:6:=$_at_TransactionType{$_l_Index}
				If ([ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12=0)
					If ([ACC_Bank_Statements:198]Bank_TransactionDate:5#$_d_LastDateStamp)
						$_l_LastTimeStamp:=0
					End if 
					$_l_LastTimeStamp:=$_l_LastTimeStamp+1
					[ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12:=$_l_LastTimeStamp
				End if 
				$_d_Date:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
				$_d_LastDateStamp:=$_d_Date
				$_l_TimeNum:=[ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12
				$_t_Reference:=String:C10(Year of:C25($_d_Date); "##0000")+String:C10(Month of:C24($_d_Date); "##00")+String:C10(Day of:C23($_d_Date); "##00")+String:C10($_l_TimeNum; "#00000")
				[ACC_Bank_Statements:198]Bank_TransactionReference:4:=$_t_Reference
				AA_CheckUUID(Table:C252(->[ACC_Bank_Statements:198]))
				<>SYS_t_LastSavedTableName:="ACC_Bank_Statements"
				SAVE RECORD:C53([ACC_Bank_Statements:198])
			Else 
				$_bo_Save:=False:C215
				If ([ACC_Bank_Statements:198]Bank_TransactionID:13="")
					[ACC_Bank_Statements:198]Bank_TransactionID:13:=$_at_TransactionID{$_l_Index}
					$_bo_Save:=True:C214
				End if 
				If ([ACC_Bank_Statements:198]Bank_TransactionReference:4="")
					$_d_Date:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
					$_d_LastDateStamp:=$_d_Date
					$_l_TimeNum:=[ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12
					$_t_Reference:=String:C10(Year of:C25($_d_Date); "##0000")+String:C10(Month of:C24($_d_Date); "##00")+String:C10(Day of:C23($_d_Date); "##00")+String:C10($_l_TimeNum; "#00000")
					[ACC_Bank_Statements:198]Bank_TransactionReference:4:=$_t_Reference
					$_bo_Save:=True:C214
				End if 
				If ($_bo_Save)
					AA_CheckUUID(Table:C252(->[ACC_Bank_Statements:198]))
					<>SYS_t_LastSavedTableName:="ACC_Bank_Statements"
					SAVE RECORD:C53([ACC_Bank_Statements:198])
					
				End if 
				
			End if 
		End for 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_ImportStatementRecords"; $_t_oldMethodName)