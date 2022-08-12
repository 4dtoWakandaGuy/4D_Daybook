//%attributes = {}
If (False:C215)
	//Project Method Name:      Import_Dealers
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
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Count; $_l_Create; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>DefRole; <>PER_t_CurrentUserInitials; $_t_AddressLine1; $_t_AddressLine2; $_t_AddressLine3; $_t_AddressSearch; $_t_CompanyName; $_t_ContactName; $_t_Country; $_t_County; $_t_DealName)
	C_TEXT:C284($_t_Department; $_t_FieldDelimiter; $_t_ForeName; $_t_oldMethodName; $_t_PostCode; $_t_RecordDelimiter; $_t_Surname; $_t_Telephone; $_t_Title; $_t_Town; vArea)
	C_TEXT:C284(vCompName; vSales; vSource; vStatus; vT; vText; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Import_Dealers")
//Import_Dealers
$_l_Count:=0
Open_PrD_Window("Import_Dealers: Command-. to Cancel")
$_t_RecordDelimiter:=Char:C90(13)
$_t_FieldDelimiter:=Char:C90(9)
RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
	IDLE:C311  // 03/04/03 pb
	RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
	vT:=vText
	$_t_DealName:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_CompanyName:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_AddressLine1:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_AddressLine2:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_AddressLine3:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_Town:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_County:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_PostCode:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_Telephone:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_ContactName:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	
	If ($_t_AddressLine3#"")
		$_t_AddressLine1:=$_t_AddressLine1+", "+$_t_AddressLine2
		$_t_AddressLine2:=$_t_AddressLine3
	End if 
	
	$_t_Surname:=LastWord2($_t_ContactName)
	$_t_Title:=FirstWord($_t_ContactName)
	$_t_ForeName:=RemoveTrail2(RemoveLead(Substring:C12($_t_ContactName; Length:C16($_t_Title)+2; Length:C16($_t_ContactName)-Length:C16($_t_Title)-Length:C16($_t_Surname)-2)))
	
	$_l_Create:=0
	If ($_t_CompanyName#"")
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName; *)
		QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Town_or_City:5=$_t_Town)
		If (Records in selection:C76([COMPANIES:2])>1)
			$_t_AddressSearch:=Substring:C12($_t_AddressLine1; 1; 8)
			QUERY SELECTION:C341([COMPANIES:2]Address_Line_one:3=$_t_AddressSearch)
		End if 
		If (Records in selection:C76([COMPANIES:2])=0)
			CREATE RECORD:C68([COMPANIES:2])
			vCompName:=$_t_CompanyName
			Company_No
			$_l_Create:=1
		End if 
		$_l_Count:=$_l_Count+1
		MESSAGE:C88(String:C10($_l_Count)+"  "+$_t_CompanyName+Char:C90(13))
		[COMPANIES:2]Company_Name:2:=$_t_CompanyName
		[COMPANIES:2]Address_Line_one:3:=$_t_AddressLine1
		[COMPANIES:2]Address_Line_two:4:=$_t_AddressLine2
		[COMPANIES:2]Town_or_City:5:=Uppercase:C13($_t_Town)
		[COMPANIES:2]County_or_State:6:=$_t_County
		[COMPANIES:2]Postal_Code:7:=$_t_PostCode
		[COMPANIES:2]Telephone:9:=$_t_Telephone
		[COMPANIES:2]Status:12:=vStatus
		[COMPANIES:2]Company_Type:13:=vType
		[COMPANIES:2]Source:14:=vSource
		If ([COMPANIES:2]Entry_Date:16=!00-00-00!)
			[COMPANIES:2]Entry_Date:16:=<>DB_d_CurrentDate
		End if 
		[COMPANIES:2]Modified_Date:32:=<>DB_d_CurrentDate
		[COMPANIES:2]Omit:17:="N"
		[COMPANIES:2]Area:11:=vArea
		[COMPANIES:2]Taken_By:26:=<>PER_t_CurrentUserInitials
		[COMPANIES:2]Sales_Person:29:=vSales
		[COMPANIES:2]Comments:30:=[COMPANIES:2]Comments:30+$_t_DealName+Char:C90(13)
		DB_SaveRecord(->[COMPANIES:2])
		AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
		If ($_l_Create=1)
			ADD TO SET:C119([COMPANIES:2]; "CMaster")
		Else 
			ADD TO SET:C119([COMPANIES:2]; "Master")
		End if 
		
		If ($_t_Surname#"")
			If ($_l_Create=0)
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
				QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname)
			End if 
			If ((Records in selection:C76([CONTACTS:1])=0) | ($_l_Create=1))
				CREATE RECORD:C68([CONTACTS:1])
				[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
				Contact_Code
				[CONTACTS:1]Surname:5:=$_t_Surname
			End if 
			[CONTACTS:1]Forename:4:=$_t_ForeName
			[CONTACTS:1]Title:3:=$_t_Title
			[CONTACTS:1]Job_Title:6:="Dealer Principal"
			[CONTACTS:1]Role:11:=<>DefRole
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		End if 
		
	End if 
	
End while 
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
Companies_ImpEn
ERR_MethodTrackerReturn("Import_Dealers"; $_t_oldMethodName)