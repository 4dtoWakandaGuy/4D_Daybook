//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllCSUp2
	//------------------ Method Notes ------------------
	//NG NOTE The semaphore is set in the calling method because this method assumes the Current stock record is loaded already
	
	//------------------ Revision Control ----------------
	//Date Created: 04/04/2010 11:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AllocationPost)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllCSUp2")
//OrderI_AllCSUp2 - the middle of the proc without the 2
//Check_LockMess (->[CURRENT STOCK];"Current Stock")
If (OK=1)
	If ([CURRENT_STOCK:62]Product_Code:1#"")
		If (Not:C34(STK_IsProductAnalysed([CURRENT_STOCK:62]Product_Code:1)))
			OrderI_AllSTChk([CURRENT_STOCK:62]Stock_Type:3)  //4.0.036b
			If (OK=1)
				//Post out of old level
				$_l_AllocationPost:=New process:C317("STK_MovePostLevelinProcess"; 256000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; -1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
				
				If (OK=1)
					//If it can simply be allocated the Item Number
					If ((([CURRENT_STOCK:62]Serial_Number:2#"") & ([CURRENT_STOCK:62]Quantity:4=1)) | ([CURRENT_STOCK:62]Quantity:4=[STOCK_MOVEMENT_ITEMS:27]Quantity:12))
						[CURRENT_STOCK:62]Item_Number:5:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
						If ([CURRENT_STOCK:62]X_ID:13=0)
							[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
						End if 
						DB_SaveRecord(->[CURRENT_STOCK:62])
						AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
						If (OK=1)
							//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)
							//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1;[CURRENT STOCK]Product Code;[CURRENT STOCK]Analysis Code;[CURRENT STOCK]Currency Code;[CURRENT STOCK]Layer Code;[CURRENT STOCK]Item Number;[CURRENT STOCK]Quantity;[CURRENT STOCK]Total Cost)
							$_l_AllocationPost:=New process:C317("STK_MovePostLevelinProcess"; 256000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
							
						End if 
					Else 
						[CURRENT_STOCK:62]Quantity:4:=Gen_Round(([CURRENT_STOCK:62]Quantity:4-Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 6)  //Abs-ified 4.0.035/6
						[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
						If ([CURRENT_STOCK:62]X_ID:13=0)
							[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
						End if 
						DB_SaveRecord(->[CURRENT_STOCK:62])
						AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
						If (OK=1)
							//Move_PostLev (»[CURRENT STOCK]Stock Type;1)`what was this doing here?? 4.0.035/6
							COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$SC")
							DUPLICATE RECORD:C225([CURRENT_STOCK:62])
							[CURRENT_STOCK:62]X_ID:13:=0
							
							[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
							[CURRENT_STOCK:62]Quantity:4:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
							[CURRENT_STOCK:62]Total_Cost:9:=Gen_Round(([CURRENT_STOCK:62]Quantity:4*[CURRENT_STOCK:62]Cost_Price:6); 2; 2)
							[CURRENT_STOCK:62]Item_Number:5:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
							
							
							[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
							
						End if 
						DB_SaveRecord(->[CURRENT_STOCK:62])
						AA_CheckFileUnlocked(->[CURRENT_STOCK:62]X_ID:13)
						If (OK=1)
							//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1;[CURRENT STOCK]Product Code;[CURRENT STOCK]Analysis Code;[CURRENT STOCK]Currency Code;[CURRENT STOCK]Layer Code;[CURRENT STOCK]Item Number;[CURRENT STOCK]Quantity;[CURRENT STOCK]Total Cost)
							$_l_AllocationPost:=New process:C317("STK_MovePostLevelinProcess"; 256000; "Update Allocation "+[CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Stock_Type:3; 1; [CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
							
							//Move_PostLevCur (->[CURRENT STOCK]Stock Type;1)
						End if 
						USE NAMED SELECTION:C332("$SC")
						CLEAR NAMED SELECTION:C333("$SC")
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_AllCSUp2"; $_t_oldMethodName)
