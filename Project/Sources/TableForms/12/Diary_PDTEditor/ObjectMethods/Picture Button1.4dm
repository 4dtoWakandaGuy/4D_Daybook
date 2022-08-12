If (False:C215)
	//object Name: [DIARY]Diary_PDTEditor.Picture Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_FeaturesList;0)
	ARRAY LONGINT:C221($_al_GotTables; 0)
	ARRAY LONGINT:C221($_al_MorderItems; 0)
	ARRAY LONGINT:C221($_al_OneTableRecordIDs; 0)
	ARRAY LONGINT:C221($_al_RecordIDs; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY LONGINT:C221($_al_TablesLoaded; 0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedTableNum;0)
	ARRAY TEXT:C222($_at_OneTableRecordCodes; 0)
	ARRAY TEXT:C222($_at_RecordCodes; 0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Index; $_l_Index2; $_l_Row; $_l_TableNumber; $_l_TableRow; $_l_ThisTable)
	C_TEXT:C284($_t_FeatureCode; $_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_PDTEditor.Picture Button1"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(SD2_lb_FeaturesList; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			//Before we delete we must save
			For ($_l_Index2; 1; Size of array:C274(SD2_al_RelatedRecordID))
				If ($_l_Index2#$_l_Row)  //dont save the line we are deleting
					If (SD2_al_RelatedRecordID{$_l_Index2}<0)  //new link needs to be created
						QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=SD2_al_RelatedTableNum{$_l_Index2}; *)
						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
						QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=Abs:C99(SD2_al_RelatedRecordID{$_l_Index2}))
						If (Records in selection:C76([xDiaryRelations:137])=0)
							CREATE RECORD:C68([xDiaryRelations:137])
							[xDiaryRelations:137]xTableNUM:3:=SD2_al_RelatedTableNum{$_l_Index2}
							[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
							[xDiaryRelations:137]xRecordID:4:=Abs:C99(SD2_al_RelatedRecordID{$_l_Index2})
							[xDiaryRelations:137]XRecord_Code:5:=SD2_at_RelatedRecordCode{$_l_Index2}
							DB_SaveRecord(->[xDiaryRelations:137])
						End if 
					End if 
					
				End if 
			End for 
			If (SD2_al_RelatedRecordID{$_l_Row}>0)
				//dont bother deleting if it does not exist
				READ WRITE:C146([xDiaryRelations:137])
				
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=SD2_al_RelatedTableNum{$_l_Row}; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=Abs:C99(SD2_al_RelatedRecordID{$_l_Row}))
				If (Records in selection:C76([xDiaryRelations:137])>0)
					LOAD RECORD:C52([xDiaryRelations:137])
					If (Locked:C147([xDiaryRelations:137]))
						
						ALERT:C41("record Locked")
					Else 
						ARRAY LONGINT:C221($_al_MorderItems; 0)
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$TEMP")
						FIRST RECORD:C50([ORDER_ITEMS:25])
						For ($_l_Index2; 1; Records in selection:C76([ORDER_ITEMS:25]))
							$_t_FeatureCode:=FurthFld_Get("ORDER ITEMS"; "Feature Code")
							If ($_t_FeatureCode=SD2_at_RelatedRecordCode{$_l_Row})
								APPEND TO ARRAY:C911($_al_MorderItems; [ORDER_ITEMS:25]Item_Number:27)
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
						If (Size of array:C274($_al_MorderItems)>0)
							Gen_Confirm("There are orders related to these features. You cannot delete the feature till the bookings are attached to another feature date"; "Report"; "Cancel")
							If (OK=1)
								QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_MorderItems)
								$_ti_DocumentRef:=Create document:C266(""; "TEXT")
								If ($_ti_DocumentRef#?00:00:00?)
									For ($_l_Index2; 1; Records in selection:C76([ORDER_ITEMS:25]))
										If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
											QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
										End if 
										If ([COMPANIES:2]Company_Code:1#[ORDERS:24]Company_Code:1)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[ORDERS:24]Company_Code:1)
										End if 
										SEND PACKET:C103($_ti_DocumentRef; [ORDER_ITEMS:25]Order_Code:1+Char:C90(9)+[ORDERS:24]Company_Code:1+Char:C90(9)+[COMPANIES:2]Company_Code:1+Char:C90(9)+[ORDER_ITEMS:25]Product_Code:2+Char:C90(9)+[ORDER_ITEMS:25]Product_Name:13+Char:C90(9)+[ORDER_ITEMS:25]Description:44+Char:C90(13))
										NEXT RECORD:C51([ORDER_ITEMS:25])
									End for 
									CLOSE DOCUMENT:C267($_ti_DocumentRef)
								End if 
								
							End if 
						Else 
							DELETE RECORD:C58([xDiaryRelations:137])
						End if 
					End if 
				End if 
			End if 
			If ([DIARY:12]x_ID:50>0)
				
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50)
			Else 
				REDUCE SELECTION:C351([xDiaryRelations:137]; 0)
			End if 
			QUERY SELECTION:C341([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3#Table:C252(->[ORDER_ITEMS:25]))
			If (Records in selection:C76([xDiaryRelations:137])>0)
				CREATE SET:C116([xDiaryRelations:137]; "OTHERS")
			Else 
				CREATE EMPTY SET:C140([xDiaryRelations:137]; "OTHERS")
			End if 
			ARRAY LONGINT:C221(SD2_al_RelatedTableNum; 0)
			ARRAY LONGINT:C221(SD2_al_RelatedRecordID; 0)
			ARRAY TEXT:C222(SD2_at_RelatedRecordCode; 0)
			ARRAY TEXT:C222(SD2_at_RelatedRecordName; 0)
			
			SELECTION TO ARRAY:C260([xDiaryRelations:137]xTableNUM:3; $_al_TableNumbers; [xDiaryRelations:137]XRecord_Code:5; $_at_RecordCodes; [xDiaryRelations:137]xRecordID:4; $_al_RecordIDs)
			ARRAY LONGINT:C221($_al_GotTables; 0)
			$_l_ThisTable:=0
			ARRAY LONGINT:C221($_al_OneTableRecordIDs; 0)
			ARRAY TEXT:C222($_at_OneTableRecordCodes; 0)
			ARRAY LONGINT:C221($_al_TablesLoaded; 0)
			
			For ($_l_Index; 1; Size of array:C274($_al_TableNumbers))
				$_l_ThisTable:=0
				If (Find in array:C230($_al_TablesLoaded; $_al_TableNumbers{$_l_Index})<0)
					ARRAY LONGINT:C221($_al_OneTableRecordIDs; 0)
					ARRAY TEXT:C222($_at_OneTableRecordCodes; 0)
					APPEND TO ARRAY:C911($_al_TablesLoaded; $_al_TableNumbers{$_l_Index})
					For ($_l_Index2; 1; Size of array:C274($_al_TableNumbers))
						$_l_TableNumber:=$_al_TableNumbers{$_l_Index2}
						$_l_TableRow:=Find in array:C230($_al_GotTables; $_l_TableNumber)
						If ($_l_TableRow<0)
							APPEND TO ARRAY:C911($_al_GotTables; $_l_TableNumber)
						End if 
						If ($_l_ThisTable=0)
							$_l_ThisTable:=$_l_TableNumber
						End if 
						If ($_l_TableNumber=$_l_ThisTable)
							APPEND TO ARRAY:C911($_al_OneTableRecordIDs; $_al_RecordIDs{$_l_Index2})
							APPEND TO ARRAY:C911($_at_OneTableRecordCodes; $_at_RecordCodes{$_l_Index2})
						End if 
						
					End for 
					Case of   //At the moment these are only going to be products
						: ($_l_TableNumber=9)
							QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_OneTableRecordCodes)
							CREATE SET:C116([PRODUCTS:9]; "Todisplay")
							For ($_l_Index2; 1; Size of array:C274($_at_OneTableRecordCodes))
								USE SET:C118("ToDisplay")
								QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_at_OneTableRecordCodes{$_l_Index2})
								APPEND TO ARRAY:C911(SD2_al_RelatedTableNum; Table:C252(->[PRODUCTS:9]))
								APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; [PRODUCTS:9]X_ID:43)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; [PRODUCTS:9]Product_Code:1)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; [PRODUCTS:9]Product_Name:2)
							End for 
							
					End case 
				End if 
			End for 
			LB_SetEnterable(->SD2_lb_FeaturesList; False:C215; 0; "")
			
		Else 
			Gen_Alert("You must select a record before you can delete the link")
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_PDTEditor.Picture Button1"; $_t_oldMethodName)
