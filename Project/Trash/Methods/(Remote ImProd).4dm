//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImProd
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
	C_BOOLEAN:C305($_bo_Create; $_bo_Extras; $1)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_DTR; $_t_oldMethodName; $_t_ProductCode; $_t_ProductName; $_t_Remainder; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImProd")
//Remote ImProd
$_bo_Extras:=(Count parameters:C259=0)
If ($_bo_Extras)
	CREATE EMPTY SET:C140([PRODUCTS:9]; "Master")
	CREATE EMPTY SET:C140([PRODUCTS:9]; "Extra")
	CREATE EMPTY SET:C140([PRODUCTS:9]; "Not")
End if 
$_t_DTR:="Start"
While (($_t_DTR#"*END*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_DTR:=Remote_Packet(vFld)
	If ($_t_DTR#"*END*")
		$_t_ProductCode:=Remote_Packet(vFld)
		$_t_ProductName:=Remote_Packet(vFld)
		If (Length:C16($_t_ProductCode)>1)
			$_bo_Create:=False:C215
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ProductCode)
			If (Records in selection:C76([PRODUCTS:9])=0)
				CREATE RECORD:C68([PRODUCTS:9])
				[PRODUCTS:9]Product_Code:1:=$_t_ProductCode
				$_bo_Create:=True:C214
				OK:=1
			Else 
				If ($_bo_Extras)
					Remote_ImOverCh([PRODUCTS:9]Export:22)
					If (OK=0)
						MESSAGE:C88("         Cannot overwrite "+$_t_ProductCode+Char:C90(13))
						ONE RECORD SELECT:C189([PRODUCTS:9])
						FIRST RECORD:C50([PRODUCTS:9])
						ADD TO SET:C119([PRODUCTS:9]; "Not")
						OK:=0
					End if 
				End if 
			End if 
			If (OK=1)
				If ($_bo_Extras)
					MESSAGE:C88("         "+$_t_ProductCode+"  "+$_t_ProductName+Char:C90(13))
				End if 
				[PRODUCTS:9]Export:22:=$_t_DTR
				[PRODUCTS:9]Product_Name:2:=$_t_ProductName
				[PRODUCTS:9]Group_Code:3:=Remote_Rec
				[PRODUCTS:9]Brand_Code:4:=Remote_Rec
				[PRODUCTS:9]Model_Code:5:=Remote_Rec
				[PRODUCTS:9]Description:6:=Remote_Rec
				[PRODUCTS:9]Price_List:8:=(Remote_Rec="1")
				[PRODUCTS:9]Sales_Price:9:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Maintain_Stock:14:=(Remote_Rec="1")
				[PRODUCTS:9]Superior:15:=Remote_Rec
				[PRODUCTS:9]Standard_Price:16:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Serial_Numbered:17:=(Remote_Rec="1")
				[PRODUCTS:9]Short_Code:19:=Remote_Rec
				[PRODUCTS:9]Enclosures:20:=Remote_Rec
				[PRODUCTS:9]Exported:24:=True:C214
				[PRODUCTS:9]Price_Updates:25:=(Remote_Rec="1")
				[PRODUCTS:9]Weight:26:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Issues_Number:27:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Every_Number:28:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Unit_Number:29:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Start_Number:30:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Start_Days:31:=Num:C11(Remote_Rec)
				[PRODUCTS:9]First_Issue_Date:32:=Date:C102(Remote_Rec)
				[PRODUCTS:9]First_Day_Month:33:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Append_Month:34:=(Remote_Rec="1")
				[PRODUCTS:9]Append_Issue:35:=(Remote_Rec="1")
				[PRODUCTS:9]Bundle_Assembly:36:=(Remote_Rec="1")
				[PRODUCTS:9]Bundle_Show:37:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Commodity_Code:38:=Remote_Rec
				[PRODUCTS:9]Size:39:=Remote_Rec
				[PRODUCTS:9]Price_Per:40:=Num:C11(Remote_Rec)
				[PRODUCTS:9]Subscription_Perpetual:41:=(Remote_Rec="1")
				$_t_Remainder:=Remote_Packet(vRec)
				If ($_bo_Extras)
					Remote_ImSaveSe(->[PRODUCTS:9]; $_bo_Create)
				Else 
					DB_SaveRecord(->[PRODUCTS:9])
					AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
				End if 
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
	Remote_ImSetSav("New Prod"; "Mod Prod"; "Not Prod"; "P"; ->[PRODUCTS:9])
End if 
ERR_MethodTrackerReturn("Remote ImProd"; $_t_oldMethodName)
