//%attributes = {}
If (False:C215)
	//Project Method Name:      Adept_Mail
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/02/2010 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307($_d_ModifiedDate)
	C_LONGINT:C283($_l_CodeisUnique; $_l_EndofLine; $_l_OK; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_AddressLine1; $_t_AddressLine2; $_t_Area; $_t_Comments; $_t_CompanyCode; $_t_CompanyName; $_t_CompanyStatus; $_t_Contract; $_t_CountyorState; $_t_DefaultComments; $_t_Department)
	C_TEXT:C284($_t_FieldDelimiter; $_t_Forename; $_t_IncomingText; $_t_Location; $_t_oldMethodName; $_t_Position; $_t_PostalCode; $_t_ProductCode; $_t_Products; $_t_Source; $_t_Surname)
	C_TEXT:C284($_t_TelephoneExtension; $_t_Title; $_t_TownorCity; vSolution)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Adept_Mail")
//Adept_Mail
SET CHANNEL:C77(11)
Gen_Alert("Please locate the Mail text file.....")
SET CHANNEL:C77(10; "")
$_t_FieldDelimiter:=Char:C90(9)
If (OK=1)
	
	
	//ON EVENT CALL("Remote Event")
	Open_PrD_Window("Adept Import")
	MESSAGE:C88(Char:C90(13)+"   Press Esc to Stop"+Char:C90(13)+Char:C90(13))
	$_t_IncomingText:=""
	Repeat 
		RECEIVE PACKET:C104($_t_IncomingText; Char:C90(13))
		$_l_OK:=OK
		If (Length:C16($_t_IncomingText)>3)
			$_t_AddressLine1:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_AddressLine2:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_PostalCode:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_TownorCity:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_Contract:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)  //Was vCheck
			$_t_Comments:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_CompanyName:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			If (($_t_CompanyName="") & ($_t_AddressLine1="") & ($_t_AddressLine2=""))
				$_l_OK:=0
			End if 
			MESSAGE:C88($_t_CompanyName+Char:C90(13))
			
			$_t_CountyorState:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_d_ModifiedDate:=Date:C102(First_Field(->$_t_IncomingText; $_t_FieldDelimiter))
			$_t_CompanyStatus:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_Department:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_Location:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)  //Was vDisk
			$_t_Forename:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_Source:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_Area:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)  //Was vOn
			$_t_Position:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_Products:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)  //Was vProds
			$_t_Surname:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_TelephoneExtension:=First_Field(->$_t_IncomingText; $_t_FieldDelimiter)
			$_t_Title:=$_t_IncomingText
			
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName; *)
			QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Postal_Code:7=$_t_PostalCode)
			If (Records in selection:C76([COMPANIES:2])=0)
				CREATE RECORD:C68([COMPANIES:2])
				[COMPANIES:2]Company_Name:2:=$_t_CompanyName
				[COMPANIES:2]Address_Line_one:3:=$_t_AddressLine1
				[COMPANIES:2]Address_Line_two:4:=$_t_AddressLine2
				[COMPANIES:2]Town_or_City:5:=$_t_TownorCity
				[COMPANIES:2]County_or_State:6:=$_t_CountyorState
				[COMPANIES:2]Postal_Code:7:=$_t_PostalCode
				[COMPANIES:2]Telephone:9:=$_t_TelephoneExtension
				[COMPANIES:2]Status:12:=$_t_CompanyStatus
				Repeat 
					$_t_CompanyCode:=Substring:C12([COMPANIES:2]Company_Name:2; 1; 4)+Gen_CodePref(1; ->[COMPANIES:2]Company_Code:1; Substring:C12([COMPANIES:2]Company_Name:2; 1; 4))
					SET QUERY DESTINATION:C396(3; $_l_CodeisUnique)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
					If ($_l_CodeisUnique=0)
						[COMPANIES:2]Company_Code:1:=$_t_CompanyCode
					End if 
					SET QUERY DESTINATION:C396(0)
				Until ($_l_CodeisUnique=0)
				[COMPANIES:2]Entry_Date:16:=$_d_ModifiedDate
				[COMPANIES:2]Modified_Date:32:=$_d_ModifiedDate
				DB_SaveRecord(->[COMPANIES:2])
				AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			End if 
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_Surname; *)
			QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
			If (Records in selection:C76([CONTACTS:1])=0)
				CREATE RECORD:C68([CONTACTS:1])
				[CONTACTS:1]Contact_Code:2:=Gen_CodePref(2; ->[CONTACTS:1]Contact_Code:2)
				[CONTACTS:1]Title:3:=$_t_Title
				[CONTACTS:1]Forename:4:=$_t_Forename
				[CONTACTS:1]Surname:5:=$_t_Surname
				[CONTACTS:1]Dept:8:=$_t_Department
				[CONTACTS:1]Job_Title:6:=$_t_Position
				[CONTACTS:1]Extn:9:=$_t_TelephoneExtension
				[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
				[CONTACTS:1]Entry_Date:17:=$_d_ModifiedDate
				CREATE RECORD:C68([CONTACTS_COMPANIES:145])
				[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
				[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
				[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
				[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
				[CONTACTS_COMPANIES:145]Address_Type:2:="WORK"
				DB_SaveRecord(->[CONTACTS_COMPANIES:145])
				
				DB_SaveRecord(->[CONTACTS:1])
				AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
			End if 
			
			If ($_t_Contract="DNS")
				[COMPANIES:2]Omit:17:="Y"
			Else 
				[COMPANIES:2]Omit:17:="N"
			End if 
			
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			
			$_t_DefaultComments:=$_t_Comments  //Was vComments2
			Repeat 
				$_t_Comments:=$_t_DefaultComments
				CREATE RECORD:C68([ORDERS:24])
				[ORDERS:24]State:15:=-3
				[ORDERS:24]Company_Code:1:=[COMPANIES:2]Company_Code:1
				[ORDERS:24]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
				[ORDERS:24]Order_Code:3:=Gen_CodePref(6; ->[ORDERS:24]Order_Code:3)
				[ORDERS:24]Enquiry_Date:25:=$_d_ModifiedDate
				
				$_l_EndofLine:=Position:C15(Char:C90(32); $_t_Source)
				If (($_l_EndofLine=0) & (Length:C16($_t_Source)>1))
					vSolution:=$_t_Source  //Was vSourceCode
					$_t_Source:=""
				Else 
					vSolution:=Substring:C12($_t_Source; 1; ($_l_EndofLine-1))
					$_t_Source:=Delete string:C232($_t_Source; 1; $_l_EndofLine)
					$_l_EndofLine:=Position:C15(Char:C90(32); $_t_Source)
					If ($_l_EndofLine=1)
						$_t_Source:=""
					End if 
				End if 
				
				QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Code:1=vSolution)
				If (Records in selection:C76([SOURCES:6])=1)
					If (False:C215)
						[ORDERS:24]Source:18:=[SOURCES:6]Source_Code:1
						
						[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[COMPANIES:2]Company_Code:1
						[COMPANIES_RECORD_ANALYSIS:146]ID:2:=AA_GetNextID(->[COMPANIES_RECORD_ANALYSIS:146]ID:2)
						[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1:=[SOURCES:6]Source_Code:1
						DB_SaveRecord(->[COMPANIES_RECORD_ANALYSIS:146])
					Else 
						//not putting an alternative here-not used
					End if 
				Else 
					CREATE RECORD:C68([SOURCES:6])
					[SOURCES:6]Source_Code:1:=vSolution
					[SOURCES:6]Source_Name:2:=vSolution
					DB_SaveRecord(->[SOURCES:6])
					[ORDERS:24]Source:18:=[SOURCES:6]Source_Code:1
					CREATE RECORD:C68([COMPANIES_RECORD_ANALYSIS:146])
					[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[COMPANIES:2]Company_Code:1
					[COMPANIES_RECORD_ANALYSIS:146]ID:2:=AA_GetNextID(->[COMPANIES_RECORD_ANALYSIS:146]ID:2)
					[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1:=[SOURCES:6]Source_Code:1
					DB_SaveRecord(->[COMPANIES_RECORD_ANALYSIS:146])
					
				End if 
				DB_SaveRecord(->[COMPANIES:2])
				AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
				DB_SaveRecord(->[ORDERS:24])
				AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
				Repeat 
					CREATE RECORD:C68([ORDER_ITEMS:25])
					[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
					$_l_EndofLine:=Position:C15(Char:C90(32); $_t_Comments)
					If ($_l_EndofLine<=1)
						$_t_ProductCode:=$_t_Comments
						$_t_Comments:=""
					Else 
						$_t_ProductCode:=Substring:C12($_t_Comments; 1; ($_l_EndofLine-1))
						$_t_Comments:=Delete string:C232($_t_Comments; 1; $_l_EndofLine)
					End if 
					[ORDER_ITEMS:25]Product_Code:2:=$_t_ProductCode+$_t_Area+$_t_Location
					[ORDER_ITEMS:25]Product_Name:13:=$_t_ProductCode+" "+$_t_Area+" "+$_t_Location
					[ORDER_ITEMS:25]Item_Number:27:=Gen_Code(14; ->[ORDER_ITEMS:25]Item_Number:27)
					
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				Until (Length:C16($_t_Comments)<=1)
				
				DB_SaveRecord(->[ORDERS:24])
				AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
			Until (Length:C16($_t_Source)<=1)
			
			If (Length:C16($_t_Products)>1)
				CREATE RECORD:C68([ORDERS:24])
				[ORDERS:24]State:15:=-0
				[ORDERS:24]Company_Code:1:=[COMPANIES:2]Company_Code:1
				[ORDERS:24]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
				[ORDERS:24]Order_Code:3:=Gen_CodePref(6; ->[ORDERS:24]Order_Code:3)
				[ORDERS:24]Order_Date:4:=$_d_ModifiedDate
				
				Repeat 
					CREATE RECORD:C68([ORDER_ITEMS:25])
					[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
					$_l_EndofLine:=Position:C15(Char:C90(32); $_t_Products)
					If (($_l_EndofLine<=1) & (Length:C16($_t_Products)>1))
						$_t_ProductCode:=$_t_Products
						$_t_Products:=""
					Else 
						$_t_ProductCode:=Substring:C12($_t_Products; 1; ($_l_EndofLine-1))
						$_t_Products:=Delete string:C232($_t_Products; 1; $_l_EndofLine)
					End if 
					[ORDER_ITEMS:25]Product_Code:2:=$_t_ProductCode+$_t_Area+$_t_Location
					[ORDER_ITEMS:25]Product_Name:13:=$_t_ProductCode+" "+$_t_Area+" "+$_t_Location
					[ORDER_ITEMS:25]Item_Number:27:=Gen_Code(14; ->[ORDER_ITEMS:25]Item_Number:27)
					[ORDER_ITEMS:25]Delivery_Date:11:=$_d_ModifiedDate
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				Until (Length:C16($_t_Products)<=1)
				DB_SaveRecord(->[ORDERS:24])
				AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
			End if 
		Else 
			$_l_OK:=0
		End if 
	Until ($_l_OK=0)
	SET CHANNEL:C77(11)
	
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	WS_KeepFocus
	
	ON EVENT CALL:C190("")
End if 
ERR_MethodTrackerReturn("Adept_Mail"; $_t_oldMethodName)
