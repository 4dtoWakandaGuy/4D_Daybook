//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPOI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//C_UNKNOWN(vAB)
	//C_UNKNOWN(vST)
	C_LONGINT:C283($_l_CountParameters; $_l_RecordsinSelection; $1; $2; VAB; vST; $_l_ClashingRecords; $_l_CountParameters; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPOI")
$_l_CountParameters:=Count parameters:C259
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
MESSAGES OFF:C175

COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$CurOIS")
$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
SET QUERY DESTINATION:C396(Into variable:K19:4; $_l_ClashingRecords)
QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1#"")
SET QUERY DESTINATION:C396(Into current selection:K19:1)

If ($_l_ClashingRecords=0)
	$_l_RecordsinSelection:=0
	CLEAR NAMED SELECTION:C333("$CurOIS")
End if 



QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
If (Records in selection:C76([ORDER_ITEMS:25])>0)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Delivery_Type:12=True:C214)
	If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
		APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Allocated:28:=ORDERI_GetAllocated)
		APPLY TO SELECTION:C70([ORDER_ITEMS:25]; ORDI_setDelivered)
	End if 
End if 
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
	If ($_l_CountParameters>0)
		vAB:=$1
	Else 
		vAB:=0
	End if 
	OrderI_LevelSrc(vAB)
	vST:=0
End if 
MESSAGES OFF:C175
If (Records in selection:C76([ORDER_ITEMS:25])>0)
	ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
End if 
If ($_l_CountParameters#2)
	Orders_InLPTot
End if 
If ($_l_RecordsinSelection=Records in selection:C76([ORDER_ITEMS:25])) & ($_l_RecordsinSelection>0)
	USE NAMED SELECTION:C332("$CurOIS")
End if 
MESSAGES ON:C181
ERR_MethodTrackerReturn("Orders_InLPOI"; $_t_oldMethodName)
