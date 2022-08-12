//%attributes = {}
If (False:C215)
	//Project Method Name:      JOBs_GetSortref
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
	C_LONGINT:C283($_l_OrderSortNumber; $_l_OrderSortSequence; $_l_Repeats; $0; $3)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOBs_GetSortref")
$_l_OrderSortSequence:=1
$_l_Repeats:=0
If (Count parameters:C259>=1)
	If (Count parameters:C259>=2)  //Pass what you think will be the next ref for testing
		$_l_OrderSortSequence:=$3
	End if 
	Repeat 
		SET QUERY DESTINATION:C396(3; $_l_OrderSortNumber)
		
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26=$_l_OrderSortSequence; *)
		QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=$1; *)
		If ($2#"")
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=$2)
		Else 
			QUERY:C277([ORDER_ITEMS:25])
		End if 
		If (Count parameters:C259>=4)
			QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46=$4)
		End if 
		
		SET QUERY DESTINATION:C396(0)
		If ($_l_OrderSortNumber=0)
			$0:=$_l_OrderSortSequence
		Else 
			$_l_OrderSortSequence:=$_l_OrderSortSequence+1
			If ($_l_Repeats>2)
				$_l_OrderSortSequence:=$_l_OrderSortSequence+($_l_Repeats*2)
			End if 
			
		End if 
		$_l_Repeats:=$_l_Repeats+1
	Until ($_l_OrderSortNumber=0)
	If ($_l_Repeats>1)
		$_l_Repeats:=0
		Repeat 
			SET QUERY DESTINATION:C396(3; $_l_OrderSortNumber)
			
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26=$_l_OrderSortSequence; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=$1; *)
			If ($2#"")
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=$2)
			Else 
				QUERY:C277([ORDER_ITEMS:25])
			End if 
			If (Count parameters:C259>=4)
				QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46=$4)
			End if 
			
			SET QUERY DESTINATION:C396(0)
			If ($_l_OrderSortNumber>0)
				//$0:=$_l_OrderSortSequence
			Else 
				$_l_OrderSortSequence:=$_l_OrderSortSequence-1
				If ($_l_Repeats>10)
					$_l_OrderSortSequence:=$_l_OrderSortSequence+($_l_Repeats*2)
				End if 
				
			End if 
			$_l_Repeats:=$_l_Repeats+1
		Until ($_l_OrderSortNumber>0)
		Repeat 
			SET QUERY DESTINATION:C396(3; $_l_OrderSortNumber)
			
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26=$_l_OrderSortSequence; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=$1; *)
			If ($2#"")
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=$2)
			Else 
				QUERY:C277([ORDER_ITEMS:25])
			End if 
			If (Count parameters:C259>=4)
				QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46=$4)
			End if 
			
			SET QUERY DESTINATION:C396(0)
			If ($_l_OrderSortNumber=0)
				$0:=$_l_OrderSortSequence
			Else 
				$_l_OrderSortSequence:=$_l_OrderSortSequence+1
			End if 
			$_l_Repeats:=$_l_Repeats+1
		Until ($_l_OrderSortNumber=0)
		
	End if 
	
End if 
ERR_MethodTrackerReturn("JOBs_GetSortref"; $_t_oldMethodName)