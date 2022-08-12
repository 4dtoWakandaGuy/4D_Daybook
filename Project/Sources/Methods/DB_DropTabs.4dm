//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DropTabs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2013 22:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_TabNavigation;0)
	//ARRAY TEXT(DB_at_TabContext;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_LONGINT:C283($_l_TabRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DropTabs")
If (Count parameters:C259>=1)
	//this will drop an item from the tabs
	
	
	Case of 
		: ($1=Table:C252(->[PRODUCTS:9]))
			$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[COMPANIES:2]))
			If ($_l_TabRow<0)
				$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[PRODUCTS_SUPPLIERS:148]))
				If ($_l_TabRow<0)
					$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
					If ($_l_TabRow<0)
						$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[ORDER_ITEMS:25]))
						If ($_l_TabRow<0)
							$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[DIARY:12]))
							If ($_l_TabRow<0)
								$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[DOCUMENTS:7]))
								If ($_l_TabRow<0)
									$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[SERVICE_CALLS:20]))
									If ($_l_TabRow<0)
										$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
										If ($_l_TabRow<0)
											$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[PURCHASE_INVOICES:37]))
											If ($_l_TabRow<0)
												$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[PURCHASE_ORDERS:57]))
												If ($_l_TabRow<0)
													$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[ORDERS:24]))
													If ($_l_TabRow<0)
														$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[CURRENT_STOCK:62]))
														If ($_l_TabRow<0)
															$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[STOCK_LEVELS:58]))
															If ($_l_TabRow<0)
																$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[STOCK_MOVEMENTS:40]))
																If ($_l_TabRow<0)
																	$_l_TabRow:=Find in array:C230(DB_al_TabNavigation; Table:C252(->[INVOICES:39]))
																	If ($_l_TabRow<0)
																	End if 
																End if 
															End if 
														End if 
													End if 
												End if 
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
					
					
					
					
					
				End if 
			End if 
			
	End case 
	If ($_l_TabRow>0)
		DELETE FROM ARRAY:C228(DB_at_TabNavigation; $_l_TabRow)
		DELETE FROM ARRAY:C228(DB_at_TabContext; $_l_TabRow)
		DELETE FROM ARRAY:C228(DB_al_TabNavigation; $_l_TabRow)
	End if 
End if 
ERR_MethodTrackerReturn("DB_DropTabs"; $_t_oldMethodName)