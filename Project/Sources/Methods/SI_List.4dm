//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SI_List
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(INV_ad_InvoiceDate;0)
	ARRAY INTEGER:C220($_ai_invoicesStates; 0)
	//ARRAY LONGINT(SI_al_InvoiceStates;0)
	//ARRAY REAL(INV_ar_amount;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(INV_at_CreditStages;0)
	//ARRAY TEXT(INV_at_SalesPerson;0)
	//ARRAY TEXT(INV_at_StateName;0)
	//ARRAY TEXT(SI_at_InvoiceStates;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283($_l_Index; $_l_StateRow; bd1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_List")
//Contact_List2
Array_LCx(Records in selection:C76([INVOICES:39]))



SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)

SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; GEN_at_RecordCode; [INVOICES:39]Company_Code:2; GEN_at_Name; [COMPANIES:2]Company_Name:2; GEN_at_Identity; [INVOICES:39]Contact_Code:3; SVS_at_PreviewEvent; [INVOICES:39]State:10; $_ai_invoicesStates; [INVOICES:39]Invoice_Date:4; INV_ad_InvoiceDate; [INVOICES:39]Person:42; INV_at_SalesPerson; [INVOICES:39]Credit_Stage:22; INV_at_CreditStages; [INVOICES:39]Total_Invoiced:5; INV_ar_amount)
ARRAY TEXT:C222(INV_at_StateName; 0)
ARRAY TEXT:C222(INV_at_StateName; Size of array:C274($_ai_invoicesStates))
SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
SORT ARRAY:C229(GEN_at_Name; GEN_at_Identity; GEN_at_RecordCode; SVS_at_PreviewEvent; INV_ad_InvoiceDate; $_ai_invoicesStates; INV_ad_InvoiceDate; INV_at_SalesPerson; INV_at_CreditStages; INV_ar_amount; INV_at_StateName; >)
ARRAY TEXT:C222(SI_at_InvoiceStates; 8)
ARRAY LONGINT:C221(SI_al_InvoiceStates; 8)
SI_at_InvoiceStates{1}:="Receipt"
SI_al_InvoiceStates{1}:=-3
SI_at_InvoiceStates{2}:="Deposit"
SI_al_InvoiceStates{2}:=-2
SI_at_InvoiceStates{3}:="Proforma"
SI_al_InvoiceStates{3}:=-1
SI_at_InvoiceStates{4}:="Credit Note"
SI_al_InvoiceStates{4}:=-0
SI_at_InvoiceStates{5}:="Unposted Invoice"
SI_al_InvoiceStates{5}:=4

SI_at_InvoiceStates{6}:="Batched Invoice"
SI_al_InvoiceStates{6}:=1
SI_at_InvoiceStates{7}:="Posted Invoice"
SI_al_InvoiceStates{7}:=2
SI_at_InvoiceStates{8}:="imported Invoice"
SI_al_InvoiceStates{8}:=3
For ($_l_Index; 1; Size of array:C274($_ai_invoicesStates))
	If ($_ai_invoicesStates{$_l_Index}=0)
		If (INV_ar_amount{$_l_Index}>0)
			$_ai_invoicesStates{$_l_Index}:=4  //makes it easer to set
		End if 
	End if 
	$_l_StateRow:=Find in array:C230(SI_al_InvoiceStates; $_ai_invoicesStates{$_l_Index})
	If ($_l_StateRow>0)
		INV_at_StateName{$_l_Index}:=SI_at_InvoiceStates{$_l_StateRow}
	Else 
		INV_at_StateName{$_l_Index}:="unknown invoice type"
	End if 
End for 


bd1:=Size of array:C274(GEN_at_Name)
Array_LCStart
SVS_at_PreviewEvent:=1
ERR_MethodTrackerReturn("SO_List"; $_t_oldMethodName)
