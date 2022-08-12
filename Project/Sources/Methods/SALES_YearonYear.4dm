//%attributes = {}
If (False:C215)
	//Project Method Name:      SALES_YearonYear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SALES_YearonYear
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_AllDates; 0)
	ARRAY DATE:C224($_ad_DistinctDates; 0)
	ARRAY DATE:C224($_ad_DueDates; 0)
	ARRAY LONGINT:C221($_al_AverageLateDays; 0)
	ARRAY LONGINT:C221($_al_InvoiceCount; 0)
	ARRAY LONGINT:C221($_al_Years; 0)
	ARRAY LONGINT:C221($_al_AveragePaymentDays; 0)
	//ARRAY LONGINT(SALES_al_PayOverdueDays;0)
	//ARRAY LONGINT(SALES_al_PayTime;0)
	//ARRAY LONGINT(SALES_al_Years;0)
	ARRAY REAL:C219($_ar_TotalInvoiced; 0)
	ARRAY REAL:C219($_ar_TotalSpend; 0)
	//ARRAY REAL(SALES_ar_Spend;0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	C_BOOLEAN:C305($_bo_ArraySet; $_bo_UseOld; SALES_ArraySET; SALES_ArraySET2)
	C_DATE:C307($_d_DueDate; $_d_LastDate)
	C_LONGINT:C283($_l_Element; $_l_Index; $_l_Index2; $_l_Index3; $_l_LateDays; $_l_PayedDays; $_l_TotalDaysSoFar; $_l_TotalLateDays; $_l_Year; $_l_YearOf; $_l_YearRow)
	C_LONGINT:C283(SALES_ArraySize; Zoffset)
	C_REAL:C285($_r_TotalAmount; $2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SALES_YearonYear")
//this method will take a single company
//and tell you the year on year sales/purchases
//note that this method runs in a process of its own
//so it does not change any current selections
$_bo_UseOld:=False:C215
//$1 is the company code
If ($1#"")
	QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$1; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Invoiced:5>0; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1#"*R"+"@"; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1#"*S"+"@"; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1#"*D"+"@")
	SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers; [INVOICES:39]Invoice_Date:4; $_ad_AllDates; [INVOICES:39]Total_Invoiced:5; $_ar_TotalInvoiced; [INVOICES:39]Due_Date:18; $_ad_DueDates)
	ARRAY DATE:C224($_ad_DistinctDates; 0)
	
	DISTINCT VALUES:C339([INVOICES:39]Invoice_Date:4; $_ad_DistinctDates)
	ARRAY LONGINT:C221($_al_Years; Size of array:C274($_ad_DistinctDates))
	//extract from their the years
	$_l_Element:=0
	For ($_l_Index; 1; Size of array:C274($_ad_DistinctDates))
		$_l_Year:=Year of:C25($_ad_DistinctDates{$_l_Index})
		$_l_YearRow:=Find in array:C230($_al_Years; $_l_Year)
		If ($_l_YearRow<0)
			$_l_Element:=$_l_Element+1
			$_al_Years{$_l_Element}:=$_l_Year
		End if 
		
	End for 
	ARRAY LONGINT:C221($_al_Years; $_l_Element)
	ARRAY REAL:C219($_ar_TotalSpend; $_l_Element)
	ARRAY LONGINT:C221($_al_AveragePaymentDays; $_l_Element)
	ARRAY LONGINT:C221($_al_AverageLateDays; $_l_Element)
	ARRAY LONGINT:C221($_al_InvoiceCount; $_l_Element)
	For ($_l_Index; 1; Size of array:C274($_at_InvoiceNumbers))
		
		
		$_l_YearOf:=Year of:C25($_ad_AllDates{$_l_Index})
		$_l_YearRow:=Find in array:C230($_al_Years; $_l_YearOf)
		$_ar_TotalSpend{$_l_YearRow}:=$_ar_TotalSpend{$_l_YearRow}+$_ar_TotalInvoiced{$_l_Index}
		
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
		If ($_bo_UseOld)
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			
			
			$_r_TotalAmount:=0
			$_d_LastDate:=!00-00-00!
			For ($_l_Index2; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				$_r_TotalAmount:=[INVOICES_ALLOCATIONS:162]Amount:2
				If ([INVOICES_ALLOCATIONS:162]Date:3>$_d_LastDate)
					$_d_LastDate:=[INVOICES_ALLOCATIONS:162]Date:3
				End if 
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
		Else 
			$_r_TotalAmount:=INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214)
			ORDER BY:C49([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAllocationDate:6; <)
			FIRST RECORD:C50([XInvoiceAllocation:126])
			$_d_LastDate:=[XInvoiceAllocation:126]xAllocationDate:6
		End if 
		
		If ([INVOICES:39]Total_Paid:6<$_r_TotalAmount)
			//TRACE
		End if 
		If ($_r_TotalAmount<[INVOICES:39]Total_Invoiced:5)
			$_l_PayedDays:=Current date:C33(*)-[INVOICES:39]Invoice_Date:4
		Else 
			$_l_PayedDays:=$_d_LastDate-[INVOICES:39]Invoice_Date:4
		End if 
		If ($_ad_DueDates{$_l_Index}#!00-00-00!)
			$_d_DueDate:=$_ad_DueDates{$_l_Index}
		Else 
			$_d_DueDate:=[INVOICES:39]Invoice_Date:4
		End if 
		If ($_d_LastDate>$_d_DueDate)
			$_l_LateDays:=$_d_LastDate-$_d_DueDate
		Else 
			$_l_LateDays:=0
		End if 
		$_l_TotalLateDays:=($_al_InvoiceCount{$_l_YearRow}*$_al_AverageLateDays{$_l_YearRow})+$_l_LateDays
		$_l_TotalDaysSoFar:=($_al_InvoiceCount{$_l_YearRow}*$_al_AveragePaymentDays{$_l_YearRow})+$_l_PayedDays
		$_al_InvoiceCount{$_l_YearRow}:=$_al_InvoiceCount{$_l_YearRow}+1
		$_al_AveragePaymentDays{$_l_YearRow}:=Round:C94($_l_TotalDaysSoFar/$_al_InvoiceCount{$_l_YearRow}; 2)
		$_al_AverageLateDays{$_l_YearRow}:=Round:C94($_l_TotalLateDays/$_al_InvoiceCount{$_l_YearRow}; 2)
		
		
		
		
		
		
	End for 
	ERASE WINDOW:C160
	GOTO XY:C161(0; 0)
	If ($2>0)
		$_bo_ArraySet:=False:C215
		SET PROCESS VARIABLE:C370($2; SALES_ArraySET; False:C215)
		GET PROCESS VARIABLE:C371($2; SALES_ArraySize; Zoffset)
		SET PROCESS VARIABLE:C370($2; SALES_ArraySize; Size of array:C274($_ar_TotalSpend))
		Repeat 
			SET PROCESS VARIABLE:C370($2; SALES_ArraySET; True:C214)
			DelayTicks(2)
			GET PROCESS VARIABLE:C371($2; SALES_ArraySET2; SALES_ArraySET2)
		Until (SALES_ArraySET2)
		
		For ($_l_Index3; 1; Size of array:C274($_ar_TotalSpend))
			//     MESSAGE(String($_al_Years{$_l_Index3})+":"+"Total Spend:"+String($_ar_TotalSpend{$_l_Index3})+" PAY
			SET PROCESS VARIABLE:C370($2; SALES_al_Years{$_l_Index3+Zoffset}; $_al_Years{$_l_Index3})
			SET PROCESS VARIABLE:C370($2; SALES_ar_Spend{$_l_Index3+Zoffset}; $_ar_TotalSpend{$_l_Index3})
			SET PROCESS VARIABLE:C370($2; SALES_al_PayTime{$_l_Index3+Zoffset}; $_al_AveragePaymentDays{$_l_Index3})
			SET PROCESS VARIABLE:C370($2; SALES_al_PayOverdueDays{$_l_Index3+Zoffset}; $_al_AverageLateDays{$_l_Index3})
		End for 
	End if 
	
	
	
	
	//there are now figures for each year
	
End if 
ERR_MethodTrackerReturn("SALES_YearonYear"; $_t_oldMethodName)