//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_GP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 17:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_BOOLEAN:C305(<>SalesItemDP; $_bo_Reselect; DB_bo_RecordModified; ORD_bo_IsRevision)
	C_LONGINT:C283($_l_AddMode; $_l_NextOrderSortReference; $_l_OrderItemsRow; $no; vAdd; vNo; vP)
	C_POINTER:C301($_ptr_ListBoxSetup; $_ptr_NamedSetValue)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_CurrentOutputform; $_t_NamedSet; $_t_oldMethodName; $title; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; VSELPREV; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_GP")
//Orders_GP
If (Not:C34(ORD_bo_IsRevision))
	
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	Menu_Record("Orders_GP"; "Add Product Items")
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	Case of 
		: (DB_t_CurrentFormUsage="Purch")
		: (DB_t_CurrentFormUsage="Job@")
			DB_SaveRecord(->[JOBS:26])
			AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
			COPY NAMED SELECTION:C331([JOBS:26]; "Jobs")
			If (DB_t_CurrentFormUsage="JobStage")
				DB_SaveRecord(->[JOB_STAGES:47])
			End if 
		Else 
			DB_SaveRecord(->[ORDERS:24])
			AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
			COPY NAMED SELECTION:C331([ORDERS:24]; "Orders")
	End case 
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	$_l_AddMode:=vAdd
	$no:=vNo
	vSelPrev:=""
	//Products_File
	While (vP=1)
		Prod_Sel
		If (vP=1)
			If (Records in selection:C76([PRODUCTS:9])>0)
				
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])); True:C214)
				
				vNo:=Records in selection:C76([PRODUCTS:9])
				If ((vNo>0) & (OK=1))
					If (DB_t_CurrentFormUsage="JobStage")
						$title:="Job Stage"
					Else 
						$title:=Uppers2(Lowercase:C14([TABLE_RECORD_STATES:90]Entry_Name:5))
					End if 
					Gen_Confirm("Do you want to insert "+String:C10(vNo)+" Product"+("s"*Num:C11(vNo#1))+" into the "+$title+"?"; "Yes"; "No")
					If (OK=1)
						
						FIRST RECORD:C50([PRODUCTS:9])
						$_l_NextOrderSortReference:=1
						While (Not:C34(End selection:C36([PRODUCTS:9])))
							CREATE RECORD:C68([ORDER_ITEMS:25])
							OrderI_No
							[ORDER_ITEMS:25]Print_Description:45:=<>SalesItemDP
							[ORDER_ITEMS:25]Product_Code:2:=[PRODUCTS:9]Product_Code:1
							[ORDER_ITEMS:25]Quantity:3:=1
							If (DB_t_CurrentFormUsage="Job@")
								[ORDER_ITEMS:25]Job_Code:34:=[JOBS:26]Job_Code:1
								[ORDER_ITEMS:25]Person:14:=[JOBS:26]Person:19
								
								If (DB_t_CurrentFormUsage="JobStage")
									[ORDER_ITEMS:25]Job_Stage:35:=[JOB_STAGES:47]Stage_Code:2
									If ((DB_GetModuleSettingByNUM(1)=5) | (FORM Get current page:C276#2))
										[ORDER_ITEMS:25]State:46:="A"
										[JOBS:26]Sort_No:22:=[JOBS:26]Sort_No:22+1
										$_l_NextOrderSortReference:=JOBs_GetSortref([JOBS:26]Job_Code:1; [JOB_STAGES:47]Stage_Code:2; $_l_NextOrderSortReference; "A")
										[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
										[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
										
									Else 
										[ORDER_ITEMS:25]State:46:="B"
										[JOBS:26]Sort_No:22:=[JOBS:26]Sort_No:22+1
										$_l_NextOrderSortReference:=JOBs_GetSortref([JOBS:26]Job_Code:1; [JOB_STAGES:47]Stage_Code:2; $_l_NextOrderSortReference; "B")
										[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
										[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
										
									End if 
								Else 
									[ORDER_ITEMS:25]State:46:="A"
									//***********************added 09/02/06 -kmw ************************
									[JOBS:26]Sort_No:22:=[JOBS:26]Sort_No:22+1
									$_l_NextOrderSortReference:=JOBs_GetSortref([JOBS:26]Job_Code:1; [JOB_STAGES:47]Stage_Code:2; $_l_NextOrderSortReference)
									[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
									[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
									//**************************************************************
								End if 
								
							Else 
								[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
								[ORDER_ITEMS:25]Required_Date:10:=[ORDERS:24]Required_Date:9
								[ORDER_ITEMS:25]Person:14:=[ORDERS:24]Person:5
								
								[ORDERS:24]Sort_Number:27:=[ORDERS:24]Sort_Number:27+1
								//$_l_NextOrderSortReference:=ORDI_GetSortRef ([ORDERS]Order_Code;$_l_NextOrderSortReference)
								$_l_NextOrderSortReference:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextOrderSortReference; Records in selection:C76([ORDER_ITEMS:25]))
								
								[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
								[ORDERS:24]Sort_Number:27:=[ORDER_ITEMS:25]Sort_Order:26
								
							End if 
							OrderI_SubVAT
							OrderI_SubLPPC2
							
							//******************* added 30/01/07 -kmw *******************
							//NG-April 2007
							//Modification here-only append these if the view is of order items
							
							//******************************************************
							
							
							
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
							NEXT RECORD:C51([PRODUCTS:9])
							
						End while 
						If (DB_t_CurrentFormUsage="Job@")
							DB_SaveRecord(->[JOBS:26])
							AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
						Else 
							DB_SaveRecord(->[ORDERS:24])
							AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
						End if 
						DB_bo_RecordModified:=True:C214
					End if 
				End if 
				Close_ProWin
				vP:=0
			Else 
				Gen_None("Products"; ->vP)
			End if 
		End if 
	End while 
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	Case of 
		: (DB_t_CurrentFormUsage="Purch")
		: (DB_t_CurrentFormUsage="Job")
			
			USE NAMED SELECTION:C332("Jobs")
			CLEAR NAMED SELECTION:C333("Jobs")
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1)
			ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
			Jobs_InLPTot
		: (DB_t_CurrentFormUsage="JobStage")
			
			USE NAMED SELECTION:C332("Jobs")
			CLEAR NAMED SELECTION:C333("Jobs")
			JobStages_InOI2
			JobStages_InT3
		Else 
			//TRACE
			//COPY NAMED SELECTION([ORDERS];"$TempOrders")
			
			USE NAMED SELECTION:C332("Orders")
			CLEAR NAMED SELECTION:C333("Orders")
			
			COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
			
			Orders_InLPOI
			$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
			$_bo_Reselect:=False:C215
			If ($_l_OrderItemsRow>0)
				$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
				If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82($_ptr_ListBoxSetup->)))
					$_ptr_NamedSetValue:=$_ptr_ListBoxSetup->{20}
					$_t_NamedSet:=$_ptr_NamedSetValue->
					If (Records in set:C195($_t_NamedSet)>0)
						USE SET:C118($_t_NamedSet)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
						$_bo_Reselect:=True:C214
					End if 
					
				Else 
					$_bo_Reselect:=False:C215
				End if 
				
				Orders_InLPß("S1")
				Orders_InLPTot
				USE NAMED SELECTION:C332("$Temp")
				If ($_bo_Reselect)
					HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
				End if 
			End if 
	End case 
	vAdd:=$_l_AddMode
	DB_bo_RecordModified:=True:C214
	vNo:=$no
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders_GP"; $_t_oldMethodName)
