//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_ContDef
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>SYS_bo_ContactDuplicateCheck)
	C_LONGINT:C283($_l_Event; $_l_Type)
	C_POINTER:C301($1; $2)
	C_REAL:C285($3)
	C_TEXT:C284(<>DefRole; $_t_oldMethodName; $_t_Search; vContName; VContNameJT; vExtn; vLayCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_ContDef")
//Check_ContDef
$_l_Event:=Form event code:C388

If ($1->#"")
	If ($2->#"")
		$_l_Type:=Type:C295($2->)
		If ($_l_Type=Is alpha field:K8:1)
			RELATE ONE:C42($2->)
		Else 
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$2->)
		End if 
		
		
		If ((<>SYS_bo_ContactDuplicateCheck) & (([CONTACTS:1]Duplicate_State:26="") | ([CONTACTS:1]Duplicate_State:26="U@") | ([CONTACTS:1]Duplicate_State:26="D@")) | ([CONTACTS:1]Deleted:32=1))
			$2->:=""
			vContName:=""
			vExtn:=""
		Else 
			$_t_Search:=$1->
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_Search)
			If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
				$2->:=""
				vContName:=""
				vExtn:=""
			End if 
		End if 
	End if 
	If ($2->="")
		If (vLayCode#"")
			If (Not:C34($_l_Event=On Load:K2:1))
				
				Cont_SelFS(Sel_AtSign(vLayCode))
				SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
				QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$1->; *)
				QUERY SELECTION:C341([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
				
				SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
				QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
				QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
				If (Records in selection:C76([CONTACTS:1])>0)
					$2->:=[CONTACTS:1]Contact_Code:2
				End if 
			End if 
			vLayCode:=""
		End if 
		If ($2->="")
			
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$1->; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
			If (<>DefRole#"")
				If ((Records in selection:C76([CONTACTS:1])>1) & ([CONTACTS:1]Role:11#<>DefRole))
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Role:11=<>DefRole; *)
					QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
					If (Records in selection:C76([CONTACTS:1])=0)
						QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$1->; *)
						QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
						SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
						QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
					End if 
				End if 
			End if 
			If (<>SYS_bo_ContactDuplicateCheck)
				QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Duplicate_State:26#""; *)
				QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Duplicate_State:26#"U@"; *)
				QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Duplicate_State:26#"D@"; *)
				QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32#1)
			End if 
			$2->:=[CONTACTS:1]Contact_Code:2
		End if 
		// Contact_Details
		vContName:=CON_BuildContactNameandJobTitle
		VContNameJT:=[CONTACTS:1]Job_Title:6
	End if 
End if 
ERR_MethodTrackerReturn("Check_ContDef"; $_t_oldMethodName)
