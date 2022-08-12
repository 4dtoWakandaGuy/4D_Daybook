//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 12:43
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

$_t_oldMethodName:=ERR_MethodTracker("SM_List")

Array_LCx(Records in selection:C76([PURCHASE_INVOICES:37]))
SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
ARRAY REAL:C219(PI_ar_Value; 0)

SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; GEN_at_RecordCode; [STOCK_MOVEMENTS:40]Movement_Type:6; GEN_at_Name; [STOCK_MOVEMENTS:40]Company_From:2; GEN_at_Identity)

SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
SORT ARRAY:C229(GEN_at_Name; GEN_at_Identity; GEN_at_RecordCode; >)
bd1:=Size of array:C274(GEN_at_Name)
Array_LCStart
ERR_MethodTrackerReturn("SM_List"; $_t_oldMethodName)
