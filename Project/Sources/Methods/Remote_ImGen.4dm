//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ImGen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/10/2011 14:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>RemOver; $_bo_Pasked; $_bo_Reject; $_bo_RemoteOver; $_bo_Unload)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; <>SYS_l_LoggedInaccount; $_l_CharacterIndex)
	C_TEXT:C284(<>OfficeCode; $_t_DateTimeString; $_t_FileStart; $_t_initials; $_t_Name; $_t_NumberSTR; $_t_oldMethodName; $_t_OrderCode; $_t_Packet; $_t_PassWord; $_t_PassWordRequest)
	C_TEXT:C284($_t_Start; $_t_SystemOfficeCode; $_t_TableName; $1; vFld; vRec; vText; vTitle2)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ImGen")
//Remote_ImGen

vText:=""
vTitle2:="Start"
$_bo_Pasked:=False:C215
RECEIVE PACKET:C104(vDoc; vText; 32000)
If (vText#"*START*…@")
	vFld:=Char:C90(198)
	vRec:=Char:C90(183)
End if 
$_t_Start:=Remote_Packet(vRec)

While (($_t_Start="*START*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_Start:=""
	$_t_initials:=Remote_Packet(vRec)
	$_t_Name:=Remote_Packet(vRec)
	$_t_DateTimeString:=Remote_Packet(vRec)
	MESSAGE:C88("      "+$_t_DateTimeString+Char:C90(13))
	$_t_FileStart:=Remote_Packet(vRec)
	
	If ((($_t_FileStart="*PASS*") | ($_t_FileStart="*P*")) & (<>SYS_l_CancelProcess#<>Process))
		$_t_PassWord:=Remote_Decode(Remote_Packet(vRec))
		If (($_bo_Pasked) | ($1="Rem"))
			$_t_FileStart:=Remote_Packet(vRec)
		Else 
			$_t_PassWordRequest:=Gen_Request("Please enter your Main System User Id:")
			ERASE WINDOW:C160
			MESSAGE:C88(Char:C90(13)+"      "+$_t_DateTimeString+Char:C90(13))
			If (OK=1)
				$_bo_Reject:=False:C215
				If (Length:C16($_t_PassWord)=Length:C16($_t_PassWordRequest))
					$_l_CharacterIndex:=1
					While ($_l_CharacterIndex<=Length:C16($_t_PassWordRequest))
						IDLE:C311  // 7/04/03 pb
						If (Character code:C91(Substring:C12($_t_PassWord; $_l_CharacterIndex; 1))#Character code:C91(Substring:C12($_t_PassWordRequest; $_l_CharacterIndex; 1)))
							$_bo_Reject:=True:C214
						End if 
						$_l_CharacterIndex:=$_l_CharacterIndex+1
					End while 
				Else 
					$_bo_Reject:=True:C214
				End if 
				If ($_bo_Reject)
					MESSAGE:C88("      INCORRECT USER ID"+Char:C90(13))
					<>SYS_l_CancelProcess:=<>Process
				Else 
					$_bo_Pasked:=True:C214
					$_t_FileStart:=Remote_Packet(vRec)
				End if 
			Else 
				MESSAGE:C88("      USER ID NOT KNOWN"+Char:C90(13))
				<>SYS_l_CancelProcess:=<>Process
			End if 
		End if 
	End if 
	If (($_t_FileStart="*OC*") & (<>SYS_l_CancelProcess#<>Process))
		$_t_OrderCode:=Remote_Packet(vRec)
		If ($1="Main")
			$_t_SystemOfficeCode:=Substring:C12(<>OfficeCode; 1; Length:C16(<>OfficeCode)-1)
			If (($_t_OrderCode#"") & ($_t_OrderCode#$_t_SystemOfficeCode))
				MESSAGE:C88("      UPDATING OFFICE CODE TO "+$_t_OrderCode+Char:C90(13))
				If (<>SYS_l_LoggedInaccount=0)
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
				Else 
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
				End if 
				$_bo_Unload:=(Records in selection:C76([USER:15])=0)
				LOAD RECORD:C52([USER:15])
				[USER:15]Office Code:13:=$_t_OrderCode
				DB_SaveRecord(->[USER:15])
				If ($_bo_Unload)
					UNLOAD RECORD:C212([USER:15])
				End if 
				<>OfficeCode:=$_t_OrderCode+"/"
				Menu_DisFile
			End if 
		End if 
		$_t_FileStart:=Remote_Packet(vRec)
	End if 
	
	If (($_t_FileStart="*RO*") & (<>SYS_l_CancelProcess#<>Process))
		$_t_Packet:=Remote_Packet(vRec)
		If ($1="Main")
			$_bo_RemoteOver:=($_t_Packet="1")
			If ($_bo_RemoteOver#<>RemOver)
				$_bo_Unload:=(Records in selection:C76([USER:15])=0)
				MESSAGE:C88("      UPDATING REMOTE / MAIN SYSTEM PRECEDENCE"+Char:C90(13))
				If (<>SYS_l_LoggedInaccount=0)
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
				Else 
					QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
				End if 
				LOAD RECORD:C52([USER:15])
				[USER:15]Remote Over:81:=$_bo_RemoteOver
				DB_SaveRecord(->[USER:15])
				If ($_bo_Unload)
					UNLOAD RECORD:C212([USER:15])
				End if 
				<>RemOver:=$_bo_RemoteOver
			End if 
		End if 
		$_t_FileStart:=Remote_Packet(vRec)
	End if 
	
	While (($_t_FileStart="*FILE*") & (<>SYS_l_CancelProcess#<>Process))
		$_t_TableName:=Remote_Packet(vRec)
		$_t_NumberSTR:=Remote_Packet(vRec)
		MESSAGE:C88("      "+$_t_NumberSTR+" "+$_t_TableName+Char:C90(13))
		Case of 
			: ($_t_TableName="Companies")
				Remote_ImComp
			: ($_t_TableName="Contacts")
				Remote_ImCont
			: ($_t_TableName="Diary")
				Remote_ImDry
			: ($_t_TableName="Products")
				Remote_ImProd
			: ($_t_TableName="Orders")
				Remote_ImOrd
			: ($_t_TableName="Areas")
				Remote_ImMin(->[AREAS:3]; ->[AREAS:3]Area_Code:1; ->[AREAS:3]Export:3; "Areas"; 2; 5)
			: ($_t_TableName="Postcodes")
				Remote_ImMin(->[POSTAL_CODES:50]; ->[POSTAL_CODES:50]Postal_Code_From:1; ->[POSTAL_CODES:50]Export:3; "Postcodes"; 2; 3)
			: ($_t_TableName="Status")
				Remote_ImMin(->[STATUS:4]; ->[STATUS:4]Status_Code:1; ->[STATUS:4]Export:3; "Status"; 2; 1)
			: ($_t_TableName="Types")
				Remote_ImMin(->[TYPES:5]; ->[TYPES:5]Type_Code:1; ->[TYPES:5]Export:3; "Types"; 2; 1)
			: ($_t_TableName="Sources")
				Remote_ImMin(->[SOURCES:6]; ->[SOURCES:6]Source_Code:1; ->[SOURCES:6]Export:13; "Sources"; 2; 11)
			: ($_t_TableName="Further Analyses")
				Remote_ImMin(->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Export:3; "Further Analyses"; 2; 1)
			: ($_t_TableName="Actions")
				Remote_ImMin(->[ACTIONS:13]; ->[ACTIONS:13]Action_Code:1; ->[ACTIONS:13]Export:3; "Actions"; 2; 1)
			: ($_t_TableName="Results")
				Remote_ImMin(->[RESULTS:14]; ->[RESULTS:14]Result_Code:1; ->[RESULTS:14]Export:4; "Results"; 2; 2)
			: ($_t_TableName="Sequences")
				Remote_ImMin(->[WORKFLOW_CONTROL:51]; ->[WORKFLOW_CONTROL:51]WFControl_Code:10; ->[WORKFLOW_CONTROL:51]Export:9; "Sequences"; 1; 8)
			: ($_t_TableName="Groups")
				Remote_ImMin(->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Export:7; "Groups"; 2; 5)
			: ($_t_TableName="Brands")
				Remote_ImMin(->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Export:3; "Brands"; 2; 1)
			: ($_t_TableName="Price Groups")
				Remote_ImMin(->[PRICE_GROUPS:18]; ->[PRICE_GROUPS:18]Price_Code:1; ->[PRICE_GROUPS:18]Export:7; "Price Groups"; 2; 5)
			: ($_t_TableName="Price Table")
				Remote_ImMin(->[PRICE_TABLE:28]; ->[PRICE_TABLE:28]Table_Code:12; ->[PRICE_TABLE:28]Export:11; "Price Table"; 1; 10)
			: ($_t_TableName="Countries")
				Remote_ImMin(->[COUNTRIES:73]; ->[COUNTRIES:73]COUNTRY_CODE:1; ->[COUNTRIES:73]Export:3; "Countries"; 2; 1)
			: ($_t_TableName="Address Formats")
				Remote_ImMin(->[ADDRESS_FORMATS:74]; ->[ADDRESS_FORMATS:74]Format_Code:1; ->[ADDRESS_FORMATS:74]Export:10; "Address Formats"; 2; 8)
			: ($_t_TableName="Documents")
				Remote_ImLet
			: ($_t_TableName="Deletions")
				Remote_ImDel
		End case 
		If ($_t_FileStart="*START*")
			$_t_Start:="*START*"
			$_t_FileStart:=""
		Else 
			$_t_FileStart:=Remote_Packet(vRec)
			If ($_t_FileStart="*START*")
				$_t_Start:="*START*"
				$_t_FileStart:=""
			Else 
				If (($_t_FileStart#"*FILE*") & ($_t_FileStart#"*EXEND*"))
					$_t_FileStart:=Remote_Packet(vRec)
					If ($_t_FileStart="*START*")
						$_t_Start:="*START*"
						$_t_FileStart:=""
					End if 
				End if 
			End if 
		End if 
	End while 
	If ($_t_Start#"*START*")
		$_t_Start:=Remote_Packet(vRec)
	End if 
End while 

If (<>SYS_l_CancelProcess#<>Process)
	[PERSONNEL:11]Last_Import:12:=$_t_DateTimeString
	DB_SaveRecord(->[PERSONNEL:11])
	AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
End if 
ERR_MethodTrackerReturn("Remote_ImGen"; $_t_oldMethodName)
