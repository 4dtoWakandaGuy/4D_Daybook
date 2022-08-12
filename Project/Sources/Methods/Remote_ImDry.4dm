//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ImDry
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
	C_BOOLEAN:C305($_bo_Create)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_DiaryCode; $_t_DTR; $_t_oldMethodName; $_t_Originator; $_t_Person; $_t_Remainder; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ImDry")
CREATE EMPTY SET:C140([DIARY:12]; "Master")
CREATE EMPTY SET:C140([DIARY:12]; "Extra")
CREATE EMPTY SET:C140([DIARY:12]; "Not")
$_t_DTR:="Start"
While (($_t_DTR#"*END*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_DTR:=Remote_Packet(vFld)
	If ($_t_DTR#"*END*")
		$_t_DiaryCode:=Remote_Packet(vFld)
		$_t_Person:=Remote_Packet(vFld)
		$_t_Originator:=Remote_Packet(vFld)
		If (Length:C16($_t_DiaryCode)>1)
			$_bo_Create:=False:C215
			QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
			If (Records in selection:C76([DIARY:12])=0)
				CREATE RECORD:C68([DIARY:12])
				[DIARY:12]Diary_Code:3:=$_t_DiaryCode
				$_bo_Create:=True:C214
				OK:=1
			Else 
				Remote_ImOverCh([DIARY:12]Export:24)
				If (OK=0)
					MESSAGE:C88("         Cannot overwrite "+$_t_DiaryCode+Char:C90(13))
					ONE RECORD SELECT:C189([DIARY:12])
					FIRST RECORD:C50([DIARY:12])
					ADD TO SET:C119([DIARY:12]; "Not")
					OK:=0
				End if 
			End if 
			If (OK=1)
				MESSAGE:C88("         "+$_t_DiaryCode+"  "+$_t_Person+"  "+$_t_Originator+Char:C90(13))
				[DIARY:12]Export:24:=$_t_DTR
				[DIARY:12]Person:8:=$_t_Person
				[DIARY:12]Originator:23:=$_t_Originator
				[DIARY:12]Company_Code:1:=Remote_Rec
				[DIARY:12]Contact_Code:2:=Remote_Rec
				[DIARY:12]Date_Do_From:4:=Date:C102(Remote_Rec)
				[DIARY:12]Date_Done_From:5:=Date:C102(Remote_Rec)
				[DIARY:12]Time_Do_From:6:=Time:C179(Remote_Rec)
				[DIARY:12]Time_Done_From:7:=Time:C179(Remote_Rec)
				[DIARY:12]Action_Code:9:=Remote_Rec
				[DIARY:12]Action_Details:10:=Remote_Rec
				[DIARY:12]Result_Code:11:=Remote_Rec
				[DIARY:12]Result_Description:12:=Remote_Rec
				[DIARY:12]Product_Code:13:=Remote_Rec
				[DIARY:12]Done:14:=(Remote_Rec="1")
				[DIARY:12]Document_Code:15:=Remote_Rec
				[DIARY:12]Value:16:=Num:C11(Remote_Rec)
				[DIARY:12]Priority:17:=Remote_Rec
				[DIARY:12]Job_Code:19:=Remote_Rec
				[DIARY:12]Units:20:=Num:C11(Remote_Rec)
				[DIARY:12]Stage_Code:21:=Remote_Rec
				[DIARY:12]Charge_Rate:22:=Num:C11(Remote_Rec)
				[DIARY:12]Call_Code:25:=Remote_Rec
				[DIARY:12]Order_Code:26:=Remote_Rec
				
				[DIARY:12]Time_Checked:28:=(Remote_Rec="1")
				[DIARY:12]Script_Code:29:=Remote_Rec
				[DIARY:12]Status:30:=Remote_Rec
				[DIARY:12]Personal_Priority:31:=Remote_Rec
				[DIARY:12]Document_Heading:32:=Remote_Rec
				[DIARY:12]Date_Do_To:33:=Date:C102(Remote_Rec)
				[DIARY:12]Date_Done_To:34:=Date:C102(Remote_Rec)
				[DIARY:12]Time_Do_To:35:=Time:C179(Remote_Rec)
				[DIARY:12]Time_Done_To:36:=Time:C179(Remote_Rec)
				[DIARY:12]Picture_Code:37:=Remote_Rec
				$_t_Remainder:=Remote_Packet(vRec)
				Remote_ImSaveSe(->[DIARY:12]; $_bo_Create)
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
Remote_ImSetSav("New Diary"; "Mod Diary"; "Not Diary"; "D"; ->[DIARY:12])
ERR_MethodTrackerReturn("Remote_ImDry"; $_t_oldMethodName)
