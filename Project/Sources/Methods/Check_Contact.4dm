//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Contact
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	C_BOOLEAN:C305(<>MultiCo; <>SYS_bo_ContactDuplicateCheck; $_bo_OK)
	C_LONGINT:C283($_l_CharPosition; $_l_CompanyRow; $_l_CurrentRow; $_l_Index; $_l_Type)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_CloseSave; $_t_ForeName; $_t_oldMethodName; $_t_Surname; $4; COM_t_TelephoneNumberFormat; DB_t_CallOnCloseorSave; Gen_t_FirstName; Gen_t_Surname; GEN_t_Title)
	C_TEXT:C284(vCompany; vCompName; vContName; vSearch; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Contact")
//Check_Contact
If ($1->#"")
	$1->:=Check_QM($1->)
	$_t_CloseSave:=DB_t_CallOnCloseorSave
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
	If ($2->#"")
		If (<>MultiCo)
			SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$2->; *)
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			
		Else 
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$2->)
		End if 
	End if 
	
	If ((Records in selection:C76([CONTACTS:1])=1) & ([CONTACTS:1]Contact_Code:2=$1->) & (Character code:C91(Substring:C12($1->; Length:C16($1->); 1))#64))
		
		$1->:=Uppercase:C13($1->)
		//  Contact_Details
		vContName:=CON_BuildContactNameandJobTitle
		Case of 
			: (Count parameters:C259<4)  //``````WT-06/26
				$_l_Type:=Type:C295($2->)
				If ($_l_Type=Is alpha field:K8:1)
					$_bo_OK:=(Table:C252($2)#2)
					
				Else 
					$_bo_OK:=True:C214
				End if 
				
				If ($_bo_OK)
					If (<>MultiCo)
						If ($2->#"")
							ARRAY TEXT:C222($_at_CompanyCodes; 99)
							$_l_CurrentRow:=0
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							FIRST RECORD:C50([CONTACTS_COMPANIES:145])
							For ($_l_Index; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
								$_l_CurrentRow:=$_l_CurrentRow+1
								$_at_CompanyCodes{$_l_CurrentRow}:=[CONTACTS_COMPANIES:145]Company_Code:1
								NEXT RECORD:C51([CONTACTS_COMPANIES:145])
							End for 
							ARRAY TEXT:C222($_at_CompanyCodes; $_l_CurrentRow)
							$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; $2->)
							If ($_l_CompanyRow<0)
								Check_MultiCo($1; $2; $3)
							End if 
						Else 
							Check_MultiCo($1; $2; $3)
						End if 
						
						
					Else 
						If ($2->#[CONTACTS:1]Company_Code:1)
							$2->:=[CONTACTS:1]Company_Code:1
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$2->)
							vCompName:=[COMPANIES:2]Company_Name:2
							vTel:=[COMPANIES:2]Telephone:9
							If ([COMPANIES:2]Country:8#"")
								If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
									QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
									COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
								End if 
							Else 
								COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
							End if 
							If (COM_t_TelephoneNumberFormat#"")
								OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
							End if 
						End if 
					End if 
				End if 
			Else   //``````WT-06/26
				If (<>MultiCo)  //``````WT-06/26
					If ($2->#"")
						ARRAY TEXT:C222($_at_CompanyCodes; 99)
						$_l_CurrentRow:=0
						QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
						QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
						FIRST RECORD:C50([CONTACTS_COMPANIES:145])
						For ($_l_Index; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
							$_l_CurrentRow:=$_l_CurrentRow+1
							$_at_CompanyCodes{$_l_CurrentRow}:=[CONTACTS_COMPANIES:145]Company_Code:1
							NEXT RECORD:C51([CONTACTS_COMPANIES:145])
						End for 
						ARRAY TEXT:C222($_at_CompanyCodes; $_l_CurrentRow)
						$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; $2->)
						If ($_l_CompanyRow<0)
							Check_MultiCo($1; $2; $3; "SuperDiary")  //``````WT-06/26
						End if 
					Else 
						Check_MultiCo($1; $2; $3; "SuperDiary")  //``````WT-06/26
					End if 
					
					
				Else   //``````WT-06/26
					If ($2->#[CONTACTS:1]Company_Code:1)  //``````WT-06/26
						$2->:=[CONTACTS:1]Company_Code:1  //``````WT-06/26
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$2->)  //``````WT-06/26
						vCompName:=[COMPANIES:2]Company_Name:2  //``````WT-06/26
						vTel:=[COMPANIES:2]Telephone:9  //``````WT-06/26
						If ([COMPANIES:2]Country:8#"")
							If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
								QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
								COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
							End if 
						Else 
							COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
						End if 
						If (COM_t_TelephoneNumberFormat#"")
							OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
						End if 
					End if   //``````WT-06/26
				End if   //``````WT-06/26
		End case   //``````WT-06/26
	Else 
		If (Character code:C91(Substring:C12($1->; Length:C16($1->); 1))#64)
			vSearch:=$1->+"@"
		Else 
			vSearch:=$1->
		End if 
		If (Count parameters:C259<4)  //``````WT-06/26
			$_l_Type:=Type:C295($2->)
			If ($_l_Type=Is alpha field:K8:1)
				$_bo_OK:=(Table:C252($2)#0)
			Else 
				$_bo_OK:=True:C214
			End if 
			
			If ($_bo_OK)
				vCompany:=$2->
			Else 
				vCompany:=""
			End if 
		Else   //``````WT-06/26
			vCompany:=""  //``````WT-06/26
		End if   //``````WT-06/26
		If (vCompany="")
			Check_ContSrch(->vSearch)
			Case of 
				: (Records in selection:C76([CONTACTS:1])=1)
					$1->:=[CONTACTS:1]Contact_Code:2
				: (Records in selection:C76([CONTACTS:1])>1)
					Check_Cont($1; $2; $3)
				: (Records in selection:C76([CONTACTS:1])=0)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=vSearch; *)
					QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
					Case of 
						: (Records in selection:C76([CONTACTS:1])=1)
							$1->:=[CONTACTS:1]Contact_Code:2
						: (Records in selection:C76([CONTACTS:1])>1)
							Check_Cont($1; $2; $3)
						: (Records in selection:C76([CONTACTS:1])=0)
							
							If ((vSearch="@ @") | (vSearch="@,@"))
								$_l_CharPosition:=Position:C15(","; vSearch)
								If ($_l_CharPosition>0)
									$_t_Surname:=Substring:C12(vSearch; 1; $_l_CharPosition-1)
									$_t_ForeName:=RemoveLead(Substring:C12(vSearch; $_l_CharPosition+1; 32000))
								Else 
									AA_LoadNameArrays
									GEN_t_Title:=""
									Gen_t_FirstName:=""
									Gen_t_Surname:=""
									AA_ParseName(Vsearch; 0; ->GEN_t_Title; ->Gen_t_FirstName; ->Gen_t_Surname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
									$_t_ForeName:=Gen_t_FirstName
									$_t_Surname:=Gen_t_Surname
								End if 
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ForeName; *)
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname; *)
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
							End if 
							Case of 
								: (Records in selection:C76([CONTACTS:1])=1)
									$1->:=[CONTACTS:1]Contact_Code:2
								: (Records in selection:C76([CONTACTS:1])>1)
									Check_Cont($1; $2; $3)
								: (Records in selection:C76([CONTACTS:1])=0)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=vSearch; *)
									QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
									If (Records in selection:C76([CONTACTS:1])=1)
										$1->:=[CONTACTS:1]Contact_Code:2
									Else 
										Check_Cont($1; $2; $3)
									End if 
							End case 
					End case 
			End case 
		Else 
			If (Length:C16($1->)=1)
				Check_ContSrch(->vSearch)
				If (<>MultiCo)
					SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
					QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$2->; *)
					QUERY SELECTION:C341([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
					
					SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					
					
				Else 
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$2->)
				End if 
				If (Records in selection:C76([CONTACTS:1])=1)
					$1->:=[CONTACTS:1]Contact_Code:2
				Else 
					Check_Cont($1; $2; $3)
				End if 
			Else 
				Check_ContSrch(->vSearch)
				If (<>MultiCo)
					SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
					QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$2->; *)
					QUERY SELECTION:C341([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
					
					SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
				Else 
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$2->)
				End if 
				Case of 
					: (Records in selection:C76([CONTACTS:1])=1)
						$1->:=[CONTACTS:1]Contact_Code:2
					: (Records in selection:C76([CONTACTS:1])>1)
						Check_Cont($1; $2; $3)
					: (Records in selection:C76([CONTACTS:1])=0)
						If (<>MultiCo)
							$_l_Type:=2
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$2->; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
							QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
						Else 
							$_l_Type:=1
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$2->; *)
						End if 
						If ($_l_Type=1)
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=vSearch; *)
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
						Else 
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Forename:4=vSearch; *)
							QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
						End if 
						Case of 
							: (Records in selection:C76([CONTACTS:1])=1)
								$1->:=[CONTACTS:1]Contact_Code:2
							: (Records in selection:C76([CONTACTS:1])>1)
								Check_Cont($1; $2; $3)
							: (Records in selection:C76([CONTACTS:1])=0)
								If (<>MultiCo)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$2->; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
									QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
									$_l_Type:=2
								Else 
									$_l_Type:=1
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$2->; *)
								End if 
								If ($_l_Type=1)
									QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Contact_Code:2=vSearch; *)
									QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
								Else 
									QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=vSearch; *)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
								End if 
								
								Case of 
									: (Records in selection:C76([CONTACTS:1])=1)
										$1->:=[CONTACTS:1]Contact_Code:2
									: (Records in selection:C76([CONTACTS:1])>1)
										Check_Cont($1; $2; $3)
									: (Records in selection:C76([CONTACTS:1])=0)
										If ((vSearch="@ @") | (vSearch="@,@"))
											$_l_CharPosition:=Position:C15(","; vSearch)
											If ($_l_CharPosition>0)
												$_t_Surname:=Substring:C12(vSearch; 1; $_l_CharPosition-1)
												$_t_ForeName:=RemoveLead(Substring:C12(vSearch; $_l_CharPosition+1; 32000))
											Else 
												$_l_CharPosition:=Position:C15(" "; vSearch)
												$_t_ForeName:=Substring:C12(vSearch; 1; $_l_CharPosition-1)
												$_t_Surname:=RemoveLead(Substring:C12(vSearch; $_l_CharPosition+1; 32000))
											End if 
											If (<>MultiCo)
												QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$2->; *)
												QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
												SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
												QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
												$_l_Type:=2
											Else 
												$_l_Type:=1
												QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$2->; *)
											End if 
											If ($_l_Type=1)
												QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_ForeName; *)
												QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname; *)
												QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
											Else 
												QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ForeName; *)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname; *)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)
											End if 
											
										End if 
										Case of 
											: (Records in selection:C76([CONTACTS:1])=1)
												$1->:=[CONTACTS:1]Contact_Code:2
											: (Records in selection:C76([CONTACTS:1])>1)
												Check_Cont($1; $2; $3)
											: (Records in selection:C76([CONTACTS:1])=0)
												If (<>MultiCo)
													QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$2->; *)
													QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
													SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
													QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
													
												Else 
													
													QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$2->)
												End if 
												QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32=0)
												Check_Cont($1; $2; $3)
										End case 
								End case 
						End case 
				End case 
			End if 
		End if 
		If ([CONTACTS:1]Contact_Code:2#$1->)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
			
		End if 
		If (<>SYS_bo_ContactDuplicateCheck)
			If (([CONTACTS:1]Duplicate_State:26="") | ([CONTACTS:1]Duplicate_State:26="U@") | ([CONTACTS:1]Duplicate_State:26="D@"))
				Gen_Alert("That Contact cannot be used, as it has not yet been Duplicate Checked"; "Try again")
				$1->:=""
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
				GOTO OBJECT:C206($1->)
			End if 
		End if 
		// Contact_Details
		vContName:=CON_BuildContactNameandJobTitle
		If ($1->#"")
			If (Count parameters:C259<4)  //``````WT-06/26
				$_l_Type:=Type:C295($2->)
				If ($_l_Type=Is alpha field:K8:1)
					$_bo_OK:=(Table:C252($2)#2)
					
				Else 
					$_bo_OK:=True:C214
				End if 
				If ($_bo_OK)
					If (<>MultiCo)
						
						
						If ($2->#"")
							ARRAY TEXT:C222($_at_CompanyCodes; 99)
							$_l_CurrentRow:=0
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							For ($_l_Index; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
								$_l_CurrentRow:=$_l_CurrentRow+1
								$_at_CompanyCodes{$_l_CurrentRow}:=[CONTACTS_COMPANIES:145]Company_Code:1
								NEXT RECORD:C51([CONTACTS_COMPANIES:145])
							End for 
							ARRAY TEXT:C222($_at_CompanyCodes; $_l_CurrentRow)
							$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; $2->)
							If ($_l_CompanyRow<0)
								Check_MultiCo($1; $2; $3)
							End if 
						Else 
							Check_MultiCo($1; $2; $3)
						End if 
						
					Else 
						If ($2->#[CONTACTS:1]Company_Code:1)
							$2->:=[CONTACTS:1]Company_Code:1
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$2->)
							vCompName:=[COMPANIES:2]Company_Name:2
							vTel:=[COMPANIES:2]Telephone:9
						End if 
					End if 
				End if 
			Else   //``````WT-06/26
				If (<>MultiCo)  //``````WT-06/26
					If ($2->#"")
						ARRAY TEXT:C222($_at_CompanyCodes; 99)
						$_l_CurrentRow:=0
						QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
						QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
						For ($_l_Index; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
							$_l_CurrentRow:=$_l_CurrentRow+1
							$_at_CompanyCodes{$_l_CurrentRow}:=[CONTACTS_COMPANIES:145]Company_Code:1
							NEXT RECORD:C51([CONTACTS_COMPANIES:145])
						End for 
						ARRAY TEXT:C222($_at_CompanyCodes; $_l_CurrentRow)
						$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; $2->)
						If ($_l_CompanyRow<0)
							Check_MultiCo($1; $2; $3; "SuperDiary")
						End if 
					Else 
						Check_MultiCo($1; $2; $3; "SuperDiary")
					End if 
					
				Else   //``````WT-06/26
					If ($2->#[CONTACTS:1]Company_Code:1)  //``````WT-06/26
						$2->:=[CONTACTS:1]Company_Code:1  //``````WT-06/26
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$2->)  //``````WT-06/26
						vCompName:=[COMPANIES:2]Company_Name:2  //``````WT-06/26
						vTel:=[COMPANIES:2]Telephone:9  //``````WT-06/26
					End if   //``````WT-06/26
				End if   //``````WT-06/26
			End if   //``````WT-06/26
		End if   //``````WT-06/26
	End if 
	
	DB_t_CallOnCloseorSave:=$_t_CloseSave
Else 
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
	// Contact_Details
	vContName:=CON_BuildContactNameandJobTitle
End if 
ERR_MethodTrackerReturn("Check_Contact"; $_t_oldMethodName)
