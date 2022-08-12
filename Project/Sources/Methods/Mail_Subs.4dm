//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_Subs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    14/06/2010 13:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordsinSelection; cList; rOrd; vNo; vOrdI; vP)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_Subs")
//Mail_Subscriptions
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Start_ProcMail
If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)
	If ((DB_GetModuleSettingByNUM(Module_Subscriptions))#3)
		OrderI_File
		READ ONLY:C145([ORDER_ITEMS:25])
		READ ONLY:C145([ORDERS:24])
		While (vOrdI=1)
			DB_t_CurrentFormUsage:="Subs Mail"
			OrderI_SelP
			If (vOrdI=1)
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
						CREATE SET:C116([ORDER_ITEMS:25]; "OMaster")
						CREATE SET:C116([SUBSCRIPTIONS:93]; "AMaster")
						//vNo:=Records in selection([ORDER ITEMS])
						//DB_t_CurrentFormUsage:="Print"
						//Open_Pro_Window ("Mail_Subscriptions";0;1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
						//  OUTPUT LAYOUT("Items_OutPrint")
						//FS_SetFormSort (WIN_t_CurrentOutputform)
						//WIn_SetFormSize (1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
						//D`ISPLAY SELECTION([ORDER ITEMS];*)  `NG may 2004 added table
						
						DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])))
						If (OK=1)
							vNo:=Records in selection:C76([ORDER_ITEMS:25])
							Subscript_OrdRe
							$_l_RecordsinSelection:=Records in selection:C76([ORDERS:24])
							Gen_Confirm("Do you want to mail each Subscription individually ("+String:C10(vNo)+" Item"+("s"*(Num:C11(vNo#1)))+"), or once to each different Ordering Company ("+String:C10($_l_RecordsinSelection)+" Item"+("s"*(Num:C11($_l_RecordsinSelection#1)))+") ?"; "Subscription"; "Company")
							If (OK=1)
								
								rOrd:=2
								MAsk_Print(->[ORDER_ITEMS:25])
								If (vP=1)
									MAsk_MS(->[ORDER_ITEMS:25])
									If (OK=1)
										If (cList=1)
											FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Items_List")
											MList_Print(->[ORDER_ITEMS:25])
										End if 
										MailP_Let(->[ORDER_ITEMS:25])
										MailP_Lab(->[ORDER_ITEMS:25])
										MailP_Env(->[ORDER_ITEMS:25])
										MailP_Exp(->[ORDER_ITEMS:25])
										Mail_SubsUp(->[ORDER_ITEMS:25])
									End if 
								End if 
								
							Else 
								
								
								rOrd:=3
								MAsk_Print(->[ORDERS:24])
								If (vP=1)
									MAsk_MS(->[ORDERS:24])
									If (OK=1)
										If (cList=1)
											FORM SET OUTPUT:C54([ORDERS:24]; "Orders_List")
											MList_Print(->[ORDERS:24])
										End if 
										MailP_Let(->[ORDERS:24])
										MailP_Lab(->[ORDERS:24])
										MailP_Env(->[ORDERS:24])
										MailP_Exp(->[ORDERS:24])
										Mail_SubsUp(->[ORDERS:24])
									End if 
								End if 
								
							End if 
							
						End if 
						//Close_ProWin
						
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
ERR_MethodTrackerReturn("Mail_Subs"; $_t_oldMethodName)
