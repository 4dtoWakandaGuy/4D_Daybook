//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ExCont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 11:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	C_BOOLEAN:C305($_bo_Extras; $1)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ExCont")
$_bo_Extras:=(Count parameters:C259=0)
If (Records in selection:C76([CONTACTS:1])>0)
	If ($_bo_Extras)
		MESSAGE:C88("      "+String:C10(Records in selection:C76([CONTACTS:1]))+" Contacts"+Char:C90(13))
	End if 
	SEND PACKET:C103(vDoc; "*FILE*"+vRec+"Contacts"+vRec+String:C10(Records in selection:C76([CONTACTS:1]))+vRec)
	FIRST RECORD:C50([CONTACTS:1])
	While ((Not:C34(End selection:C36([CONTACTS:1]))) & (<>SYS_l_CancelProcess#<>Process))
		If ($_bo_Extras)
			MESSAGE:C88("         "+[CONTACTS:1]Company_Code:1+"  "+[CONTACTS:1]Contact_Code:2+"  "+[CONTACTS:1]Surname:5+Char:C90(13))
		End if 
		SEND PACKET:C103(vDoc; [CONTACTS:1]Export:18+vFld)
		SEND PACKET:C103(vDoc; [CONTACTS:1]Company_Code:1+vFld+[CONTACTS:1]Contact_Code:2+vFld+[CONTACTS:1]Title:3+vFld+[CONTACTS:1]Forename:4+vFld+[CONTACTS:1]Surname:5+vFld+[CONTACTS:1]Job_Title:6+vFld+[CONTACTS:1]Salutation:7+vFld+[CONTACTS:1]Dept:8+vFld)
		SEND PACKET:C103(vDoc; [CONTACTS:1]Extn:9+vFld+[CONTACTS:1]Comments:10+vFld+[CONTACTS:1]Role:11+vFld+[CONTACTS:1]Mobile:12+vFld+[CONTACTS:1]Qualifications:13+vFld)
		SEND PACKET:C103(vDoc; [CONTACTS:1]Status:14+vFld+[CONTACTS:1]Contact_Type:15+vFld+[CONTACTS:1]Source:16+vFld+String:C10([CONTACTS:1]Entry_Date:17)+vFld+[CONTACTS:1]Fax:19+vFld+[CONTACTS:1]Omit:20+vFld)
		SEND PACKET:C103(vDoc; [CONTACTS:1]EMail_After_At:24+vFld+[CONTACTS:1]Sales_Person:25+vFld+[CONTACTS:1]Duplicate_State:26+vFld+String:C10(Num:C11([CONTACTS:1]Esquire:27))+vFld+String:C10([CONTACTS:1]Modified_Date:28)+vFld)
		QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3=[CONTACTS:1]Contact_Code:2)
		
		While (Not:C34(End selection:C36([CONTACTS_RECORD_ANALYSIS:144])))
			SEND PACKET:C103(vDoc; [CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1+vFld)
			NEXT RECORD:C51([CONTACTS_RECORD_ANALYSIS:144])
		End while 
		SEND PACKET:C103(vDoc; "*INTEND*"+vFld)
		QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
		QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
		While (Not:C34(End selection:C36([CONTACTS_COMPANIES:145])))
			
			SEND PACKET:C103(vDoc; [CONTACTS_COMPANIES:145]Company_Code:1+vFld+[CONTACTS_COMPANIES:145]Address_Type:2+vFld)
			NEXT RECORD:C51([CONTACTS_COMPANIES:145])
		End while 
		SEND PACKET:C103(vDoc; "*INTEND*"+vFld+vRec)
		If (([CONTACTS:1]Exported:23=False:C215) & ($_bo_Extras))
			[CONTACTS:1]Exported:23:=True:C214
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		End if 
		NEXT RECORD:C51([CONTACTS:1])
	End while 
	SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
End if 
ERR_MethodTrackerReturn("Remote ExCont"; $_t_oldMethodName)
