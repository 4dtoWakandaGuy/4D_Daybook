//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_PrintAutopaySelected
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/11/2010 09:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Print)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_OK; $_l_RecordsinSelection; DB_l_CurrentDisplayedForm; vNo)
	C_REAL:C285(vSubtotal; vTotal)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName; DB_t_CurrentContext; vTitle1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_PrintAutopaySelected")
CREATE SET:C116([PURCHASE_INVOICES:37]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
$_l_RecordsinSelection:=Records in selection:C76([PURCHASE_INVOICES:37])
If ($_l_RecordsinSelection>0)
	If (Not:C34(SR_ReportOK("PurchAP")))
		ORDER BY:C49([PURCHASE_INVOICES:37]Company_Code:2; >; [PURCHASE_INVOICES:37]Invoice_Date:5; >)
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Autopay List")
		If ($_l_OK>=0)  //See in PRINT_SetSize about this
			If ($_l_OK=1)
				PRINT SETTINGS:C106
				$_l_OK:=OK
			Else 
				$_l_OK:=1
			End if 
			
			If ($_l_OK=1)
				
				Print form:C5([PURCHASE_INVOICES:37]; "Autopay_Header")
				
				vTotal:=0
				FIRST RECORD:C50([PURCHASE_INVOICES:37])
				While (Not:C34(End selection:C36([PURCHASE_INVOICES:37])))
					
					$_t_CompanyCode:=[PURCHASE_INVOICES:37]Company_Code:2
					RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
					If ([COMPANIES:2]Autopay_Number:47#"")
						$_bo_Print:=True:C214
					Else 
						$_bo_Print:=False:C215
					End if 
					vSubtotal:=0
					While ((Not:C34(End selection:C36([PURCHASE_INVOICES:37])) & ($_t_CompanyCode=[PURCHASE_INVOICES:37]Company_Code:2)))
						If ($_bo_Print)
							vSubtotal:=vSubtotal+[PURCHASE_INVOICES:37]Total_Paid:8
							vTotal:=vTotal+[PURCHASE_INVOICES:37]Total_Paid:8
						End if 
						NEXT RECORD:C51([PURCHASE_INVOICES:37])
					End while 
					If ($_bo_Print)
						Print form:C5([PURCHASE_INVOICES:37]; "Autopay_Detail")
					End if 
					
				End while 
				
				READ ONLY:C145([USER:15])
				ALL RECORDS:C47([USER:15])
				vTitle1:=Replace([USER:15]Bank Details:159)
				
				Print form:C5([PURCHASE_INVOICES:37]; "Autopay_Footer")
				
				PAGE BREAK:C6
				PRT_SetPrinterPaperOptions("Autopay List")  //NG June 2005
				Gen_Confirm("Was the Autopay List printed OK?"; "Yes"; "No")
				If (OK=1)
					READ WRITE:C146([PURCHASE_INVOICES:37])
					CREATE EMPTY SET:C140([PURCHASE_INVOICES:37]; "LockedSet")
					DB_lockFile(->[PURCHASE_INVOICES:37])
					APPLY TO SELECTION:C70([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Due_Date:17:=<>DB_d_CurrentDate)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
					While ((Records in set:C195("LockedSet")>0) & (OK=1))
						vNo:=Records in set:C195("LockedSet")
						USE SET:C118("LockedSet")
						Gen_Confirm("I am waiting for "+String:C10(vNo)+" Payment record(s) to become unlocked.  Please close other processes and check o"; "Try again"; "Cancel")
						DelayTicks(20*60)
						DB_lockFile(->[PURCHASE_INVOICES:37])
						APPLY TO SELECTION:C70([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Due_Date:17:=<>DB_d_CurrentDate)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[PURCHASE_INVOICES:37]))
					End while 
				End if 
				
			End if 
		End if 
	End if 
End if 

USE SET:C118("$temp")
QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24=-3; *)
QUERY SELECTION:C341([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]State:24=-2)
QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Due_Date:17=!00-00-00!)

SEL_UpdateRecordCache(Table:C252(->[PURCHASE_INVOICES:37]))
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("PUR_PrintAutopaySelected"; $_t_oldMethodName)
