//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Inv Accept
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 21:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_BOOLEAN:C305($_bo_ExitWIndow; $1; INV_bo_Addingitem; INV_bo_FurtherFieldsLoaded)
	C_DATE:C307(vInvDate)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285(INV_l_FurtherFieldsMod; vSubtotal; vTotal)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumAsString; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Inv Accept")
If (Count parameters:C259>=1)  //to allow this to be called without exiting the record
	$_bo_ExitWIndow:=$1
Else 
	$_bo_ExitWIndow:=True:C214
End if 
If (INV_bo_FurtherFieldsLoaded)  // Further fields exist for the invoice table and are loaded
	If (INV_l_FurtherFieldsMod>0)
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ WRITE:C146([CUSTOM_FIELDS:98])
		If (Records in set:C195("INV_FFSelection")>0)
			USE SET:C118("INV_FFSelection")
			DELETE SELECTION:C66([CUSTOM_FIELDS:98])
		End if 
		CLEAR SET:C117("INV_FFSelection")
		FUR_UpdateFurtherFields(->[INVOICES:39])
		UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		READ ONLY:C145([CUSTOM_FIELDS:98])
		//at least one further field has been modified
		
		
	End if 
	$_l_TableNumber:=Table:C252(->[INVOICES:39])
	$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
	$_t_TableNumAsString:=Str LeadZeros(String:C10($_l_TableNumber); 3)
	$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
	CLEAR SEMAPHORE:C144($_t_SemaphoreName)
	CLEAR SET:C117("INV_FFSelection")
End if 
If ([INVOICES:39]State:10<-1)
	INV_SaveDeliveryAddress
	If (INV_bo_Addingitem)
		DB_SaveRecord(->[INVOICES_ITEMS:161])
	End if 
	INV_bo_Addingitem:=False:C215
	DB_SaveRecord(->[INVOICES:39])  //ensures dupplicate checking is done properly
	If (OK=1)
		If ($_bo_ExitWIndow)
			ACCEPT:C269
		End if 
		
	End if 
Else 
	INV_SaveDeliveryAddress
	If (([INVOICES:39]Company_Code:2="") | ([INVOICES:39]Period_Code:13="") | (([INVOICES:39]Total_Invoiced:5=0) & (DB_LedgerAllowZeroInvoices=False:C215)) | ([INVOICES:39]Invoice_Date:4=!00-00-00!))
		Gen_Alert("Please complete this Invoice or Cancel"; "")
	Else 
		If ((DB_t_CurrentFormUsage="CN") & ([INVOICES:39]Total_Invoiced:5>0))
			Inv_AcceptCNChk
		End if 
		OK:=1
		If (([INVOICES:39]Invoice_Number:1="0") | ([INVOICES:39]Invoice_Number:1=""))
			Inv_No
		End if 
		If (OK=1)
			If (INV_bo_Addingitem)
				DB_SaveRecord(->[INVOICES_ITEMS:161])
			End if 
			INV_bo_Addingitem:=False:C215
			DB_SaveRecord(->[INVOICES:39])  //ensures dupplicate checking is done properly
			If (OK=1)
				If ((DB_GetLedgerINVAllowUnproc) | (DB_t_CurrentFormUsage2="NC") | (Read only state:C362([INVOICES:39])))
					If ($_bo_ExitWIndow)
						ACCEPT:C269
					Else 
						DB_SaveRecord(->[INVOICES:39])
					End if 
				Else 
					If ([INVOICES:39]State:10=0)
						If (DB_GetLedgerINVAllownoPrint)
							
							DB_SaveRecord(->[INVOICES:39])
							Invoices_PostTx
							Inv_InvCalc
							Gen_Confirm("Are you ready to Post "+vText+" "+[INVOICES:39]Invoice_Number:1+"?"; "Post it"; "Try again")
							If (OK=1)
								Gen_Confirm("Post "+vText+" "+[INVOICES:39]Invoice_Number:1+" now or Batch it?"; "Post now"; "Batch")
								If (OK=0)
									[INVOICES:39]State:10:=1
									[INVOICES:39]Total_Invoiced:5:=vTotal
									[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=vSubtotal
									DB_SaveRecord(->[INVOICES:39])
									If ($_bo_ExitWIndow)
										ACCEPT:C269
									Else 
										DB_SaveRecord(->[INVOICES:39])
									End if 
								Else 
									If ($_bo_ExitWIndow)
										ACCEPT:C269
									Else 
										DB_SaveRecord(->[INVOICES:39])
									End if 
									
									vInvDate:=[INVOICES:39]Invoice_Date:4
									Inv_InvPost
								End if 
								Invoices_InLPSt
							End if 
							
						Else 
							Gen_Alert("Please Print and process this Invoice first"; "Try again")
						End if 
						
					Else 
						If ($_bo_ExitWIndow)
							ACCEPT:C269
						Else 
							DB_SaveRecord(->[INVOICES:39])
						End if 
						
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Inv Accept"; $_t_oldMethodName)