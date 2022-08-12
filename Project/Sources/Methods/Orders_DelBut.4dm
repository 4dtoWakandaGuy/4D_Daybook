//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_DelBut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 20:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_noDeletion)
	C_LONGINT:C283($_l_Index; $_l_OK; MOD_l_CurrentModuleAccess)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_DelBut")
OK:=0
MESSAGES OFF:C175
If (MOD_l_CurrentModuleAccess<3)
	COPY NAMED SELECTION:C331([ORDERS:24]; "$Or2")
	COPY NAMED SELECTION:C331([ORDERS:24]; "$Sel2")
	READ WRITE:C146([ORDERS:24])
	USE NAMED SELECTION:C332("$Sel2")
	//see also OrderI_OutDel2
	Are_You_Sure
	If (OK=1)
		FIRST RECORD:C50([ORDERS:24])
		If (Records in selection:C76([ORDERS:24])>1)
			FIRST RECORD:C50([ORDERS:24])
			$_bo_noDeletion:=False:C215
			For ($_l_Index; 1; Records in selection:C76([ORDERS:24]))
				//Delete the order items
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
				COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Or")
				COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Sel")
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Locked:16=True:C214)
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					Gen_Alert("Invoiced Items cannot be deleted"; "Cancel")
					OK:=0
					$_bo_noDeletion:=True:C214
				Else 
					USE NAMED SELECTION:C332("$Sel")
					If (OK=1)
						FIRST RECORD:C50([ORDER_ITEMS:25])
						While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
							If ([ORDER_ITEMS:25]Item_Locked:16)
								//Gen_Alert ("You cannot delete Item Number";"Cancel")
							Else 
								If (Count parameters:C259=0)
									If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
										If ([ORDER_ITEMS:25]Item_Number:27>0)
											QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
											DELETE SELECTION:C66([SUBSCRIPTIONS:93])
										End if 
									End if 
								Else 
									//New section NG MAy 2004 to handle contracts deletions
									If (Count parameters:C259>=1)
										Case of 
											: ($1="Contracts")
												If ([ORDER_ITEMS:25]Contract_Code:29#"")
													If ([ORDER_ITEMS:25]Order_Code:1#"")
														Gen_Confirm("This Item cannot be deleted as it's part of an Order.  Unallocate"+" it from this Contract instead?"; "Yes"; "No")
														If (OK=1)
															[ORDER_ITEMS:25]Contract_Code:29:=""
															DB_SaveRecord(->[ORDER_ITEMS:25])
															AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
														End if 
													Else 
														$_l_OK:=DB_DeletionControl(->[ORDER_ITEMS:25]; "Orders_DelBut")
														If ($_l_OK=1)
															DELETE RECORD:C58([ORDER_ITEMS:25])
														End if 
														
														
														
													End if 
												End if 
												
										End case 
									End if 
									//end of new section
								End if 
								
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End while 
						DELETE SELECTION:C66([ORDER_ITEMS:25])
					End if 
					
				End if 
				
				NEXT RECORD:C51([ORDERS:24])
			End for 
			If ($_bo_noDeletion=False:C215)
				DELETE SELECTION:C66([ORDERS:24])
			Else 
				Gen_Alert("Because some order items could not be deleted these orders will not be deleted")
				
			End if 
			
		Else 
			
			$_bo_noDeletion:=False:C215
			//Delete the order items
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Or")
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Sel")
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Locked:16=True:C214)
			If (Records in selection:C76([ORDER_ITEMS:25])>0)
				Gen_Alert("Invoiced Items cannot be deleted"; "Cancel")
				OK:=0
				$_bo_noDeletion:=True:C214
			Else 
				USE NAMED SELECTION:C332("$Sel")
				If (OK=1)
					FIRST RECORD:C50([ORDER_ITEMS:25])
					While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
						If ([ORDER_ITEMS:25]Item_Locked:16)
							//Gen_Alert ("You cannot delete Item Number";"Cancel")
						Else 
							If (Count parameters:C259=0)
								If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
									If ([ORDER_ITEMS:25]Item_Number:27>0)
										QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
										DELETE SELECTION:C66([SUBSCRIPTIONS:93])
									End if 
								End if 
							Else 
								//New section NG MAy 2004 to handle contracts deletions
								
								Case of 
									: ($1="Contracts")
										If ([ORDER_ITEMS:25]Contract_Code:29#"")
											If ([ORDER_ITEMS:25]Order_Code:1#"")
												Gen_Confirm("This Item cannot be deleted as it's part of an Order.  Unallocate"+" it from this Contract instead?"; "Yes"; "No")
												If (OK=1)
													[ORDER_ITEMS:25]Contract_Code:29:=""
													DB_SaveRecord(->[ORDER_ITEMS:25])
													AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
												End if 
											Else 
												DB_DeletionControl(->[ORDER_ITEMS:25]; "Orders_DelBut")
												DELETE RECORD:C58([ORDER_ITEMS:25])
											End if 
										End if 
										
								End case 
								//end of new section
							End if 
							
						End if 
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End while 
					DELETE SELECTION:C66([ORDER_ITEMS:25])
				End if 
				
			End if 
			If ($_bo_noDeletion=False:C215)
				DB_DeletionControl(->[ORDERS:24]; "Orders_DelBut")
				DELETE RECORD:C58([ORDERS:24])
			Else 
				Gen_Alert("Because some order items could not be deleted this order will not be deleted!")
				OK:=0
			End if 
			
		End if 
	End if 
	
	
End if 
UNLOAD RECORD:C212([ORDERS:24])
READ ONLY:C145([ORDERS:24])
CLEAR NAMED SELECTION:C333("$Sel")
USE NAMED SELECTION:C332("$Or")
MESSAGES ON:C181
ERR_MethodTrackerReturn("Orders_DelBut"; $_t_oldMethodName)
