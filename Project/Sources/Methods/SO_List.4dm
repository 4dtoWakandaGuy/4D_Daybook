//%attributes = {}
If (False:C215)
	//Project Method Name:      SO_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SO_List
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ORD_ad_orderDate;0)
	ARRAY TEXT:C222($_at_OrderStates; 0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(ORD_at_StateNames;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283($_l_Index; bd1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SO_List")
//Contact_List2
Array_LCx(Records in selection:C76([ORDERS:24]))



SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)

SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; GEN_at_RecordCode; [ORDERS:24]Company_Code:1; GEN_at_Name; [COMPANIES:2]Company_Name:2; GEN_at_Identity; [ORDERS:24]Contact_Code:2; SVS_at_PreviewEvent; [ORDERS:24]State:15; $_at_OrderStates; [ORDERS:24]SORT_Date:57; ORD_ad_orderDate)
ARRAY TEXT:C222(ORD_at_StateNames; 0)
ARRAY TEXT:C222(ORD_at_StateNames; Size of array:C274($_at_OrderStates))
SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
SORT ARRAY:C229(GEN_at_Name; GEN_at_Identity; GEN_at_RecordCode; SVS_at_PreviewEvent; ORD_ad_orderDate; $_at_OrderStates; >)
For ($_l_Index; 1; Size of array:C274($_at_OrderStates))
	If ([TABLE_RECORD_STATES:90]State_Reference:4#$_at_OrderStates{$_l_Index})
		QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=$_at_OrderStates{$_l_Index})
	End if 
	ORD_at_StateNames{$_l_Index}:=[TABLE_RECORD_STATES:90]Entry_Name:5
End for 




bd1:=Size of array:C274(GEN_at_Name)
Array_LCStart
SVS_at_PreviewEvent:=1
ERR_MethodTrackerReturn("SO_List"; $_t_oldMethodName)
