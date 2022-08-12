//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_Imp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_DateAdded)
	//C_UNKNOWN(Address_Status)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Create; $_l_No; $_l_NP; $_l_WindowReferenceRow; vAdd; vNo; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_Address1; $_t_Address2; $_t_AddressCountry; $_t_AddressCounty; $_t_AddressPostCode; $_t_AddressTelephone; $_t_AddressTown; $_t_CompanyCode; $_t_CompanyName; $_t_ContCode; $_t_ContractPrice)
	C_TEXT:C284($_t_ContractText; $_t_ContractType; $_t_DeliveryDate; $_t_Description; $_t_EndDate; $_t_FieldDelimiter; $_t_Forenames; $_t_OCP; $_t_oldMethodName; $_t_OrderCode; $_t_PrintDescription)
	C_TEXT:C284($_t_ProductCode; $_t_ProductName; $_t_Quantity; $_t_RecordDelimiter; $_t_SerialNumber; $_t_StartDate; $_t_SupplierCode; $_t_SupplierCompany; $_t_SupplierContact; $_t_Surname; $_t_SystemCode)
	C_TEXT:C284($_t_Title; $_t_TotalCost; $_t_WindowTitle; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompName; vT; vText; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_Imp")
//Contracts_Import
$_t_WindowTitle:="Import Contracts"
Start_Process
If (Contracts_File)  // modified NG June 2004
	vAdd:=0
	Gen_Confirm("Have you created an Contracts_File in the correct Text format?"; "Yes"; "No")
	If (OK=1)
		SET CHANNEL:C77(10; "")
		If (OK=1)
			//$Count:=0
			CREATE EMPTY SET:C140([CONTRACTS:17]; "Master")
			$_t_RecordDelimiter:=Char:C90(13)
			$_t_FieldDelimiter:=Char:C90(9)
			$_t_OCP:=""
			vText:="sdfsdf"
			Open_PrD_Window($_t_WindowTitle+": Command-. to Cancel")
			MESSAGE:C88(Char:C90(13))
			While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
				IDLE:C311  // 03/04/03 pb
				RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
				vT:=vText
				$_t_OrderCode:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_CompanyCode:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_CompanyName:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_Address1:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_Address2:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_AddressTown:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_AddressCounty:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_AddressPostCode:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_AddressCountry:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_AddressTelephone:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_ContCode:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_Title:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_Forenames:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_Surname:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_ContractType:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_StartDate:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_EndDate:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_TotalCost:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_SupplierCompany:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_SupplierContact:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_ContractText:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_ProductCode:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_ProductName:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_Description:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_PrintDescription:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_SystemCode:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_SerialNumber:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_DeliveryDate:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_Quantity:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_ContractPrice:=First_Field(->vT; $_t_FieldDelimiter)
				$_t_SupplierCode:=First_Field(->vT; $_t_FieldDelimiter)
				$_l_Create:=0
				
				$_l_No:=0
				
				If ($_t_OrderCode="")
					$_t_OrderCode:=$_t_OCP
				End if 
				
				If (($_t_OrderCode#"") & (Length:C16($_t_OrderCode)>1) & ($_t_OrderCode#"Contract @"))
					QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=$_t_OrderCode)
					If (Records in selection:C76([CONTRACTS:17])=1)
					Else 
						
						If (($_t_CompanyCode#"") | (($_t_CompanyName#"") & ($_t_AddressTown#"")))
							If ($_t_CompanyCode#"")
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=Substring:C12($_t_CompanyCode; 1; 11))
							Else 
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName; *)
								QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Town_or_City:5=$_t_AddressTown)
								QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Address_Line_one:3=$_t_Address1)
							End if 
							$_l_Create:=0
							If (Records in selection:C76([COMPANIES:2])=0)
								MESSAGE:C88("  Creating Company "+$_t_CompanyCode+" "+$_t_CompanyName+Char:C90(13))
								CREATE RECORD:C68([COMPANIES:2])
								If ($_t_CompanyCode#"")
									[COMPANIES:2]Company_Code:1:=$_t_CompanyCode
								Else 
									vCompName:=$_t_CompanyName
									Company_No
									$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
								End if 
								[COMPANIES:2]Status:12:="CI"
								$_l_Create:=1
							Else 
								$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
							End if 
							If (($_t_CompanyName#"") | ($_l_Create=1))
								[COMPANIES:2]Company_Name:2:=$_t_CompanyName
								[COMPANIES:2]Company_Abbreviated_Name:52:=Companies_Abbr([COMPANIES:2]Company_Name:2)
								[COMPANIES:2]Address_Line_one:3:=$_t_Address1
								[COMPANIES:2]Address_Line_two:4:=$_t_Address2
								[COMPANIES:2]Town_or_City:5:=Uppercase:C13($_t_AddressTown)
								[COMPANIES:2]County_or_State:6:=$_t_AddressCounty
								[COMPANIES:2]Postal_Code:7:=$_t_AddressPostCode
								[COMPANIES:2]Country:8:=$_t_AddressCountry
								[COMPANIES:2]Telephone:9:=$_t_AddressTelephone
								DB_SaveRecord(->[COMPANIES:2])
								AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
							End if 
							
							If (($_t_ContCode#"") | ($_t_Surname#""))
								If ($_t_ContCode#"")
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContCode)
								Else 
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_CompanyCode; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									
									SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
									QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
									CREATE SET:C116([CONTACTS:1]; "$set1")
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_Surname)
									QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_Forenames)
									CREATE SET:C116([CONTACTS:1]; "$set2")
									INTERSECTION:C121("$Set1"; "$Set2"; "$set1")
									USE SET:C118("$Set1")
									
								End if 
								If (Records in selection:C76([CONTACTS:1])=0)
									MESSAGE:C88("  Creating Contact "+$_t_Forenames+" "+$_t_Surname+Char:C90(13))
									CREATE RECORD:C68([CONTACTS:1])
									If ($_t_ContCode="")
										Contact_Code
									Else 
										[CONTACTS:1]Contact_Code:2:=$_t_ContCode
									End if 
									[CONTACTS:1]Company_Code:1:=$_t_CompanyCode
									CREATE RECORD:C68([CONTACTS_COMPANIES:145])
									[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
									[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
									[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
									[CONTACTS_COMPANIES:145]Company_Code:1:=$_t_CompanyCode
									[CONTACTS:1]Surname:5:=$_t_Surname
									[CONTACTS:1]Forename:4:=$_t_Forenames
									[CONTACTS:1]Title:3:=$_t_Title
									DB_SaveRecord(->[CONTACTS_COMPANIES:145])
									DB_SaveRecord(->[CONTACTS:1])
									AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
								End if 
							End if 
						End if 
						
						MESSAGE:C88("  Creating Contract "+$_t_OrderCode+Char:C90(13))
						CREATE RECORD:C68([CONTRACTS:17])
						[CONTRACTS:17]Contract_Code:3:=$_t_OrderCode
						[CONTRACTS:17]Company_Code:1:=$_t_CompanyCode
						If (($_t_ContCode#"") | ($_t_Surname#""))
							[CONTRACTS:17]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
						End if 
						[CONTRACTS:17]Start_Date:5:=Date:C102($_t_StartDate)
						If ([CONTRACTS:17]Start_Date:5=!00-00-00!)
							[CONTRACTS:17]Start_Date:5:=<>DB_d_CurrentDate
						End if 
						[CONTRACTS:17]End_Date:6:=Date:C102($_t_EndDate)
						[CONTRACTS:17]Contract_Type_Code:4:=$_t_ContractType
						[CONTRACTS:17]Contract_Text:8:=$_t_ContractText
						[CONTRACTS:17]Supplier_Company:9:=$_t_SupplierCompany
						[CONTRACTS:17]Supplier_Contact:10:=$_t_SupplierContact
						[CONTRACTS:17]Contract_Cost:7:=Num:C11($_t_TotalCost)
						DB_SaveRecord(->[CONTRACTS:17])
						ADD TO SET:C119([CONTACTS:1]; "Master")
						$_l_Create:=1
					End if 
					//$Calc:=0
					$_l_NP:=0
					
					//Items
					If ((($_t_ProductCode#"") | ($_t_ProductName#"")) & ($_l_No=0))
						MESSAGE:C88("     "+$_t_ProductCode+" "+$_t_ProductName+Char:C90(13))
						CREATE RECORD:C68([ORDER_ITEMS:25])
						[ORDER_ITEMS:25]Contract_Code:29:=$_t_OrderCode
						[ORDER_ITEMS:25]Product_Code:2:=$_t_ProductCode
						RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
						If (($_t_ProductName#"") & ($_t_ProductCode#"") & ([PRODUCTS:9]Product_Code:1=""))
							MESSAGE:C88("     Creating Product "+$_t_ProductCode+Char:C90(13))
							CREATE RECORD:C68([PRODUCTS:9])
							[PRODUCTS:9]Product_Code:1:=$_t_ProductCode
							[PRODUCTS:9]Group_Code:3:=Substring:C12($_t_ProductCode; 1; 3)
							[PRODUCTS:9]Brand_Code:4:=Substring:C12($_t_ProductCode; 4; 3)
							[PRODUCTS:9]Model_Code:5:=Substring:C12($_t_ProductCode; 7; 15)
							[PRODUCTS:9]Product_Name:2:=$_t_ProductName
							[PRODUCTS:9]Modified_Date:10:=<>DB_d_CurrentDate
							DB_SaveRecord(->[PRODUCTS:9])
							AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
							$_l_NP:=1
						End if 
						If ($_t_ProductName="")
							[ORDER_ITEMS:25]Product_Name:13:=[PRODUCTS:9]Product_Name:2
						Else 
							[ORDER_ITEMS:25]Product_Name:13:=$_t_ProductName
						End if 
						[ORDER_ITEMS:25]Description:44:=$_t_Description
						If (($_t_PrintDescription="Y@") | ($_t_PrintDescription="True") | ($_t_PrintDescription="1"))
							[ORDER_ITEMS:25]Print_Description:45:=True:C214
						End if 
						[ORDER_ITEMS:25]Quantity:3:=Num:C11($_t_Quantity)
						[ORDER_ITEMS:25]Contract_Cost:30:=Num:C11($_t_ContractPrice)
						[ORDER_ITEMS:25]Tax_Code:12:=DB_GetLedgerDefaultSalesTax
						[ORDER_ITEMS:25]Serial_Number:24:=$_t_SerialNumber
						[ORDER_ITEMS:25]Supplier_Code:20:=$_t_SupplierCode
						[ORDER_ITEMS:25]Job_Stage:35:=$_t_SystemCode
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
						[CONTRACTS:17]Contract_Cost:7:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Contract_Cost:30)); 2; 2)
						DB_SaveRecord(->[CONTRACTS:17])
						ADD TO SET:C119([CONTRACTS:17]; "Master")
					End if 
					
				Else 
					MESSAGE:C88("  Line without Contract Code"+Char:C90(13))
				End if 
				
				$_t_OCP:=$_t_OrderCode
			End while 
			CLOSE WINDOW:C154
			If (WIN_bo_TrackerInited)
				$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
				If ($_l_WindowReferenceRow>0)
					WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
				End if 
			End if 
			SET CHANNEL:C77(11)
			
			//Checking, Printing & Processing
			USE SET:C118("Master")
			If (Records in selection:C76([CONTRACTS:17])>0)
				Gen_Confirm("Do you want to View the Contracts_Imported?"; "Yes"; "No")
				If (OK=1)
					DB_t_CurrentFormUsage:=""
					vNo:=Records in selection:C76([CONTRACTS:17])
					Open_Pro_Window($_t_WindowTitle; 0; 1; ->[CONTRACTS:17]; "Contracts_Out")  //NG may 2004 added form name
					FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[CONTRACTS:17]))
					
					WIn_SetFormSize(1; ->[CONTRACTS:17]; "Contacts_Out")
					MODIFY SELECTION:C204([CONTRACTS:17]; *)
					Close_ProWin
				End if 
			Else 
				Gen_Alert("No Contracts were created"; "Cancel")
			End if 
			
		End if 
	End if 
End if 

Process_End
ERR_MethodTrackerReturn("Contracts_Imp"; $_t_oldMethodName)
