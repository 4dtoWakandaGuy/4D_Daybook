//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_ContAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2010 16:23
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_DateAdded)
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_LONGINT:C283($_l_AddMode; $_l_CountRecords; $_l_RecordsinSelectionCompanies; vAdd; vNo)
	C_TEXT:C284(<>CompCode; <>ContCode; $_t_AddressType; $_t_CompanyCode; $_t_CurrentFormUsage; $_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vSelPrev)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_ContAdd")
//Comp_ContAdd
$_t_CurrentOutputform:=WIN_t_CurrentOutputform

$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
DB_SaveRecord(->[COMPANIES:2])
AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
DB_SaveRecord(->[CONTACTS_COMPANIES:145])
DB_SaveRecord(->[CONTACTS:1])
AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
CUT NAMED SELECTION:C334([COMPANIES:2]; "$ContAdd")
UNLOAD RECORD:C212([COMPANIES:2])
$_l_AddMode:=vAdd

FORM SET INPUT:C55([CONTACTS:1]; "Contact_In")  //NG April 2004 removed reference to ◊screen
FORM SET OUTPUT:C54([CONTACTS:1]; "Contacts_Out")
WIN_t_CurrentOutputform:="Contacts_Out"
<>CompCode:=""
<>ContCode:=""
vSelPrev:=""
Cont_Sel
If (OK=1)
	SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
	QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
	QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1#$_t_CompanyCode; *)
	QUERY SELECTION:C341([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
	QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
	
	If (Records in selection:C76([CONTACTS:1])>0)
		//Userset_Empty (->[CONTACTS])
		//DB_t_CurrentFormUsage:="Select"
		//Open_Pro_Window ("Select Contact(s) to Add";0;1;->[CONTACTS];WIN_t_CurrentOutputform)
		//vNo:=Records in selection([CONTACTS])
		//FS_SetFormSort (WIN_t_CurrentOutputform;0;1;->[CONTACTS];WIN_t_CurrentOutputform)
		//WIn_SetFormSize (1;->[CONTACTS];WIN_t_CurrentOutputform)
		//D`ISPLAY SELECTION([CONTACTS];*)
		DBI_MenuSelectRecords(Table name:C256(Table:C252(->[CONTACTS:1])); True:C214)
		
		If (OK=1)
			//Userset
			$_l_CountRecords:=Records in selection:C76([CONTACTS:1])
			If ($_l_CountRecords>0)
				REDUCE SELECTION:C351([CODE_USES:91]; 0)
				While ((Records in selection:C76([CODE_USES:91])=0) & (OK=1))
					$_t_AddressType:=Substring:C12(Gen_Request("Add "+String:C10($_l_CountRecords)+" Contacts with Address Type:"; "WORK"; ""; ""); 1; 5)
					If (OK=1)
						QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1="005"+$_t_AddressType; *)
						QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=4)
						If (Records in selection:C76([CODE_USES:91])=0)
							Gen_Confirm("That is not an Address Type"; "Try again"; "Leave Blank")
							If (OK=0)
								$_t_AddressType:="Blank"
							End if 
						End if 
					End if 
				End while 
				If ($_t_AddressType="Blank")
					OK:=1
					$_t_AddressType:=""
				End if 
			End if 
		End if 
		Close_ProWin
	Else 
		Gen_Alert("No Contacts Found")
	End if 
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
vAdd:=$_l_AddMode
Userset_Empty(->[COMPANIES:2])

USE NAMED SELECTION:C332("$ContAdd")
If (($_l_CountRecords>0) & (OK=1))
	FIRST RECORD:C50([CONTACTS:1])
	While (Not:C34(End selection:C36([CONTACTS:1])))
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		$_l_RecordsinSelectionCompanies:=Records in selection:C76([CONTACTS_COMPANIES:145])
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_CompanyCode)
		If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
			CREATE RECORD:C68([CONTACTS_COMPANIES:145])
			[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
			[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
			[CONTACTS_COMPANIES:145]Company_Code:1:=$_t_CompanyCode
			[CONTACTS_COMPANIES:145]Address_Type:2:=Uppercase:C13($_t_AddressType)
			If ($_l_RecordsinSelectionCompanies=0)  //first record
				[CONTACTS:1]Company_Code:1:=$_t_CompanyCode
			End if 
			DB_SaveRecord(->[CONTACTS_COMPANIES:145])
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		End if 
		NEXT RECORD:C51([CONTACTS:1])
	End while 
End if 
vNo:=Records in selection:C76([COMPANIES:2])
vAdd:=0
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
Companies_InLPB
Companies_InLPß("S1")
ERR_MethodTrackerReturn("Comp_ContAdd"; $_t_oldMethodName)
