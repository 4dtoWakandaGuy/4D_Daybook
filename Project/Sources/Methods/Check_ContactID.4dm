//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_ContactID
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
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>MultiCo; <>SYS_bo_ContactDuplicateCheck)
	C_LONGINT:C283($_l_CharPosition; $_l_ContactID; $_l_Type; $0)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_CloseSave; $_t_ContactCodeOLD; $_t_ForeName; $_t_oldMethodName; $_t_Surname; AA_MNULL; COM_t_TelephoneNumberFormat; DB_t_CallOnCloseorSave; vCompany; vCompName)
	C_TEXT:C284(vContName; vSearch; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_ContactID")
//Check_Contact

$0:=0
$_l_ContactID:=0
If ($1->#"")
	$1->:=Check_QM($1->)
	$_t_CloseSave:=DB_t_CallOnCloseorSave
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
	If ((Records in selection:C76([CONTACTS:1])=1) & ([CONTACTS:1]Contact_Code:2=$1->) & (Character code:C91(Substring:C12($1->; Length:C16($1->); 1))#64))
		$1->:=Uppercase:C13($1->)
		//  Contact_Details
		$1->:=[CONTACTS:1]Contact_Name:31
		$0:=[CONTACTS:1]x_ID:33
		$_l_ContactID:=[CONTACTS:1]x_ID:33
		vContName:=CON_BuildContactNameandJobTitle
		If (<>MultiCo)
			Check_MultiCo(->[CONTACTS:1]Contact_Code:2; $2; $3)
		Else 
			QUERY:C277([COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
			If ($2->#[COMPANIES:2]x_ID:63)
				$2->:=[COMPANIES:2]x_ID:63
			End if 
		End if 
	Else 
		If (Character code:C91(Substring:C12($1->; Length:C16($1->); 1))#64)
			vSearch:=$1->+"@"
		Else 
			vSearch:=$1->
		End if 
		If (Count parameters:C259<4)  //``````WT-06/26
			If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
				
			End if 
			If ($2->>0)
				vCompany:=[COMPANIES:2]Company_Code:1
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
					$1->:=[CONTACTS:1]Contact_Name:31
					$0:=[CONTACTS:1]x_ID:33
					$_l_ContactID:=[CONTACTS:1]x_ID:33
				: (Records in selection:C76([CONTACTS:1])>1)
					$_t_ContactCodeOLD:=$1->
					If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
					End if 
					If ($2->>0)
						Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
					Else 
						AA_mnull:=""
						Check_Cont($1; ->AA_mnull; $3)
					End if 
					If ($1->#"") & ($1->#$_t_ContactCodeOLD)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
						$1->:=[CONTACTS:1]Contact_Name:31
						$0:=[CONTACTS:1]x_ID:33
						$_l_ContactID:=[CONTACTS:1]x_ID:33
					End if 
					
				: (Records in selection:C76([CONTACTS:1])=0)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=vSearch)
					Case of 
						: (Records in selection:C76([CONTACTS:1])=1)
							$1->:=[CONTACTS:1]Contact_Name:31
							$0:=[CONTACTS:1]x_ID:33
							$_l_ContactID:=[CONTACTS:1]x_ID:33
						: (Records in selection:C76([CONTACTS:1])>1)
							$_t_ContactCodeOLD:=$1->
							If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
							End if 
							If ($2->>0)
								Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
							Else 
								AA_mnull:=""
								Check_Cont($1; ->AA_mnull; $3)
							End if 
							If ($1->#"") & ($1->#$_t_ContactCodeOLD)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
								$1->:=[CONTACTS:1]Contact_Name:31
								$0:=[CONTACTS:1]x_ID:33
								$_l_ContactID:=[CONTACTS:1]x_ID:33
							End if 
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
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ForeName; *)
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname)
							End if 
							Case of 
								: (Records in selection:C76([CONTACTS:1])=1)
									$1->:=[CONTACTS:1]Contact_Name:31
									$0:=[CONTACTS:1]x_ID:33
									$_l_ContactID:=[CONTACTS:1]x_ID:33
								: (Records in selection:C76([CONTACTS:1])>1)
									$_t_ContactCodeOLD:=$1->
									If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
									End if 
									If ($2->>0)
										Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
									Else 
										AA_mnull:=""
										Check_Cont($1; ->AA_mnull; $3)
									End if 
									If ($1->#"") & ($1->#$_t_ContactCodeOLD)
										QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
										$0:=[CONTACTS:1]x_ID:33
										$_l_ContactID:=[CONTACTS:1]x_ID:33
										$1->:=[CONTACTS:1]Contact_Name:31
									End if 
								: (Records in selection:C76([CONTACTS:1])=0)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=vSearch)
									If (Records in selection:C76([CONTACTS:1])=1)
										$1->:=[CONTACTS:1]Contact_Name:31
										$0:=[CONTACTS:1]x_ID:33
										$_l_ContactID:=[CONTACTS:1]x_ID:33
									Else 
										$_t_ContactCodeOLD:=$1->
										If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
										End if 
										If ($2->>0)
											Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
										Else 
											AA_mnull:=""
											Check_Cont($1; ->AA_mnull; $3)
										End if 
										If ($1->#"") & ($1->#$_t_ContactCodeOLD)
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
											$1->:=[CONTACTS:1]Contact_Name:31
											$0:=[CONTACTS:1]x_ID:33
											$_l_ContactID:=[CONTACTS:1]x_ID:33
										End if 
									End if 
							End case 
					End case 
			End case 
		Else 
			If (Length:C16($1->)=1)
				If ([COMPANIES:2]x_ID:63#$2->)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
				End if 
				If (<>MultiCo)
					QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
					QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
					SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
				Else 
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
				End if 
				If (Records in selection:C76([CONTACTS:1])=1)
					$1->:=[CONTACTS:1]Contact_Name:31
					$0:=[COMPANIES:2]x_ID:63
					$_l_ContactID:=[CONTACTS:1]x_ID:33
				Else 
					$_t_ContactCodeOLD:=$1->
					If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
					End if 
					If ($2->>0)
						Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
					Else 
						AA_mnull:=""
						Check_Cont($1; ->AA_mnull; $3)
					End if 
					If ($1->#"") & ($1->#$_t_ContactCodeOLD)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
						$1->:=[CONTACTS:1]Contact_Name:31
						$0:=[CONTACTS:1]x_ID:33
						$_l_ContactID:=[CONTACTS:1]x_ID:33
					End if 
				End if 
			Else 
				Check_ContSrch(->vSearch)
				If ([COMPANIES:2]x_ID:63#$2->)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
				End if 
				If (<>MultiCo)
					CREATE SET:C116([CONTACTS:1]; "$Set1")
					QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
					QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
					
					SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					CREATE SET:C116([CONTACTS:1]; "$Set2")
					INTERSECTION:C121("$Set1"; "$Set2"; "$Set2")
					USE SET:C118("$Set2")
				Else 
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
				End if 
				Case of 
					: (Records in selection:C76([CONTACTS:1])=1)
						$1->:=[CONTACTS:1]Contact_Name:31
						$0:=[CONTACTS:1]x_ID:33
						$_l_ContactID:=[CONTACTS:1]x_ID:33
					: (Records in selection:C76([CONTACTS:1])>1)
						$_t_ContactCodeOLD:=$1->
						If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
						End if 
						If ($2->>0)
							Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
						Else 
							AA_mnull:=""
							Check_Cont($1; ->AA_mnull; $3)
						End if 
						If ($1->#"") & ($1->#$_t_ContactCodeOLD)
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
							$1->:=[CONTACTS:1]Contact_Name:31
							$0:=[CONTACTS:1]x_ID:33
							$_l_ContactID:=[CONTACTS:1]x_ID:33
						End if 
					: (Records in selection:C76([CONTACTS:1])=0)
						If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
						End if 
						If (<>MultiCo)
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
							QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
							$_l_Type:=2
						Else 
							$_l_Type:=1
							QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
						End if 
						If ($_l_Type=1)
							QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=vSearch)
						Else 
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Forename:4=vSearch)
						End if 
						
						Case of 
							: (Records in selection:C76([CONTACTS:1])=1)
								$1->:=[CONTACTS:1]Contact_Name:31
								$0:=[CONTACTS:1]x_ID:33
								$_l_ContactID:=[CONTACTS:1]x_ID:33
							: (Records in selection:C76([CONTACTS:1])>1)
								$_t_ContactCodeOLD:=$1->
								If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
								End if 
								If ($2->>0)
									Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
								Else 
									AA_mnull:=""
									Check_Cont($1; ->AA_mnull; $3)
								End if 
								If ($1->#"") & ($1->#$_t_ContactCodeOLD)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
									$1->:=[CONTACTS:1]Contact_Name:31
									$0:=[CONTACTS:1]x_ID:33
									$_l_ContactID:=[CONTACTS:1]x_ID:33
								End if 
							: (Records in selection:C76([CONTACTS:1])=0)
								If ([COMPANIES:2]x_ID:63#$2->)
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
								End if 
								If (<>MultiCo)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
									QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
									$_l_Type:=2
								Else 
									$_l_Type:=1
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
								End if 
								If ($_l_Type=1)
									QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Contact_Code:2=vSearch)
								Else 
									QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=vsearch)
								End if 
								Case of 
									: (Records in selection:C76([CONTACTS:1])=1)
										$0:=[CONTACTS:1]x_ID:33
										$_l_ContactID:=[CONTACTS:1]x_ID:33
										$1->:=[CONTACTS:1]Contact_Name:31
										$_l_ContactID:=[CONTACTS:1]x_ID:33
									: (Records in selection:C76([CONTACTS:1])>1)
										$_t_ContactCodeOLD:=$1->
										If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
										End if 
										If ($2->>0)
											Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
										Else 
											AA_mnull:=""
											Check_Cont($1; ->AA_mnull; $3)
										End if 
										If ($1->#"") & ($1->#$_t_ContactCodeOLD)
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
											$1->:=[CONTACTS:1]Contact_Name:31
											$0:=[CONTACTS:1]x_ID:33
											$_l_ContactID:=[CONTACTS:1]x_ID:33
											
										End if 
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
											If ([COMPANIES:2]x_ID:63#$2->)
												QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
											End if 
											If (<>MultiCo)
												QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
												QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
												SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
												QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
												$_l_Type:=2
											Else 
												$_l_Type:=1
												QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
											End if 
											If ($_l_Type=1)
												QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_ForeName; *)
												QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname)
											Else 
												QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ForeName; *)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname)
											End if 
											
										End if 
										Case of 
											: (Records in selection:C76([CONTACTS:1])=1)
												$0:=[CONTACTS:1]x_ID:33
												$_l_ContactID:=[CONTACTS:1]x_ID:33
											: (Records in selection:C76([CONTACTS:1])>1)
												$_t_ContactCodeOLD:=$1->
												If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
												End if 
												If ($2->>0)
													Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
												Else 
													AA_mnull:=""
													Check_Cont($1; ->AA_mnull; $3)
												End if 
												If ($1->#"") & ($1->#$_t_ContactCodeOLD)
													QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
													$0:=[CONTACTS:1]x_ID:33
													$_l_ContactID:=[CONTACTS:1]x_ID:33
												End if 
											: (Records in selection:C76([CONTACTS:1])=0)
												If ([COMPANIES:2]x_ID:63#$2->)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
												End if 
												If (<>MultiCo)
													QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
													QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
													SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
													QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
													
												Else 
													QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
												End if 
												$_t_ContactCodeOLD:=$1->
												If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
												End if 
												If ($2->>0)
													Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
												Else 
													AA_mnull:=""
													Check_Cont($1; ->AA_mnull; $3)
												End if 
												If ($1->#"") & ($1->#$_t_ContactCodeOLD)
													QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
													$0:=[CONTACTS:1]x_ID:33
													$_l_ContactID:=[CONTACTS:1]x_ID:33
												End if 
										End case 
								End case 
						End case 
				End case 
			End if 
		End if 
		If ([CONTACTS:1]Contact_Name:31#$1->)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
		End if 
		If (<>SYS_bo_ContactDuplicateCheck)
			If (([CONTACTS:1]Duplicate_State:26="") | ([CONTACTS:1]Duplicate_State:26="U@") | ([CONTACTS:1]Duplicate_State:26="D@"))
				Gen_Alert("That Contact cannot be used, as it has not yet been Duplicate Checked"; "Try again")
				$1->:=""
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
				$0:=[CONTACTS:1]x_ID:33
				$_l_ContactID:=[CONTACTS:1]x_ID:33
				GOTO OBJECT:C206($1->)
				
			End if 
		End if 
		// Contact_Details
		vContName:=CON_BuildContactNameandJobTitle
		If ($1->#"")
			If (Count parameters:C259<4)  //``````WT-06/26
				If ([COMPANIES:2]x_ID:63#$2->)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
				End if 
				If (<>MultiCo)
					If ([COMPANIES:2]x_ID:63#$2->) & ($2->>0)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
					End if 
					If ($2->>0)
						Check_Cont($1; ->[COMPANIES:2]Company_Code:1; $3)
					Else 
						//AA_mnull:=""
						//Check_Cont ($1;->AA_mnull;$3)
					End if 
					If ($1->#"") & ($1->#$_t_ContactCodeOLD)
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
						$0:=[CONTACTS:1]x_ID:33
						$_l_ContactID:=[CONTACTS:1]x_ID:33
						
					End if 
				Else 
					If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
						$2->:=[COMPANIES:2]x_ID:63
						vCompName:=[COMPANIES:2]Company_Name:2
						vTel:=[COMPANIES:2]Telephone:9
					End if 
				End if 
				
			Else   //``````WT-06/26
				If (<>MultiCo)  //``````WT-06/26
					Check_MultiCo($1; $2; $3; "SuperDiary")  //``````WT-06/26
				Else   //``````WT-06/26
					If ([COMPANIES:2]x_ID:63#$2->)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$2->)
					End if 
					If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)  //``````WT-06/26
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
						$2->:=[COMPANIES:2]x_ID:63
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
			End if   //``````WT-06/26
		End if   //``````WT-06/26
	End if 
	DB_t_CallOnCloseorSave:=$_t_CloseSave
Else 
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$1->)
	// Contact_Details
	vContName:=CON_BuildContactNameandJobTitle
End if 
ERR_MethodTrackerReturn("Check_ContactID"; $_t_oldMethodName)
