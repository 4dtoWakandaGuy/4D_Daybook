//%attributes = {}
If (False:C215)
	//Project Method Name:      ORDI_GetSortRef
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
	C_LONGINT:C283($_l_Increment; $_l_OrderSort; $_l_Repeats; $_l_SortRef; $0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDI_GetSortRef")
$_l_SortRef:=1
If (Count parameters:C259>=1)
	If (Count parameters:C259>=2)  //Pass what you think will be the next ref for testing
		//$_l_SortRef:=$2
	End if 
	If (Count parameters:C259>=3)
		//$_l_SortRef:=$_l_SortRef+$3
	End if 
	
	SET QUERY DESTINATION:C396(3; $_l_OrderSort)
	If (True:C214)
		Repeat 
			$_l_Increment:=1
			$_l_Repeats:=0
			$_l_Increment:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26=$_l_SortRef; *)
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1=$1)
				
				
				If ($_l_OrderSort=0)
					$0:=$_l_SortRef
				Else 
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$1)
					If ($_l_SortRef<$_l_OrderSort)
						$_l_SortRef:=($_l_OrderSort+1)
					Else 
						$_l_SortRef:=$_l_SortRef+1
					End if 
					
					
					
				End if 
				
			Until ($_l_OrderSort=0)
			
		Until ($_l_OrderSort=0) & ($_l_Increment=1)
	End if 
	SET QUERY DESTINATION:C396(0)
End if 
ERR_MethodTrackerReturn("ORDI_GetSortRef"; $_t_oldMethodName)
