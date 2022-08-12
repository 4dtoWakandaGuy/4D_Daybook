//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp_SelFOI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 18:10
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	C_LONGINT:C283($_l_Index; $_l_SelectedRecordsCount)
	C_TEXT:C284($_t_LastOrderCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelFOI")
//Comp_SelFOI
$_l_SelectedRecordsCount:=Records in selection:C76([ORDER_ITEMS:25])
OK:=1
If ($_l_SelectedRecordsCount>10000)
	Gen_Confirm("There are "+String:C10($_l_SelectedRecordsCount)+" records to link, which may take some time.  Proceed?"; "Yes"; "No")
End if 
If (OK=1)
	CREATE EMPTY SET:C140([COMPANIES:2]; "Master")
	
	SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
	SORT ARRAY:C229($_at_OrderCodes; >)
	$_t_LastOrderCode:=""
	For ($_l_Index; 1; $_l_SelectedRecordsCount)
		If ($_t_LastOrderCode#$_at_OrderCodes{$_l_Index})
			$_t_LastOrderCode:=$_at_OrderCodes{$_l_Index}
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_at_OrderCodes{$_l_Index})
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
			ADD TO SET:C119([COMPANIES:2]; "Master")
		End if 
	End for 
	
	INTERSECTION:C121("Master"; "CMaster"; "Master")
	USE SET:C118("Master")
Else 
	USE SET:C118("CMaster")
	CREATE SET:C116([COMPANIES:2]; "Master")
End if 
ERR_MethodTrackerReturn("Comp_SelFOI"; $_t_oldMethodName)