//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ExComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 13:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305($_bo_Extras; $1)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ExComp")
$_bo_Extras:=(Count parameters:C259=0)
If ($_bo_Extras)
	CREATE EMPTY SET:C140([CONTACTS:1]; "OMaster")
End if 
If (Records in selection:C76([COMPANIES:2])>0)
	If ($_bo_Extras)
		MESSAGE:C88("      "+String:C10(Records in selection:C76([COMPANIES:2]))+" Companies"+Char:C90(13))
	End if 
	SEND PACKET:C103(vDoc; "*FILE*"+vRec+"Companies"+vRec+String:C10(Records in selection:C76([COMPANIES:2]))+vRec)
	FIRST RECORD:C50([COMPANIES:2])
	While ((Not:C34(End selection:C36([COMPANIES:2]))) & (<>SYS_l_CancelProcess#<>Process))
		If ($_bo_Extras)
			MESSAGE:C88("         "+[COMPANIES:2]Company_Code:1+" "+[COMPANIES:2]Company_Name:2+Char:C90(13))
		End if 
		SEND PACKET:C103(vDoc; [COMPANIES:2]Export:33+vFld)
		SEND PACKET:C103(vDoc; [COMPANIES:2]Company_Code:1+vFld+[COMPANIES:2]Company_Name:2+vFld+[COMPANIES:2]Address_Line_one:3+vFld+[COMPANIES:2]Address_Line_two:4+vFld+[COMPANIES:2]Town_or_City:5+vFld+[COMPANIES:2]County_or_State:6+vFld+[COMPANIES:2]Postal_Code:7+vFld+[COMPANIES:2]Country:8+vFld)
		SEND PACKET:C103(vDoc; [COMPANIES:2]Telephone:9+vFld+[COMPANIES:2]Fax:10+vFld+[COMPANIES:2]Area:11+vFld+[COMPANIES:2]Status:12+vFld+[COMPANIES:2]Company_Type:13+vFld+[COMPANIES:2]Source:14+vFld+String:C10([COMPANIES:2]Size:15)+vFld+String:C10([COMPANIES:2]Entry_Date:16)+vFld)
		SEND PACKET:C103(vDoc; [COMPANIES:2]Omit:17+vFld+[COMPANIES:2]Invoice_Address_Line_One:18+vFld+[COMPANIES:2]Invoice_Address_Line_Two:19+vFld+[COMPANIES:2]Invoice_Town:20+vFld+[COMPANIES:2]Invoice_County:21+vFld+[COMPANIES:2]Invoice_Postcode:22+vFld+[COMPANIES:2]Invoice_Country:23+vFld+[COMPANIES:2]Invoice_Dept:24+vFld+[COMPANIES:2]Invoice_Name:25+vFld)
		SEND PACKET:C103(vDoc; [COMPANIES:2]Taken_By:26+vFld+String:C10([COMPANIES:2]Financial_Year:27)+vFld+[COMPANIES:2]Sales_Person:29+vFld+[COMPANIES:2]Comments:30+vFld+String:C10([COMPANIES:2]Value:31)+vFld+String:C10([COMPANIES:2]Modified_Date:32)+vFld)
		SEND PACKET:C103(vDoc; [COMPANIES:2]Superior:34+vFld+String:C10([COMPANIES:2]Sales_Credit:35)+vFld+String:C10([COMPANIES:2]Purchase_Credit:36)+vFld+String:C10(Num:C11([COMPANIES:2]Private:37))+vFld+[COMPANIES:2]TAX_Prefix:38+vFld+[COMPANIES:2]TAX_Registration_Number:39+vFld+[COMPANIES:2]SL_Terms:40+vFld+[COMPANIES:2]Default_TAX:41+vFld+[COMPANIES:2]Default_Credit_Stage:42+vFld+[COMPANIES:2]Also_Known_As:43+vFld)
		QUERY:C277([COMPANIES_RECORD_ANALYSIS:146]; [COMPANIES_RECORD_ANALYSIS:146]Company_Code:4=[COMPANIES:2]Company_Code:1)
		For ($_l_Index; 1; Records in selection:C76([COMPANIES_RECORD_ANALYSIS:146]))
			SEND PACKET:C103(vDoc; [COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1+vFld)
			NEXT RECORD:C51([COMPANIES_RECORD_ANALYSIS:146])
			
		End for 
		
		SEND PACKET:C103(vDoc; "*INTEND*"+vFld)
		SEND PACKET:C103(vDoc; [COMPANIES:2]SO_Price_Group:44+vFld+[COMPANIES:2]Factor_Number:46+vFld+[COMPANIES:2]Autopay_Number:47+vFld+[COMPANIES:2]Their_Account_Number:48+vFld)
		SEND PACKET:C103(vDoc; [COMPANIES:2]Mailsort_SSC:49+vFld+[COMPANIES:2]Mailsort_OFN:50+vFld+[COMPANIES:2]Default_Layer:51+vFld+[COMPANIES:2]Company_Abbreviated_Name:52+vFld)
		SEND PACKET:C103(vDoc; [COMPANIES:2]PL_Terms:53+vFld+[COMPANIES:2]PO_Price_Group:54+vFld+[COMPANIES:2]EMail_After_At:55+vFld+[COMPANIES:2]Home_Page_URL:56+vFld+String:C10(Num:C11([COMPANIES:2]Invoice_Superior:57))+vFld+vRec)
		If ($_bo_Extras)
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			CREATE SET:C116([CONTACTS:1]; "$Set1")
			//QUERY([CONTACTS];[ADDRESS FORMATS]'Company Code=[COMPANIES]Company Code;*)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
			CREATE SET:C116([CONTACTS:1]; "$Set2")
			UNION:C120("$set1"; "$Set2"; "$set1")
			USE SET:C118("$Set1")
			CREATE SET:C116([CONTACTS:1]; "Extra")
			UNION:C120("Extra"; "OMaster"; "OMaster")
			If ([COMPANIES:2]Exported:45=False:C215)
				[COMPANIES:2]Exported:45:=True:C214
				DB_SaveRecord(->[COMPANIES:2])
				AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			End if 
		End if 
		NEXT RECORD:C51([COMPANIES:2])
	End while 
	SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
End if 
ERR_MethodTrackerReturn("Remote ExComp"; $_t_oldMethodName)
