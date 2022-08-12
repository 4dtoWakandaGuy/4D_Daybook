//%attributes = {}
If (False:C215)
	//Project Method Name:      PI_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 11:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(PI_ar_Value;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283(bd1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PI_List")

//Contact_List2
Array_LCx(Records in selection:C76([PURCHASE_INVOICES:37]))
SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
ARRAY REAL:C219(PI_ar_Value; 0)

SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Purchase_Code:1; GEN_at_RecordCode; [PURCHASE_INVOICES:37]Company_Code:2; GEN_at_Name; [COMPANIES:2]Company_Name:2; GEN_at_Identity; [PURCHASE_INVOICES:37]Total_Invoiced:7; PI_ar_Value)
SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
SORT ARRAY:C229(GEN_at_Name; GEN_at_Identity; GEN_at_RecordCode; PI_ar_Value; >)
bd1:=Size of array:C274(GEN_at_Name)
Array_LCStart
ERR_MethodTrackerReturn("PI_List"; $_t_oldMethodName)
