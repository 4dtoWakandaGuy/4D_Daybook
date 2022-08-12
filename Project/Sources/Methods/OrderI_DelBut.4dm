//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_DelBut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 20:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY INTEGER:C220($_ai_SortOrder; 0)
	C_BOOLEAN:C305(vUnallocatedFromJob)
	C_LONGINT:C283($_l_OK; vALLevels)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_DelBut")
OK:=0
MESSAGES OFF:C175

ARRAY INTEGER:C220($_ai_SortOrder; 0)
If ((vALLevels>0) & (DB_t_CurrentFormUsage#"Job@"))
	COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Or")
	COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Sel")
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Locked:16=True:C214)
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		Gen_Alert("Invoiced Items cannot be deleted"; "Cancel")
		OK:=0
	Else 
		USE NAMED SELECTION:C332("$Sel")
		//see also OrderI_OutDel2
		QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Allocated:28>0)
		
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			Gen_Alert("Allocated items cannot be deleted!"; "Cancel")
			OK:=0
		Else 
			USE NAMED SELECTION:C332("$Sel")
			//Are You Sure
			If ([ORDER_ITEMS:25]Product_Name:13#"")
				Gen_Confirm("Are you sure you want to delete order line for "+[ORDER_ITEMS:25]Product_Name:13; "No"; "Yes")
			Else 
				Gen_Confirm("Are you sure you want to delete this order line"; "No"; "Yes")
			End if 
			If (OK=0)
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
											$_l_OK:=DB_DeletionControl(->[ORDER_ITEMS:25])
											If ($_l_OK=1)
												DELETE RECORD:C58([ORDER_ITEMS:25])
											End if 
										End if 
									End if 
									
							End case 
							//end of new section
						End if 
						
					End if 
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End while 
				SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Sort_Order:26; $_ai_SortOrder)
				DELETE SELECTION:C66([ORDER_ITEMS:25])
			End if 
			
			OK:=1
		End if 
	End if 
	CLEAR NAMED SELECTION:C333("$Sel")
	USE NAMED SELECTION:C332("$Or")
	
	
Else 
	If ([ORDER_ITEMS:25]Item_Locked:16)
		Gen_Alert("You cannot delete this item"; "Cancel")
		OK:=0  //added 26/03/07 -kmw
	Else 
		OK:=1
		If ([ORDER_ITEMS:25]Product_Code:2#"")
			Are_You_Sure
		End if 
		If (OK=1)
			
			Case of   //added checks to see if order item part of an order and disallow deletion if so - kmw, 27/03/07
				: ([ORDER_ITEMS:25]Order_Code:1#"") & (DB_t_CurrentFormUsage="Job")
					Gen_Confirm("This Item cannot be deleted as it's part of an Order.  Unallocate"+" it from this Job instead?"; "Yes"; "No")
					If (OK=1)
						[ORDER_ITEMS:25]Job_Code:34:=""
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					End if 
					
				: ([ORDER_ITEMS:25]Order_Code:1#"") & (DB_t_CurrentFormUsage="JobStage")
					Gen_Confirm("This Item cannot be deleted as it's part of an Order.  Unallocate"+" it from this Job Stage instead?"; "Yes"; "No")
					If (OK=1)
						[ORDER_ITEMS:25]Job_Code:34:=""
						[ORDER_ITEMS:25]Job_Stage:35:=""
						[ORDER_ITEMS:25]Job_Stage_Code:60:=""
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					End if 
					
				Else 
					If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>0)
						If ([ORDER_ITEMS:25]Item_Number:27>0)
							QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
							DELETE SELECTION:C66([SUBSCRIPTIONS:93])
						End if 
					End if 
					DELETE RECORD:C58([ORDER_ITEMS:25])
			End case 
			
			Case of 
				: (DB_t_CurrentFormUsage="SC")
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
					[SERVICE_CALLS:20]Value:12:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
				: (DB_t_CurrentFormUsage="Job")
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35="")
					ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
					LAST RECORD:C200([ORDER_ITEMS:25])
					[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
				: (DB_t_CurrentFormUsage="JobStage")
					If (DB_t_CurrentFormUsage3="JobB")
						JobStages_InLOI("B")
					Else 
						JobStages_InLOI("A")
					End if 
					LAST RECORD:C200([ORDER_ITEMS:25])
					[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
				Else 
					Orders_InLPOI
					LAST RECORD:C200([ORDER_ITEMS:25])
					[ORDERS:24]Sort_Number:27:=[ORDER_ITEMS:25]Sort_Order:26
			End case 
			OK:=1
			
		End if 
	End if 
End if 
vTot:=1
MESSAGES ON:C181
ERR_MethodTrackerReturn("OrderI_DelBut"; $_t_oldMethodName)
