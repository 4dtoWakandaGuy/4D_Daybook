//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_CheckRemainder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Save; $2)
	C_REAL:C285($_r_TotalDue2; $_r_TotalDuetoClient; $_r_TotalPaid2; $_r_TotalPaid3)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_CheckRemainder")
//This method will check the remaining amount on an invoice
//NG October 2004
If (Count parameters:C259>=1)
	If ([INVOICES:39]Invoice_Number:1#$1)
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$1)
	End if 
End if 
If (Count parameters:C259>=2)
	$_r_TotalPaid2:=INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; $2)
Else 
	$_r_TotalPaid2:=INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214)
End if 

$_r_TotalDue2:=[INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2
$_r_TotalPaid3:=$_r_TotalPaid2
$_bo_Save:=False:C215
Case of 
	: ([INVOICES:39]Total_Invoiced:5>0)
		Case of 
			: ([INVOICES:39]State:10=-1)  // Proformas should not have a due amount!!! 19/4/2006
				$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
				$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2); 2; 2)
				If ($_r_TotalPaid2#0)
					If ([INVOICES:39]Total_Paid:6#$_r_TotalPaid2) | ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
						[INVOICES:39]Total_Paid:6:=$_r_TotalPaid2
						[INVOICES:39]Total_Due:7:=$_r_TotalDue2
						$_bo_Save:=True:C214
					End if 
				Else 
					If ([INVOICES:39]Total_Due:7#0)
						[INVOICES:39]Total_Due:7:=0
						$_bo_Save:=True:C214
					End if 
				End if 
			: ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
				$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
				$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Invoiced:5-$_r_TotalPaid2); 2; 2)
				If ([INVOICES:39]Total_Paid:6#$_r_TotalPaid2) | ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
					[INVOICES:39]Total_Paid:6:=$_r_TotalPaid2
					[INVOICES:39]Total_Due:7:=$_r_TotalDue2
					$_bo_Save:=True:C214
				End if 
			Else 
				$_r_TotalPaid2:=Gen_Round(($_r_TotalPaid2); 2; 2)
				$_r_TotalDue2:=[INVOICES:39]Total_Due:7
				
		End case 
		
	: ((Position:C15("*"; [INVOICES:39]Invoice_Number:1))=0)
		If ([INVOICES:39]Total_Due:7#$_r_TotalDue2)
			If ($_r_TotalPaid2<0)
				$_bo_Save:=True:C214
				[INVOICES:39]Total_Due:7:=(Abs:C99([INVOICES:39]Total_Invoiced:5))-(Abs:C99($_r_TotalPaid2))
			Else 
				$_bo_Save:=True:C214
				[INVOICES:39]Total_Due:7:=([INVOICES:39]Total_Invoiced:5)-($_r_TotalPaid2)
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
					$_r_TotalDuetoClient:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_TotalPaid2); 2; 2)
					If ($_r_TotalDuetoClient>0)
						If ([INVOICES:39]Total_Due:7#-$_r_TotalDuetoClient)
							$_bo_Save:=True:C214
							[INVOICES:39]Total_Due:7:=-$_r_TotalDuetoClient
						End if 
					Else 
						If ([INVOICES:39]Total_Due:7#Abs:C99($_r_TotalDuetoClient))
							$_bo_Save:=True:C214
							[INVOICES:39]Total_Due:7:=Abs:C99($_r_TotalDuetoClient)
						End if 
					End if 
					
				Else 
					//$_r_TotalPaid2:=[INVOICES]Total Paid
					//$_r_TotalDue2:=[INVOICES]Total Due
					$_r_TotalDuetoClient:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_TotalPaid2); 2; 2)
					If ($_r_TotalDuetoClient>0)
						If ([INVOICES:39]Total_Due:7#-$_r_TotalDuetoClient)
							$_bo_Save:=True:C214
							[INVOICES:39]Total_Due:7:=-$_r_TotalDuetoClient
						End if 
					Else 
						If ([INVOICES:39]Total_Due:7#Abs:C99($_r_TotalDuetoClient))
							$_bo_Save:=True:C214
							[INVOICES:39]Total_Due:7:=Abs:C99($_r_TotalDuetoClient)
						End if 
					End if 
					
				End if 
				
			Else 
				If ([INVOICES:39]Total_Paid:6#Gen_Round(($_r_TotalPaid2); 2; 2)) | ([INVOICES:39]Total_Due:7#0)
					$_bo_Save:=True:C214
					[INVOICES:39]Total_Paid:6:=Gen_Round(($_r_TotalPaid2); 2; 2)
					
					[INVOICES:39]Total_Due:7:=0
				End if 
				
			End if 
			
		End if 
		
		
End case 
If (Count parameters:C259>=1)
	If ($_bo_Save)
		DB_SaveRecord(->[INVOICES:39])
	End if 
End if 
ERR_MethodTrackerReturn("INV_CheckRemainder"; $_t_oldMethodName)