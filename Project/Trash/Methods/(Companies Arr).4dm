//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies Arr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	//ARRAY BOOLEAN(COM_abo_PrivateAddress;0)
	//ARRAY TEXT(<>Com_at_CompanyDataDisplay;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>Com_bo_DisplayDataInited)
	C_LONGINT:C283($_l_CompaniesCount; $_l_Index; $_l_SelectedElement; $1)
	C_POINTER:C301($_Ptr_FieldPointer)
	C_TEXT:C284(<>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType; vContCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies Arr")
Array_LCx(Records in selection:C76([COMPANIES:2]))
If (Count parameters:C259>=1)
	$_l_SelectedElement:=$1
Else 
	If (Not:C34(<>Com_bo_DisplayDataInited))
		ARRAY TEXT:C222(<>Com_at_CompanyDataDisplay; 10)
		<>Com_at_CompanyDataDisplay{1}:=<>DB_t_TownLabel
		<>Com_at_CompanyDataDisplay{2}:=<>DB_t_CountyLabel
		<>Com_at_CompanyDataDisplay{3}:=<>DB_t_PostcodeLabel
		<>Com_at_CompanyDataDisplay{4}:=<>DB_t_CountryLabel
		<>Com_at_CompanyDataDisplay{5}:="Telephone"
		<>Com_at_CompanyDataDisplay{6}:="Fax"
		<>Com_at_CompanyDataDisplay{7}:="Status"
		<>Com_at_CompanyDataDisplay{8}:="Type"
		<>Com_at_CompanyDataDisplay{9}:="Source"
		<>Com_at_CompanyDataDisplay{10}:="Area"
		<>Com_at_CompanyDataDisplay:=1
		<>Com_bo_DisplayDataInited:=True:C214
	End if 
	$_l_SelectedElement:=<>Com_at_CompanyDataDisplay
End if 

Case of 
	: ($_l_SelectedElement=1)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Town_or_City:5
	: ($_l_SelectedElement=2)
		$_Ptr_FieldPointer:=->[COMPANIES:2]County_or_State:6
	: ($_l_SelectedElement=3)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Postal_Code:7
	: ($_l_SelectedElement=4)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Country:8
	: ($_l_SelectedElement=5)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Telephone:9
	: ($_l_SelectedElement=6)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Fax:10
	: ($_l_SelectedElement=7)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Status:12
	: ($_l_SelectedElement=8)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Company_Type:13
	: ($_l_SelectedElement=9)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Source:14
	: ($_l_SelectedElement=10)
		$_Ptr_FieldPointer:=->[COMPANIES:2]Area:11
	Else 
		$_Ptr_FieldPointer:=->[COMPANIES:2]Town_or_City:5
End case 
SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; GEN_at_RecordCode; [COMPANIES:2]Company_Name:2; GEN_at_Name; $_Ptr_FieldPointer->; GEN_at_Identity; [COMPANIES:2]Private:37; COM_abo_PrivateAddress)
If ((SYS_t_AccessType#"Q") & (DB_t_CurrentFormUsage2#"Contact"))
	$_l_CompaniesCount:=Size of array:C274(GEN_at_Identity)
	For ($_l_Index; 1; $_l_CompaniesCount)
		If (COM_abo_PrivateAddress{$_l_Index})
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=GEN_at_RecordCode{$_l_Index}; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			If ((Records in selection:C76([CONTACTS:1])>0) & ([CONTACTS:1]Contact_Code:2#vContCode))
				GEN_at_Name{$_l_Index}:=[CONTACTS:1]Contact_Name:31
			Else 
				If ([COMPANIES:2]Company_Name:2#"")
					GEN_at_Name{$_l_Index}:=[COMPANIES:2]Company_Name:2
				Else 
					GEN_at_Name{$_l_Index}:=[COMPANIES:2]Address_Line_one:3
				End if 
			End if 
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("Companies Arr"; $_t_oldMethodName)
