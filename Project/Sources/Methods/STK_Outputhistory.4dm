//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_Outputhistory
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/03/2013 15:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_aBo_AccountedFor; 0)
	ARRAY LONGINT:C221($_al_AllIDs; 0)
	ARRAY LONGINT:C221($_al_POMovementItemIDS; 0)
	ARRAY LONGINT:C221($_al_SubItems1; 0)
	ARRAY LONGINT:C221($_al_SubItems2; 0)
	ARRAY LONGINT:C221($_al_SubItems3; 0)
	ARRAY LONGINT:C221($_al_SubItems4; 0)
	ARRAY LONGINT:C221($_al_SubItems5; 0)
	ARRAY LONGINT:C221($_al_SubItems6; 0)
	ARRAY LONGINT:C221($_al_SubItems7; 0)
	ARRAY LONGINT:C221($_al_SubItems8; 0)
	C_LONGINT:C283($_l_PoItemsIndex; $_l_SubItem1Index; $_l_SubItem2Index; $_l_SubItem3Index; $_l_SubItem4Index; $_l_SubItem7Index; $_l_SubItem8Index; $_l_SubItemIndex; $_l_SubItemIndex5; $_l_SubItemRow)
	C_REAL:C285($_r_CalledOffQuantity; $_r_CalledOffQuantity1; $_r_CalledOffQuantity2; $_r_CalledOffQuantity3; $_r_CalledOffQuantity4; $_r_CalledOffQuantity5; $_r_CalledOffQuantity6; $_r_CalledOffQuantity7; $_r_CalledOffShouldBe; $_r_CalledOffShouldBe1; $_r_CalledOffShouldBe2)
	C_REAL:C285($_r_CalledOffShouldBe3; $_r_CalledOffShouldBe4; $_r_CalledOffShouldBe5; $_r_CalledOffShouldBe6; $_r_CalledOffShouldBe7)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductCode; $_t_TabsText; $1)
	C_TIME:C306($_ti_DocumentRef; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_OutputHistory")
If (Count parameters:C259=0)
	$_t_ProductCode:=Gen_Request("Enter Product Code"; "")
	$_ti_DocumentRef:=Create document:C266(""; "TEXT")
Else 
	$_t_ProductCode:=$1
	$_ti_DocumentRef:=$2
End if 
QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ProductCode)
If (Records in selection:C76([PRODUCTS:9])=1)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
	CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "ValidItems")
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_AllIDs)
	ARRAY BOOLEAN:C223($_aBo_AccountedFor; 0)
	ARRAY BOOLEAN:C223($_aBo_AccountedFor; Size of array:C274($_al_AllIDs))
	USE SET:C118("ValidItems")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30="PO")
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_POMovementItemIDS)
	SEND PACKET:C103($_ti_DocumentRef; "Product Code :"+$_t_ProductCode+Char:C90(13))
	For ($_l_PoItemsIndex; 1; Size of array:C274($_al_POMovementItemIDS))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_POMovementItemIDS{$_l_PoItemsIndex})
		$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_POMovementItemIDS{$_l_PoItemsIndex})
		If ($_l_SubItemRow<0)
			APPEND TO ARRAY:C911($_al_AllIDs; $_al_POMovementItemIDS{$_l_PoItemsIndex})
			APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
			$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
		End if 
		If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
			$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
			$_r_CalledOffShouldBe:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			$_r_CalledOffQuantity:=0
			SEND PACKET:C103($_ti_DocumentRef; "Purchase Order number"+Char:C90(9)+"Ordered Quantity"+Char:C90(9)+"Remaining On Order"+Char:C90(13))
			SEND PACKET:C103($_ti_DocumentRef; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_Code:20+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_POMovementItemIDS{$_l_PoItemsIndex})
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems1)
			
			For ($_l_SubItem1Index; 1; Size of array:C274($_al_SubItems1))
				
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems1{$_l_SubItem1Index})
				$_r_CalledOffQuantity:=$_r_CalledOffQuantity+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				
				$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems1{$_l_SubItem1Index})
				If ($_l_SubItemRow<0)
					APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems1{$_l_SubItem1Index})
					APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
					$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
				End if 
				If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
					$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
					$_r_CalledOffShouldBe1:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
					$_r_CalledOffQuantity1:=0
					$_t_TabsText:=Char:C90(9)*3
					SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems1{$_l_SubItem1Index})
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems2)
					
					For ($_l_SubItem2Index; 1; Size of array:C274($_al_SubItems2))
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems2{$_l_SubItem2Index})
						$_r_CalledOffQuantity1:=$_r_CalledOffQuantity1+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems2{$_l_SubItem2Index})
						If ($_l_SubItemRow<0)
							APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems2{$_l_SubItem2Index})
							APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
							$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
						End if 
						If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
							$_r_CalledOffShouldBe2:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
							$_r_CalledOffQuantity2:=0
							$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
							$_t_TabsText:=Char:C90(9)*7
							SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
							SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems2{$_l_SubItem2Index})
							SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems3)
							
							For ($_l_SubItem3Index; 1; Size of array:C274($_al_SubItems3))
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems3{$_l_SubItem3Index})
								$_r_CalledOffQuantity2:=$_r_CalledOffQuantity2+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems3{$_l_SubItem3Index})
								
								If ($_l_SubItemRow<0)
									APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems3{$_l_SubItem3Index})
									APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
									$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
								End if 
								If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
									$_r_CalledOffShouldBe3:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
									$_r_CalledOffQuantity3:=0
									$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
									$_t_TabsText:=Char:C90(9)*11
									SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
									SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems3{$_l_SubItem3Index})
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems4)
									
									For ($_l_SubItem4Index; 1; Size of array:C274($_al_SubItems4))
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems4{$_l_SubItem4Index})
										$_r_CalledOffQuantity3:=$_r_CalledOffQuantity3+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										
										$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems4{$_l_SubItem4Index})
										If ($_l_SubItemRow<0)
											APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems4{$_l_SubItem4Index})
											APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
											
											$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
										End if 
										If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
											$_r_CalledOffShouldBe4:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											$_r_CalledOffQuantity4:=0
											$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
											$_t_TabsText:=Char:C90(9)*15
											SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
											SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems4{$_l_SubItem4Index})
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems5)
											
											For ($_l_SubItemIndex5; 1; Size of array:C274($_al_SubItems5))
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems5{$_l_SubItemIndex5})
												$_r_CalledOffQuantity4:=$_r_CalledOffQuantity4+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
												$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems5{$_l_SubItemIndex5})
												If ($_l_SubItemRow<0)
													APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems5{$_l_SubItemIndex5})
													APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
													$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
												End if 
												If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
													$_r_CalledOffShouldBe5:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
													$_r_CalledOffQuantity5:=0
													$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
													$_t_TabsText:=Char:C90(9)*19
													SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
													SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems5{$_l_SubItemIndex5})
													SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems6)
													
													For ($_l_SubItemIndex; 1; Size of array:C274($_al_SubItems6))
														
														QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems6{$_l_SubItemIndex})
														$_r_CalledOffQuantity5:=$_r_CalledOffQuantity5+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
														$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems6{$_l_SubItemIndex})
														If ($_l_SubItemRow<0)
															APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems6{$_l_SubItemIndex})
															APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
															$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
														End if 
														If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
															$_r_CalledOffShouldBe6:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
															$_r_CalledOffQuantity6:=0
															$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
															$_t_TabsText:=Char:C90(9)*19
															SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
															SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems6{$_l_SubItemIndex})
															SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems7)
															
															For ($_l_SubItem7Index; 1; Size of array:C274($_al_SubItems7))
																
																QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems7{$_l_SubItem7Index})
																$_r_CalledOffQuantity6:=$_r_CalledOffQuantity6+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems7{$_l_SubItem7Index})
																If ($_l_SubItemRow<0)
																	APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems7{$_l_SubItemIndex})
																	APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
																	$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
																End if 
																If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
																	$_r_CalledOffShouldBe7:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
																	$_r_CalledOffQuantity7:=0
																	$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
																	$_t_TabsText:=Char:C90(9)*19
																	SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
																	SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems7{$_l_SubItemIndex})
																	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems8)
																	
																	For ($_l_SubItem8Index; 1; Size of array:C274($_al_SubItems8))
																		SEND PACKET:C103($_ti_DocumentRef; "ALso"+String:C10($_al_SubItems8{$_l_SubItem8Index})+Char:C90(13))
																		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems8{$_l_SubItem8Index})
																		$_r_CalledOffQuantity7:=$_r_CalledOffQuantity7+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
																	End for 
																	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems7{$_l_SubItemIndex})
																	$_t_TabsText:=Char:C90(9)*19
																	SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe7)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity7))
																	If ($_r_CalledOffQuantity7#$_r_CalledOffShouldBe7)
																		SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
																	Else 
																		SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
																	End if 
																	
																End if 
															End for 
															QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems6{$_l_SubItemIndex})
															$_t_TabsText:=Char:C90(9)*19
															SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe6)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity6))
															If ($_r_CalledOffQuantity6#$_r_CalledOffShouldBe6)
																SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
															Else 
																SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
															End if 
															
														End if 
													End for 
													QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems5{$_l_SubItemIndex5})
													$_t_TabsText:=Char:C90(9)*19
													SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe5)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity5))
													If ($_r_CalledOffQuantity5#$_r_CalledOffShouldBe5)
														SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
													Else 
														SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
													End if 
												End if 
											End for 
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems4{$_l_SubItem4Index})
											$_t_TabsText:=Char:C90(9)*15
											SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe4)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity4))
											If ($_r_CalledOffQuantity4#$_r_CalledOffShouldBe4)
												SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
											Else 
												SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
											End if 
										End if 
									End for 
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems3{$_l_SubItem3Index})
									$_t_TabsText:=Char:C90(9)*11
									SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe3)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity3))
									If ($_r_CalledOffQuantity3#$_r_CalledOffShouldBe3)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
									Else 
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
									End if 
								End if 
							End for 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems2{$_l_SubItem2Index})
							$_t_TabsText:=Char:C90(9)*11
							SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe2)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity2))
							If ($_r_CalledOffQuantity2#$_r_CalledOffShouldBe2)
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
							Else 
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
							End if 
						End if 
					End for 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems1{$_l_SubItem1Index})
					$_t_TabsText:=Char:C90(9)*11
					SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe1)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity1))
					If ($_r_CalledOffQuantity1#$_r_CalledOffShouldBe1)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
					Else 
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
					End if 
				End if 
			End for 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_POMovementItemIDS{$_l_PoItemsIndex})
			SEND PACKET:C103($_ti_DocumentRef; "Called off should be "+String:C10($_r_CalledOffShouldBe)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity))
			If ($_r_CalledOffQuantity#$_r_CalledOffShouldBe)
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
			Else 
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
			End if 
		End if 
		
	End for 
	
	USE SET:C118("ValidItems")
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="P")
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems1)
	For ($_l_SubItem1Index; 1; Size of array:C274($_al_SubItems1))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems1{$_l_SubItem1Index})
		$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems1{$_l_SubItem1Index})
		
		If ($_l_SubItemRow<0)
			APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems1{$_l_SubItem1Index})
			APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
			$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
		End if 
		If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
			$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
			$_t_TabsText:=Char:C90(9)*3
			$_r_CalledOffShouldBe1:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
			$_r_CalledOffQuantity1:=0
			SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
			SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems1{$_l_SubItem1Index})
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems2)
			
			For ($_l_SubItem2Index; 1; Size of array:C274($_al_SubItems2))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems2{$_l_SubItem2Index})
				$_r_CalledOffShouldBe2:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
				$_r_CalledOffQuantity2:=0
				$_r_CalledOffQuantity1:=$_r_CalledOffQuantity1+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
				
				$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems2{$_l_SubItem2Index})
				If ($_l_SubItemRow<0)
					APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems2{$_l_SubItem2Index})
					APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
					$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
				End if 
				If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
					$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
					$_t_TabsText:=Char:C90(9)*7
					SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems2{$_l_SubItem2Index})
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems3)
					For ($_l_SubItem3Index; 1; Size of array:C274($_al_SubItems3))
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems3{$_l_SubItem3Index})
						$_r_CalledOffShouldBe3:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
						
						$_r_CalledOffQuantity3:=0
						$_r_CalledOffQuantity2:=$_r_CalledOffQuantity2+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
						$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems3{$_l_SubItem3Index})
						If ($_l_SubItemRow<0)
							APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems3{$_l_SubItem3Index})
							APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
							$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
						End if 
						If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
							$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
							$_t_TabsText:=Char:C90(9)*11
							SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
							SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems3{$_l_SubItem3Index})
							SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems4)
							
							For ($_l_SubItem4Index; 1; Size of array:C274($_al_SubItems4))
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems4{$_l_SubItem4Index})
								$_r_CalledOffShouldBe4:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
								$_r_CalledOffQuantity4:=0
								$_r_CalledOffQuantity3:=$_r_CalledOffQuantity3+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
								$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems4{$_l_SubItem4Index})
								If ($_l_SubItemRow<0)
									APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems4{$_l_SubItem4Index})
									APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
									$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
								End if 
								If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
									$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
									$_t_TabsText:=Char:C90(9)*15
									SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
									SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems4{$_l_SubItem4Index})
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems5)
									
									For ($_l_SubItemIndex5; 1; Size of array:C274($_al_SubItems5))
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems5{$_l_SubItemIndex5})
										$_r_CalledOffShouldBe5:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
										$_r_CalledOffQuantity5:=0
										$_r_CalledOffQuantity4:=$_r_CalledOffQuantity4+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
										$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems5{$_l_SubItemIndex5})
										If ($_l_SubItemRow<0)
											APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems5{$_l_SubItemIndex5})
											APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
											$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
										End if 
										If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
											$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
											$_t_TabsText:=Char:C90(9)*19
											SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
											SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems5{$_l_SubItemIndex5})
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems6)
											$_r_CalledOffShouldBe5:=[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
											$_r_CalledOffQuantity5:=0
											For ($_l_SubItemIndex; 1; Size of array:C274($_al_SubItems6))
												QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems6{$_l_SubItemIndex})
												$_r_CalledOffQuantity5:=$_r_CalledOffQuantity5+[STOCK_MOVEMENT_ITEMS:27]Quantity:12
												SEND PACKET:C103($_ti_DocumentRef; "ALso"+String:C10($_al_SubItems6{$_l_SubItemIndex})+Char:C90(13))
											End for 
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems4{$_l_SubItem4Index})
											SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe5)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity5))
											If ($_r_CalledOffQuantity5#$_r_CalledOffShouldBe5)
												SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
												
											Else 
												SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
											End if 
											
											
										End if 
									End for 
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems4{$_l_SubItem4Index})
									SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe4)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity4))
									If ($_r_CalledOffQuantity4#$_r_CalledOffShouldBe4)
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
									Else 
										SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
									End if 
									
								End if 
							End for 
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems3{$_l_SubItem3Index})
							SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe3)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity3))
							If ($_r_CalledOffQuantity3#$_r_CalledOffShouldBe3)
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
							Else 
								SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
							End if 
						End if 
					End for 
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems2{$_l_SubItem2Index})
					SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Called off should be "+String:C10($_r_CalledOffShouldBe2)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity2))
					If ($_r_CalledOffQuantity2#$_r_CalledOffShouldBe2)
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
					Else 
						SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
					End if 
				End if 
				
			End for 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems1{$_l_SubItem1Index})
			SEND PACKET:C103($_ti_DocumentRef; "Called off should be "+String:C10($_r_CalledOffShouldBe1)+Char:C90(9)+"Called off ="+String:C10($_r_CalledOffQuantity1))
			If ($_r_CalledOffShouldBe1#$_r_CalledOffQuantity1)
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(9)+"WRONG "+"INVESTIGATE"+Char:C90(13))
			Else 
				SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
			End if 
		End if 
		
	End for 
	
	USE SET:C118("ValidItems")
	SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems1)
	For ($_l_SubItem1Index; 1; Size of array:C274($_al_SubItems1))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems1{$_l_SubItem1Index})
		$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems1{$_l_SubItem1Index})
		If ($_l_SubItemRow<0)
			APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems1{$_l_SubItem1Index})
			APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
			$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
		End if 
		If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
			$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
			$_t_TabsText:=Char:C90(9)*3
			SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
			SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems1{$_l_SubItem1Index})
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems2)
			For ($_l_SubItem2Index; 1; Size of array:C274($_al_SubItems2))
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems2{$_l_SubItem2Index})
				$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems2{$_l_SubItem2Index})
				If ($_l_SubItemRow<0)
					APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems2{$_l_SubItem2Index})
					APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
					$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
				End if 
				If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
					$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
					$_t_TabsText:=Char:C90(9)*7
					SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
					SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems2{$_l_SubItem2Index})
					SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems3)
					For ($_l_SubItem3Index; 1; Size of array:C274($_al_SubItems3))
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems3{$_l_SubItem3Index})
						$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems3{$_l_SubItem3Index})
						If ($_l_SubItemRow<0)
							APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems3{$_l_SubItem3Index})
							APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
							$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
						End if 
						If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
							$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
							$_t_TabsText:=Char:C90(9)*11
							SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
							SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
							QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems3{$_l_SubItem3Index})
							SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems4)
							For ($_l_SubItem4Index; 1; Size of array:C274($_al_SubItems4))
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems4{$_l_SubItem4Index})
								$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems4{$_l_SubItem4Index})
								If ($_l_SubItemRow<0)
									APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems4{$_l_SubItem4Index})
									APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
									$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
								End if 
								If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
									$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
									$_t_TabsText:=Char:C90(9)*15
									SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
									SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems4{$_l_SubItem4Index})
									SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems5)
									For ($_l_SubItemIndex5; 1; Size of array:C274($_al_SubItems5))
										QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$_al_SubItems5{$_l_SubItemIndex5})
										$_l_SubItemRow:=Find in array:C230($_al_AllIDs; $_al_SubItems5{$_l_SubItemIndex5})
										If ($_l_SubItemRow<0)
											APPEND TO ARRAY:C911($_al_AllIDs; $_al_SubItems5{$_l_SubItemIndex5})
											APPEND TO ARRAY:C911($_aBo_AccountedFor; False:C215)
											$_l_SubItemRow:=Size of array:C274($_al_AllIDs)
										End if 
										If ($_aBo_AccountedFor{$_l_SubItemRow}=False:C215)
											$_aBo_AccountedFor{$_l_SubItemRow}:=True:C214
											$_t_TabsText:=Char:C90(9)*19
											SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+"Movement Code"+Char:C90(9)+"Quantity"+Char:C90(9)+"Remaining on that movement"+Char:C90(13))
											SEND PACKET:C103($_ti_DocumentRef; $_t_TabsText+[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]Quantity:12)+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31+Char:C90(9)+[STOCK_MOVEMENT_ITEMS:27]Product_Code:1+Char:C90(9)+String:C10([STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26)+Char:C90(13))
											QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_al_SubItems5{$_l_SubItemIndex5})
											SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]x_ID:16; $_al_SubItems6)
											For ($_l_SubItemIndex; 1; Size of array:C274($_al_SubItems6))
												SEND PACKET:C103($_ti_DocumentRef; "ALso"+String:C10($_al_SubItems6{$_l_SubItemIndex})+Char:C90(13))
											End for 
											
										End if 
									End for 
									
								End if 
							End for 
						End if 
					End for 
				End if 
			End for 
		End if 
	End for 
	
End if 
ERR_MethodTrackerReturn("STK_OutputHistory"; $_t_oldMethodName)