//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_ImpGB
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
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>MultiCo; $_bo_SSCOK; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Create; $_l_ImportedCount; $_l_NumericDepartment; $_l_RecordNumber; $_l_VarNumber; $_l_WindowReferenceRow; r1; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284(<>DefRole; $_t_Address1R; $_t_Address2R; $_t_Address3; $_t_Address4; $_t_Address5; $_t_AddressCountry; $_t_AddressCounty; $_t_AddressLine1; $_t_AddressLine2; $_t_AddressPostCode)
	C_TEXT:C284($_t_AddressTown; $_t_AgeAddressCounty; $_t_AgeAddressLine1; $_t_AgeAddressLine2; $_t_AgeAddressTown; $_t_AgeArea; $_t_AgeCompany; $_t_AgeContact1; $_t_AgeContact2; $_t_AgeFax; $_t_AgeJobTitle1)
	C_TEXT:C284($_t_AgeJobTitle2; $_t_AgePostalCode; $_t_AgeSalutation1; $_t_AgeSalutation2; $_t_AgeTelephone; $_t_Area; $_t_CompanyCode; $_t_CompanyName; $_t_Contact1; $_t_Contact2; $_t_Department)
	C_TEXT:C284($_t_Fax; $_t_FieldDelimiter; $_t_FirstCharacter; $_t_FirstWord; $_t_ForeName; $_t_FS; $_t_Issues; $_t_JobTitle; $_t_JobTitle1; $_t_JobTitle2; $_t_oldMethodName)
	C_TEXT:C284($_t_PC1; $_t_PC2; $_t_PCTest; $_t_Qualifications; $_t_RecordAccountNumber; $_t_RecordDelimiter; $_t_Rubbish; $_t_s1; $_t_S2; $_t_S3; $_t_S4)
	C_TEXT:C284($_t_S5; $_t_S6; $_t_Salutation1; $_t_Salutation2; $_t_Status; $_t_Surname; $_t_Telephone; $_t_TFS; $_t_Title; MOD_FieldValue; vCompName)
	C_TEXT:C284(vSource; vT; vText; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_ImpGB")

Open_PrD_Window("GB Import: Command-. to Cancel")
If (vSource="GBP")
	$_t_FieldDelimiter:="|"
	$_t_RecordDelimiter:=Char:C90(13)+"\n"
Else 
	Gen_Confirm("What is the delimiter?"; "Tab"; "Comma")
	If (OK=1)
		$_t_FieldDelimiter:=Char:C90(9)
	Else 
		$_t_FieldDelimiter:=Char:C90(44)
	End if 
	$_t_RecordDelimiter:=Char:C90(13)
End if 
$_l_ImportedCount:=0
r1:=0

RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
	IDLE:C311  // 03/04/03 pb
	vT:=vText
	
	If (vSource="GBO")
		vCompName:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
		If (vCompName#"")
			$_t_RecordAccountNumber:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AddressLine1:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AddressLine2:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AddressTown:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AddressCounty:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AddressPostCode:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_Area:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_Telephone:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_Fax:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_Contact1:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_JobTitle1:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_Contact2:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_JobTitle2:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_Rubbish:=First_Field(->vT; $_t_FieldDelimiter)+First_Field(->vT; $_t_FieldDelimiter)+First_Field(->vT; $_t_FieldDelimiter)+First_Field(->vT; $_t_FieldDelimiter)
			$_t_AgeCompany:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeAddressLine1:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeAddressLine2:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeAddressTown:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeAddressCounty:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgePostalCode:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeArea:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeTelephone:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeFax:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeContact1:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeJobTitle1:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeContact2:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeJobTitle2:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_l_NumericDepartment:=1
			While ($_l_NumericDepartment<27)
				IDLE:C311  // 03/04/03 pb
				$_t_Rubbish:=First_Field(->vT; $_t_FieldDelimiter)
				$_l_NumericDepartment:=$_l_NumericDepartment+1
			End while 
			$_t_Salutation1:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_Salutation2:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeSalutation1:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_t_AgeSalutation2:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			$_l_NumericDepartment:=1
			While ($_l_NumericDepartment<7)
				IDLE:C311  // 03/04/03 pb
				$_t_Rubbish:=First_Field(->vT; $_t_FieldDelimiter)
				$_l_NumericDepartment:=$_l_NumericDepartment+1
			End while 
			$_t_Issues:=RemoveQuote(First_Field(->vT; $_t_FieldDelimiter))
			
			CREATE RECORD:C68([COMPANIES:2])
			[COMPANIES:2]Company_Name:2:=Uppers3(Lowercase:C14(vCompName))
			Company_No
			[COMPANIES:2]Address_Line_one:3:=$_t_AddressLine1
			[COMPANIES:2]Address_Line_two:4:=$_t_AddressLine2
			[COMPANIES:2]Town_or_City:5:=$_t_AddressTown
			[COMPANIES:2]County_or_State:6:=$_t_AddressCounty
			[COMPANIES:2]Postal_Code:7:=$_t_AddressPostCode
			Companies_ImpMP
			$_bo_SSCOK:=Check_SSC([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Town_or_City:5; ->[COMPANIES:2]Mailsort_SSC:49)
			[COMPANIES:2]Area:11:=$_t_Area
			$_l_ImportedCount:=$_l_ImportedCount+1
			If ($_t_RecordAccountNumber#"")
				MESSAGE:C88(String:C10($_l_ImportedCount)+"  Advertiser: "+vCompName+Char:C90(13))
				[COMPANIES:2]Status:12:="ADV"
				[COMPANIES:2]Their_Account_Number:48:=$_t_RecordAccountNumber
			Else 
				MESSAGE:C88(String:C10($_l_ImportedCount)+"  Non-Advertiser: "+vCompName+Char:C90(13))
				[COMPANIES:2]Status:12:="PROS"
			End if 
			[COMPANIES:2]Telephone:9:=$_t_Telephone
			[COMPANIES:2]Fax:10:=$_t_Fax
			[COMPANIES:2]Entry_Date:16:=<>DB_d_CurrentDate
			[COMPANIES:2]Modified_Date:32:=<>DB_d_CurrentDate
			[COMPANIES:2]Omit:17:="N"
			If ($_t_Issues#"")
				While ($_t_Issues#"")
					IDLE:C311  // 03/04/03 pb
					$_t_FirstWord:=FirstWord($_t_Issues)
					If ($_t_FirstWord#"")
						$_t_Issues:=Substring:C12($_t_Issues; Length:C16($_t_FirstWord)+2; 32000)
						CREATE RECORD:C68([COMPANIES_RECORD_ANALYSIS:146])
						Case of 
							: ($_t_FirstWord="98")
								$_t_FirstWord:="7"
							: ($_t_FirstWord="14")
								$_t_FirstWord:="10"
							: ($_t_FirstWord="13")
								$_t_FirstWord:="12"
							: ($_t_FirstWord="15")
								$_t_FirstWord:="13"
							: ($_t_FirstWord="16")
								$_t_FirstWord:="14"
						End case 
						If (Length:C16($_t_FirstWord)=1)
							$_t_FirstWord:="0"+$_t_FirstWord
						End if 
						[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1:=$_t_FirstWord
						[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[COMPANIES:2]Company_Code:1
						SAVE RECORD:C53([COMPANIES_RECORD_ANALYSIS:146])
					Else 
						$_t_Issues:=""
					End if 
				End while 
			End if 
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			$_l_RecordNumber:=Record number:C243([COMPANIES:2])
			ADD TO SET:C119([COMPANIES:2]; "CMaster")
			If ($_t_Contact1#"")
				Contacts_ImpNJT($_t_Contact1; $_t_JobTitle1; $_t_Salutation1)
			End if 
			If ($_t_Contact2#"")
				Contacts_ImpNJT($_t_Contact2; $_t_JobTitle2; $_t_Salutation2)
			End if 
			
			If ($_t_AgeCompany#"")
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Status:12="AGE"; *)
				QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Company_Name:2=$_t_AgeCompany; *)
				QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Postal_Code:7=$_t_AgePostalCode)
				If (Records in selection:C76([COMPANIES:2])=0)
					MESSAGE:C88("  Agency: "+$_t_AgeCompany+Char:C90(13))
					CREATE RECORD:C68([COMPANIES:2])
					[COMPANIES:2]Company_Name:2:=Uppers3(Lowercase:C14($_t_AgeCompany))
					vCompName:=$_t_AgeCompany
					Company_No
					[COMPANIES:2]Address_Line_one:3:=$_t_AgeAddressLine1
					[COMPANIES:2]Address_Line_two:4:=$_t_AgeAddressLine2
					[COMPANIES:2]Town_or_City:5:=$_t_AgeAddressTown
					[COMPANIES:2]County_or_State:6:=$_t_AgeAddressCounty
					[COMPANIES:2]Postal_Code:7:=$_t_AgePostalCode
					Companies_ImpMP
					$_bo_SSCOK:=Check_SSC([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Town_or_City:5; ->[COMPANIES:2]Mailsort_SSC:49)
					[COMPANIES:2]Area:11:=$_t_AgeArea
					[COMPANIES:2]Telephone:9:=$_t_AgeTelephone
					[COMPANIES:2]Fax:10:=$_t_AgeFax
					[COMPANIES:2]Status:12:="AGE"
					[COMPANIES:2]Entry_Date:16:=<>DB_d_CurrentDate
					[COMPANIES:2]Modified_Date:32:=<>DB_d_CurrentDate
					[COMPANIES:2]Omit:17:="N"
					DB_SaveRecord(->[COMPANIES:2])
					AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
					ADD TO SET:C119([COMPANIES:2]; "CMaster")
					If ($_t_AgeContact1#"")
						Contacts_ImpNJT($_t_AgeContact1; $_t_AgeJobTitle1; $_t_AgeSalutation1)
					End if 
					If ($_t_AgeContact2#"")
						Contacts_ImpNJT($_t_AgeContact2; $_t_AgeJobTitle2; $_t_AgeSalutation2)
					End if 
				End if 
				$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
				GOTO RECORD:C242([COMPANIES:2]; $_l_RecordNumber)
				[COMPANIES:2]Superior:34:=$_t_CompanyCode
				DB_SaveRecord(->[COMPANIES:2])
				AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			End if 
		End if 
		
	Else 
		If (vSource="GBP")
			$_t_RecordAccountNumber:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CompanyName:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AddressLine1:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AddressLine2:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AddressTown:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AddressCounty:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AddressPostCode:=First_Field(->vT; $_t_FieldDelimiter)
			If ($_t_AddressPostCode#"")
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_RecordAccountNumber)
				If (Records in selection:C76([COMPANIES:2])>0)
					If (([COMPANIES:2]Company_Name:2=$_t_CompanyName) & ([COMPANIES:2]Address_Line_one:3=$_t_AddressLine1))
						$_l_ImportedCount:=$_l_ImportedCount+1
						MESSAGE:C88(String:C10($_l_ImportedCount)+"  "+$_t_RecordAccountNumber+"  "+$_t_CompanyName+"  "+$_t_AddressPostCode+Char:C90(13))
						[COMPANIES:2]Address_Line_two:4:=$_t_AddressLine2
						[COMPANIES:2]Town_or_City:5:=$_t_AddressTown
						$_t_Department:=LastWord2([COMPANIES:2]Town_or_City:5)
						$_l_NumericDepartment:=Num:C11($_t_Department)
						If ($_l_NumericDepartment>0)
							[COMPANIES:2]Town_or_City:5:=Substring:C12([COMPANIES:2]Town_or_City:5; 1; Length:C16([COMPANIES:2]Town_or_City:5)-Length:C16($_t_Department)-1)
						End if 
						$_t_Department:=LastWord2([COMPANIES:2]Town_or_City:5)
						$_l_NumericDepartment:=Num:C11($_t_Department)
						If ($_l_NumericDepartment>0)
							[COMPANIES:2]Town_or_City:5:=Substring:C12([COMPANIES:2]Town_or_City:5; 1; Length:C16([COMPANIES:2]Town_or_City:5)-Length:C16($_t_Department)-1)
						End if 
						[COMPANIES:2]County_or_State:6:=$_t_AddressCounty
						$_t_Department:=LastWord2([COMPANIES:2]County_or_State:6)
						$_l_NumericDepartment:=Num:C11($_t_Department)
						If ($_l_NumericDepartment>0)
							[COMPANIES:2]County_or_State:6:=Substring:C12([COMPANIES:2]County_or_State:6; 1; Length:C16([COMPANIES:2]County_or_State:6)-Length:C16($_t_Department)-1)
						End if 
						$_t_Department:=LastWord2([COMPANIES:2]County_or_State:6)
						$_l_NumericDepartment:=Num:C11($_t_Department)
						If ($_l_NumericDepartment>0)
							[COMPANIES:2]County_or_State:6:=Substring:C12([COMPANIES:2]County_or_State:6; 1; Length:C16([COMPANIES:2]County_or_State:6)-Length:C16($_t_Department)-1)
						End if 
						[COMPANIES:2]Postal_Code:7:=$_t_AddressPostCode
						$_bo_SSCOK:=Check_Postcode([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Mailsort_OFN:50)
						$_bo_SSCOK:=Check_SSC([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Town_or_City:5; ->[COMPANIES:2]Mailsort_SSC:49)
						DB_SaveRecord(->[COMPANIES:2])
						AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
						ADD TO SET:C119([COMPANIES:2]; "Master")
					End if 
				End if 
			End if 
		Else 
			MOD_FieldValue:=""
			RemoveLeadTr(First_Field(->vT; $_t_FieldDelimiter); ->MOD_FieldValue)
			$_t_s1:=MOD_FieldValue
			$_t_s1:=Replace string:C233($_t_s1; Char:C90(34); "'")
			RemoveLeadTr(First_Field(->vT; $_t_FieldDelimiter); ->MOD_FieldValue)
			$_t_S2:=MOD_FieldValue
			$_t_S2:=Replace string:C233($_t_S2; Char:C90(34); "'")
			RemoveLeadTr(First_Field(->vT; $_t_FieldDelimiter); ->MOD_FieldValue)
			$_t_S3:=MOD_FieldValue
			$_t_S3:=Replace string:C233($_t_S3; Char:C90(34); "'")
			RemoveLeadTr(First_Field(->vT; $_t_FieldDelimiter); ->MOD_FieldValue)
			$_t_S3:=MOD_FieldValue
			$_t_S4:=Replace string:C233($_t_S4; Char:C90(34); "'")
			
			RemoveLeadTr(First_Field(->vT; $_t_FieldDelimiter); ->MOD_FieldValue)
			$_t_S5:=MOD_FieldValue
			$_t_S5:=Replace string:C233($_t_S5; Char:C90(34); "'")
			RemoveLeadTr(First_Field(->vT; $_t_FieldDelimiter); ->MOD_FieldValue)
			$_t_S6:=MOD_FieldValue
			$_t_S6:=Replace string:C233($_t_S6; Char:C90(34); "'")
			RemoveLeadTr(First_Field(->vT; $_t_FieldDelimiter); ->MOD_FieldValue)
			$_t_RecordAccountNumber:=MOD_FieldValue
			RemoveLeadTr(First_Field(->vT; $_t_FieldDelimiter); ->MOD_FieldValue)
			$_t_Status:=MOD_FieldValue
			
			If (Character code:C91($_t_s1[[1]])=10)
				$_t_s1:=Substring:C12($_t_s1; 2; 32000)
			End if 
			If ($_t_S2="")
				$_t_S2:=$_t_S3
				$_t_S3:=$_t_S4
				$_t_S4:=$_t_S5
				$_t_S5:=$_t_S6
				$_t_S6:=""
			End if 
			
			$_t_TFS:=""
			$_t_CompanyName:=""
			$_t_Address1R:=""
			$_t_Address2R:=""
			$_t_AddressTown:=""
			$_t_AddressCounty:=""
			$_t_AddressPostCode:=""
			$_t_AddressCountry:=""
			$_t_JobTitle:=""
			$_t_Title:=""
			$_t_ForeName:=""
			$_t_Surname:=""
			$_t_Qualifications:=""
			$_t_FS:=""
			$_t_AddressCountry:=""
			
			$_l_Create:=0
			
			If (($_t_s1#"") & ($_t_RecordAccountNumber#""))
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_RecordAccountNumber)
				If (Records in selection:C76([COMPANIES:2])=0)
					CREATE RECORD:C68([COMPANIES:2])
					[COMPANIES:2]Company_Code:1:=$_t_RecordAccountNumber
					$_l_Create:=1
				End if 
				$_l_ImportedCount:=$_l_ImportedCount+1
				MESSAGE:C88(String:C10($_l_ImportedCount)+"  "+$_t_s1+"  "+$_t_RecordAccountNumber+Char:C90(13))
				$_l_NumericDepartment:=1
				
				$_t_FirstWord:=FirstWord($_t_s1)
				$_t_FirstCharacter:=FirstWord(Substring:C12($_t_s1; Length:C16($_t_FirstWord)+2; 32000))
				If ((($_t_FirstWord="Mr") | ($_t_FirstWord="Mrs") | ($_t_FirstWord="Ms") | ($_t_FirstWord="Miss") | ($_t_FirstWord="Miss") | ($_t_FirstWord="Dr") | ($_t_FirstWord="Lord") | ($_t_FirstWord="Lady") | ($_t_FirstWord="Sir")) & ($_t_FirstCharacter#"The"))
					$_t_TFS:=$_t_s1
					$_t_CompanyName:=$_t_S2
					$_l_NumericDepartment:=2
				Else 
					If (($_t_s1[[2]]=" ") & (Not:C34(Str_IsAComp($_t_s1))))
						$_t_FS:=$_t_s1
						$_t_CompanyName:=$_t_S2
						$_l_NumericDepartment:=2
					Else 
						$_t_CompanyName:=$_t_s1
					End if 
				End if 
				
				If ((($_t_CompanyName="The @") | ($_t_CompanyName="@manag@") | ($_t_CompanyName="@Director@") | ($_t_CompanyName="@Director@") | ($_t_CompanyName="@asst@") | ($_t_CompanyName="@ENG'R@") | ($_t_CompanyName="@ENG'R@")) & (Not:C34(Str_IsAComp($_t_CompanyName))))
					
					$_t_JobTitle:=$_t_CompanyName
					If ($_t_JobTitle="Mr the@")
						$_t_JobTitle:=Substring:C12($_t_JobTitle; 4; 32000)
					End if 
					If ($_l_NumericDepartment=1)
						$_t_CompanyName:=$_t_S2
						$_l_NumericDepartment:=2
					Else 
						$_t_CompanyName:=$_t_S3
						$_l_NumericDepartment:=3
					End if 
				Else 
					
					If (($_t_CompanyName="@ Plant@") | ($_t_CompanyName="@Tech @"))
						$_t_JobTitle:=$_t_CompanyName
						If ($_l_NumericDepartment=1)
							$_t_CompanyName:=$_t_S2
							$_l_NumericDepartment:=2
						Else 
							$_t_CompanyName:=$_t_S3
							$_l_NumericDepartment:=3
						End if 
					End if 
				End if 
				
				If ($_l_NumericDepartment=1)
					vTitle1:=$_t_S2
					vTitle2:=$_t_S3
					vTitle3:=$_t_S4
					vTitle4:=$_t_S5
					vTitle5:=$_t_S6
				Else 
					If ($_l_NumericDepartment=2)
						vTitle1:=$_t_S3
						vTitle2:=$_t_S4
						vTitle3:=$_t_S5
						vTitle4:=$_t_S6
						vTitle5:=""
					Else 
						vTitle1:=$_t_S4
						vTitle2:=$_t_S5
						vTitle3:=$_t_S6
						vTitle4:=""
						vTitle5:=""
					End if 
				End if 
				
				$_l_VarNumber:=5
				$_ptr_Variable:=Get pointer:C304("vTitle"+String:C10($_l_VarNumber))
				While (($_l_VarNumber>1) & ($_ptr_Variable->=""))
					IDLE:C311  // 03/04/03 pb
					$_l_VarNumber:=$_l_VarNumber-1
					$_ptr_Variable:=Get pointer:C304("vTitle"+String:C10($_l_VarNumber))
				End while 
				
				$_t_PCTest:=RemoveLeadTr($_ptr_Variable->)
				If (Str_IsACountry($_t_PCTest))
					$_t_AddressCountry:=$_t_PCTest
					If ($_l_VarNumber>1)
						$_l_VarNumber:=$_l_VarNumber-1
						$_ptr_Variable:=Get pointer:C304("vTitle"+String:C10($_l_VarNumber))
					End if 
				End if 
				
				$_t_PCTest:=$_ptr_Variable->
				$_t_PC2:=LastWord2($_t_PCTest)
				$_t_PCTest:=Substring:C12($_t_PCTest; 1; Length:C16($_t_PCTest)-Length:C16($_t_PC2)-1)
				$_t_PC1:=LastWord2($_t_PCTest)
				If (($_t_PC1="") | (Length:C16($_t_PC1)>4) | (Check_PC_AN($_t_PC1)#"@N@"))
					$_t_PC1:=$_t_PC2
					$_t_PC2:=""
				End if 
				If ($_t_PC1#"")
					If ($_t_PC2#"")
						If (Check_Postcode($_t_PC1+" "+$_t_PC2; ->[COMPANIES:2]Mailsort_OFN:50))
							$_t_AddressPostCode:=$_t_PC1+" "+$_t_PC2
						End if 
					Else 
						If (Check_Postcode($_t_PC1; ->[COMPANIES:2]Mailsort_OFN:50))
							$_t_AddressPostCode:=$_t_PC1
						End if 
					End if 
				End if 
				
				If ($_t_AddressPostCode#"")
					$_ptr_Variable->:=Substring:C12($_t_PCTest; 1; Length:C16($_ptr_Variable->)-Length:C16($_t_AddressPostCode)-1)
				End if 
				
				If (vTitle5#"")
					$_t_Address1R:=vTitle1
					$_t_Address2R:=vTitle2+", "+vTitle3
					$_t_AddressTown:=vTitle4
					$_t_AddressCounty:=vTitle5
				Else 
					If ((vTitle4#"") | (Str_IsARoad(vTitle2)))
						$_t_Address1R:=vTitle1
						$_t_Address2R:=vTitle2
						$_t_AddressTown:=vTitle3
						$_t_AddressCounty:=vTitle4
					Else 
						If ((vTitle3#"") | (Str_IsARoad(vTitle1)))
							$_t_Address1R:=vTitle1
							$_t_AddressTown:=vTitle2
							$_t_AddressCounty:=vTitle3
						Else 
							If (vTitle2#"")
								$_t_AddressTown:=vTitle1
								$_t_AddressCounty:=vTitle2
							Else 
								$_t_AddressTown:=vTitle1
							End if 
						End if 
					End if 
				End if 
				
				$_t_CompanyName:=RemoveLeadTr(Uppers2(Lowercase:C14($_t_CompanyName)))
				[COMPANIES:2]Company_Name:2:=$_t_CompanyName
				[COMPANIES:2]Address_Line_one:3:=RemoveLeadTr(Uppers2(Lowercase:C14($_t_Address1R)))
				[COMPANIES:2]Address_Line_two:4:=RemoveLeadTr(Uppers2(Lowercase:C14($_t_Address2R)))
				[COMPANIES:2]Town_or_City:5:=RemoveLeadTr(Uppers2(Lowercase:C14($_t_AddressTown)))
				[COMPANIES:2]County_or_State:6:=RemoveLeadTr(Uppers2(Lowercase:C14($_t_AddressCounty)))
				[COMPANIES:2]Postal_Code:7:=$_t_AddressPostCode
				$_bo_SSCOK:=Check_SSC([COMPANIES:2]Postal_Code:7; ->[COMPANIES:2]Town_or_City:5; ->[COMPANIES:2]Mailsort_SSC:49)
				[COMPANIES:2]Country:8:=Uppers2(Lowercase:C14($_t_AddressCountry))
				[COMPANIES:2]Status:12:=$_t_Status
				If ([COMPANIES:2]Entry_Date:16=!00-00-00!)
					[COMPANIES:2]Entry_Date:16:=<>DB_d_CurrentDate
				End if 
				[COMPANIES:2]Modified_Date:32:=<>DB_d_CurrentDate
				[COMPANIES:2]Omit:17:="N"
				If ((Not:C34(Str_IsAComp($_t_CompanyName))) & (($_t_TFS#"") | ($_t_FS#"")))
					[COMPANIES:2]Private:37:=True:C214
				End if 
				DB_SaveRecord(->[COMPANIES:2])
				AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
				If ($_l_Create=1)
					ADD TO SET:C119([COMPANIES:2]; "CMaster")
				Else 
					ADD TO SET:C119([COMPANIES:2]; "Master")
				End if 
				
				If (($_t_TFS#"") | ($_t_FS#""))
					If ($_t_TFS#"")
						$_t_Title:=FirstWord($_t_TFS)
						$_t_TFS:=Substring:C12($_t_TFS; Length:C16($_t_Title)+2; 50)
					Else 
						$_t_TFS:=$_t_FS
					End if 
					$_t_ForeName:=FirstWord($_t_TFS)
					$_t_TFS:=Substring:C12($_t_TFS; Length:C16($_t_ForeName)+2; 50)
					$_t_Surname:=FirstWord($_t_TFS)
					While (Length:C16($_t_Surname)=1)
						IDLE:C311  // 03/04/03 pb
						$_t_ForeName:=$_t_ForeName+" "+$_t_Surname
						$_t_TFS:=Substring:C12($_t_TFS; Length:C16($_t_Surname)+2; 50)
						$_t_Surname:=FirstWord($_t_TFS)
					End while 
					$_t_TFS:=RemoveLeadTr(Substring:C12($_t_TFS; Length:C16($_t_Surname)+2; 50))
					If ($_t_TFS#"")
						If ($_t_Qualifications#"")
							$_t_Surname:=$_t_Surname+" "+$_t_TFS
						Else 
							$_t_Qualifications:=$_t_TFS
						End if 
					End if 
				End if 
				
				If (($_t_Surname#"") | ($_t_ForeName#"") | ($_t_Qualifications#"") | ($_t_JobTitle#""))
					CREATE RECORD:C68([CONTACTS:1])
					[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
					If (<>MultiCo)
						CREATE RECORD:C68([CONTACTS_COMPANIES:145])
						[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
						
						[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
						[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
						
						[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
						DB_SaveRecord(->[CONTACTS_COMPANIES:145])
					End if 
					Contact_Code
					[CONTACTS:1]Surname:5:=RemoveLeadTr(Uppers2(UppersSurname(Lowercase:C14($_t_Surname)); 1))
					[CONTACTS:1]Forename:4:=RemoveLeadTr(Uppers2(Lowercase:C14($_t_ForeName); 1))
					[CONTACTS:1]Title:3:=RemoveLeadTr(Uppers2(Lowercase:C14($_t_Title); 1))
					[CONTACTS:1]Job_Title:6:=RemoveLeadTr(UppersBetBrack(Uppers2(Lowercase:C14($_t_JobTitle); 1)))
					[CONTACTS:1]Role:11:=<>DefRole
					[CONTACTS:1]Qualifications:13:=$_t_Qualifications
					DB_SaveRecord(->[CONTACTS:1])
					AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
				End if 
			End if 
			
		End if 
	End if 
	RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
End while 
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
WS_KeepFocus

Companies_ImpEn
ERR_MethodTrackerReturn("Companies_ImpGB"; $_t_oldMethodName)
