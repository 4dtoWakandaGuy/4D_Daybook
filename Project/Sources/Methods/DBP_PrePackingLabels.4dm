//%attributes = {}
If (False:C215)
	//Project Method Name:      DBP_PrePackingLabels
	//------------------ Method Notes ------------------
	//Fri, Mar 20, 2009 balinderwalia: PrePrintPackingLabels
	//Macro PrePrintPackingLabels
	//We have the order items in selection
	//Gen_Alert ("about to print packing labels - 4 per page")
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2012 15:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DBP_al_BookIDS;0)
	//ARRAY LONGINT(DBP_al_TotalPagesNumbers;0)
	//ARRAY TEXT(DBP_at_2DPageItems;0)
	C_BOOLEAN:C305(PRT_bo_PrintReportOK)
	C_LONGINT:C283(DBP_l_ActualLabelCounter; DBP_l_BarCodeChartArea; DBP_l_Capacity; DBP_l_Count; DBP_l_CurrentBook; DBP_l_CurrentLabel; DBP_l_CurrentPageNumber; DBP_l_CurrentTotalPages; DBP_l_Quantity; DBP_l_QuantityLastBox; DBP_l_QuantityPerBoxLong)
	C_LONGINT:C283(DBP_l_ResizeImageByNum; DBP_l_TotalBooks; DBP_l_TotalFieldSizeArrayK; DBP_l_TotalLabelPerPageK; DBP_l_TotalLabels; nSize)
	C_PICTURE:C286(DBP_pic_BarCodePic1; DBP_pic_BarCodePic2; DBP_pic_BarCodePic3; DBP_pic_BarCodePic4)
	C_POINTER:C301(DBP_ptr_BarCode; DBP_ptr_Variable)
	C_REAL:C285(DBP_r_BookWeight; DBP_r_TotalBookWeight)
	C_TEXT:C284($_t_oldMethodName; $1; DBP_t_BarCodeType; DBP_t_BookDescription; DBP_t_BookTitle; DBP_t_CustName; DBP_t_CustProductCode; DBP_t_ISBNNumber; DBP_t_ISBNNumber13Digits; DBP_t_OurOrdNumber; DBP_t_PCode)
	C_TEXT:C284(DBP_t_YourOrdNumber; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBP_PrePackingLabels")

DBP_t_PCode:=""
If (Count parameters:C259>0)
	DBP_t_PCode:=$1
End if 

Case of 
	: (PRT_bo_PrintReportOK=False:C215)
	: (DBP_t_PCode="header-init-titles")
		DBP_l_CurrentLabel:=0
		//blank all variables to start with
		For (DBP_l_CurrentLabel; 1; DBP_l_TotalLabelPerPageK)
			For (DBP_l_Count; 1; DBP_l_TotalFieldSizeArrayK)
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle"+String:C10(DBP_l_Count))
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					DBP_ptr_Variable->:=""
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue"+String:C10(DBP_l_Count))
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					DBP_ptr_Variable->:=""
				End if 
			End for 
		End for 
		
	: (DBP_t_PCode="header")
		
		//Fri, Mar 20, 2009 balinderwalia: called from Header
		//make sure you set the iteration array size same as pages
		//PrePrintPackingLabels_Header
		
		DBP_l_CurrentPageNumber:=DBP_l_CurrentPageNumber+1
		
		DBP_l_CurrentLabel:=0
		
		For (DBP_l_CurrentLabel; 1; DBP_l_TotalLabelPerPageK)
			
			If (Size of array:C274(DBP_at_2DPageItems)>=DBP_l_CurrentPageNumber)
				//barcode picture pointer
				DBP_ptr_BarCode:=Get pointer:C304("DBP_pic_BarCodePic"+String:C10(DBP_l_CurrentLabel))
				If (Not:C34(Is nil pointer:C315(DBP_ptr_BarCode)))
					DBP_ptr_BarCode->:=DBP_ptr_BarCode->*0  //we want a blank pictuer by default
				Else 
				End if 
				//find the right offset where values of first label start based on page number and current label number
				DBP_l_Count:=(DBP_l_TotalFieldSizeArrayK*Num:C11(DBP_l_CurrentLabel>1)*(DBP_l_CurrentLabel-1))+1  //default to first element + total fields in a set
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue3")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=DBP_l_Count)
						DBP_ptr_Variable->:=DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count}  //1 Page number
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle3")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle3"
							End if 
						End if 
					End if 
				Else 
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue4")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+1))
						DBP_ptr_Variable->:=DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+1}  //2 Label number
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle4")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle4"
							End if 
						End if 
					End if 
					
				Else 
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue1")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+2))
						DBP_t_ISBNNumber13Digits:=DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+2}  //3 ISBN number
						DBP_ptr_Variable->:=DBP_t_ISBNNumber13Digits
						
						DBP_t_BarCodeType:="EAN13"  //add bar code as picture array for each page
						DBP_ptr_BarCode:=Get pointer:C304("DBP_pic_BarCodePic"+String:C10(DBP_l_CurrentLabel))
						If (Not:C34(Is nil pointer:C315(DBP_ptr_BarCode)))
							//DBP_l_BarCodeChartArea:=DB_CreateSVGgraph
							DBP_ptr_BarCode->:=DBP_ptr_BarCode->*0  //we want a blank pictuer by default
							//DBP_ptr_BarCode->:=Barcode_Create (DBP_t_BarCodeType;DBP_t_ISBNNumber13Digits;True;True;True;DBP_l_BarCodeChartArea)
							//DB_CreateSVGgraph (DBP_l_BarCodeChartArea)  //Tue, Mar 17, 2009 balinderwalia: added
							//DBP_ptr_BarCode->:=DBP_ptr_BarCode->*2  `make it bit bigger as per label size
							If (DBP_l_ResizeImageByNum>0)
								DBP_ptr_BarCode->:=DBP_ptr_BarCode->*DBP_l_ResizeImageByNum  //make it bit bigger as per label size
							End if 
							
						Else 
						End if 
						
						
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle1")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle1"
							End if 
						End if 
						
					Else 
						
					End if 
				Else 
					
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue2")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+3))
						DBP_ptr_Variable->:=DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+3}  //4 Custname
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle2")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle2"
							End if 
						End if 
					End if 
				Else 
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue5")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+4))
						DBP_ptr_Variable->:=DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+4}
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle5")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle5"
							End if 
						End if 
					End if 
				Else 
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue6")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+5))
						DBP_ptr_Variable->:=DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+5}
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle6")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle6"
							End if 
						End if 
					End if 
				Else 
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue7")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+6))
						DBP_ptr_Variable->:=DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+6}
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle7")
						If (DBP_ptr_Variable->="")
							DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle7"
						End if 
					End if 
				Else 
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue8")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+7))
						DBP_l_QuantityPerBoxLong:=Num:C11(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+7})
						DBP_ptr_Variable->:=String:C10(DBP_l_QuantityPerBoxLong)
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle8")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle8"
							End if 
						End if 
					End if 
				Else 
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue9")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+8))
						DBP_r_BookWeight:=Num:C11(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+8})
						
						DBP_r_TotalBookWeight:=DBP_r_BookWeight*DBP_l_QuantityPerBoxLong  //total weight of a box
						DBP_r_TotalBookWeight:=Round:C94(DBP_r_TotalBookWeight; 2)  //display weight so humans can read it and understand easily
						
						DBP_ptr_Variable->:=String:C10(DBP_r_TotalBookWeight/1000)+" Kg(s)."
						
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle9")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle9"
							End if 
						End if 
					End if 
				Else 
				End if 
				
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue10")
				
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (Size of array:C274(DBP_at_2DPageItems{DBP_l_CurrentPageNumber})>=(DBP_l_Count+9))
						DBP_ptr_Variable->:=DBP_at_2DPageItems{DBP_l_CurrentPageNumber}{DBP_l_Count+9}  //10 your order ref
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle10")
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							If (DBP_ptr_Variable->="")
								DBP_ptr_Variable->:="Label"+String:C10(DBP_l_CurrentLabel)+"FieldTitle10"
							End if 
						End if 
					End if 
				Else 
				End if 
				
			Else 
			End if 
			
		End for 
		
		//if field value is blank it should blank field title too
		For (DBP_l_CurrentLabel; 1; DBP_l_TotalLabelPerPageK)
			For (DBP_l_Count; 1; DBP_l_TotalFieldSizeArrayK)
				DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldValue"+String:C10(DBP_l_Count))
				If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
					If (DBP_ptr_Variable->="")  //value is blank - blank the field too
						DBP_ptr_Variable:=Get pointer:C304("mLabel"+String:C10(DBP_l_CurrentLabel)+"FieldTitle"+String:C10(DBP_l_Count))
						If (Not:C34(Is nil pointer:C315(DBP_ptr_Variable)))
							DBP_ptr_Variable->:=""
						End if 
					End if 
				End if 
			End for 
		End for 
		
		
	Else 
		Orders_PPFormL2
		Orders_FormSR("")
		
		//Added kmw 18/03/08
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		
		//declare 2D array which contains data per page number / label boxes
		ARRAY LONGINT:C221(DBP_al_TotalPagesNumbers; 0)  //dummy array for superreport iterations, var doesn't work for some reason
		ARRAY LONGINT:C221(DBP_al_BookIDS; 0)
		ARRAY TEXT:C222(DBP_at_2DPageItems; 0; 0)
		
		DBP_l_CurrentPageNumber:=0  //current page number
		DBP_l_CurrentTotalPages:=0  //total number of pages
		DBP_l_CurrentBook:=0
		DBP_l_TotalBooks:=0
		DBP_l_CurrentLabel:=0
		DBP_l_Count:=0
		
		vTitle:="Packing Labels"
		DBP_l_TotalLabelPerPageK:=4  //print 4 labels per page in this case
		DBP_l_TotalFieldSizeArrayK:=10
		DBP_t_ISBNNumber:=""
		DBP_t_ISBNNumber13Digits:=""
		DBP_t_OurOrdNumber:=[ORDERS:24]Order_Code:3  //Added setting value3 - v631b120h_7 & v631b120p -KMW 14/08/09
		DBP_t_YourOrdNumber:=[ORDERS:24]Your_Order_Number:10  //Tue, Apr 14, 2009 balinderwalia: added
		
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
		QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Product_Code:2="@ISBN@")
		
		If (Records in selection:C76([ORDER_ITEMS:25])<1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Product_Code:2="@CAT@")
		End if 
		
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$TotalBooks")
		//we have one element in 2D array per book in the order
		
		If (Records in selection:C76([ORDER_ITEMS:25])>0)  //I have the book records in my selection
			
			USE NAMED SELECTION:C332("$TotalBooks")
			FIRST RECORD:C50([ORDER_ITEMS:25])
			
			DBP_l_TotalBooks:=Records in selection:C76([ORDER_ITEMS:25])
			ARRAY LONGINT:C221(DBP_al_BookIDS; DBP_l_TotalBooks)
			
			For (DBP_l_CurrentBook; 1; DBP_l_TotalBooks)
				DBP_al_BookIDS{DBP_l_CurrentBook}:=[ORDER_ITEMS:25]x_ID:58
				//find the related information to this book like ISBN number, title etc.
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2)
				//
				DBP_t_ISBNNumber:=[PRODUCTS:9]Model_Code:5
				DBP_t_ISBNNumber13Digits:=Replace string:C233(DBP_t_ISBNNumber; "ISBN"; "")
				
				If (Length:C16(DBP_t_ISBNNumber13Digits)#13)  //
					PRT_bo_PrintReportOK:=False:C215
					Gen_Alert("Unable to generate bar code for this ISBN ["+DBP_t_ISBNNumber13Digits+"]. Please update ISBN number and try again!")
				Else 
					DBP_t_CustName:=[COMPANIES:2]Company_Name:2
					DBP_t_CustProductCode:=[PRODUCTS:9]Commodity_Code:38
					If (DBP_t_CustProductCode="")
						DBP_t_CustProductCode:=""  //"Cust product ref." Testing debugging only
					End if 
					DBP_t_BookTitle:=[PRODUCTS:9]Product_Name:2
					DBP_t_BookTitle:=Replace string:C233(DBP_t_BookTitle; (" - "+DBP_t_ISBNNumber); "")
					DBP_t_BookDescription:=[PRODUCTS:9]Description:6
					//find quantity of these books which can fit in a carton
					DBP_l_QuantityPerBoxLong:=Num:C11(FurthFld_Get("Products"; "QuantityPerBox"))
					If (DBP_l_QuantityPerBoxLong=0)
						DBP_l_QuantityPerBoxLong:=Num:C11(Request:C163("Please enter quantity per box ["+DBP_t_ISBNNumber+"]:"))
						If (DBP_l_QuantityPerBoxLong>0)
							FurthFld_Set("Products"; "QuantityPerBox"; String:C10(DBP_l_QuantityPerBoxLong))
						End if 
					End if 
					
					If (DBP_l_QuantityPerBoxLong=0)
						PRT_bo_PrintReportOK:=False:C215
						Gen_Alert("Quantity per carton is not available for this book ["+DBP_t_ISBNNumber+"]. Please provide quantity per carton and try again!")
					Else 
						//weight of per book
						DBP_r_BookWeight:=Num:C11(FurthFld_Get("Products"; "BookWeightInGrams"))
						If (DBP_r_BookWeight=0)
							DBP_r_BookWeight:=Num:C11(Request:C163("Please book weight in grams: ["+DBP_t_ISBNNumber+"]"))
							If (DBP_r_BookWeight>0)
								FurthFld_Set("Products"; "BookWeightInGrams"; String:C10(DBP_r_BookWeight))
							Else 
								PRT_bo_PrintReportOK:=False:C215
							End if 
						End if 
						
						DBP_r_TotalBookWeight:=DBP_r_BookWeight*DBP_l_QuantityPerBoxLong  //total weight of a box
						DBP_r_TotalBookWeight:=Round:C94(DBP_r_TotalBookWeight; 2)  //display weight so humans can read it and understand easily
						DBP_l_Quantity:=[ORDER_ITEMS:25]Quantity:3
						
						If (DBP_l_Quantity<DBP_l_QuantityPerBoxLong)  //all books can fit in one carton and some space left
							DBP_l_TotalLabels:=1  //DBP_l_TotalLabelPerPageK is 4 but here it means 1 and 3 blanks actually
						Else 
							DBP_l_TotalLabels:=DBP_l_Quantity/DBP_l_QuantityPerBoxLong  //same as total cartons
						End if 
						
						If ((DBP_l_QuantityPerBoxLong*DBP_l_TotalLabels)<DBP_l_Quantity)
							DBP_l_TotalLabels:=DBP_l_TotalLabels+1
						End if 
						
						If (DBP_l_TotalLabels<DBP_l_TotalLabelPerPageK)  //ah total labels is less than min. per page. so we have to print one label on page with 4 label frames
							
						End if 
						
						DBP_l_CurrentTotalPages:=DBP_l_TotalLabels\DBP_l_TotalLabelPerPageK  //we can have 4 labels per page a4 size
						If (Mod:C98(DBP_l_TotalLabels; DBP_l_TotalLabelPerPageK)=0)  //all labels fits perfectly 4 labels per page
						Else 
							DBP_l_CurrentTotalPages:=DBP_l_CurrentTotalPages+1  //we will have less than 4 labels left on the last page so add extra page for remaining labels
						End if 
						
						ARRAY LONGINT:C221(DBP_al_TotalPagesNumbers; DBP_l_CurrentTotalPages)
						DBP_l_ActualLabelCounter:=1
						//calculate last box quantity
						DBP_l_Capacity:=DBP_l_TotalLabels*DBP_l_QuantityPerBoxLong
						DBP_l_QuantityLastBox:=(DBP_l_QuantityPerBoxLong-(DBP_l_Capacity-DBP_l_Quantity))
						
						For (DBP_l_CurrentPageNumber; 1; DBP_l_CurrentTotalPages)  //add book information needed for printing the bar codes / packing labels
							If (DBP_l_ActualLabelCounter<=DBP_l_TotalLabels)
								nSize:=Size of array:C274(DBP_at_2DPageItems)
								INSERT IN ARRAY:C227(DBP_at_2DPageItems; nSize+1; 1)
								
								For (DBP_l_CurrentLabel; 1; DBP_l_TotalLabelPerPageK)  //add data for each label for number of labels per page
									If (DBP_l_ActualLabelCounter<=DBP_l_TotalLabels)
										DBP_al_TotalPagesNumbers{DBP_l_CurrentPageNumber}:=DBP_l_CurrentPageNumber
										//APPEND TO ARRAY(DBP_at_2DPageItems{DBP_l_CurrentPageNumber};String(DBP_l_CurrentPageNumber))  `current page number
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; DBP_t_OurOrdNumber)  //order number
										//APPEND TO ARRAY(DBP_at_2DPageItems{DBP_l_CurrentPageNumber};String(DBP_l_ActualLabelCounter))  `current label number
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; ((String:C10(DBP_l_ActualLabelCounter)+" of "+String:C10(DBP_l_TotalLabels))))  //kmw v631b120h_7 & v631b120p Added "of x" information
										
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; DBP_t_ISBNNumber13Digits)  //first item in 2D array within book record is ISBN number
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; DBP_t_CustName)  //second item in 2D array within book record is Customer Name
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; DBP_t_CustProductCode)  //5th cust product ref
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; DBP_t_BookTitle)  //book title 6th
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; DBP_t_BookDescription)  //desc 7th
										If (DBP_l_ActualLabelCounter=DBP_l_TotalLabels)  //we are at the last label
											APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; String:C10(DBP_l_QuantityLastBox))  //quantity per box
										Else 
											APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; String:C10(DBP_l_QuantityPerBoxLong))  //quantity per box
										End if 
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; String:C10(DBP_r_BookWeight))  //weight of each book
										APPEND TO ARRAY:C911(DBP_at_2DPageItems{DBP_l_CurrentPageNumber}; DBP_t_YourOrdNumber)  //your order number
										DBP_l_ActualLabelCounter:=DBP_l_ActualLabelCounter+1
									End if 
								End for 
								
							End if 
						End for 
						
						
						
					End if 
					
				End if 
				NEXT RECORD:C51([ORDER_ITEMS:25])
				
			End for 
			
		Else   //book record not found
			
		End if 
		//reuse same variable in superreport for iterations
		DBP_l_CurrentPageNumber:=0
		DBP_l_CurrentLabel:=0
		
		//PRT_bo_PrintReportOK:=False
		
End case 
ERR_MethodTrackerReturn("DBP_PrePackingLabels"; $_t_oldMethodName)