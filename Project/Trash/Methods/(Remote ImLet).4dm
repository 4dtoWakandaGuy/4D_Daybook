//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImLet
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
	C_BOOLEAN:C305($_bo_Create)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_DocumentCode; $_t_DTR; $_t_oldMethodName; $_t_PathName; $_t_Remainder; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImLet")
CREATE EMPTY SET:C140([DOCUMENTS:7]; "Master")
CREATE EMPTY SET:C140([DOCUMENTS:7]; "Extra")
CREATE EMPTY SET:C140([DOCUMENTS:7]; "Not")
$_t_DTR:="Start"
While (($_t_DTR#"*END*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_DTR:=Remote_Packet(vFld)
	If ($_t_DTR#"*END*")
		$_t_DocumentCode:=Remote_Packet(vFld)
		If (Length:C16($_t_DocumentCode)>1)
			$_bo_Create:=False:C215
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode)
			If (Records in selection:C76([DOCUMENTS:7])=0)
				CREATE RECORD:C68([DOCUMENTS:7])
				[DOCUMENTS:7]Document_Code:1:=$_t_DocumentCode
				$_bo_Create:=True:C214
				OK:=1
			Else 
				Remote_ImOverCh([DOCUMENTS:7]Export:6)
				If (OK=0)
					MESSAGE:C88("         Cannot overwrite "+$_t_DocumentCode+Char:C90(13))
					ONE RECORD SELECT:C189([DOCUMENTS:7])
					FIRST RECORD:C50([DOCUMENTS:7])
					ADD TO SET:C119([DOCUMENTS:7]; "Not")
					OK:=0
				End if 
			End if 
			If (OK=1)
				MESSAGE:C88("         "+$_t_DocumentCode+Char:C90(13))
				[DOCUMENTS:7]Export:6:=$_t_DTR
				[DOCUMENTS:7]Heading:2:=Remote_Rec
				$_t_PathName:=Remote_Rec
				[DOCUMENTS:7]Document_Font:7:=Remote_Rec
				[DOCUMENTS:7]Document_Font_Size:8:=Num:C11(Remote_Rec)
				[DOCUMENTS:7]Standard:9:=(Remote_Rec="1")
				[DOCUMENTS:7]Person:10:=Remote_Rec
				[DOCUMENTS:7]Table_Number:11:=Num:C11(Remote_Rec)
				[DOCUMENTS:7]Analysis_Code:12:=Remote_Rec
				[DOCUMENTS:7]Document_Type:13:=Remote_Rec
				$_t_Remainder:=Remote_Packet(vRec)
				DB_SaveRecord(->[DOCUMENTS:7])
				
				If ($_t_PathName="Fetch: @")
					$_t_PathName:=Substring:C12($_t_PathName; 8; 32000)
					SET CHANNEL:C77(10; [PERSONNEL:11]Export_Path:11+"Docs"+Folder separator:K24:12+$_t_PathName)
					If (OK=1)
						DELETE RECORD:C58([DOCUMENTS:7])
						RECEIVE RECORD:C79([DOCUMENTS:7])
						If (OK=1)
							[DOCUMENTS:7]Export:6:=""
							DB_SaveRecord(->[DOCUMENTS:7])
							Remote_ImSaveSe(->[DOCUMENTS:7]; $_bo_Create)
							SET CHANNEL:C77(11)
							DELETE DOCUMENT:C159([PERSONNEL:11]Export_Path:11+"Docs"+Folder separator:K24:12+$_t_PathName)
						Else 
							SET CHANNEL:C77(11)
							MESSAGE:C88("         "+"The Document text could not be received"+Char:C90(13))
						End if 
					Else 
						MESSAGE:C88("         "+"The Document text document could not be opened"+Char:C90(13))
					End if 
				Else 
					MESSAGE:C88("         "+"The Document has no related text"+Char:C90(13))
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
Remote_ImSetSav("New Doc"; "Mod Doc"; "Not Doc"; "L"; ->[DOCUMENTS:7])
ERR_MethodTrackerReturn("Remote ImLet"; $_t_oldMethodName)
