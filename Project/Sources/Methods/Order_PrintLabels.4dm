//%attributes = {}
If (False:C215)
	//Project Method Name:      Order_PrintLabels
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 16:23`Method: Order_PrintLabels
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($currWindowTitle)
	//C_UNKNOWN(nCurrentPageNumber)
	//C_UNKNOWN(nCurrentTotalPages)
	//C_UNKNOWN(SR_Print)
	//ARRAY INTEGER(LAB_ai_IncludeLine;0)
	ARRAY LONGINT:C221($_al_ItemToPrint; 0)
	//ARRAY LONGINT(LAB_al_OrderCode;0)
	//ARRAY LONGINT(ORD_al_ItemsInt;0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(PRT_al_PrintOptions;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	ARRAY REAL:C219($_ar_QuantityToPrint; 0)
	//ARRAY REAL(LAB_ar_QuantityRemaining;0)
	//ARRAY REAL(LAB_ar_QuantityToInclude;0)
	ARRAY TEXT:C222($_at_Printers; 0)
	//ARRAY TEXT(LAB_at_ProductName;0)
	//ARRAY TEXT(PRT_at_PrintOptions;0)
	C_BOOLEAN:C305($_bo_DymoisInstalled; $_bo_DymoPrint; $_bo_PrintSettingsDisplayed; $_bo_Reselect; $_bo_SuperReportExists; $bReSelectLines; PRT_bo_PrintReportOK; SR_bo_PageSetupFound; <>SRP262; $_bo_DymoisInstalled; $_bo_DymoPrint)
	C_BOOLEAN:C305($_bo_PrintSettingsDisplayed; $_bo_Reselect; $_bo_SuperReportExists; PRT_bo_PrintReportOK; SR_bo_PageSetupFound)
	C_DATE:C307(SRDate)
	C_LONGINT:C283($_l_CountLines; $_l_CurrentElement; $_l_CurrentWinRefOLD; $_l_DymoPosition; $_l_FillBlanks; $_l_Index; $_l_Index2; $_l_KeyPosition; $_l_LabelsPerSheet; $_l_MaxLines; $_l_NoisPrinted)
	C_LONGINT:C283($_l_OK; $_l_PageSetupOption; $_l_Repeats; $_l_SelectionPosition; $nErrorInt; $nThisLine; LAB_l_Continue; Macro_nError; mCount1; mCount2; mCount3)
	C_LONGINT:C283(mCount5; mQuantityPerBoxLong; mTotalFieldSizeArrayK; mTotalLabelPerPageK; nActualLabelCounter; nCount; nCurrentBook; nCurrentLabel; nCurrentPageNumber; nCurrentTotalPages; nTotalBooks)
	C_LONGINT:C283(SRPage; SRRecord; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_CountLines; $_l_CurrentElement; $_l_CurrentWinRefOLD; $_l_DymoPosition; $_l_FillBlanks; $_l_Index; $_l_Index2)
	C_LONGINT:C283($_l_KeyPosition; $_l_LabelsPerSheet; $_l_MaxLines; $_l_NoisPrinted; $_l_OK; $_l_PageSetupOption; $_l_Repeats; $_l_SelectionPosition; LAB_l_Continue; mCount4; nTotalLabels)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_HighlightSet; $_Ptr_KeyField; $_ptr_ListboxArea; $_ptr_ListBoxSetup; $_ptr_SRPrintArea; $_Ptr_ThisColumnArray; $_ptr_VariablePointer; mVarPtr; $_ptr_ArrayFieldPointers)
	C_POINTER:C301($_ptr_ArrayofArrayPointers; $_ptr_HighlightSet; $_Ptr_KeyField; $_ptr_ListboxArea; $_ptr_ListBoxSetup; $_ptr_SRPrintArea; $_Ptr_ThisColumnArray; $_ptr_VariablePointer)
	C_REAL:C285($_r_PrintQuantity; mBookWeightReal; mTotalBoxWeightReal; $_r_PrintQuantity)
	C_TEXT:C284($_t_ErrorMethod; $_t_HighlightSetName; $_t_LabelData1; $_t_oldMethodName; $_t_SelectionOption; $currWindowTitle; DB_t_CurrentFormUsage; Lab_t_Data1; mBookDescription; mBookTitle; mCustNameStr)
	C_TEXT:C284(mISBNNumber; mISBNNumber13Digits; mLabel1FieldTitle1; mLabel1FieldTitle10; mLabel1FieldTitle2; mLabel1FieldTitle3; mLabel1FieldTitle4; mLabel1FieldTitle5; mLabel1FieldTitle6; mLabel1FieldTitle7; mLabel1FieldTitle8)
	C_TEXT:C284(mLabel1FieldValue1; mLabel1FieldValue10; mLabel1FieldValue2; mLabel1FieldValue3; mLabel1FieldValue4; mLabel1FieldValue5; mLabel1FieldValue6; mLabel1FieldValue7; mLabel1FieldValue8; mLabel1FieldValue9; mLabel2FieldTitle1)
	C_TEXT:C284(mLabel2FieldTitle2; mLabel2FieldTitle3; mLabel2FieldTitle4; mLabel2FieldTitle5; mLabel2FieldTitle6; mLabel2FieldTitle7; mLabel2FieldTitle8; mLabel2FieldValue1; mLabel2FieldValue10; mLabel2FieldValue2; mLabel2FieldValue3)
	C_TEXT:C284(mLabel2FieldValue4; mLabel2FieldValue6; mLabel2FieldValue7; mLabel2FieldValue8; mLabel2FieldValue9; mLabel3FieldTitle1; mLabel3FieldTitle10; mLabel3FieldTitle2; mLabel3FieldTitle3; mLabel3FieldTitle4; mLabel3FieldTitle5)
	C_TEXT:C284(mLabel3FieldTitle6; mLabel3FieldTitle8; mLabel3FieldTitle9; mLabel3FieldValue1; mLabel3FieldValue10; mLabel3FieldValue2; mLabel3FieldValue3; mLabel3FieldValue4; mLabel3FieldValue5; mLabel3FieldValue6; mLabel3FieldValue7)
	C_TEXT:C284(mLabel3FieldValue8; mLabel4FieldTitle1; mLabel4FieldTitle10; mLabel4FieldTitle2; mLabel4FieldTitle3; mLabel4FieldTitle4; mLabel4FieldTitle5; mLabel4FieldTitle6; mLabel4FieldTitle7; mLabel4FieldTitle8; mLabel4FieldTitle9)
	C_TEXT:C284(mLabel4FieldValue1; mLabel4FieldValue2; mLabel4FieldValue3; mLabel4FieldValue4; mLabel4FieldValue5; mLabel4FieldValue6; mLabel4FieldValue7; mLabel4FieldValue8; mLabel4FieldValue9; mOurOrdNumber; mYourOrdNumber)
	C_TEXT:C284($_t_DocumentName; $_t_ErrorMethod; $_t_HighlightSetName; $_t_LabelData1; $_t_oldMethodName; $_t_SelectionOption; DB_t_CurrentFormUsage; Lab_t_Data1; mCustProductCodeStr; mLabel1FieldTitle9; mLabel2FieldTitle10)
	C_TEXT:C284(mLabel2FieldTitle9; mLabel2FieldValue5; mLabel3FieldTitle7; mLabel3FieldValue9; mLabel4FieldValue10)
	C_TIME:C306(SRTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order_PrintLabels")
//this method will print a label with the order details on
//one label for each item on the order
If (False:C215)
	QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]DOCUMENT_NAME:5="OrderItem.lab")
	If (Records in selection:C76([DATA_AUDITS:102])=0)
		//first time!!
		Gen_Alert("Do not forget to save your template to disk")
		FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Item_label")
		PRINT LABEL:C39([ORDERS:24]; " ")
		If (OK=1)  //the user should create the document
			CONFIRM:C162("Did you save the template to disk")
			If (OK=1)
				//suck it back inr
				READ WRITE:C146([DATA_AUDITS:102])
				CREATE RECORD:C68([DATA_AUDITS:102])
				[DATA_AUDITS:102]TABLE_NUMBER:2:=-8888888
				[DATA_AUDITS:102]START_DATE:3:=Current date:C33(*)
				[DATA_AUDITS:102]END_DATE:4:=Current date:C33(*)
				[DATA_AUDITS:102]DOCUMENT_NAME:5:="OrderItem.lab"
				DOCUMENT TO BLOB:C525(Document; [DATA_AUDITS:102]DATA:6)
				DB_SaveRecord(->[DATA_AUDITS:102])
				AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
				
			End if 
			
		End if 
	Else 
		//the blob exist so put it on the disk
		BLOB TO DOCUMENT:C526("OrderItem.lab"; [DATA_AUDITS:102]DATA:6)
		PRINT LABEL:C39([ORDER_ITEMS:25]; "OrderItem.lab")
		
	End if 
End if 

//Thu, Mar 19, 2009 balinderwalia: declare some variables used in macros allow 10 field name/pair values per label box




//box 2


//box 3

//box 4


nCurrentPageNumber:=0  //current page number
nCurrentTotalPages:=0  //total number of pages

ARRAY LONGINT:C221(ORD_al_ItemsInt; 0)

$_l_SelectionPosition:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
If ($_l_SelectionPosition>0)
	$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_SelectionPosition}
	
	ARRAY TEXT:C222($_at_Printers; 0)
	PRINTERS LIST:C789($_at_Printers)
	$_bo_DymoisInstalled:=False:C215
	For ($_l_Index; 1; Size of array:C274($_at_Printers))
		$_l_DymoPosition:=Position:C15("DYMO"; $_at_Printers{$_l_Index})
		If ($_l_DymoPosition>0)
			$_bo_DymoisInstalled:=True:C214
		End if 
	End for 
	
	If ($_bo_DymoisInstalled)
		Gen_Confirm_WithHideOption(304; "Print to Dymo?"; "Yes"; "No")
		
		$_bo_DymoPrint:=(OK=1)
	Else 
		$_bo_DymoPrint:=False:C215
	End if 
	OK:=1
	If (Not:C34($_bo_DymoPrint))
		$_bo_SuperReportExists:=Form_SRProOK("PackingLabels"; "")  //Mon, Mar 2, 2009 balinderwalia: check if Superreport "SR PackingLabels exist or not? If it does print Superreport else run existing code
		If ($_bo_SuperReportExists)  //Mon, Mar 2, 2009 balinderwalia: SR PackingLabels exists
			
			Case of 
				: (In_ButtChkMan(->[ORDERS:24]; "1 3")=False:C215)  //do nothing i think a message has already been displayed to the user about why this failed.
				: (DB_t_CurrentFormUsage="None")  //Shouldnt happen. Probably a developer error but just display a 'nice" message saying can't run this report from this screen.
					Gen_Alert("Cannot run Packing Labels print command. Invalid form."; "Cancel")
				: (Size of array:C274($_ptr_ListBoxSetup->)=0)  //Shouldnt happen. Probably a developer error but just display a 'nice" message saying can't run this report from this screen.
					Gen_Alert("Cannot run Packing Labels print command.  Invalid ListBox  arrays setup."; "Cancel")
					
				Else 
					//TRACE
					$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
					COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
					Orders_InLPA(False:C215)
					DB_SaveRecord(->[ORDERS:24])
					AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
					
					$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
					$_Ptr_KeyField:=$_ptr_ListBoxSetup->{8}
					$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
					$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
					$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
					$_t_HighlightSetName:=$_ptr_HighlightSet->
					$_bo_Reselect:=False:C215
					If ($_t_HighlightSetName#"")
						If (Records in set:C195($_t_HighlightSetName)>0)
							USE SET:C118($_t_HighlightSetName)
							CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
							$_bo_Reselect:=True:C214
						End if 
					End if 
					
					
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						$_t_DocumentName:="Packing labels "+[ORDERS:24]Order_Code:3
						$currWindowTitle:=Get window title:C450
						SET WINDOW TITLE:C213($_t_DocumentName)
						
						If (Picture size:C356([DOCUMENTS:7]Write_:5)>0)
							PRT_bo_PrintReportOK:=True:C214  //can be reset inside macro to stop call to SR Print Report
							If ([DOCUMENTS:7]SR_PreMacro:16#"")
								Macro([DOCUMENTS:7]SR_PreMacro:16)
							End if 
							
							If (PRT_bo_PrintReportOK)  //Thu, Mar 19, 2009 balinderwalia: added so that can be controlled from Pre macro
								$_t_ErrorMethod:=Method called on error:C704
								ON ERR CALL:C155("")
								SR_bo_PageSetupFound:=False:C215
								$_l_OK:=PRINT_SetSIZE("A4"; "P"; [DOCUMENTS:7]Document_Code:1)
								$_l_OK:=1
								$_bo_PrintSettingsDisplayed:=False:C215
								If (Not:C34(SR_bo_PageSetupFound))
									$_bo_PrintSettingsDisplayed:=True:C214
									PRINT SETTINGS:C106(2)
									$_l_OK:=OK
									$_l_PageSetupOption:=SRP_Print_4DPageSetup
								Else 
									$_l_OK:=1
									$_l_PageSetupOption:=SRP_Print_4DPageSetup  //+2  wahts the 2
									
								End if 
								If ($_l_OK=1)
									//$_l_PageSetupOption:=SRP_Print_4DPageSetup
									If (<>SRP262)
										$_ptr_SRPrintArea:=->[DOCUMENTS:7]SR_DOCUMENT_:4
									Else 
										
										$_ptr_SRPrintArea:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
									End if 
									//$_l_NoisPrinted:=SR Print Report ($_ptr_SRPrintArea->;$_l_PageSetupOption;65535)
									$_l_NoisPrinted:=SR_Print([DOCUMENTS:7]SR_DOCUMENTXML_:34; 0; SRP_Print_DestinationPrinter+$_l_PageSetupOption; ""; 0; "")
									
									PRT_SetPrinterPaperOptions([DOCUMENTS:7]Document_Code:1)
								Else 
									$_l_NoisPrinted:=-1
								End if 
								ON ERR CALL:C155($_t_ErrorMethod)
							End if 
						End if 
						
						SET WINDOW TITLE:C213($currWindowTitle)  //restore previous window title
						Case of 
							: (Not:C34(In transaction:C397))
							: ($_l_NoisPrinted=0)  //Report was printed
								//VALIDATE TRANSACTION
								Transact_End(True:C214)
							Else 
								//CANCEL TRANSACTION
								Transact_End(False:C215)
						End case 
						
					Else 
						Gen_Alert("No order item records were found that matched the selected and/or currently displ"+"ayed order items!"; "Cancel")
					End if 
					USE NAMED SELECTION:C332("$Temp")
					If ($_bo_Reselect)
						HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
					End if 
			End case 
			
		Else   //super report doesn't exist
			
			CONFIRM:C162("Packing Lists or Mini Labels"; "Mini"; "Sheets")
			If (OK=0)  //print lists(could be onto labels
				//make sure we have all the order items
				ARRAY INTEGER:C220(LAB_ai_IncludeLine; 0)
				ARRAY REAL:C219(LAB_ar_QuantityRemaining; 0)
				ARRAY REAL:C219(LAB_ar_QuantityToInclude; 0)
				ARRAY TEXT:C222(LAB_at_ProductName; 0)
				ARRAY LONGINT:C221(LAB_al_OrderCode; 0)
				ARRAY INTEGER:C220(LAB_ai_IncludeLine; Records in selection:C76([ORDER_ITEMS:25]))
				ARRAY REAL:C219(LAB_ar_QuantityRemaining; Records in selection:C76([ORDER_ITEMS:25]))
				ARRAY REAL:C219(LAB_ar_QuantityToInclude; Records in selection:C76([ORDER_ITEMS:25]))
				ARRAY TEXT:C222(LAB_at_ProductName; Records in selection:C76([ORDER_ITEMS:25]))
				ARRAY LONGINT:C221(LAB_al_OrderCode; Records in selection:C76([ORDER_ITEMS:25]))
				
				FIRST RECORD:C50([ORDER_ITEMS:25])
				For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
					LAB_ar_QuantityRemaining{$_l_Index}:=[ORDER_ITEMS:25]Quantity:3
					LAB_at_ProductName{$_l_Index}:=[ORDER_ITEMS:25]Product_Name:13
					LAB_al_OrderCode{$_l_Index}:=[ORDER_ITEMS:25]Item_Number:27
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End for 
				LAB_l_Continue:=0
				Repeat 
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
					DIALOG:C40([USER:15]; "ORDERITEMLABELADMIN")
					CLOSE WINDOW:C154
					WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
					//Gather print data
					If (LAB_l_Continue>0)
						ARRAY LONGINT:C221($_al_ItemToPrint; 0)
						ARRAY REAL:C219($_ar_QuantityToPrint; 0)
						ARRAY LONGINT:C221($_al_ItemToPrint; Size of array:C274(LAB_al_OrderCode))
						ARRAY REAL:C219($_ar_QuantityToPrint; Size of array:C274(LAB_al_OrderCode))
						$_l_CurrentElement:=0
						For ($_l_Index; 1; Size of array:C274(LAB_al_OrderCode))
							If (LAB_ar_QuantityToInclude{$_l_Index}>0)
								$_l_CurrentElement:=$_l_CurrentElement+1
								$_ar_QuantityToPrint{$_l_CurrentElement}:=LAB_ar_QuantityToInclude{$_l_Index}
								$_al_ItemToPrint{$_l_CurrentElement}:=LAB_al_OrderCode{$_l_Index}
								
							End if 
						End for 
						ARRAY LONGINT:C221($_al_ItemToPrint; $_l_CurrentElement)
						ARRAY REAL:C219($_ar_QuantityToPrint; $_l_CurrentElement)
						Lab_t_Data1:=""
						For ($_l_Index; 1; Size of array:C274($_al_ItemToPrint))
							$_l_SelectionPosition:=Find in array:C230(LAB_al_OrderCode; $_al_ItemToPrint{$_l_Index})
							Lab_t_Data1:=Lab_t_Data1+LAB_at_ProductName{$_l_SelectionPosition}
							Lab_t_Data1:=Lab_t_Data1+String:C10(LAB_ar_QuantityToInclude{$_l_Index})+Char:C90(13)
						End for 
						//How many lines??
						$_l_CountLines:=0
						For ($_l_Index; 1; Length:C16(Lab_t_Data1))
							If (Lab_t_Data1[[$_l_Index]]=Char:C90(13))
								$_l_CountLines:=$_l_CountLines+1
							End if 
						End for 
						$_l_MaxLines:=30
						If ($_l_CountLines<=$_l_MaxLines)
							$_l_FillBlanks:=$_l_MaxLines-$_l_CountLines
							$_l_FillBlanks:=Int:C8($_l_FillBlanks/2)
							//put some char returns in
							Lab_t_Data1:=(Char:C90(13)*$_l_FillBlanks)+Lab_t_Data1
							//Centre on Page
							Print form:C5([USER:15]; "LAB_L7167")
							PAGE BREAK:C6
							
						Else 
							//two  or more sheets
							$_t_LabelData1:=Lab_t_Data1
							Repeat 
								$_l_CountLines:=0
								For ($_l_Index; 1; $_l_MaxLines)
									If (Length:C16($_t_LabelData1)>0)
										$_l_DymoPosition:=Position:C15(Char:C90(13); $_t_LabelData1)
										If ($_l_DymoPosition>0)
											Lab_t_Data1:=Substring:C12($_t_LabelData1; 1; $_l_DymoPosition)
											$_t_LabelData1:=Substring:C12($_t_LabelData1; $_l_DymoPosition+1; Length:C16($_t_LabelData1))
											$_l_CountLines:=$_l_CountLines+1
										Else 
											Lab_t_Data1:=$_t_LabelData1
											$_t_LabelData1:=""
											$_l_CountLines:=$_l_CountLines+1
										End if 
										
									Else 
										$_l_Index:=$_l_MaxLines
									End if 
									
								End for 
								
							Until (Length:C16($_t_LabelData1)=0)
							//now print a sheet
							//still have to centre it as may not be a whole sheet
							$_l_FillBlanks:=$_l_MaxLines-$_l_CountLines
							$_l_FillBlanks:=Int:C8($_l_FillBlanks/2)
							//put some char returns in
							Lab_t_Data1:=(Char:C90(13)*$_l_FillBlanks)+Lab_t_Data1
							//Centre on Page
							Print form:C5([USER:15]; "LAB_L7167")
							PAGE BREAK:C6
						End if 
						
						
					End if 
					
				Until (LAB_l_Continue=0)
				
			Else 
				//print mini labels
				//each item goes onto one label
				//here we still need to show the selector
				//except that you dont select what items to print
				//but you do indicate how many per label
				//eg could be big items and you want a  label for each item
				ARRAY INTEGER:C220(LAB_ai_IncludeLine; 0)
				ARRAY REAL:C219(LAB_ar_QuantityRemaining; 0)
				ARRAY REAL:C219(LAB_ar_QuantityToInclude; 0)
				ARRAY TEXT:C222(LAB_at_ProductName; 0)
				ARRAY LONGINT:C221(LAB_al_OrderCode; 0)
				ARRAY INTEGER:C220(LAB_ai_IncludeLine; Records in selection:C76([ORDER_ITEMS:25]))
				ARRAY REAL:C219(LAB_ar_QuantityRemaining; Records in selection:C76([ORDER_ITEMS:25]))
				ARRAY REAL:C219(LAB_ar_QuantityToInclude; Records in selection:C76([ORDER_ITEMS:25]))
				ARRAY TEXT:C222(LAB_at_ProductName; Records in selection:C76([ORDER_ITEMS:25]))
				ARRAY LONGINT:C221(LAB_al_OrderCode; Records in selection:C76([ORDER_ITEMS:25]))
				
				
				FIRST RECORD:C50([ORDER_ITEMS:25])
				For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
					LAB_ar_QuantityRemaining{$_l_Index}:=[ORDER_ITEMS:25]Quantity:3
					LAB_ar_QuantityToInclude{$_l_Index}:=[ORDER_ITEMS:25]Quantity:3
					LAB_at_ProductName{$_l_Index}:=[ORDER_ITEMS:25]Product_Name:13
					LAB_al_OrderCode{$_l_Index}:=[ORDER_ITEMS:25]Item_Number:27
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End for 
				$_l_Index:=0
				$_l_LabelsPerSheet:=21  //this should depend on label type selected
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
				DIALOG:C40([USER:15]; "ORDERITEMLABELADMIN")
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
				Repeat 
					For ($_l_Index2; 1; $_l_LabelsPerSheet)
						$_l_Index:=$_l_Index+1
						If ($_l_Index<=Size of array:C274(LAB_al_OrderCode))
							If (LAB_ar_QuantityToInclude{$_l_Index}>0)
								//include this item
								$_l_Repeats:=0
								Repeat 
									$_r_PrintQuantity:=LAB_ar_QuantityToInclude{$_l_Index}
									If ($_r_PrintQuantity>LAB_ar_QuantityRemaining{$_l_Index})
										$_r_PrintQuantity:=LAB_ar_QuantityRemaining{$_l_Index}
									End if 
									LAB_ar_QuantityRemaining{$_l_Index}:=LAB_ar_QuantityRemaining{$_l_Index}-$_r_PrintQuantity
									$_ptr_VariablePointer:=Get pointer:C304(""+String:C10($_l_Index2+$_l_Repeats))  //SOMETHING WRONG HERE@@@
									
									$_ptr_VariablePointer->:=Char:C90(13)+LAB_at_ProductName{$_l_Index}+Char:C90(9)+String:C10($_r_PrintQuantity)
									$_l_Repeats:=$_l_Repeats+1
								Until (LAB_ar_QuantityRemaining{$_l_Index}=0)
								$_l_Index2:=$_l_Index2+($_l_Repeats-1)
							End if 
						End if 
					End for 
					//now print the labels(the form name needs to be
					//changed to a variable
					Print form:C5([USER:15]; "LAB_L7160")
					
				Until ($_l_Index>=Size of array:C274(LAB_al_OrderCode))
				
				
			End if 
			
		End if 
	Else 
		ARRAY LONGINT:C221(PRT_al_PrintOptions; 0)
		ARRAY TEXT:C222(PRT_at_PrintOptions; 0)
		$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
		$_Ptr_KeyField:=$_ptr_ListBoxSetup->{8}
		$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
		$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
		$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
		$_t_HighlightSetName:=$_ptr_HighlightSet->
		$_bo_Reselect:=False:C215
		If ($_t_HighlightSetName#"")
			
			If (Records in set:C195($_t_HighlightSetName)>0)
				APPEND TO ARRAY:C911(PRT_at_PrintOptions; "Highlighted")
				APPEND TO ARRAY:C911(PRT_al_PrintOptions; 1)
			End if 
		End if 
		APPEND TO ARRAY:C911(PRT_at_PrintOptions; "Delivered")
		APPEND TO ARRAY:C911(PRT_al_PrintOptions; 2)
		APPEND TO ARRAY:C911(PRT_at_PrintOptions; "Invoiced")
		
		APPEND TO ARRAY:C911(PRT_al_PrintOptions; 3)
		APPEND TO ARRAY:C911(PRT_at_PrintOptions; "All")
		APPEND TO ARRAY:C911(PRT_al_PrintOptions; 4)
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
		//TRACE
		$_t_SelectionOption:=Gen_RequestWithList("Packing Label Options:"; ""; "Select"; "All"; 0; 0; "Select Order items to print"; 0; ""; "PRT_at_PrintOptions")
		If (OK=1)
			$_l_SelectionPosition:=Find in array:C230(PRT_at_PrintOptions; $_t_SelectionOption)
			If ($_l_SelectionPosition>0)
				Case of 
					: (PRT_al_PrintOptions{$_l_SelectionPosition}=1)
						USE SET:C118($_t_HighlightSetName)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
						$_bo_Reselect:=True:C214
					: (PRT_al_PrintOptions{$_l_SelectionPosition}=2)
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivered:51>0)
					: (PRT_al_PrintOptions{$_l_SelectionPosition}=3)
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17#"")
						
					: (PRT_al_PrintOptions{$_l_SelectionPosition}=4)
						
				End case 
				
			Else 
			End if 
		Else 
			//All
		End if 
		FIRST RECORD:C50([ORDER_ITEMS:25])
		
		PRT_DymoLabel("Order Packing Label"; ->[ORDER_ITEMS:25])
		If ($_bo_Reselect)
			USE SET:C118("$Reselection")
		Else 
			USE NAMED SELECTION:C332("$Temp")
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("Order_PrintLabels"; $_t_oldMethodName)
