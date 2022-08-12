//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_InPLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/01/2010 20:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_CCAuthDate; 0)
	//ARRAY DATE(ORD_ad_CCAuthDate;0)
	ARRAY LONGINT:C221($_al_AuthRecord; 0)
	ARRAY LONGINT:C221($_al_AuthStatus; 0)
	ARRAY LONGINT:C221($_al_CCID; 0)
	//ARRAY LONGINT(ORD_al_AuthRecord;0)
	//ARRAY LONGINT(ORD_al_AuthStatus;0)
	//ARRAY LONGINT(ORD_al_CCID;0)
	ARRAY REAL:C219($_ar_CCAmount; 0)
	//ARRAY REAL(ORD_ar_CCAmount;0)
	ARRAY TEXT:C222($_at_AuthStatus; 0)
	ARRAY TEXT:C222($_at_CCAUTH; 0)
	ARRAY TEXT:C222($_at_InvoiceCode; 0)
	//ARRAY TEXT(ORD_at_AuthStatus;0)
	//ARRAY TEXT(ORD_at_CCAUTH;0)
	C_BOOLEAN:C305(INV_bo_HidePayment)
	C_LONGINT:C283($_l_ButtonClickedFunction; $_l_CurrentRow; $_l_Index; $_l_OK; $_l_SizeofArray; DB_l_ButtonClickedFunction; INV_l_CallBackProcess)
	C_TEXT:C284($_t_oldMethodName; CC_t_AuthCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InPLPA")
$_l_OK:=1
If ([INVOICES:39]X_DepositRelatedRecordID:45>0) & ([INVOICES:39]X_DepositRelatedTable:44=Table:C252(->[ORDERS:24]))
	// we are entering a deposit
	//we did not get the money via CC
	//it does relat to an order
	//TRACE
	//check if there is a CC auth against that order
	If (CC_t_AuthCode="")
		CCM_LoadOrderAuths([INVOICES:39]X_DepositRelatedRecordID:45; False:C215)
		$_l_SizeofArray:=Size of array:C274(ORD_at_AuthStatus)
		ARRAY TEXT:C222($_at_CCAUTH; $_l_SizeofArray)
		ARRAY DATE:C224($_ad_CCAuthDate; $_l_SizeofArray)
		ARRAY REAL:C219($_ar_CCAmount; $_l_SizeofArray)
		ARRAY LONGINT:C221($_al_CCID; $_l_SizeofArray)
		ARRAY LONGINT:C221($_al_AuthStatus; $_l_SizeofArray)
		ARRAY TEXT:C222($_at_AuthStatus; $_l_SizeofArray)
		ARRAY TEXT:C222($_at_InvoiceCode; $_l_SizeofArray)
		ARRAY LONGINT:C221($_al_AuthRecord; 0)
		
		$_l_CurrentRow:=0
		For ($_l_Index; 1; Size of array:C274(ORD_at_AuthStatus))
			QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=ORD_al_AuthRecord{$_l_Index})
			If (ORD_al_AuthStatus{$_l_Index}=1) & (ORD_ad_CCAuthDate{$_l_Index}>(Current date:C33-30)) & ([CC_OrderAuths:133]xDepositCode:8="") & ([CC_OrderAuths:133]xinvoiceCode:9="")
				//cannot take a deposit against an invoice!
				$_l_CurrentRow:=$_l_CurrentRow+1
				$_at_CCAUTH{$_l_CurrentRow}:=ORD_at_CCAUTH{$_l_Index}
				$_ad_CCAuthDate{$_l_CurrentRow}:=ORD_ad_CCAuthDate{$_l_Index}
				$_ar_CCAmount{$_l_CurrentRow}:=ORD_ar_CCAmount{$_l_Index}
				$_al_CCID{$_l_CurrentRow}:=ORD_al_CCID{$_l_Index}
				ORD_al_AuthStatus{$_l_CurrentRow}:=ORD_al_AuthStatus{$_l_Index}
				$_al_AuthRecord{$_l_CurrentRow}:=ORD_al_AuthRecord{$_l_Index}
			End if 
		End for 
		ARRAY TEXT:C222($_at_CCAUTH; $_l_CurrentRow)
		ARRAY DATE:C224($_ad_CCAuthDate; $_l_CurrentRow)
		ARRAY REAL:C219($_ar_CCAmount; $_l_CurrentRow)
		ARRAY LONGINT:C221($_al_CCID; $_l_CurrentRow)
		ARRAY LONGINT:C221($_al_AuthStatus; $_l_CurrentRow)
		ARRAY TEXT:C222($_at_AuthStatus; $_l_CurrentRow)
		ARRAY TEXT:C222($_at_InvoiceCode; $_l_CurrentRow)
		ARRAY LONGINT:C221($_al_AuthRecord; $_l_CurrentRow)
		If (Size of array:C274($_at_CCAUTH)>0)
			Gen_Confirm("There are authorizations against this order, you did not select to obtain a card "+"payment"; "Stop"; "Continue")
			If (OK=1)
				$_l_OK:=0
			Else 
				$_l_OK:=1
			End if 
		Else 
			//No outstanding authorizations
			$_l_OK:=1
		End if 
		
	End if 
	If (INV_l_CallBackProcess>0)
		$_l_ButtonClickedFunction:=DB_GetButtonFunction("ReloadAuths")
		SET PROCESS VARIABLE:C370(INV_l_CallBackProcess; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
		POST OUTSIDE CALL:C329(INV_l_CallBackProcess)
		
	End if 
End if 
If ($_l_OK=1)
	If (INV_bo_HidePayment)
		OK:=1
	Else 
		If (CC_t_AuthCode="")
			Gen_Confirm("Are you ready to Post this Deposit?"; "Post it"; "Try again")
		Else 
			OK:=1
			
		End if 
	End if 
	If (OK=1)
		If ([INVOICES:39]Invoice_Number:1="")
			InvP_No
		End if 
		If ([INVOICES:39]Invoice_Number:1#"")
			DB_SaveRecord(->[INVOICES:39])
			If (OK=1)
				ACCEPT:C269
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Invoices_InPLPA"; $_t_oldMethodName)