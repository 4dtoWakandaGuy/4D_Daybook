//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Subscript Del
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SalesOrderItemNumbers; 0)
	ARRAY TEXT:C222($_at_SalesOrderItemProductCodes; 0)
	C_DATE:C307(<>DB_d_CurrentDate; vDoDateF)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; vNo; vOrdI)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $form; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Subscript Del")
//Subscript Del iveries

//NG APRIL NOTE...I thought this would be a Deleting method
//its actually to do with deliveries
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)
	If ((DB_GetModuleSettingByNUM(Module_Subscriptions))#3)
		OrderI_File
		READ ONLY:C145([ORDER_ITEMS:25])
		READ ONLY:C145([ORDERS:24])
		While (vOrdI=1)
			vDoDateF:=!00-00-00!
			DB_t_CurrentFormUsage:="Subs Del"
			OrderI_SelP
			If (vOrdI=1)
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
						CREATE SET:C116([ORDER_ITEMS:25]; "OMaster")
						CREATE SET:C116([SUBSCRIPTIONS:93]; "AMaster")
						vNo:=Records in selection:C76([ORDER_ITEMS:25])
						DB_t_CurrentFormUsage:="Print"
						Open_Pro_Window("Issue Deliveries: Select Items"; 0; 1; ->[ORDER_ITEMS:25]; WIN_t_CurrentOutputform)
						//  OUTPUT LAYOUT("Items OutPrint")
						//FS_SetFormSort (WIN_t_CurrentOutputform)
						WIn_SetFormSize(1; ->[ORDER_ITEMS:25]; WIN_t_CurrentOutputform)
						DISPLAY SELECTION:C59([ORDER_ITEMS:25]; *)
						If (OK=1)
							Subscript_OrdRe
							
							Gen_Confirm("Do you want to print Delivery Notes, or to use a different SuperReport form?"; "Del Notes"; "SuperReport")
							If (OK=1)
								Gen_PPMulti(->[ORDERS:24]; "Delivery Note"; "Orders Out"; "Subs"; "Delivery Note"; "Orders_PPDelL2"; 0; ->[ORDERS:24]State:15; "Delivery"; [ORDERS:24]Analysis_Code:33)
							Else 
								OK:=1
								$form:=""
								While (($form="") & (OK=1))
									$form:=Gen_Request("Which SR Form?")
									If (OK=1)
										QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$form)
										If (Records in selection:C76([DOCUMENTS:7])=1)
											DB_t_CurrentFormUsage:="Subs"
											SR Print("Orders"; $form; 2)
										Else 
											Gen_Confirm("Report '"+$form+"' was not found"; "Try again"; "Cancel")
											$form:=""
										End if 
									End if 
								End while 
							End if 
							If (OK=1)
								Gen_Confirm("Do you now wish to mark any relevant Subscription Details as Done?"; "Yes"; "No")
								If (OK=1)
									MESSAGES OFF:C175
									USE SET:C118("OMaster")
									SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Item_Number:27; $_al_SalesOrderItemNumbers; [ORDER_ITEMS:25]Product_Code:2; $_at_SalesOrderItemProductCodes)
									$_l_SizeofArray:=Size of array:C274($_al_SalesOrderItemNumbers)
									READ WRITE:C146([SUBSCRIPTIONS:93])
									For ($_l_Index; 1; $_l_SizeofArray)
										USE SET:C118("AMaster")
										QUERY SELECTION:C341([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=$_al_SalesOrderItemNumbers{$_l_Index}; *)
										QUERY SELECTION:C341([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Date_Done:9=!00-00-00!; *)
										QUERY SELECTION:C341([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="ISS")
										If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
											ORDER BY:C49([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Subscription_Date:3; >)
											FIRST RECORD:C50([SUBSCRIPTIONS:93])
											If (Check_LockMess(->[SUBSCRIPTIONS:93]; "Subscription"))
												[SUBSCRIPTIONS:93]Date_Done:9:=<>DB_d_CurrentDate
												DB_SaveRecord(->[SUBSCRIPTIONS:93])
												AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
											End if 
											
											//for perpetual ones
											If (Records in selection:C76([SUBSCRIPTIONS:93])=1)
												QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_SalesOrderItemProductCodes{$_l_Index})
												If ([PRODUCTS:9]Subscription_Perpetual:41)
													DUPLICATE RECORD:C225([SUBSCRIPTIONS:93])
													[SUBSCRIPTIONS:93]x_ID:11:=0
													
													[SUBSCRIPTIONS:93]Date_Done:9:=!00-00-00!
													[SUBSCRIPTIONS:93]Subscription_Date:3:=Subscript_SDate([SUBSCRIPTIONS:93]Subscription_Date:3)
													[SUBSCRIPTIONS:93]After_Number:5:=[SUBSCRIPTIONS:93]After_Number:5+[PRODUCTS:9]Every_Number:28
													DB_SaveRecord(->[SUBSCRIPTIONS:93])
													AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
												End if 
											End if 
											
										End if 
									End for 
									UNLOAD RECORD:C212([SUBSCRIPTIONS:93])
								End if 
								MESSAGES ON:C181
							End if 
						End if 
						Close_ProWin
					Else 
						Gen_Alert("You found Order Items, but did not find any Subscription Details"; "Cancel")
					End if 
					vOrdI:=0
				Else 
					Gen_None("Order Items"; ->vOrdI)
				End if 
			End if 
		End while 
	Else 
		Gen_Alert("You have only Read Only access to Subscriptions"; "Cancel")
	End if 
Else 
	Gen_Alert("You do not have access to Subscriptions"; "Cancel")
End if 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Subscript Del"; $_t_oldMethodName)
