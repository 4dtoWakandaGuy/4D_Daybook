//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_CalcClearedDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2009 17:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $0)
	C_LONGINT:C283($_l_AllocationsIndex; DataDummy)
	C_REAL:C285($_r_Sum; $_r_TotalDue; $_r_TotalDue2; $_r_TotalDueToClient; $_r_TotalPaid; $_r_TotalPaid2; $_r_TotalPaid3)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_CalcClearedDate")

//This method will run from the process services
//this is for updating legacy data
//to populate the DEBT_CLEARED date field in the invoice table
//for new records this will be executing because when the record is saved
//if the OLD outstanding amount was >0
//and the amount is 0 in the trigger the date can be populated
//But with old data we need to find the date the amount was cleared
//this is simply the date the final receipt was made
If (Count parameters:C259>=1)
	If ([INVOICES:39]Invoice_Number:1#$1)
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$1)
	End if 
End if 

$_d_Date:=!00-00-00!
If ([INVOICES:39]Total_Due:7=0)
	INV_GetAllocations([INVOICES:39]Invoice_Number:1)
	If (Records in selection:C76([XInvoiceAllocation:126])=0)
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		
		If (Records in selection:C76([INVOICES_ALLOCATIONS:162])>0)
			Datadummy:=0
			If (Not:C34(In transaction:C397))
				ProcessServices_CreateRecord(->[INVOICES:39]; ->Datadummy; [INVOICES:39]Invoice_Number:1)
			Else 
				SI_AllocationValidation
				INV_CheckRemainder
				
			End if 
			
			FIRST RECORD:C50([INVOICES_ALLOCATIONS:162])
			$_d_Date:=!00-00-00!
			For ($_l_AllocationsIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				If ([INVOICES_ALLOCATIONS:162]Date:3>$_d_Date)
					$_d_Date:=[INVOICES_ALLOCATIONS:162]Date:3
				End if 
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			$0:=$_d_Date
		Else 
			$_d_Date:=[INVOICES:39]Invoice_Date:4
		End if 
		
	Else 
		$_r_TotalPaid:=Gen_Round((Sum:C1([INVOICES_ALLOCATIONS:162]Amount:2)); 2; 2)
		$_r_TotalDue:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid); 2; 2)
		$_r_Sum:=(Round:C94(INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214); 2))
		$_r_TotalPaid2:=Gen_Round(($_r_Sum); 2; 2)
		$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2); 2; 2)
		//`````
		Case of 
			: ([INVOICES:39]Total_Invoiced:5>0)
				Case of 
					: ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
						$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
						$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2); 2; 2)
						
					Else 
						$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
						$_r_TotalDue2:=[INVOICES:39]Total_Due:7
				End case 
				
			: ((Position:C15("*"; [INVOICES:39]Invoice_Number:1))=0)
				If ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
					If ($_r_TotalPaid2<0)
						$_r_TotalDue2:=(Abs:C99([INVOICES:39]Total_Invoiced:5))-(Abs:C99($_r_TotalPaid2))
					Else 
						$_r_TotalDue2:=([INVOICES:39]Total_Invoiced:5)-($_r_TotalPaid2)
					End if 
					
				Else 
					$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
					$_r_TotalDue2:=[INVOICES:39]Total_Due:7
				End if 
				
			Else 
				If ((Position:C15("*"; [INVOICES:39]Invoice_Number:1))>0)
					If ([INVOICES:39]Invoice_Number:1="*D@")
						If ($_r_TotalPaid2#0)
							If ($_r_TotalPaid2<0)
								$_r_TotalPaid2:=Abs:C99($_r_TotalPaid2)
								$_r_TotalPaid3:=$_r_TotalPaid2
							Else 
								$_r_TotalPaid2:=-($_r_TotalPaid2)
								$_r_TotalPaid3:=$_r_TotalPaid2
								
							End if 
							$_r_TotalDueToClient:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_TotalPaid2); 2; 2)
							If ($_r_TotalDueToClient>0)
								$_r_TotalDue2:=-$_r_TotalDueToClient
							Else 
								$_r_TotalDue2:=Abs:C99($_r_TotalDueToClient)
							End if 
							
						Else 
							//$_r_TotalPaid2:=[INVOICES]Total Paid
							//$_r_TotalDue2:=[INVOICES]Total Due
							$_r_TotalDueToClient:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_TotalPaid2); 2; 2)
							If ($_r_TotalDueToClient>0)
								$_r_TotalDue2:=-$_r_TotalDueToClient
							Else 
								$_r_TotalDue2:=Abs:C99($_r_TotalDueToClient)
							End if 
							
						End if 
						
					Else 
						
						
						$_r_TotalDue2:=0
						
						
					End if 
					
				End if 
				
				
		End case 
		//```
		If ($_r_TotalDue2<=0)
			CREATE SET:C116([XInvoiceAllocation:126]; "$Temp")
			QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xTaxPointDate:8=!00-00-00!)
			If (Records in selection:C76([XInvoiceAllocation:126])>0)
				UNLOAD RECORD:C212([XInvoiceAllocation:126])
				READ WRITE:C146([XInvoiceAllocation:126])
				USE SET:C118("$Temp")
				QUERY SELECTION:C341([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xTaxPointDate:8=!00-00-00!)
				APPLY TO SELECTION:C70([XInvoiceAllocation:126]; SI_SetTaxPoint)
				UNLOAD RECORD:C212([XInvoiceAllocation:126])
				READ ONLY:C145([XInvoiceAllocation:126])
				
			End if 
			USE SET:C118("$temp")
			CLEAR SET:C117("$temp")
			
			ORDER BY:C49([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xTaxPointDate:8; <)
			FIRST RECORD:C50([XInvoiceAllocation:126])
			$_d_Date:=[XInvoiceAllocation:126]xTaxPointDate:8
		Else 
			//Use subrecords
			$_d_Date:=!00-00-00!  // it is not cleared
			
			
		End if 
		
	End if 
	$0:=$_d_Date
Else 
	$0:=!00-00-00!
End if 
ERR_MethodTrackerReturn("INV_CalcClearedDate"; $_t_oldMethodName)