//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ExDry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
	C_TIME:C306(vDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ExDry")
If (Records in selection:C76([DIARY:12])>0)
	MESSAGE:C88("      "+String:C10(Records in selection:C76([DIARY:12]))+" Diary"+Char:C90(13))
	SEND PACKET:C103(vDoc; "*FILE*"+vRec+"Diary"+vRec+String:C10(Records in selection:C76([DIARY:12]))+vRec)
	FIRST RECORD:C50([DIARY:12])
	CREATE EMPTY SET:C140([DOCUMENTS:7]; "Letters")
	While ((Not:C34(End selection:C36([DIARY:12]))) & (<>SYS_l_CancelProcess#<>Process))
		MESSAGE:C88("         "+[DIARY:12]Diary_Code:3+"  "+[DIARY:12]Company_Code:1+Char:C90(13))
		SEND PACKET:C103(vDoc; [DIARY:12]Export:24+vFld+[DIARY:12]Diary_Code:3+vFld+[DIARY:12]Person:8+vFld+[DIARY:12]Originator:23+vFld)
		SEND PACKET:C103(vDoc; [DIARY:12]Company_Code:1+vFld+[DIARY:12]Contact_Code:2+vFld+String:C10([DIARY:12]Date_Do_From:4)+vFld+String:C10([DIARY:12]Date_Done_From:5)+vFld)
		SEND PACKET:C103(vDoc; String:C10([DIARY:12]Time_Do_From:6)+vFld+String:C10([DIARY:12]Time_Done_From:7)+vFld+[DIARY:12]Action_Code:9+vFld+[DIARY:12]Action_Details:10+vFld)
		SEND PACKET:C103(vDoc; [DIARY:12]Result_Code:11+vFld+[DIARY:12]Result_Description:12+vFld+[DIARY:12]Product_Code:13+vFld+String:C10(Num:C11([DIARY:12]Done:14))+vFld)
		SEND PACKET:C103(vDoc; [DIARY:12]Document_Code:15+vFld+String:C10([DIARY:12]Value:16)+vFld+[DIARY:12]Priority:17+vFld+[DIARY:12]Job_Code:19+vFld)
		SEND PACKET:C103(vDoc; String:C10([DIARY:12]Units:20)+vFld+[DIARY:12]Stage_Code:21+vFld+String:C10([DIARY:12]Charge_Rate:22)+vFld)
		SEND PACKET:C103(vDoc; [DIARY:12]Call_Code:25+vFld+[DIARY:12]Order_Code:26+vFld+String:C10(Num:C11([DIARY:12]Time_Checked:28))+vFld+[DIARY:12]Script_Code:29+vFld+[DIARY:12]Status:30+vFld+[DIARY:12]Personal_Priority:31+vFld+[DIARY:12]Document_Heading:32+vFld)
		SEND PACKET:C103(vDoc; String:C10([DIARY:12]Date_Do_To:33)+vFld+String:C10([DIARY:12]Date_Done_To:34)+vFld+String:C10([DIARY:12]Time_Do_To:35)+vFld+String:C10([DIARY:12]Time_Done_To:36)+vFld+[DIARY:12]Picture_Code:37+vFld)
		SEND PACKET:C103(vDoc; vRec)
		If ([DIARY:12]Document_Code:15#"")
			RELATE ONE:C42([DIARY:12]Document_Code:15)
			ADD TO SET:C119([DOCUMENTS:7]; "Letters")
		End if 
		NEXT RECORD:C51([DIARY:12])
	End while 
	SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
End if 
ERR_MethodTrackerReturn("Remote_ExDry"; $_t_oldMethodName)