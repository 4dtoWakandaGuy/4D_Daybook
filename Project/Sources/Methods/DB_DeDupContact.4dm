//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_DeDupContact
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Redeye0735
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_ContactCodes;0)
	//ARRAY TEXT(SD_at_ContactCompanyCodes;0)
	//ARRAY TEXT(SD_at_ContactInfo;0)
	//ARRAY TEXT(SD_at_ContactNames;0)
	C_BOOLEAN:C305($_bo_ReturnToCompany)
	C_LONGINT:C283($_l_ContactsIndex; $_l_CurrentWinRefOLD; $_l_SelectedCompaniesRecord; $_l_SoundexLength; $_l_TableNumber; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Table; $2; $3)
	C_REAL:C285($5; $6)
	C_TEXT:C284($_t_Character1; $_t_CharacterString; $_t_ContactCodeString; $_t_ContactNameString; $_t_FilteredContactName; $_t_oldMethodName; $_t_SoundexSub; $_t_Sounds; $_t_Soundsex; $0; $1)
	C_TEXT:C284($4; SD_t_AttachContactCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DeDupContact")

//Method DB_DeDupContact
//NG August 2004 based on DB_DeDupCompany This method finds similare contacts
$_t_oldMethodName:=ERR_MethodTracker("DB_DeDupContact")
//First we create a sound alike string
ARRAY TEXT:C222(SD_at_ContactCodes; 0)
ARRAY TEXT:C222(SD_at_ContactNames; 0)
SD_t_AttachContactCode:=""
$_t_CharacterString:="aehiouwybfpvcgjkqsxzdtlmnr"
$_t_Sounds:="11111111222233333333445667"

If ($1#"")
	//now filter out any extranious chars first
	$_t_FilteredContactName:=DB_ContactNameClean($1)
	$_t_Character1:=$_t_FilteredContactName[[1]]
	//Now we build a soundex of that
	$_t_Soundsex:=DB_BuildSoundex($_t_FilteredContactName)
	$_l_TableNumber:=Table:C252($2)
	$_ptr_Table:=Table:C252($_l_TableNumber)
	CREATE EMPTY SET:C140($_ptr_Table->; "ReturnSet2")
	$_l_SoundexLength:=Length:C16($_t_Soundsex)
	Repeat 
		
		$_t_SoundexSub:=Substring:C12($_t_Soundsex; 1; $_l_SoundexLength)
		$_l_SoundexLength:=$_l_SoundexLength-1
		QUERY:C277($_ptr_Table->; $2->=$_t_SoundexSub+"@"; *)
		If ($4#"")
			QUERY:C277($_ptr_Table->;  & ; $3->=$4+"@")
		Else 
			QUERY:C277($_ptr_Table->)
		End if 
		
		If (Records in selection:C76($_ptr_Table->)>0)
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Contact_Name:31#"")
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
			QUERY SELECTION BY FORMULA:C207([CONTACTS:1]; DB_ContactNameClean([CONTACTS:1]Surname:5)[[1]]=$_t_Character1)
			CREATE SET:C116($_ptr_Table->; "JOIN2")
			UNION:C120("ReturnSet2"; "JOIN2"; "ReturnSet2")
		End if 
	Until (Length:C16($_t_SoundexSub)<=5)
	
	
	CLEAR SET:C117("JOIN2")
	USE SET:C118("ReturnSet2")
	
	
	
	//CLEAR SET("ReturnSet")
	If (Records in selection:C76([CONTACTS:1])>0)
		If (Records in set:C195("Rejected2")>0)  // Empty set is created before forms are displayed
			//CREATE SET([COMPANIES];"ReturnSet")
			DIFFERENCE:C122("ReturnSet2"; "Rejected2"; "ReturnSet2")
			USE SET:C118("ReturnSet2")
		End if 
		If (Records in selection:C76([CONTACTS:1])>0)
			
			SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; SD_at_ContactCodes; [CONTACTS:1]Contact_Name:31; SD_at_ContactNames; [CONTACTS:1]Company_Code:1; SD_at_ContactCompanyCodes)
			ARRAY TEXT:C222(SD_at_ContactInfo; Size of array:C274(SD_at_ContactCodes))
			$_bo_ReturnToCompany:=False:C215
			If (Records in selection:C76([COMPANIES:2])>0)
				$_bo_ReturnToCompany:=True:C214
				COPY NAMED SELECTION:C331([COMPANIES:2]; "$Current")
				$_l_SelectedCompaniesRecord:=Selected record number:C246([COMPANIES:2])
			End if 
			
			For ($_l_ContactsIndex; 1; Size of array:C274(SD_at_ContactCodes))
				If (SD_at_ContactCompanyCodes{$_l_ContactsIndex}#"")
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=SD_at_ContactCompanyCodes{$_l_ContactsIndex})
					$_t_ContactCodeString:=" "*(10-Length:C16(SD_at_ContactCodes{$_l_ContactsIndex}))+SD_at_ContactCodes{$_l_ContactsIndex}
					$_t_ContactNameString:=" "*(50-Length:C16(SD_at_ContactNames{$_l_ContactsIndex}))+SD_at_ContactNames{$_l_ContactsIndex}
					Case of 
						: ([COMPANIES:2]Company_Name:2#"")
							
							SD_at_ContactInfo{$_l_ContactsIndex}:=$_t_ContactCodeString+$_t_ContactNameString+" ("+[COMPANIES:2]Company_Name:2+")"
							
						: ([COMPANIES:2]Town_or_City:5#"")
							SD_at_ContactInfo{$_l_ContactsIndex}:=$_t_ContactCodeString+$_t_ContactNameString+" ("+[COMPANIES:2]Town_or_City:5+")"
						: ([COMPANIES:2]Telephone:9#"")
							SD_at_ContactInfo{$_l_ContactsIndex}:=$_t_ContactCodeString+$_t_ContactNameString+" ("+[COMPANIES:2]Telephone:9+")"
						Else 
							SD_at_ContactInfo{$_l_ContactsIndex}:=$_t_ContactCodeString+$_t_ContactNameString  //+SD_at_ContactNames{$_l_ContactsIndex}
					End case 
				Else 
					SD_at_ContactInfo{$_l_ContactsIndex}:=$_t_ContactCodeString+$_t_ContactNameString  //+SD_at_ContactNames{$_l_ContactsIndex}
				End if 
				
			End for 
			
			HIDE WINDOW:C436
			UNLOAD RECORD:C212([CONTACTS:1])
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($5; $6; $5; $6; -1986)
			DIALOG:C40([USER:15]; "Contact_select")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			UNLOAD RECORD:C212([CONTACTS:1])
			If (SD_at_ContactInfo>0)
				$0:=SD_at_ContactNames{SD_at_ContactInfo}
				//CANCEL
				//this has to be handled in the form because when entering a company we WONT be cancelling out of the screen we will be attaching this contact to the company
				SD_t_AttachContactCode:=SD_at_ContactCodes{SD_at_ContactInfo}
			Else 
				UNION:C120("ReturnSet2"; "Rejected2"; "Rejected2")
				$0:=$1
			End if 
			If ($_bo_ReturnToCompany)
				USE NAMED SELECTION:C332("$Current")
				GOTO SELECTED RECORD:C245([COMPANIES:2]; $_l_SelectedCompaniesRecord)
			End if 
			
			CLEAR SET:C117("ReturnSet2")
		Else 
			CLEAR SET:C117("ReturnSet2")
			$0:=$1
			
			
		End if 
	Else 
		CLEAR SET:C117("ReturnSet2")
		$0:=$1
		
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_DeDupContact"; $_t_oldMethodName)