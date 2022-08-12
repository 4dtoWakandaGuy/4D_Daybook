//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_PrintOut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SD_D_EndDate; SD_D_StartDate)
	C_LONGINT:C283($_l_CountLines; $_l_EndofRow; $_l_MaxLines; $_l_OK; $_l_OrderItemIndex; $_l_OrdersIndex; $_l_PositionIndex; $_l_RecordsinSelection; SD_l_CURRENTPAGE; SD_l_PRODUCTQTY)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; $_t_ThisCharacter; $1; COM_t_TelephoneNumberFormat; SD_T_CompanyAddress; SD_t_CompanyName; SD_t_ContactName; SD_t_DeliveryMethod; SD_t_Department; SD_t_Description)
	C_TEXT:C284(SD_t_DiaryPrintDateRange; SD_t_ItemRequiredDate; SD_t_JobTitle; SD_t_OrderCode; SD_t_OrderReqDateString; SD_t_PrintAction; SD_t_PrintDate; SD_T_PrintLine; SD_t_PrintPerson; SD_t_printResult; SD_t_Printtimes)
	C_TEXT:C284(SD_t_ProductCode; SD_t_ProductName; SD_t_Shipper; SD_t_Telephone; SD_t_TelExt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_PrintOut")
//PRINT SETTINGS

$_l_OK:=PRINT_SetSIZE("A4"; "P"; "Diaryprintout")
If ($_l_OK>=0)  //Either the print setting was not displayed in PRINT_Setsize OR the settings were OK'd
	USE SET:C118("DMaster")
	$_l_MaxLines:=65
	//pass this method the name of the diary we are viewing
	ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Time_Stamp:45)
	COPY NAMED SELECTION:C331([DIARY:12]; "PrintSelection")
	$_l_RecordsinSelection:=Records in selection:C76([DIARY:12])
	FIRST RECORD:C50([DIARY:12])
	SD_D_StartDate:=[DIARY:12]Date_Do_From:4
	LAST RECORD:C200([DIARY:12])
	SD_D_EndDate:=[DIARY:12]Date_Do_From:4
	Case of 
		: (SD_D_StartDate=SD_D_EndDate)
			SD_t_DiaryPrintDateRange:=String:C10(SD_D_StartDate; 4)
		Else 
			SD_t_DiaryPrintDateRange:=String:C10(SD_D_StartDate; 4)+"-"+String:C10(SD_D_EndDate; 4)
	End case 
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
	SD_t_PrintPerson:=[PERSONNEL:11]Name:2
	
	$_l_CountLines:=0
	SD_l_CurrentPage:=0
	Print form:C5([DIARY:12]; "SD_Print_Header")
	$_l_CountLines:=$_l_CountLines+10
	For ($_l_OrdersIndex; 1; $_l_RecordsinSelection)
		USE NAMED SELECTION:C332("PrintSelection")
		GOTO SELECTED RECORD:C245([DIARY:12]; $_l_OrdersIndex)
		
		If ([DIARY:12]Done:14)
			If ([DIARY:12]Date_Done_From:5=[DIARY:12]Date_Done_To:34)
				SD_t_PrintDate:=String:C10([DIARY:12]Date_Done_From:5; 4)
			Else 
				SD_t_PrintDate:=String:C10([DIARY:12]Date_Done_From:5; 4)+"-"+String:C10([DIARY:12]Date_Done_To:34; 4)
			End if 
			If ([DIARY:12]Time_Done_From:7=[DIARY:12]Time_Done_To:36)
				SD_t_Printtimes:=String:C10([DIARY:12]Time_Done_From:7; 2)
			Else 
				SD_t_Printtimes:=String:C10([DIARY:12]Time_Done_From:7; 2)+"-"+String:C10([DIARY:12]Time_Done_To:36; 2)
			End if 
		Else 
			If ([DIARY:12]Date_Do_From:4=[DIARY:12]Date_Do_To:33)
				SD_t_PrintDate:=String:C10([DIARY:12]Date_Do_From:4; 4)
			Else 
				SD_t_PrintDate:=String:C10([DIARY:12]Date_Do_From:4; 4)+"-"+String:C10([DIARY:12]Date_Do_To:33; 4)
			End if 
			If ([DIARY:12]Time_Done_From:7=[DIARY:12]Time_Do_To:35)
				SD_t_Printtimes:=String:C10([DIARY:12]Time_Do_From:6; 2)
			Else 
				SD_t_Printtimes:=String:C10([DIARY:12]Time_Do_From:6; 2)+"-"+String:C10([DIARY:12]Time_Do_To:35; 2)
			End if 
		End if 
		READ ONLY:C145([ACTIONS:13])
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
		SD_t_PrintAction:=[ACTIONS:13]Action_Name:2
		If ($_l_CountLines>$_l_MaxLines)
			//print a footer and another header
			PAGE BREAK:C6
			Print form:C5([DIARY:12]; "SD_Print_Header")
			$_l_CountLines:=10  //print a footer and another header
		End if 
		Print form:C5([DIARY:12]; "SD_Print_Body_1")
		$_l_CountLines:=$_l_CountLines+2
		If ([DIARY:12]Done:14)
			READ ONLY:C145([RESULTS:14])
			QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
			SD_t_printResult:=[RESULTS:14]Result_Name:2
			Print form:C5([DIARY:12]; "SD_Print_Body_2")
			$_l_CountLines:=$_l_CountLines+1
		End if 
		//now print the [DIARY]Action Desc or[DIARY]Result Desc
		If ($_l_CountLines>$_l_MaxLines)
			PAGE BREAK:C6
			Print form:C5([DIARY:12]; "SD_Print_Header")
			$_l_CountLines:=10  //print a footer and another header
		End if 
		If ([DIARY:12]Done:14)
			If ([DIARY:12]Result_Description:12#"")
				SD_T_Description:=[DIARY:12]Result_Description:12
			Else 
				SD_T_Description:=[DIARY:12]Action_Details:10
			End if 
			
		Else 
			SD_T_Description:=[DIARY:12]Action_Details:10
		End if 
		Repeat 
			If (Length:C16(SD_T_Description)>80)
				For ($_l_PositionIndex; 80; 1; -1)
					$_l_EndofRow:=Position:C15(Char:C90(13); SD_T_Description)
					If ($_l_EndofRow=0)
						$_l_EndofRow:=Position:C15(Char:C90(13); SD_T_Description)
					End if 
					If ($_l_EndofRow>0)
						$_l_PositionIndex:=$_l_EndofRow
					End if 
					$_t_ThisCharacter:=SD_T_Description[[$_l_PositionIndex]]
					If (Character code:C91($_t_ThisCharacter)=13) | ($_t_ThisCharacter=" ") | (Character code:C91($_t_ThisCharacter)=10)
						SD_T_PrintLine:=Substring:C12(SD_T_Description; 1; $_l_PositionIndex-1)
						SD_T_Description:=Substring:C12(SD_T_Description; $_l_PositionIndex+1; Length:C16(SD_T_Description))
						$_l_PositionIndex:=0
					End if 
					If ($_l_PositionIndex=1)
						//no breaks so just take 40 chars
						SD_T_PrintLine:=Substring:C12(SD_T_Description; 1; 80)
						SD_T_Description:=Substring:C12(SD_T_Description; 80+1; Length:C16(SD_T_Description))
					End if 
				End for 
				SD_T_PrintLine:=Replace string:C233(SD_T_PrintLine; Char:C90(13); " ")
				SD_T_PrintLine:=Replace string:C233(SD_T_PrintLine; Char:C90(10); " ")
				If ($_l_CountLines>$_l_MaxLines)
					PAGE BREAK:C6
					Print form:C5([DIARY:12]; "SD_Print_Header")
					$_l_CountLines:=10  //print a footer and another header
				End if 
				Print form:C5([DIARY:12]; "SD_Print_Body_3")
				$_l_CountLines:=$_l_CountLines+1
				
			Else 
				SD_T_PrintLine:=SD_T_Description
				SD_T_Description:=""
				SD_T_PrintLine:=Replace string:C233(SD_T_PrintLine; Char:C90(13); " ")
				SD_T_PrintLine:=Replace string:C233(SD_T_PrintLine; Char:C90(10); " ")
				If ($_l_CountLines>$_l_MaxLines)
					PAGE BREAK:C6
					Print form:C5([DIARY:12]; "SD_Print_Header")
					$_l_CountLines:=10  //print a footer and another header
					//print a footer and another header
				End if 
				Print form:C5([DIARY:12]; "SD_Print_Body_3")
				$_l_CountLines:=$_l_CountLines+1
				
			End if 
			
		Until (SD_T_Description="")
		//here print the Diary code , the dates and time , the action
		//if the diary is completed print the diary result name too
		//print the diary notes too
		If ([DIARY:12]Contact_Code:2#"")
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[DIARY:12]Contact_Code:2)
			//here print the contact name and any other contact name info(job title etc)
			SD_t_ContactName:=[CONTACTS:1]Contact_Name:31
			SD_t_Department:=[CONTACTS:1]Dept:8
			SD_t_JobTitle:=[CONTACTS:1]Job_Title:6
			SD_t_TelExt:=[CONTACTS:1]Extn:9
			If ($_l_CountLines>$_l_MaxLines)
				PAGE BREAK:C6
				Print form:C5([DIARY:12]; "SD_Print_Header")
				$_l_CountLines:=10
				//print a footer and another header
			End if 
			Print form:C5([DIARY:12]; "SD_Print_Body_4")
			$_l_CountLines:=$_l_CountLines+2
		End if 
		If ([DIARY:12]Company_Code:1#"")
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[DIARY:12]Company_Code:1)
			SD_t_CompanyName:=[COMPANIES:2]Company_Name:2
			SD_T_CompanyAddress:=[COMPANIES:2]ADDRESS:60
			SD_t_Telephone:=[COMPANIES:2]Telephone:9
			If ([COMPANIES:2]Country:8#"")
				If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
					QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
					COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
				End if 
			Else 
				COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
			End if 
			If (COM_t_TelephoneNumberFormat#"")
				OBJECT SET FORMAT:C236(SD_t_Telephone; COM_t_TelephoneNumberFormat)
				
			End if 
			
			If ($_l_CountLines+10>$_l_MaxLines)
				PAGE BREAK:C6
				Print form:C5([DIARY:12]; "SD_Print_Header")
				$_l_CountLines:=10  //print a footer and another header
				//print a footer and another header
			End if 
			Print form:C5([DIARY:12]; "SD_Print_Body_5")
			$_l_CountLines:=$_l_CountLines+10
		Else 
			If ([DIARY:12]Contact_Code:2#"")
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Contact_Code:2)
				SD_T_CompanyAddress:=[COMPANIES:2]ADDRESS:60
				If ($_l_CountLines+10>$_l_MaxLines)
					PAGE BREAK:C6
					Print form:C5([DIARY:12]; "SD_Print_Header")
					$_l_CountLines:=10  //print a footer and another header
					//print a footer and another header
				End if 
				Print form:C5([DIARY:12]; "SD_Print_Body_6")
				$_l_CountLines:=$_l_CountLines+8
			End if 
		End if 
		If ([DIARY:12]Order_Code:26#"")
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[DIARY:12]Order_Code:26)
			//print the order info
			SD_t_OrderCode:=[ORDERS:24]Order_Code:3
			SD_t_OrderReqDateString:=String:C10([ORDERS:24]Required_Date:9; 4)
			SD_t_DeliveryMethod:=[ORDERS:24]Delivery_Method:19
			SD_t_Shipper:=[ORDERS:24]Shipping_Agent:41
			If ($_l_CountLines+2>$_l_MaxLines)
				PAGE BREAK:C6
				Print form:C5([DIARY:12]; "SD_Print_Header")
				$_l_CountLines:=10  //print a footer and another header
				//print a footer and another header
			End if 
			Print form:C5([DIARY:12]; "SD_Print_Body_7")
			$_l_CountLines:=$_l_CountLines+2
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			For ($_l_OrderItemIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
				SD_t_ProductCode:=[ORDER_ITEMS:25]Product_Code:2
				SD_l_ProductQTY:=[ORDER_ITEMS:25]Quantity:3
				SD_t_Description:=[ORDER_ITEMS:25]Description:44
				
				SD_t_ItemRequiredDate:=String:C10([ORDER_ITEMS:25]Required_Date:10; 4)
				SD_t_ProductName:=[ORDER_ITEMS:25]Product_Name:13
				If ($_l_CountLines+2>$_l_MaxLines)
					PAGE BREAK:C6
					Print form:C5([DIARY:12]; "SD_Print_Header")
					$_l_CountLines:=10  //print a footer and another header
					//print a footer and another header
				End if 
				Print form:C5([DIARY:12]; "SD_Print_Body_8")
				$_l_CountLines:=$_l_CountLines+2
				
				
				NEXT RECORD:C51([ORDER_ITEMS:25])
				
				
			End for 
		End if 
		If ([DIARY:12]Job_Code:19#"")
		End if 
		If ([DIARY:12]Stage_Code:21#"")
		End if 
		If ([DIARY:12]Document_Code:15#"")
		End if 
		If ([DIARY:12]Email_ID:41#0)
		End if 
		
		
		If ([DIARY:12]Call_Code:25#"")
		End if 
		Print form:C5([DIARY:12]; "SD_Print_FOOTER_1")
		If (($_l_CountLines+15)>$_l_MaxLines)
			PAGE BREAK:C6
			Print form:C5([DIARY:12]; "SD_Print_Header")
			$_l_CountLines:=10  //print a footer and another header
		End if 
		
	End for 
	PRT_SetPrinterPaperOptions("Diaryprintout")  //NG June 2005
	
	
End if 
ERR_MethodTrackerReturn("Diary_PrintOut"; $_t_oldMethodName)