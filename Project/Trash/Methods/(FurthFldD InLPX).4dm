//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFldD_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; DB_bo_RecordModified)
	C_LONGINT:C283($_l_AssociatedTableNumber; $_l_CurrentWinRefOLD; $_l_ScreenCentreVertical; $_l_TableRow; r0; r1; r2; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_FieldName; $_t_FIeldNameOLD; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFldD_InLPX")
//FurthFldD_InLPX

Case of 
	: ($1=(->[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2))
		[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2:=Uppers2([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2)
		$_t_FIeldNameOLD:=Old:C35([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2)
		DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
		$_t_FieldName:=[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2
		$_l_AssociatedTableNumber:=[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3
		CUT NAMED SELECTION:C334([CUSTOM_FIELD_DEFINITiONS:99]; "$fd")
		QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2=$_t_FieldName)
		If (Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])>1)
			QUERY SELECTION:C341([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3#$_l_AssociatedTableNumber)
			If (Records in selection:C76([CUSTOM_FIELD_DEFINITiONS:99])=0)
				Gen_Alert("That Field Name has already been allocated to this same File"; "Try again")
			Else 
				
				$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; [CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3)
				Gen_Alert("That Field Name has already been allocated to the "+<>DB_at_TableNames{$_l_TableRow}+" File"; "Try again")
			End if 
			USE NAMED SELECTION:C332("$fd")
			[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2:=$_t_FIeldNameOLD
			DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
		Else 
			USE NAMED SELECTION:C332("$fd")
		End if 
		If (($_t_FIeldNameOLD#"") & ($_t_FIeldNameOLD#[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2) & (Character code:C91(Substring:C12($_t_FIeldNameOLD; Length:C16($_t_FIeldNameOLD); 1))#64))
			READ WRITE:C146([CUSTOM_FIELDS:98])
			QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=$_t_FIeldNameOLD)
			If (Records in selection:C76([CUSTOM_FIELDS:98])#Records in table:C83([CUSTOM_FIELDS:98]))
				DB_lockFile(->[CUSTOM_FIELDS:98])
				APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3:=[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
			End if 
			READ ONLY:C145([CUSTOM_FIELDS:98])
			UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		End if 
		DB_bo_RecordModified:=True:C214
	: ($1=(->[CUSTOM_FIELD_DEFINITiONS:99]List_Name:5))
		If ([CUSTOM_FIELD_DEFINITiONS:99]Type:6#"D")
			If ([CUSTOM_FIELD_DEFINITiONS:99]Type:6="N")
				Check_Lists(->[CUSTOM_FIELD_DEFINITiONS:99]List_Name:5; "Formats")
			Else 
				Check_Lists(->[CUSTOM_FIELD_DEFINITiONS:99]List_Name:5; "Lists")
			End if 
		End if 
		DB_bo_RecordModified:=True:C214
	: ($1=(->[CUSTOM_FIELD_DEFINITiONS:99]Type:6))
		$_t_FIeldNameOLD:=Old:C35([CUSTOM_FIELD_DEFINITiONS:99]Type:6)
		If (([CUSTOM_FIELD_DEFINITiONS:99]Type:6#"A") & ([CUSTOM_FIELD_DEFINITiONS:99]Type:6#"T") & ([CUSTOM_FIELD_DEFINITiONS:99]Type:6#"N") & ([CUSTOM_FIELD_DEFINITiONS:99]Type:6#"D"))
			<>SYS_bo_CurrentWindowModal:=True:C214
			$_l_ScreenCentreVertical:=Screen width:C187/2
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-145; 130; $_l_ScreenCentreVertical+145; 275)
			DIALOG:C40([CUSTOM_FIELD_DEFINITiONS:99]; "dField Type")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			<>SYS_bo_CurrentWindowModal:=False:C215
			Case of 
				: (r0=1)
					[CUSTOM_FIELD_DEFINITiONS:99]Type:6:="A"
				: (r1=1)
					[CUSTOM_FIELD_DEFINITiONS:99]Type:6:="T"
				: (r2=1)
					[CUSTOM_FIELD_DEFINITiONS:99]Type:6:="N"
				Else 
					[CUSTOM_FIELD_DEFINITiONS:99]Type:6:="D"
			End case 
		Else 
			[CUSTOM_FIELD_DEFINITiONS:99]Type:6:=Uppercase:C13([CUSTOM_FIELD_DEFINITiONS:99]Type:6)
		End if 
		If ((Old:C35([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2)#"") & ($_t_FIeldNameOLD#"") & ($_t_FIeldNameOLD#[CUSTOM_FIELD_DEFINITiONS:99]Type:6))
			READ WRITE:C146([CUSTOM_FIELDS:98])
			QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Field_Name:3=[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2)
			If (Records in selection:C76([CUSTOM_FIELDS:98])>0)
				Gen_Confirm("Are you sure you want to convert existing data from Type "+$_t_FIeldNameOLD+" to Type "+[CUSTOM_FIELD_DEFINITiONS:99]Type:6+"?"; "No"; "Yes")
				If (OK=1)
					[CUSTOM_FIELD_DEFINITiONS:99]Type:6:=$_t_FIeldNameOLD
				Else 
					Case of 
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="A") & ($_t_FIeldNameOLD="T"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]String_31:4:=Substring:C12([CUSTOM_FIELDS:98]Text_Field:6; 1; 79))  //NG November 2004
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="T") & ($_t_FIeldNameOLD="A"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6:=[CUSTOM_FIELDS:98]String_31:4)
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="N") & ($_t_FIeldNameOLD="T"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Real_or_Integer:5:=Num:C11([CUSTOM_FIELDS:98]Text_Field:6))
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="N") & ($_t_FIeldNameOLD="A"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Real_or_Integer:5:=Num:C11([CUSTOM_FIELDS:98]String_31:4))
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="D") & ($_t_FIeldNameOLD="T"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Date_Field:7:=Date:C102([CUSTOM_FIELDS:98]Text_Field:6))
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="D") & ($_t_FIeldNameOLD="A"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Date_Field:7:=Date:C102([CUSTOM_FIELDS:98]String_31:4))
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="T") & ($_t_FIeldNameOLD="N"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6:=String:C10([CUSTOM_FIELDS:98]Real_or_Integer:5))
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="A") & ($_t_FIeldNameOLD="N"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]String_31:4:=String:C10([CUSTOM_FIELDS:98]Real_or_Integer:5))
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="T") & ($_t_FIeldNameOLD="D"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Text_Field:6:=String:C10([CUSTOM_FIELDS:98]Date_Field:7))
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
						: (([CUSTOM_FIELD_DEFINITiONS:99]Type:6="A") & ($_t_FIeldNameOLD="D"))
							DB_lockFile(->[CUSTOM_FIELDS:98])
							APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]String_31:4:=String:C10([CUSTOM_FIELDS:98]Date_Field:7))
							
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[CUSTOM_FIELDS:98]))
					End case 
				End if 
			End if 
			READ ONLY:C145([CUSTOM_FIELDS:98])
			UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
		End if 
		DB_bo_RecordModified:=True:C214
	: ($1=(->[CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4))
		DB_bo_RecordModified:=True:C214
End case 
ERR_MethodTrackerReturn("FurthFldD_InLPX"; $_t_oldMethodName)