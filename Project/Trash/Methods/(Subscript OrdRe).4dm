//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Subscript OrdRe
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
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	//ARRAY TEXT(aCC;0)
	//ARRAY TEXT(aCC2;0;0)
	//ARRAY TEXT(SUBS_at_CompanyCodes;0)
	//ARRAY TEXT(SUBS_at_OrderCodes;0;0)
	C_LONGINT:C283($_l_CompanyCodeRow; $_l_CountRecords; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; $_t_String)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Subscript OrdRe")
//Subscript OrdRe - late
$_l_CountRecords:=Records in selection:C76([ORDER_ITEMS:25])
ARRAY TEXT:C222($_at_OrderCodes; 0)
SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
CREATE EMPTY SET:C140([ORDERS:24]; "OrMaster")
ARRAY TEXT:C222(SUBS_at_OrderCodes; 0; 0)  //2D array to store the Order Codes that are to be printed
ARRAY TEXT:C222(SUBS_at_CompanyCodes; 0)
$_t_String:=""
For ($_l_Index; 1; $_l_CountRecords)
	If ($_t_String#$_at_OrderCodes{$_l_Index})
		$_t_String:=$_at_OrderCodes{$_l_Index}
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_at_OrderCodes{$_l_Index})
		$_l_CompanyCodeRow:=Find in array:C230(SUBS_at_CompanyCodes; [ORDERS:24]Company_Code:1)
		If ($_l_CompanyCodeRow<1)
			ADD TO SET:C119([ORDERS:24]; "OrMaster")
			INSERT IN ARRAY:C227(SUBS_at_CompanyCodes; 1; 1)
			INSERT IN ARRAY:C227(SUBS_at_OrderCodes; 1; 1)
			$_l_CompanyCodeRow:=1
			SUBS_at_CompanyCodes{$_l_CompanyCodeRow}:=[ORDERS:24]Company_Code:1
			ARRAY TEXT:C222(SUBS_at_OrderCodes{$_l_CompanyCodeRow}; 0)
		End if 
		INSERT IN ARRAY:C227(SUBS_at_OrderCodes{$_l_CompanyCodeRow}; 1; 1)
		SUBS_at_OrderCodes{$_l_CompanyCodeRow}{1}:=[ORDERS:24]Order_Code:3
	End if 
End for 
USE SET:C118("OrMaster")
ERR_MethodTrackerReturn("Subscript OrdRe"; $_t_oldMethodName)
