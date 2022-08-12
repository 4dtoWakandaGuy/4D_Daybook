//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImCont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Create; $_bo_Extras; $1)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_Index)
	C_TEXT:C284($_l_Type; $_t_CompanyCode; $_t_ContactCode; $_t_DTR; $_t_oldMethodName; $_t_Remainder; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImCont")
//Remote ImCont
$_bo_Extras:=(Count parameters:C259=0)
If ($_bo_Extras)
	CREATE EMPTY SET:C140([CONTACTS:1]; "Master")
	CREATE EMPTY SET:C140([CONTACTS:1]; "Extra")
	CREATE EMPTY SET:C140([CONTACTS:1]; "Not")
End if 

$_t_DTR:="Start"
While (($_t_DTR#"*END*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_DTR:=Remote_Packet(vFld)
	If ($_t_DTR#"*END*")
		$_t_CompanyCode:=Remote_Packet(vFld)
		$_t_ContactCode:=Remote_Packet(vFld)
		If ((Length:C16($_t_CompanyCode)>1) & (Length:C16($_t_ContactCode)>1))
			$_bo_Create:=False:C215
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
			If (Records in selection:C76([CONTACTS:1])=0)
				CREATE RECORD:C68([CONTACTS:1])
				[CONTACTS:1]Contact_Code:2:=$_t_ContactCode
				$_bo_Create:=True:C214
				OK:=1
			Else 
				If ($_bo_Extras)
					Remote_ImOverCh([CONTACTS:1]Export:18)
					If (OK=0)
						MESSAGE:C88("         Cannot overwrite "+$_t_CompanyCode+"  "+$_t_ContactCode+Char:C90(13))
						ONE RECORD SELECT:C189([CONTACTS:1])
						FIRST RECORD:C50([CONTACTS:1])
						ADD TO SET:C119([CONTACTS:1]; "Not")
						OK:=0
					End if 
				End if 
			End if 
			If (OK=1)
				If ($_bo_Extras)
					MESSAGE:C88("         "+$_t_CompanyCode+"  "+$_t_ContactCode+Char:C90(13))
				End if 
				[CONTACTS:1]Export:18:=$_t_DTR
				[CONTACTS:1]Company_Code:1:=$_t_CompanyCode
				[CONTACTS:1]Title:3:=Remote_Rec
				[CONTACTS:1]Forename:4:=Remote_Rec
				[CONTACTS:1]Surname:5:=Remote_Rec
				[CONTACTS:1]Job_Title:6:=Remote_Rec
				[CONTACTS:1]Salutation:7:=Remote_Rec
				[CONTACTS:1]Dept:8:=Remote_Rec
				[CONTACTS:1]Extn:9:=Remote_Rec
				[CONTACTS:1]Comments:10:=Remote_Rec
				[CONTACTS:1]Role:11:=Remote_Rec
				[CONTACTS:1]Mobile:12:=Remote_Rec
				[CONTACTS:1]Qualifications:13:=Remote_Rec
				[CONTACTS:1]Status:14:=Remote_Rec
				[CONTACTS:1]Contact_Type:15:=Remote_Rec
				[CONTACTS:1]Source:16:=Remote_Rec
				[CONTACTS:1]Entry_Date:17:=Date:C102(Remote_Rec)
				[CONTACTS:1]Fax:19:=Remote_Rec
				[CONTACTS:1]Omit:20:=Remote_Rec
				[CONTACTS:1]EMail_After_At:24:=Remote_Rec
				[CONTACTS:1]Sales_Person:25:=Remote_Rec
				[CONTACTS:1]Duplicate_State:26:=Remote_Rec
				[CONTACTS:1]Esquire:27:=(Remote_Rec="1")
				[CONTACTS:1]Modified_Date:28:=Date:C102(Remote_Rec)
				QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3=[CONTACTS:1]Contact_Code:2)
				
				
				While (Not:C34(End selection:C36([CONTACTS_RECORD_ANALYSIS:144])))
					DELETE RECORD:C58([CONTACTS_RECORD_ANALYSIS:144])
					QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3=[CONTACTS:1]Contact_Code:2)
				End while 
				$_t_Remainder:=Remote_Packet(vFld)
				$_l_Index:=0
				While (($_t_Remainder#"*INTEND*") & ($_l_Index<100) & ($_t_Remainder#"") & (<>SYS_l_CancelProcess#<>Process))
					CREATE RECORD:C68([CONTACTS_RECORD_ANALYSIS:144])
					[CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3:=[CONTACTS:1]Contact_Code:2
					[COMPANIES_RECORD_ANALYSIS:146]ID:2:=AA_GetNextID(->[COMPANIES_RECORD_ANALYSIS:146]ID:2)
					
					[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1:=$_t_Remainder
					$_t_Remainder:=Remote_Packet(vFld)
					$_l_Index:=$_l_Index+1
					DB_SaveRecord(->[CONTACTS_RECORD_ANALYSIS:144])
					
				End while 
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
				QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				While (Not:C34(End selection:C36([CONTACTS_COMPANIES:145])))
					[CONTACTS_COMPANIES:145]Address_DateDeleted:7:=Current date:C33(*)
					[CONTACTS_COMPANIES:145]Address_Status:5:=-1
					DB_SaveRecord(->[CONTACTS_COMPANIES:145])
					If ([CONTACTS:1]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
						[CONTACTS:1]Company_Code:1:=""
					End if 
					//DELETE RECORD([CONTACTS_COMPANIES])
					QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
					QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				End while 
				$_t_Remainder:=Remote_Packet(vFld)
				$_l_Index:=0
				While (($_t_Remainder#"*INTEND*") & ($_l_Index<100) & ($_t_Remainder#"") & (<>SYS_l_CancelProcess#<>Process))
					$_l_Type:=Remote_Packet(vFld)
					CREATE RECORD:C68([CONTACTS_COMPANIES:145])
					
					[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
					[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
					[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
					
					[CONTACTS_COMPANIES:145]Company_Code:1:=$_t_Remainder
					[CONTACTS_COMPANIES:145]Address_Type:2:=$_l_Type
					SAVE RECORD:C53([CONTACTS_COMPANIES:145])
					$_t_Remainder:=Remote_Packet(vFld)
					$_l_Index:=$_l_Index+1
				End while 
				If ($_bo_Extras)
					[CONTACTS:1]Exported:23:=True:C214
					Remote_ImSaveSe(->[CONTACTS:1]; $_bo_Create)
				Else 
					DB_SaveRecord(->[CONTACTS:1])
					AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
				End if 
				$_t_Remainder:=Remote_Packet(vRec)
			Else 
				$_t_Remainder:=Remote_Packet(vRec)
			End if 
		Else 
			$_t_Remainder:=Remote_Packet(vRec)
		End if 
	End if 
	If ($_t_Remainder="*END*@")
		$_t_DTR:="*END*"
	End if 
End while 
If ($_bo_Extras)
	Remote_ImSetSav("New Cont"; "Mod Cont"; "Not Cont"; "O"; ->[CONTACTS:1])
End if 
ERR_MethodTrackerReturn("Remote ImCont"; $_t_oldMethodName)
