//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CreditCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>CheckCredit; $_bo_newRecord; $_bo_OnScreenAlert; $2; $4)
	C_LONGINT:C283($_l_Process; $_l_RecordNumber; GEN_l_CreditCheckCallback; GEN_l_ResultCode; vSNo)
	C_POINTER:C301($3)
	C_TEXT:C284(<>SYS_t_StockOrderCompany; $_t_Alert; $_t_CompanyCode; $_t_CompanySuperior; $_t_NoMessage; $_t_oldMethodName; $1; GEN_t_CreditCheckAlert)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CreditCheck")
//Gen_CreditCheck

If (Count parameters:C259>=2)
	$_bo_OnScreenAlert:=$2
Else 
	$_bo_OnScreenAlert:=True:C214
End if 
If (Count parameters:C259>=4)
	//if the record is being created and is not saved cannot use named selection
	$_bo_newRecord:=$4
Else 
	$_bo_newRecord:=False:C215
End if 
vSNo:=0
If (<>CheckCredit)
	If ((Records in selection:C76([COMPANIES:2])=1) & ([COMPANIES:2]Company_Code:1#<>SYS_t_StockOrderCompany))
		If (Not:C34($_bo_newRecord))
			COPY NAMED SELECTION:C331([INVOICES:39]; "Invoices")
		End if 
		$_l_RecordNumber:=Record number:C243([COMPANIES:2])
		$_t_CompanySuperior:=[COMPANIES:2]Superior:34
		$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
		CREATE SET:C116([COMPANIES:2]; "Extra2")
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Superior:34=$_t_CompanyCode)
		CREATE SET:C116([COMPANIES:2]; "Extra")
		If ($_t_CompanySuperior#"")
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanySuperior)
			ADD TO SET:C119([COMPANIES:2]; "Extra")
			If ([COMPANIES:2]Company_Code:1#"")  //bsw 26/07/02 kateThompson found this it was causing to alert wrong credit status
				$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
			End if 
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Superior:34=$_t_CompanyCode)
			CREATE SET:C116([COMPANIES:2]; "Master")
			UNION:C120("Master"; "Extra"; "Extra")
		End if 
		DIFFERENCE:C122("Extra"; "Extra2"; "Extra")
		
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
		If (Not:C34($_bo_newRecord))
			GEN_t_CreditCheckAlert:=""
			GEN_l_CreditCheckCallback:=0
			$_l_Process:=New process:C317("Gen_CreditCheckinprocess"; 64000; "Check Credit"; Current process:C322; [COMPANIES:2]Company_Code:1; True:C214)
			While (GEN_l_CreditCheckCallback=0)
				DelayTicks(10)
			End while 
			//$_t_Alert:=Gen_CreditCh2 ([COMPANIES]Company Code;True;$NewRecord)
			VsNo:=GEN_l_ResultCode
			$_t_Alert:=GEN_t_CreditCheckAlert
		Else 
			$_t_Alert:=""
		End if 
		
		If (Count parameters:C259=1)
			$_t_NoMessage:=$1
		Else 
			$_t_NoMessage:=""
		End if 
		If (($_t_NoMessage#"NM") | (vSNo>0))  //NM m Means no message
			If (Records in set:C195("Extra")=0)
				If (Not:C34($_bo_newRecord))
					USE NAMED SELECTION:C332("Invoices")
				End if 
				If ($_bo_OnScreenAlert)
					If ($_t_Alert#"")
						Gen_Alert($_t_Alert; "")
					End if 
				Else 
					If (Count parameters:C259>=2)
						If ($3->#"")
							$3->:=$3->+Char:C90(13)+$_t_Alert
						Else 
							$3->:=$_t_Alert
						End if 
					End if 
				End if 
				
				WS_KeepFocus
				
			Else 
				$_t_Alert:=$_t_Alert+"See Related Companies?"
				If (Not:C34($_bo_newRecord))
					USE NAMED SELECTION:C332("Invoices")
				End if 
				
				If ($_bo_OnScreenAlert)
					Gen_Confirm($_t_Alert; "Yes"; "No")
				Else 
					If (Count parameters:C259>=2)
						If ($3->#"")
							$3->:=$3->+Char:C90(13)+$_t_Alert
							OK:=1
						Else 
							$3->:=$_t_Alert
							OK:=1
						End if 
					End if 
				End if 
				
				If (OK=1)
					USE SET:C118("Extra")
					FIRST RECORD:C50([COMPANIES:2])
					While ((Not:C34(End selection:C36([COMPANIES:2]))) & (OK=1))
						If (Not:C34($_bo_newRecord))
							GEN_t_CreditCheckAlert:=""
							GEN_l_CreditCheckCallback:=0
							$_l_Process:=New process:C317("Gen_CreditCheckinprocess"; 64000; "Check Credit"; Current process:C322; [COMPANIES:2]Company_Code:1; True:C214)
							While (GEN_l_CreditCheckCallback=0)
								DelayTicks(10)
							End while 
							
							//$_t_Alert:=Gen_CreditCh2 ([COMPANIES]Company Code;True;$NewRecord)
							$_t_Alert:=GEN_t_CreditCheckAlert
							VsNo:=GEN_l_ResultCode
							//$_t_Alert:=Gen_CreditCh2 ([COMPANIES]Company Code;False)
						Else 
							$_t_Alert:=""
						End if 
						
						NEXT RECORD:C51([COMPANIES:2])
						If (Not:C34($_bo_newRecord))
							USE NAMED SELECTION:C332("Invoices")
						End if 
						If (End selection:C36([COMPANIES:2]))
							
							If ($_bo_OnScreenAlert)
								Gen_Alert($_t_Alert; "")
							Else 
								If (Count parameters:C259>=2)
									If ($3->#"")
										$3->:=$3->+Char:C90(13)+$_t_Alert
										OK:=1
									Else 
										$3->:=$_t_Alert
										OK:=1
									End if 
								End if 
							End if 
							
						Else 
							$_t_Alert:=$_t_Alert+"See another?"
							
							If ($_bo_OnScreenAlert)
								Gen_Confirm($_t_Alert; "Yes"; "No")
							Else 
								If (Count parameters:C259>=2)
									If ($3->#"")
										$3->:=$3->+Char:C90(13)+$_t_Alert
										OK:=1
									Else 
										$3->:=$_t_Alert
										OK:=1
									End if 
								End if 
							End if 
							
						End if 
					End while 
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
				End if 
				//  HIDE PROCESS(Current process)
				// SHOW PROCESS(Current process)
				// BRING TO FRONT(Current process)
			End if 
		End if 
		If (Not:C34($_bo_newRecord))
			USE NAMED SELECTION:C332("Invoices")
			CLEAR NAMED SELECTION:C333("Invoices")
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_CreditCheck"; $_t_oldMethodName)