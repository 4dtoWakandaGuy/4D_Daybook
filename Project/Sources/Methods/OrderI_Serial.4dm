//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_Serial
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
	ARRAY TEXT:C222($_at_SerialNumbers; 0)
	C_LONGINT:C283($_l_index; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_Serial")
//OrderI_Serial
//see also OrderI_AllOIUp2
[ORDER_ITEMS:25]Serial_Number:24:=""
If (Records in selection:C76([CURRENT_STOCK:62])#0)
	QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Quantity:4#0)  //required cos blank items have not yet been deleted
	If (Records in selection:C76([CURRENT_STOCK:62])#0)
		ARRAY TEXT:C222($_at_SerialNumbers; 0)
		SELECTION TO ARRAY:C260([CURRENT_STOCK:62]Serial_Number:2; $_at_SerialNumbers)
		SORT ARRAY:C229($_at_SerialNumbers; >)
		$_l_SizeofArray:=Size of array:C274($_at_SerialNumbers)
		For ($_l_index; 1; $_l_SizeofArray)
			[ORDER_ITEMS:25]Serial_Number:24:=[ORDER_ITEMS:25]Serial_Number:24+$_at_SerialNumbers{$_l_index}
			If ($_l_index<$_l_SizeofArray)
				[ORDER_ITEMS:25]Serial_Number:24:=[ORDER_ITEMS:25]Serial_Number:24+" / "
			End if 
		End for 
	End if 
End if 
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
ERR_MethodTrackerReturn("OrderI_Serial"; $_t_oldMethodName)