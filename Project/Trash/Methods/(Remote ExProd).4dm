//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ExProd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Extras; $1)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ExProd")
$_bo_Extras:=(Count parameters:C259=0)
If (Records in selection:C76([PRODUCTS:9])>0)
	If ($_bo_Extras)
		MESSAGE:C88("      "+String:C10(Records in selection:C76([PRODUCTS:9]))+" Products"+Char:C90(13))
	End if 
	SEND PACKET:C103(vDoc; "*FILE*"+vRec+"Products"+vRec+String:C10(Records in selection:C76([PRODUCTS:9]))+vRec)
	FIRST RECORD:C50([PRODUCTS:9])
	While ((Not:C34(End selection:C36([PRODUCTS:9]))) & (<>SYS_l_CancelProcess#<>Process))
		If ($_bo_Extras)
			MESSAGE:C88("         "+[PRODUCTS:9]Product_Code:1+"  "+[PRODUCTS:9]Product_Name:2+Char:C90(13))
		End if 
		SEND PACKET:C103(vDoc; [PRODUCTS:9]Export:22+vFld+[PRODUCTS:9]Product_Code:1+vFld+[PRODUCTS:9]Product_Name:2+vFld+[PRODUCTS:9]Group_Code:3+vFld)
		SEND PACKET:C103(vDoc; [PRODUCTS:9]Brand_Code:4+vFld+[PRODUCTS:9]Model_Code:5+vFld+[PRODUCTS:9]Description:6+vFld+String:C10(Num:C11([PRODUCTS:9]Price_List:8))+vFld+String:C10([PRODUCTS:9]Sales_Price:9)+vFld)
		SEND PACKET:C103(vDoc; String:C10(Num:C11([PRODUCTS:9]Maintain_Stock:14))+vFld+[PRODUCTS:9]Superior:15+vFld+String:C10([PRODUCTS:9]Standard_Price:16)+vFld+String:C10(Num:C11([PRODUCTS:9]Serial_Numbered:17))+vFld)
		SEND PACKET:C103(vDoc; [PRODUCTS:9]Short_Code:19+vFld+[PRODUCTS:9]Enclosures:20+vFld)
		SEND PACKET:C103(vDoc; String:C10(Num:C11([PRODUCTS:9]Price_Updates:25))+vFld+String:C10([PRODUCTS:9]Weight:26)+vFld+String:C10([PRODUCTS:9]Issues_Number:27)+vFld)
		SEND PACKET:C103(vdoc; String:C10([PRODUCTS:9]Every_Number:28)+vFld+String:C10([PRODUCTS:9]Unit_Number:29)+vFld+String:C10([PRODUCTS:9]Start_Number:30)+vFld+String:C10([PRODUCTS:9]Start_Days:31)+vFld)
		SEND PACKET:C103(vdoc; String:C10([PRODUCTS:9]First_Issue_Date:32)+vFld+String:C10([PRODUCTS:9]First_Day_Month:33)+vFld+String:C10(Num:C11([PRODUCTS:9]Append_Month:34)))
		SEND PACKET:C103(vdoc; String:C10(Num:C11([PRODUCTS:9]Append_Issue:35))+vFld+String:C10(Num:C11([PRODUCTS:9]Bundle_Assembly:36))+vFld+String:C10([PRODUCTS:9]Bundle_Show:37)+vFld)
		SEND PACKET:C103(vDoc; [PRODUCTS:9]Commodity_Code:38+vFld+[PRODUCTS:9]Size:39+vFld+String:C10([PRODUCTS:9]Price_Per:40)+vFld+String:C10(Num:C11([PRODUCTS:9]Subscription_Perpetual:41))+vFld+vRec)
		If ([PRODUCTS:9]Exported:24=False:C215)
			[PRODUCTS:9]Exported:24:=True:C214
			DB_SaveRecord(->[PRODUCTS:9])
			AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
		End if 
		NEXT RECORD:C51([PRODUCTS:9])
	End while 
	SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
End if 
ERR_MethodTrackerReturn("Remote ExProd"; $_t_oldMethodName)
