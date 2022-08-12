//%attributes = {}
If (False:C215)
	//Project Method Name:      PO_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 16:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283(bd1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PO_List")
//Contact_List2
Array_LCx(Records in selection:C76([PURCHASE_ORDERS:57]))
SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
SELECTION TO ARRAY:C260([PURCHASE_ORDERS:57]Purchase_Order_Number:2; GEN_at_RecordCode; [PURCHASE_ORDERS:57]Company_Code:1; GEN_at_Name; [COMPANIES:2]Company_Name:2; GEN_at_Identity; [PURCHASE_ORDERS:57]Contact_Code:5; SVS_at_PreviewEvent)
SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
SORT ARRAY:C229(GEN_at_Name; GEN_at_Identity; GEN_at_RecordCode; SVS_at_PreviewEvent; >)
bd1:=Size of array:C274(GEN_at_Name)
Array_LCStart
SVS_at_PreviewEvent:=1
ERR_MethodTrackerReturn("PO_List"; $_t_oldMethodName)
