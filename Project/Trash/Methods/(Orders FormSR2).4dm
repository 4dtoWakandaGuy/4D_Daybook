//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_FormSR2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 12:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($Base)
	C_LONGINT:C283($0; $1; $OI)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; $This; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_FormSR2")

$Base:=False:C215
$0:=0
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	If (([ORDER_ITEMS:25]Print_Description:45) & ([ORDER_ITEMS:25]Description:44#""))
		vT:=RemoveTrailCR([ORDER_ITEMS:25]Description:44)
		$This:=vT
		While ((vT#"") & ($This#""))
			$This:=FormItemvT
			$0:=$0+1
		End while 
	End if 
	
	If (([ORDER_ITEMS:25]Product_Code:2#"") & ([ORDER_ITEMS:25]Purchase_Order_Number:18="BUNDLE@"))  //Calc the no of pages nec for Bundles
		If ($1<10)  //Only allow up to 10 levels cos is recursive
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
			If ([PRODUCTS:9]Bundle_Assembly:36)
				If ([PRODUCTS:9]Bundle_Show:37#0)
					If ([PRODUCTS:9]Bundle_Show:37=2)
						$Base:=True:C214
					End if 
					//       If ($1>0)  `Don't show Level 1 & onwards Bundle Products??
					//  $0:=$0-1
					//     End if
					$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
					$OI:=[ORDER_ITEMS:25]Item_Number:27
					CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "$FormSR"+String:C10($1))
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode; *)
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Level_Up_Item_Number:48=$OI)
					If (Records in selection:C76([ORDER_ITEMS:25])#0)
						$0:=$0+Records in selection:C76([ORDER_ITEMS:25])+Orders_FormSR2($1+1)
					End if 
					USE NAMED SELECTION:C332("$FormSR"+String:C10($1))
				End if 
			End if 
		End if 
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 

If (($Base) & ($1=0))  //Add 2 lines for a space + a Components heading
	$0:=$0+2
End if 
ERR_MethodTrackerReturn("Orders_FormSR2"; $_t_oldMethodName)