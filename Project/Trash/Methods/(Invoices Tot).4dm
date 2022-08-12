//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices Tot
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/04/2010 18:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(INV_bo_Addingitem)
	C_LONGINT:C283($_l_arraySize)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $1; $2)
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices Tot")
If (INV_bo_Addingitem)
	DB_SaveRecord(->[INVOICES_ITEMS:161])
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
	
End if 
If (Count parameters:C259>=2)
	
	If ($2->{$3}=Table:C252(->[INVOICES:39]))
		$_ptr_ListboxSetup:=$1
		$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
		If (Size of array:C274($_ptr_ArrayofArrayPointers->)>0)
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
			$_l_arraySize:=Size of array:C274($_Ptr_ThisColumnArray->)
			If (Records in selection:C76([INVOICES_ITEMS:161])#$_l_arraySize)
				QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
			End if 
		End if 
		[INVOICES:39]Total_Invoiced:5:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Total_Amount:8); 2; 2)
		[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Amount:5); 2; 2)
		[INVOICES:39]Total_Tax:35:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Tax_Amount:7); 2; 2)
	Else 
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
		[INVOICES:39]Total_Invoiced:5:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Total_Amount:8); 2; 2)
		[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Amount:5); 2; 2)
		[INVOICES:39]Total_Tax:35:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Tax_Amount:7); 2; 2)
	End if 
Else 
	[INVOICES:39]Total_Invoiced:5:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Total_Amount:8); 2; 2)
	[INVOICES:39]Total_Invoiced_Excluding_Tax:26:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Amount:5); 2; 2)
	[INVOICES:39]Total_Tax:35:=Gen_Round(Sum:C1([INVOICES_ITEMS:161]Tax_Amount:7); 2; 2)
End if 
Invoices_InLPTi
INV_CheckRemainder
ERR_MethodTrackerReturn("Invoices Tot"; $_t_oldMethodName)