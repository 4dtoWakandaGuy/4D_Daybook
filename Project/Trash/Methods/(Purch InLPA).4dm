//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/03/2010 15:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_BOOLEAN:C305(PI_bo_Addingitem; PUR_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_Index; $_l_NoAction; $_l_post; $_l_SavenoPost; $_l_TableNumber; PUR_l_FurtherFieldsMod; vAdd; vPS; XCANCEL; XNEXT; XOK)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285($_r_TotalDue)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumAsString; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InLPA")
If ((DB_t_CurrentFormUsage="CN") & ([PURCHASE_INVOICES:37]Total_Invoiced:7>0))
	Purch_AccCNChk
End if 
OK:=1
If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
	Purch_Code
End if 
If (PI_bo_Addingitem)
	DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
End if 
PI_bo_Addingitem:=False:C215

If (PUR_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
	If (PUR_l_FurtherFieldsMod>0)
		//at least one further field has been modified
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ WRITE:C146([CUSTOM_FIELDS:98])
		If (Records in set:C195("PI_FFSelection")>0)
			USE SET:C118("PI_FFSelection")
			DELETE SELECTION:C66([CUSTOM_FIELDS:98])
		End if 
		CLEAR SET:C117("PI_FFSelection")
		FUR_UpdateFurtherFields(->[PURCHASE_INVOICES:37])
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ ONLY:C145([CUSTOM_FIELDS:98])
		
		
		
	End if 
	$_l_TableNumber:=Table:C252(->[PURCHASE_INVOICES:37])
	$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
	$_t_TableNumAsString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
	$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
	CLEAR SEMAPHORE:C144($_t_SemaphoreName)
	CLEAR SET:C117("PI_FFSelection")
End if 


If ([PURCHASE_INVOICES:37]Analysis_Code:15="")
	QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
	
	FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
	For ($_l_Index; 1; Records in selection:C76([PURCHASE_INVOICE_ITEMS:158]))
		If ([PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9#"")
			[PURCHASE_INVOICES:37]Analysis_Code:15:=[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9
			$_l_Index:=Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])
		End if 
		NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
	End for 
	
End if 
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)
FIRST RECORD:C50([PURCHASE_INVOICE_ITEMS:158])
For ($_l_Index; 1; Records in selection:C76([PURCHASE_INVOICE_ITEMS:158]))
	If ([PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9="")
		[PURCHASE_INVOICE_ITEMS:158]Analysis_Code:9:=[PURCHASE_INVOICES:37]Analysis_Code:15
		DB_SaveRecord(->[PURCHASE_INVOICE_ITEMS:158])
		
	End if 
	NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
	
End for 
//`Here update the totals
QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]PURCHASE_INVOICE_CODE:17=[PURCHASE_INVOICES:37]Purchase_Code:1)

[PURCHASE_INVOICES:37]Total_Invoiced_Excluding_Tax:19:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Cost_Amount:4); 2; 2)
[PURCHASE_INVOICES:37]Total_Invoiced:7:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Total_Amount:7); 2; 2)
[PURCHASE_INVOICES:37]Total_Tax:25:=Gen_Round(Sum:C1([PURCHASE_INVOICE_ITEMS:158]Tax_Amount:6); 2; 2)
$_r_TotalDue:=PUR_SetDueAmount
If ($_r_TotalDue#[PURCHASE_INVOICES:37]Total_Due:9) & ([PURCHASE_INVOICES:37]State:24=0) & (Not:C34(Read only state:C362([PURCHASE_INVOICES:37]))) & (Not:C34((Locked:C147([PURCHASE_INVOICES:37]))))
	//set the due amount
	[PURCHASE_INVOICES:37]Total_Due:9:=$_r_TotalDue
End if 

If (OK=1)
	DB_SaveRecord(->[PURCHASE_INVOICES:37])  //used to ensure duplicate checking is done properly
	If (OK=1)
		If (([PURCHASE_INVOICES:37]State:24<-1) | ([PURCHASE_INVOICES:37]State:24>0) | (Read only state:C362([PURCHASE_INVOICES:37])) | (Locked:C147([PURCHASE_INVOICES:37])))
			ACCEPT:C269
		Else 
			xOK:=0  //$2
			xCancel:=0  //$3
			xnext:=0  //$4
			If (DB_GetLedgerINVAllowUnproc)
				Gen_Confirm3("Are you ready to Post (or Batch) this Purchase Invoice, "+"or do you want to leave it Unprocessed?"+Char:C90(13)+Char:C90(13)+"Purchase Code: "+[PURCHASE_INVOICES:37]Purchase_Code:1; "Post it"; "Try again"; "Unprocessed")
				//xOK:=0  `POST IT
				//xCancel:=0  `TRY AGAIN
				//xnext:=0  `UNPROCESSED
				$_l_post:=XOK
				$_l_NoAction:=XCANCEL
				$_l_SavenoPost:=XNEXT
				
			Else 
				Gen_Confirm3("Are you ready to Post or Batch this Purchase Invoice?"+Char:C90(13)+Char:C90(13)+"Purchase Code: "+[PURCHASE_INVOICES:37]Purchase_Code:1; "Post it"; "Try again"; "Batch it")
				//xOK:=0  `POST IT
				//xCancel:=0  `TRY AGAIN
				//xnext:=0  `BATCH IT
				$_l_post:=XOK
				$_l_NoAction:=XCANCEL
				$_l_SavenoPost:=XNEXT
				
			End if 
			If ($_l_post=1) | ($_l_SavenoPost=1)
				If ($_l_SavenoPost=1)
					If (DB_GetLedgerINVAllowUnproc)
						ACCEPT:C269
					Else 
						[PURCHASE_INVOICES:37]State:24:=1
						ACCEPT:C269
					End if 
				Else 
					xOK:=0
					xCancel:=0
					xnext:=0
					If (DB_GetLedgerINVAllowUnproc)
						Gen_Confirm("Post it now or Batch it?"; "Post now"; "Batch")
					End if 
					If (xCancel=1)
						[PURCHASE_INVOICES:37]State:24:=1
						ACCEPT:C269
					Else 
						If (vAdd=0)
							//  START TRANSACTION
							StartTransaction  // 13/05/02 pb
							
						End if 
						Purch_InvPost
						If (OK=1)
							If (vAdd=0)
								Transact_End
								If (OK=1)
									If ((DB_GetModuleSettingByNUM(Module_JobCosting)=2) | (DB_GetModuleSettingByNUM(Module_JobCosting)=4))
										Purch_InvJobs
									End if 
								End if 
							End if 
							If (OK=1)
								ACCEPT:C269
							Else 
								CANCEL:C270
							End if 
						Else 
							CANCEL:C270
						End if 
					End if 
				End if 
				
			End if 
			
		End if 
	End if 
End if 

//If ((vAdd=1) & ([PURCHASES]State=0))
//  If ([PURCHASES]Purchase Code="")
//    Purch_Code
//  End if
//  Gen_Confirm ("Are you ready to Post this Purchase Invoice?"+Char(13)+Char(13)+
//  If (OK=1)
//  If ([PURCHASES]Purchase Code="")
//   Purch_Code
//  End if
//  If ([PURCHASES]Analysis Code="")
//    ALL SUBRECORDS([PURCHASES_ITEMS])
//   [PURCHASES]Analysis Code:=[PURCHASES_ITEMS]Analysis Code
//   End if
// If ([PURCHASES]Purchase Code#"")
//   ACCEPT
//  End if
// End if
//Else
//  If ([PURCHASES]Purchase Code="")
//   Purch_Code
//  End if
//If ([PURCHASES]Purchase Code#"")
// ACCEPT
// End if
//End if
vPS:=0
ERR_MethodTrackerReturn("Purch_InLPA"; $_t_oldMethodName)
