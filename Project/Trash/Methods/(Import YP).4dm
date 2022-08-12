//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Import YP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Count; $_l_Create; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_AddressLine1; $_t_AddressLine2; $_t_CommentsLine4; $_t_CommentsLine5; $_t_CommentsLine6; $_t_CommentsLine7; $_t_CommentsLine8; $_t_CompanyAddress1; $_t_CompanyName; $_t_County)
	C_TEXT:C284($_t_FieldDelimiter; $_t_Line1; $_t_Line1A; $_t_Line1B; $_t_Line1C; $_t_Line2; $_t_Line2a; $_t_Line2b; $_t_Line2c; $_t_Line3; $_t_oldMethodName)
	C_TEXT:C284($_t_PostCode; $_t_StopCharacter; $_t_Telephone1; $_t_Telephone2; $_t_TelephoneTown; $_t_TelephoneTown2; $_t_Town; vArea; vCompName; vSales; vSource)
	C_TEXT:C284(vStatus; vT; vText; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Import YP")
//Import YP
$_l_Count:=0
Open_PrD_Window("Import YP: Command-. to Cancel")
$_t_StopCharacter:=">"
$_t_FieldDelimiter:=Char:C90(13)
RECEIVE PACKET:C104(vText; $_t_StopCharacter)
While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
	IDLE:C311  // 03/04/03 pb
	RECEIVE PACKET:C104(vText; $_t_StopCharacter)
	vT:=vText
	$_t_CompanyName:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_Line1:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_Line2:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_Line3:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_CommentsLine4:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_CommentsLine5:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_CommentsLine6:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_CommentsLine7:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	$_t_CommentsLine8:=RemoveLead(First_Field(->vT; $_t_FieldDelimiter))
	
	$_t_Line1A:=First_Field(->$_t_Line1; ",")
	//$_t_Line1:=Substring($_t_Line1;Length($_t_Line1A)+2;32000)
	$_t_Line1B:=First_Field(->$_t_Line1; ",")
	$_t_Line1C:=RemoveLead($_t_Line1)
	$_t_Line1B:=RemoveLead($_t_Line1B)
	
	$_t_Line2a:=First_Field(->$_t_Line2; ",")
	//$_t_Line2:=Substring($_t_Line2;Length($_t_Line2a)+2;32000)
	$_t_Line2b:=First_Field(->$_t_Line2; ",")
	$_t_Line2c:=RemoveLead($_t_Line2)
	$_t_Line2b:=RemoveLead($_t_Line2b)
	
	$_t_TelephoneTown:=FirstWord($_t_Line3)
	If ((Num:C11($_t_TelephoneTown)>0) | ($_t_TelephoneTown="0@") | ($_t_TelephoneTown="(0@"))
		$_t_TelephoneTown:=""
		$_t_Telephone1:=$_t_Line3
	Else 
		$_t_Telephone1:=RemoveLead(Substring:C12($_t_Line3; Length:C16($_t_TelephoneTown)+1; 32000))
		$_t_TelephoneTown2:=FirstWord($_t_Telephone1)
		If ((Num:C11($_t_TelephoneTown2)>0) | ($_t_TelephoneTown2="0@") | ($_t_TelephoneTown2="(0@"))
			$_t_Telephone2:=""
		Else 
			$_t_Telephone1:=RemoveLead(Substring:C12($_t_Telephone1; Length:C16($_t_TelephoneTown2)+1; 32000))
			$_t_TelephoneTown:=$_t_TelephoneTown+" "+$_t_TelephoneTown2
		End if 
	End if 
	
	If (Length:C16($_t_Line1A)<4)
		$_t_AddressLine1:=$_t_Line1A+" "+$_t_Line1B
		$_t_AddressLine2:=$_t_Line1C
	Else 
		If ($_t_Line1C#"")
			$_t_AddressLine1:=$_t_Line1A+", "+$_t_Line1B
			$_t_AddressLine2:=$_t_Line1C
		Else 
			$_t_AddressLine1:=$_t_Line1A
			$_t_AddressLine2:=$_t_Line1B
		End if 
	End if 
	
	If ($_t_Line2c="")
		$_t_Town:=$_t_TelephoneTown
		$_t_County:=$_t_Line2a
		$_t_PostCode:=$_t_Line2b
	Else 
		$_t_Town:=$_t_Line2a
		$_t_County:=$_t_Line2b
		$_t_PostCode:=$_t_Line2c
	End if 
	
	$_l_Create:=0
	If ($_t_CompanyName#"")
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName; *)
		QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Town_or_City:5=$_t_Town)
		If (Records in selection:C76([COMPANIES:2])>1)
			$_t_CompanyAddress1:=Substring:C12($_t_AddressLine1; 1; 8)
			QUERY SELECTION:C341([COMPANIES:2]Address_Line_one:3=$_t_CompanyAddress1)
		End if 
		If (Records in selection:C76([COMPANIES:2])=0)
			CREATE RECORD:C68([COMPANIES:2])
			vCompName:=$_t_CompanyName
			Company_No
			$_l_Create:=1
		End if 
		$_l_Count:=$_l_Count+1
		MESSAGE:C88(String:C10($_l_Count)+"  "+$_t_CompanyName+Char:C90(13))
		[COMPANIES:2]Company_Name:2:=$_t_CompanyName
		[COMPANIES:2]Address_Line_one:3:=$_t_AddressLine1
		[COMPANIES:2]Address_Line_two:4:=$_t_AddressLine2
		[COMPANIES:2]Town_or_City:5:=Uppercase:C13($_t_Town)
		[COMPANIES:2]County_or_State:6:=$_t_County
		[COMPANIES:2]Postal_Code:7:=$_t_PostCode
		[COMPANIES:2]Telephone:9:=$_t_Telephone1
		[COMPANIES:2]Status:12:=vStatus
		[COMPANIES:2]Company_Type:13:=vType
		[COMPANIES:2]Source:14:=vSource
		If ([COMPANIES:2]Entry_Date:16=!00-00-00!)
			[COMPANIES:2]Entry_Date:16:=<>DB_d_CurrentDate
		End if 
		[COMPANIES:2]Modified_Date:32:=<>DB_d_CurrentDate
		[COMPANIES:2]Omit:17:="N"
		[COMPANIES:2]Area:11:=vArea
		If (vArea="")
			If ($_t_PostCode#"")
				Companies_InPC
			End if 
		End if 
		[COMPANIES:2]Taken_By:26:=<>PER_t_CurrentUserInitials
		[COMPANIES:2]Sales_Person:29:=vSales
		If ($_t_CommentsLine4#"")
			[COMPANIES:2]Comments:30:=[COMPANIES:2]Comments:30+$_t_CommentsLine4+Char:C90(13)
		End if 
		If ($_t_CommentsLine5#"")
			[COMPANIES:2]Comments:30:=[COMPANIES:2]Comments:30+$_t_CommentsLine5+Char:C90(13)
		End if 
		If ($_t_CommentsLine6#"")
			[COMPANIES:2]Comments:30:=[COMPANIES:2]Comments:30+$_t_CommentsLine6+Char:C90(13)
		End if 
		If ($_t_CommentsLine7#"")
			[COMPANIES:2]Comments:30:=[COMPANIES:2]Comments:30+$_t_CommentsLine7+Char:C90(13)
		End if 
		If ($_t_CommentsLine8#"")
			[COMPANIES:2]Comments:30:=[COMPANIES:2]Comments:30+$_t_CommentsLine8+Char:C90(13)
		End if 
		DB_SaveRecord(->[COMPANIES:2])
		AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
		If ($_l_Create=1)
			ADD TO SET:C119([COMPANIES:2]; "CMaster")
		Else 
			ADD TO SET:C119([COMPANIES:2]; "Master")
		End if 
		
	End if 
	
End while 
CLOSE WINDOW:C154
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
Companies_ImpEn
ERR_MethodTrackerReturn("Import YP"; $_t_oldMethodName)