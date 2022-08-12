//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_InLPACheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/02/2012 15:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_SerialNumbers; 0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Index; $_l_RecordsInSelection; $_l_Start; $_r_Quantity)
	C_REAL:C285($_l_HalfRecordsInSelection)
	C_TEXT:C284($_t_Blank; $_t_oldMethodName; $_t_ProductCode; $_t_SerialNumber; $_t_StockType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_InLPACheck")

RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
If ([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!)
	$_t_Blank:=""
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; $_at_SerialNumbers)
	SORT ARRAY:C229($_at_SerialNumbers; $_at_ProductCodes; >)
	$_l_Index:=1
	$_t_SerialNumber:=""
	$_t_ProductCode:=""
	$_l_Start:=Find in array:C230($_at_SerialNumbers; $_t_SerialNumber)
	If ($_l_Start>0)
		For ($_l_Index; $_l_Start; Size of array:C274($_at_SerialNumbers))
			If ($_at_SerialNumbers{$_l_Index}=$_t_SerialNumber)
				If (($_at_ProductCodes{$_l_Index}=$_t_ProductCode) & ($_at_SerialNumbers{$_l_Index}#""))
					$_t_Blank:="*D:"+$_at_SerialNumbers{$_l_Index}
					
				End if 
			End if 
			$_t_SerialNumber:=$_at_SerialNumbers{$_l_Index}
			$_t_ProductCode:=$_at_ProductCodes{$_l_Index}
			If ($_t_Blank#"")
				$_l_Index:=Size of array:C274($_at_SerialNumbers)
			End if 
			
		End for 
	End if 
	$_t_SerialNumber:=""
	OK:=1
	If (([MOVEMENT_TYPES:60]Serial_Current:18) | ([MOVEMENT_TYPES:60]Serial_Forcing:16) | ([MOVEMENT_TYPES:60]Serial_Warning:15))
		FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
		While ((Not:C34(End selection:C36([STOCK_MOVEMENT_ITEMS:27]))) & ($_t_Blank=""))
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			If ([PRODUCTS:9]Serial_Numbered:17)
				If (([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4="") & ([MOVEMENT_TYPES:60]Serial_Forcing:16))
					$_t_Blank:=[PRODUCTS:9]Product_Code:1
				Else 
					If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)  //4.0.030
						$_t_StockType:=[MOVEMENT_TYPES:60]Stock_Plus:3
					Else 
						$_t_StockType:=[MOVEMENT_TYPES:60]Stock_Minus:4
					End if 
					If (($_t_StockType#"") & ([MOVEMENT_TYPES:60]Serial_Current:18))  //If there is a Stock Minus/plus and the Serial Current option is on
						//then check on Current Stock to see if the Serial No is valid
						QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
						QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4)
						If (Records in selection:C76([CURRENT_STOCK:62])=0)
							$_t_Blank:="*S:"+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
							$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
						Else 
							If (([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4="") & ([MOVEMENT_TYPES:60]Serial_Warning:15))
								$_t_Blank:=[PRODUCTS:9]Product_Code:1
							End if 
						End if 
					Else 
						If (([STOCK_MOVEMENT_ITEMS:27]Serial_Number:4="") & ([MOVEMENT_TYPES:60]Serial_Warning:15))
							$_t_Blank:=[PRODUCTS:9]Product_Code:1
						End if 
					End if 
				End if 
			End if 
			NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
		End while 
	End if 
	If ($_t_Blank#"")
		If ($_t_Blank="*D:@")
			$_t_Blank:=Substring:C12($_t_Blank; 4; 32000)
			Gen_Alert("The Serial No "+$_t_Blank+" has been duplicated"; "Try again")
		Else 
			If (($_t_Blank="*S:@") & ([MOVEMENT_TYPES:60]Serial_Current:18))
				$_t_Blank:=Substring:C12($_t_Blank; 4; 32000)
				Gen_Alert("The Serial No "+$_t_SerialNumber+" is not vaild for Product: "+$_t_Blank; "Try again")
			Else 
				If ([MOVEMENT_TYPES:60]Serial_Forcing:16)
					Gen_Alert("You must enter a Serial No for Product: "+$_t_Blank; "Try again")
				Else 
					Gen_Confirm("You should enter a Serial No for Product: "+$_t_Blank+".  Is this OK?"; "Try again"; "OK")
				End if 
			End if 
		End if 
		If (OK=0)
			OK:=1
		Else 
			OK:=0
		End if 
	End if 
Else 
	OK:=1
End if 
If (OK=1)
	If (([MOVEMENT_TYPES:60]Stock_Plus:3#"") | ([MOVEMENT_TYPES:60]Stock_Minus:4#""))
		If ([MOVEMENT_TYPES:60]Stock_Minus:4=[MOVEMENT_TYPES:60]Stock_Plus:3) & (False:C215)
			//added NG
			//if this is the case then there have to be pairs of lines
			//because the posting is not normal
			//this is used for stock location movements
			$_l_RecordsInSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
			$_l_HalfRecordsInSelection:=Int:C8($_l_RecordsInSelection/2)
			$_bo_OK:=True:C214
			If ($_l_RecordsInSelection#($_l_HalfRecordsInSelection*2))
				$_bo_OK:=False:C215
				//  ALERT("There should be an even number of lines for this type of movement")
				Gen_Alert("There should be an even number of lines for this type of movement.")
			Else 
				FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
				$_t_ProductCode:=""
				
				For ($_l_Index; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
					If ($_t_ProductCode="")
						$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
						$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
					Else 
						If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#$_t_ProductCode)
							//   ALERT("The Stock cannot be posted because the lines are not in pairs ("+$prod
							Gen_Alert("The Stock cannot be posted because the lines are not in pairs ("+$_t_ProductCode+")")
							$_t_ProductCode:=""
							$_bo_OK:=False:C215
						Else 
							If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12#$_r_Quantity)
								// ALERT("The Stock cannot be posted because the quantities are not in pairs("+$pr
								Gen_Alert("The Stock cannot be posted because the quantities are not in pairs ("+$_t_ProductCode+")")
								$_bo_OK:=False:C215
							End if 
							$_t_ProductCode:=""
						End if 
					End if 
					NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
				End for 
			End if 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
			If ($_bo_OK=False:C215)
				OK:=0
			End if 
			
			
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Move_InLPACheck"; $_t_oldMethodName)
