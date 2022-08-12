
If (False:C215)
	//Object Name:      ACC_ImportStatement.Invisible Button5
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified:
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(DB_aptr_BankStatements;0)
	//ARRAY TEXT(ACC_at_DBAccountCode;0)
	C_BOOLEAN:C305($_bo_Continue; ACC_bo_ConfimManualAdd)
	C_DATE:C307($_D_OpeningBalanceDate; ACC_D_TransactsFrom; ACC_D_Transactsto)
	C_LONGINT:C283($_l_offset; ACC_l_LoadPreferencesID)
	C_REAL:C285($_r_OpeningBalance; ABR_R_Balance)
	C_TEXT:C284($_t_oldMethodName; ABC_t_AccountCode)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ImportStatement/Invisible Button5"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (ABC_t_AccountCode#"")
			If (Not:C34(ACC_bo_ConfimManualAdd))
				ACC_bo_ConfimManualAdd:=True:C214
				Gen_Confirm("Manually adding items to the bank statement means you are taking responsibility for entering them correctly!"; "OK"; "NO")
				$_bo_Continue:=(OK=1)
			Else 
				$_bo_Continue:=True:C214
			End if 
			If ($_bo_Continue)
				//ACC_lb_Transactions
				QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
				CREATE SET:C116([ACC_Bank_Statements:198]; "Before")
				
				//FORM SET INPUT([ACC_Bank_Statements];"Balance_Entry")
				//Open window(
				DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[ACC_Bank_Statements:198]); True:C214)
				//ADD RECORD([ACC_Bank_Statements];*)
				QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
				CREATE SET:C116([ACC_Bank_Statements:198]; "AFTER")
				DIFFERENCE:C122("AFTER"; "Before"; "AFTER")
				ACC_l_LoadPreferencesID:=PREF_GetPreferenceID("Bank Account"+String:C10(ABC_t_AccountCode))
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=ACC_l_LoadPreferencesID)
				If (Records in selection:C76([PREFERENCES:116])>0)
					$_l_offset:=0
					$_D_OpeningBalanceDate:=!00-00-00!
					$_r_OpeningBalance:=0
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_D_OpeningBalanceDate; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_r_OpeningBalance; $_l_offset)
						End if 
					End if 
					If ($_r_OpeningBalance#0) & ($_D_OpeningBalanceDate#!00-00-00!)
						READ WRITE:C146([ACC_Bank_Statements:198])
						QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
						
						QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5>=$_D_OpeningBalanceDate)
						ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; [ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12; >)
						ABR_R_Balance:=$_r_OpeningBalance
						APPLY TO SELECTION:C70([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Balance:10:=ABR_CalculateBalance(->ABR_R_Balance))
					End if 
				End if 
				If (Records in set:C195("AFTER")>0)
					USE SET:C118("AFTER")
				Else 
					QUERY:C277([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_Account_Number:2=ABC_t_AccountCode)
					
					If (ACC_D_TransactsFrom#!00-00-00!)
						QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5>=ACC_D_TransactsFrom)
					End if 
					If (ACC_D_Transactsto#!00-00-00!)
						QUERY SELECTION:C341([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5<=ACC_D_Transactsto)
					End if 
				End if 
				
				
				//here we set the the date range on the form based on that selection..note that this is only the imported data displayed
				//usually that would be all the records for those dates.
				
				ORDER BY:C49([ACC_Bank_Statements:198]; [ACC_Bank_Statements:198]Bank_TransactionDate:5; >)
				FIRST RECORD:C50([ACC_Bank_Statements:198])
				ACC_D_TransactsFrom:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
				LAST RECORD:C200([ACC_Bank_Statements:198])
				ACC_D_Transactsto:=[ACC_Bank_Statements:198]Bank_TransactionDate:5
				FIRST RECORD:C50([ACC_Bank_Statements:198])
				DB_SetFormSortOrder(Table:C252(->[ACC_Bank_Statements:198]); ""; 0; 0; ->DB_aptr_BankStatements)
				
				
				
			End if 
			
			
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/ACC_ImportStatement/Invisible Button5"; $_t_oldMethodName)
