//%attributes = {}
If (False:C215)
	//Project Method Name:      Import_Kompass
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
	C_LONGINT:C283($_l_COunt; $_l_Create; $_l_WindowReferenceRow; vAdd; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>DefRole; <>PER_t_CurrentUserInitials; $_t_AddressLine1; $_t_AddressLine2; $_t_CompanyAddress1; $_t_CompanyName; $_t_County; $_t_Employees; $_t_FieldDelimiter; $_t_ForeName; $_t_JobTitle)
	C_TEXT:C284($_t_oldMethodName; $_t_PostalCode; $_t_Qualifications; $_t_RecordDelimiter; $_t_RecordNumber; $_t_Salutation; $_t_Surname; $_t_Telephone; $_t_Town; vArea; vCompName)
	C_TEXT:C284(vSales; vSource; vStatus; vT; vText; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Import_Kompass")
//Import_Kompass
Start_Process
Companies_File
vAdd:=1
Gen_Confirm("Have you copied the names to pure Text format?"; "Yes"; "No")
Companies_ImpQs
If (OK=1)
	$_l_COunt:=0
	Open_PrD_Window("Kompass Import")
	$_t_RecordDelimiter:=Char:C90(13)
	$_t_FieldDelimiter:=","
	vText:="sdfsdf"
	While (Length:C16(vText)>3)
		IDLE:C311  // 03/04/03 pb
		RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
		vT:=vText
		$_t_RecordNumber:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_Salutation:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_ForeName:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_Surname:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_Qualifications:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_JobTitle:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_CompanyName:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_AddressLine1:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_AddressLine2:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_Town:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_County:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_PostalCode:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_Salutation:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_Telephone:=First_Field(->vT; $_t_FieldDelimiter)
		$_t_Employees:=First_Field(->vT; $_t_FieldDelimiter)
		$_l_Create:=0
		
		If (($_t_RecordNumber#"") & ($_t_CompanyName#""))
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName; *)
			QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Town_or_City:5=$_t_Town)
			If (Records in selection:C76([COMPANIES:2])>1)
				$_t_CompanyAddress1:=Substring:C12($_t_AddressLine1; 1; 8)
				QUERY SELECTION:C341([COMPANIES:2]Address_Line_one:3=$_t_CompanyAddress1)
			End if 
			If (Records in selection:C76([COMPANIES:2])=0)
				CREATE RECORD:C68([COMPANIES:2])
				vCompName:=$_t_CompanyName
				Company_No
				$_l_Create:=1
			End if 
			$_l_COunt:=$_l_COunt+1
			MESSAGE:C88(String:C10($_l_COunt)+"  "+$_t_CompanyName+Char:C90(13))
			[COMPANIES:2]Company_Name:2:=$_t_CompanyName
			[COMPANIES:2]Address_Line_one:3:=$_t_AddressLine1
			[COMPANIES:2]Address_Line_two:4:=$_t_AddressLine2
			[COMPANIES:2]Town_or_City:5:=Uppercase:C13($_t_Town)
			[COMPANIES:2]County_or_State:6:=$_t_County
			[COMPANIES:2]Postal_Code:7:=$_t_PostalCode
			[COMPANIES:2]Telephone:9:=$_t_Telephone
			[COMPANIES:2]Status:12:=vStatus
			[COMPANIES:2]Company_Type:13:=vType
			[COMPANIES:2]Source:14:=vSource
			[COMPANIES:2]Size:15:=Num:C11($_t_Employees)
			If ([COMPANIES:2]Entry_Date:16=!00-00-00!)
				[COMPANIES:2]Entry_Date:16:=<>DB_d_CurrentDate
			End if 
			[COMPANIES:2]Modified_Date:32:=<>DB_d_CurrentDate
			[COMPANIES:2]Omit:17:="N"
			[COMPANIES:2]Area:11:=vArea
			[COMPANIES:2]Taken_By:26:=<>PER_t_CurrentUserInitials
			[COMPANIES:2]Sales_Person:29:=vSales
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
				[CONTACTS:1]Title:3:=$_t_Salutation
				[CONTACTS:1]Job_Title:6:=$_t_JobTitle
				[CONTACTS:1]Role:11:=<>DefRole
				DB_SaveRecord(->[CONTACTS:1])
				AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
			End if 
		End if 
		
	End while 
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
	Companies_ImpEn
End if 
Process_End
ERR_MethodTrackerReturn("Import_Kompass"; $_t_oldMethodName)