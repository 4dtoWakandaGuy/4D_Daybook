//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ImComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2009 13:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Create; $_bo_Extras; $1)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_Index)
	C_TEXT:C284($_t_CompanyCode; $_t_DTR; $_t_oldMethodName; $_t_Remainder; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ImComp")
//Remote_ImComp Mk3
$_bo_Extras:=(Count parameters:C259=0)
If ($_bo_Extras)
	CREATE EMPTY SET:C140([COMPANIES:2]; "Master")
	CREATE EMPTY SET:C140([COMPANIES:2]; "Extra")
	CREATE EMPTY SET:C140([COMPANIES:2]; "Not")
End if 

$_t_DTR:="Start"
While (($_t_DTR#"*END*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_DTR:=Remote_Packet(vFld)
	If ($_t_DTR#"*END*")
		$_t_CompanyCode:=Remote_Packet(vFld)
		If (Length:C16($_t_CompanyCode)>1)
			$_bo_Create:=False:C215
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
			If (Records in selection:C76([COMPANIES:2])=0)
				CREATE RECORD:C68([COMPANIES:2])
				[COMPANIES:2]Company_Code:1:=$_t_CompanyCode
				$_bo_Create:=True:C214
				OK:=1
			Else 
				If ($_bo_Extras)
					Remote_ImOverCh([COMPANIES:2]Export:33)
					If (OK=0)
						MESSAGE:C88("         Cannot overwrite "+$_t_CompanyCode+Char:C90(13))
						ONE RECORD SELECT:C189([COMPANIES:2])
						FIRST RECORD:C50([COMPANIES:2])
						ADD TO SET:C119([COMPANIES:2]; "Not")
						OK:=0
					End if 
				End if 
			End if 
			If (OK=1)
				If ($_bo_Extras)
					MESSAGE:C88("         "+$_t_CompanyCode+Char:C90(13))
				End if 
				[COMPANIES:2]Export:33:=$_t_DTR
				[COMPANIES:2]Company_Name:2:=Remote_Rec
				[COMPANIES:2]Address_Line_one:3:=Remote_Rec
				[COMPANIES:2]Address_Line_two:4:=Remote_Rec
				[COMPANIES:2]Town_or_City:5:=Remote_Rec
				[COMPANIES:2]County_or_State:6:=Remote_Rec
				[COMPANIES:2]Postal_Code:7:=Remote_Rec
				[COMPANIES:2]Country:8:=Remote_Rec
				[COMPANIES:2]Telephone:9:=Remote_Rec
				[COMPANIES:2]Fax:10:=Remote_Rec
				[COMPANIES:2]Area:11:=Remote_Rec
				[COMPANIES:2]Status:12:=Remote_Rec
				[COMPANIES:2]Company_Type:13:=Remote_Rec
				[COMPANIES:2]Source:14:=Remote_Rec
				[COMPANIES:2]Size:15:=Num:C11(Remote_Rec)
				[COMPANIES:2]Entry_Date:16:=Date:C102(Remote_Rec)
				[COMPANIES:2]Omit:17:=Remote_Rec
				[COMPANIES:2]Invoice_Address_Line_One:18:=Remote_Rec
				[COMPANIES:2]Invoice_Address_Line_Two:19:=Remote_Rec
				[COMPANIES:2]Invoice_Town:20:=Remote_Rec
				[COMPANIES:2]Invoice_County:21:=Remote_Rec
				[COMPANIES:2]Invoice_Postcode:22:=Remote_Rec
				[COMPANIES:2]Invoice_Country:23:=Remote_Rec
				[COMPANIES:2]Invoice_Dept:24:=Remote_Rec
				[COMPANIES:2]Invoice_Name:25:=Remote_Rec
				[COMPANIES:2]Taken_By:26:=Remote_Rec
				[COMPANIES:2]Financial_Year:27:=Date:C102(Remote_Rec)
				[COMPANIES:2]Sales_Person:29:=Remote_Rec
				[COMPANIES:2]Comments:30:=Remote_Rec
				[COMPANIES:2]Value:31:=Num:C11(Remote_Rec)
				[COMPANIES:2]Modified_Date:32:=Date:C102(Remote_Rec)
				[COMPANIES:2]Superior:34:=Remote_Rec
				[COMPANIES:2]Sales_Credit:35:=Num:C11(Remote_Rec)
				[COMPANIES:2]Purchase_Credit:36:=Num:C11(Remote_Rec)
				[COMPANIES:2]Private:37:=(Remote_Rec="1")
				[COMPANIES:2]TAX_Prefix:38:=Remote_Rec
				[COMPANIES:2]TAX_Registration_Number:39:=Remote_Rec
				[COMPANIES:2]SL_Terms:40:=Remote_Rec
				[COMPANIES:2]Default_TAX:41:=Remote_Rec
				[COMPANIES:2]Default_Credit_Stage:42:=Remote_Rec
				[COMPANIES:2]Also_Known_As:43:=Remote_Rec
				QUERY:C277([COMPANIES_RECORD_ANALYSIS:146]; [COMPANIES_RECORD_ANALYSIS:146]Company_Code:4=[COMPANIES:2]Company_Code:1)
				DELETE SELECTION:C66([COMPANIES_RECORD_ANALYSIS:146])
				
				//
				$_t_Remainder:=Remote_Packet(vFld)
				$_l_Index:=0
				While (($_t_Remainder#"*INTEND*") & ($_l_Index<100) & ($_t_Remainder#"") & (<>SYS_l_CancelProcess#<>Process))
					CREATE RECORD:C68([COMPANIES_RECORD_ANALYSIS:146])
					[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[COMPANIES:2]Company_Code:1
					[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1:=$_t_Remainder
					SAVE RECORD:C53([COMPANIES_RECORD_ANALYSIS:146])
					
					
					$_t_Remainder:=Remote_Packet(vFld)
					$_l_Index:=$_l_Index+1
				End while 
				[COMPANIES:2]SO_Price_Group:44:=Remote_Rec
				[COMPANIES:2]Factor_Number:46:=Remote_Rec
				[COMPANIES:2]Autopay_Number:47:=Remote_Rec
				[COMPANIES:2]Their_Account_Number:48:=Remote_Rec
				[COMPANIES:2]Mailsort_SSC:49:=Remote_Rec
				[COMPANIES:2]Mailsort_OFN:50:=Remote_Rec
				[COMPANIES:2]Default_Layer:51:=Remote_Rec
				[COMPANIES:2]Company_Abbreviated_Name:52:=Remote_Rec
				[COMPANIES:2]PL_Terms:53:=Remote_Rec
				[COMPANIES:2]PO_Price_Group:54:=Remote_Rec
				[COMPANIES:2]EMail_After_At:55:=Remote_Rec
				[COMPANIES:2]Home_Page_URL:56:=Remote_Rec
				[COMPANIES:2]Invoice_Superior:57:=(Remote_Rec="1")
				If ($_bo_Extras)
					[COMPANIES:2]Exported:45:=True:C214
					Remote_ImSaveSe(->[COMPANIES:2]; $_bo_Create)
				Else 
					DB_SaveRecord(->[COMPANIES:2])
					AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
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
	Remote_ImSetSav("New Comp"; "Mod Comp"; "Not Comp"; "C"; ->[COMPANIES:2])
End if 
ERR_MethodTrackerReturn("Remote_ImComp"; $_t_oldMethodName)
