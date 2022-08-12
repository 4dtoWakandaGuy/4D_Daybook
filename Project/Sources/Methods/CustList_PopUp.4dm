//%attributes = {}
If (False:C215)
	//Project Method Name:      CustList_PopUp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>PRC_abo_FirstWindow;0)
	//ARRAY BOOLEAN(COM_abo_isPrivateaddress;0)
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	ARRAY LONGINT:C221($_al_isDeleted; 0)
	ARRAY TEXT:C222($_at_AddressLine1; 0)
	ARRAY TEXT:C222($_at_AddressTypes; 0)
	ARRAY TEXT:C222($_at_CompanyAddress; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CompanyNames; 0)
	ARRAY TEXT:C222($_at_RelatedCompanyCodes; 0)
	//ARRAY TEXT(COM_at_CompanyCodes;0)
	//ARRAY TEXT(COM_at_CompanyNames;0)
	//ARRAY TEXT(CON_at_AddressTypes;0)
	C_BOOLEAN:C305($_bo_Failed; $_bo_FirstIndex; $_bo_NotNew; CON_bo_CompanyDeletable)
	C_LONGINT:C283($_l_ButtonClickedFunction; $_l_CallBackProcess; $_l_FirstIndex; $_l_Index; $_l_Offset; $_l_ProcessRow; $_l_RecordCount; $_l_Recordsindex; $_l_RecordsinSelection; $_l_RelatedAddresstype; $_l_Retries)
	C_LONGINT:C283($_l_WindowIndex; $_t_CompanyName2; bAddComp2Contact; DB_l_ButtonClickedFunction)
	C_OBJECT:C1216($_ent_Contact; $_obj_Save)
	C_TEXT:C284(<>CompCode; <>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_CompanyCode; $_t_CompanyCode2; $_t_CompanyReturn; $_t_DashedLine)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; $_t_ParentRecord; $_t_ProcessName; COM_t_Country; COM_t_TelephoneNumberFormat; CON_t_CompanyAddress; CON_t_CompanyAdType; CON_t_CompanyArea; CON_t_CompanyCode; CON_t_CompanyFAX)
	C_TEXT:C284(CON_t_CompanyName; CON_t_CompanyTel; CON_t_CompanyTelephone; CON_t_NewlyAddedCompCode; CON_t_ParentRecord; CON_t_SelectedCompanyCode; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel; DB_t_CountyLabel; DB_t_PostcodeLabel)
	C_TEXT:C284(DB_t_TownLabel; IP_t_MessageReplySTR; IP_t_MessageReplyTXT; vComp_Name)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CustList_PopUp")

$_l_RecordCount:=0
$_t_ParentRecord:=""
If (CON_t_ParentRecord#"")
	$_t_ParentRecord:=CON_t_ParentRecord
End if 
CON_t_ParentRecord:=""
$_t_CompanyCode:=<>CompCode
If ([CONTACTS:1]Company_Code:1="") | ($_t_ParentRecord#"")
	If ($_t_ParentRecord="")
		$_t_CompanyReturn:=[COMPANIES:2]Company_Code:1
	Else 
		$_t_CompanyReturn:=$_t_ParentRecord
	End if 
	
Else 
	$_t_CompanyReturn:=[CONTACTS:1]Company_Code:1
End if 

$_t_CompanyCode2:=""
vComp_Name:=" "
QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)

If (Records in selection:C76([CONTACTS_COMPANIES:145])=0) & ([CONTACTS:1]Company_Code:1#"")
	C_OBJECT:C1216($_ent_Contact)
	$_ent_Contact:=ds:C1482.CONTACTS_COMPANIES.new()
	$_ent_Contact.Address_DateAdded:=Current date:C33(*)
	$_ent_Contact.Company_Code:=[CONTACTS:1]Company_Code:1
	$_ent_Contact.ID:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)  //might look wierd but should work till i rewrite getnext id to use an object!
	$_ent_Contact.Contact_Code:=[CONTACTS:1]Contact_Code:2
	$_obj_Save:=$_ent_Contact.save(dk auto merge:K85:24)
	Case of 
		: ($_obj_Save.success)
		: ($_obj_Save.status=dk status automerge failed:K85:25)
			ALERT:C41($_obj_Save.statusText)
	End case 
	//CREATE RECORD([CONTACTS_COMPANIES])
	//[CONTACTS_COMPANIES]Address_DateAdded:=Current date(*)
	//[CONTACTS_COMPANIES]Company_Code:=[CONTACTS]Company_Code
	//[CONTACTS_COMPANIES]ID:=AA_GetNextID (->[CONTACTS_COMPANIES]ID)
	//[CONTACTS_COMPANIES]Contact_Code:=[CONTACTS]Contact_Code
	//DB_SaveRecord (->[CONTACTS_COMPANIES])
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
End if 
$_l_RecordsinSelection:=Records in selection:C76([CONTACTS_COMPANIES:145])
ARRAY TEXT:C222(COM_at_CompanyNames; 0)
ARRAY TEXT:C222(COM_at_CompanyCodes; 0)
ARRAY BOOLEAN:C223(COM_abo_isPrivateaddress; 0)
ARRAY TEXT:C222(COM_at_CompanyNames; 50)
ARRAY TEXT:C222(COM_at_CompanyCodes; 50)
ARRAY BOOLEAN:C223(COM_abo_isPrivateaddress; 50)
SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Company_Code:1; $_at_RelatedCompanyCodes; [CONTACTS_COMPANIES:145]Address_Type:2; $_at_AddressTypes)
QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_RelatedCompanyCodes)
SELECTION TO ARRAY:C260([COMPANIES:2]Company_Name:2; $_at_CompanyCodes; [COMPANIES:2]Company_Name:2; $_at_CompanyNames; [COMPANIES:2]ADDRESS:60; $_at_CompanyAddress; [COMPANIES:2]Deleted:61; $_al_isDeleted; [COMPANIES:2]Address_Line_one:3; $_at_AddressLine1)
FIRST RECORD:C50([CONTACTS_COMPANIES:145])
$_l_Offset:=0
$_l_FirstIndex:=Find in array:C230($_at_CompanyCodes; $_t_CompanyReturn)
$_bo_FirstIndex:=True:C214
If (False:C215)
	For ($_l_Recordsindex; 1; Size of array:C274($_at_CompanyCodes))
		If ($_bo_FirstIndex)
			$_l_Recordsindex:=$_l_FirstIndex
		End if 
		$_l_RelatedAddresstype:=Find in array:C230($_at_RelatedCompanyCodes; $_at_CompanyCodes{$_l_Recordsindex})
		
		If ($_at_CompanyCodes{$_l_Recordsindex}=$_t_CompanyReturn)
			If ($_al_isDeleted{$_l_Recordsindex}=0)
				$_l_Offset:=$_l_Offset+1
				If ($_at_CompanyNames{$_l_Recordsindex}#"") | ($_at_CompanyCodes{$_l_Recordsindex}=[CONTACTS_COMPANIES:145]Company_Code:1) | ($_at_AddressLine1{$_l_Recordsindex}#"")
					If ($_at_CompanyNames{$_l_Recordsindex}="")
						COM_at_CompanyNames{$_l_Offset}:="Home Address"
					Else 
						If ($_at_AddressTypes{$_l_RelatedAddresstype}#"")
							COM_at_CompanyNames{$_l_Offset}:=$_at_CompanyNames{$_l_Recordsindex}+" "+"("+$_at_AddressTypes{$_l_RelatedAddresstype}+")"
						Else 
							COM_at_CompanyNames{$_l_Offset}:=$_at_CompanyNames{$_l_Recordsindex}
						End if 
						
					End if 
					COM_at_CompanyCodes{$_l_Offset}:=$_at_CompanyCodes{$_l_Recordsindex}
				Else 
					$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; Current process:C322)
					If ($_l_ProcessRow>0)
						If (<>PRC_abo_FirstWindow{$_l_ProcessRow}=False:C215)
							For ($_l_WindowIndex; $_l_ProcessRow; 1; Size of array:C274(<>PRC_abo_FirstWindow))
								If (<>PRC_al_ProcessNum{$_l_WindowIndex}=Current process:C322) & (<>PRC_abo_FirstWindow{$_l_WindowIndex})
									$_l_ProcessRow:=$_l_WindowIndex
									$_l_WindowIndex:=Size of array:C274(<>PRC_abo_FirstWindow)
								End if 
							End for 
						End if 
						IP_t_MessageReplySTR:=""
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Get Company Name")
						$_l_CallBackProcess:=<>PRC_al_ProcessCalledBy{$_l_ProcessRow}
						
						If ($_l_CallBackProcess>0)
							$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; $_l_CallBackProcess)
							If ($_l_ProcessRow>0)
								If (<>PRC_al_ProcessState{$_l_ProcessRow}>=0)
									SET PROCESS VARIABLE:C370($_l_CallBackProcess; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
									SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
									POST OUTSIDE CALL:C329($_l_CallBackProcess)
									$_l_Retries:=0
									Repeat 
										GET PROCESS VARIABLE:C371($_l_CallBackProcess; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
										GET PROCESS VARIABLE:C371($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
										If (DB_l_ButtonClickedFunction#0) & (IP_t_MessageReplySTR="")
											$_l_Retries:=$_l_Retries+1
											DelayTicks(10*(1+$_l_Retries))
										End if 
									Until (DB_l_ButtonClickedFunction=0) | (IP_t_MessageReplySTR#"")
									$_l_Offset:=$_l_Offset+1
									COM_at_CompanyNames{$_l_Offset}:=IP_t_MessageReplySTR
									COM_at_CompanyCodes{$_l_Offset}:=[CONTACTS_COMPANIES:145]Company_Code:1
									//and update the Contacts_Company code record!!
									
								End if 
							End if 
							
							
						End if 
						
					End if 
				End if 
				
				vComp_Name:=" "
				
				
			Else 
			End if 
		Else 
		End if 
	End for 
End if 

//COM_at_CompanyNames{$vInElem}:=vComp_Name
$_l_Index:=0
If ($_l_RecordsinSelection>0)
	$_bo_Failed:=True:C214
	For ($_l_Recordsindex; 1; $_l_RecordsinSelection)  //this is so the pull through is the first in the list
		//vComp_Code:=[CONTACTS]Company Code
		If ([CONTACTS_COMPANIES:145]Company_Code:1=$_t_CompanyReturn)
			If ([COMPANIES:2]Company_Code:1#$_t_CompanyReturn)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyReturn; *)
				QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Deleted:61=0)
			End if 
			If (Records in selection:C76([COMPANIES:2])>0)
				$_l_RecordCount:=$_l_RecordCount+1
				$_bo_Failed:=False:C215
				$_l_Recordsindex:=$_l_RecordsinSelection
				$_l_Index:=$_l_Index+1
				If ($_l_Index>Size of array:C274(COM_at_CompanyNames))
					INSERT IN ARRAY:C227(COM_at_CompanyNames; 9999; 10)
					INSERT IN ARRAY:C227(COM_at_CompanyCodes; 9999; 10)
					INSERT IN ARRAY:C227(COM_abo_isPrivateaddress; 9999; 10)
				End if 
				COM_abo_isPrivateaddress{$_l_Index}:=[COMPANIES:2]Private:37
				If ([COMPANIES:2]Company_Name:2#"") | ([COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1) | ([COMPANIES:2]Address_Line_one:3#"")
					If ([COMPANIES:2]Company_Name:2="")
						COM_at_CompanyNames{$_l_Index}:="Home Address"
					Else 
						If ([CONTACTS_COMPANIES:145]Address_Type:2#"")
							COM_at_CompanyNames{$_l_Index}:=[COMPANIES:2]Company_Name:2+" "+"("+[CONTACTS_COMPANIES:145]Address_Type:2+")"
						Else 
							COM_at_CompanyNames{$_l_Index}:=[COMPANIES:2]Company_Name:2
						End if 
						
					End if 
					COM_at_CompanyCodes{$_l_Index}:=[CONTACTS_COMPANIES:145]Company_Code:1
				Else 
					$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; Current process:C322)
					If ($_l_ProcessRow>0)
						If (<>PRC_abo_FirstWindow{$_l_ProcessRow}=False:C215)
							For ($_l_WindowIndex; $_l_ProcessRow; 1; Size of array:C274(<>PRC_abo_FirstWindow))
								If (<>PRC_al_ProcessNum{$_l_WindowIndex}=Current process:C322) & (<>PRC_abo_FirstWindow{$_l_WindowIndex})
									$_l_ProcessRow:=$_l_WindowIndex
									$_l_WindowIndex:=Size of array:C274(<>PRC_abo_FirstWindow)
								End if 
							End for 
						End if 
						IP_t_MessageReplySTR:=""
						DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Get Company Name")
						$_l_CallBackProcess:=<>PRC_al_ProcessCalledBy{$_l_ProcessRow}
						
						If ($_l_CallBackProcess>0)
							$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; $_l_CallBackProcess)
							If ($_l_ProcessRow>0)
								If (<>PRC_al_ProcessState{$_l_ProcessRow}>=0)
									SET PROCESS VARIABLE:C370($_l_CallBackProcess; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
									SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
									POST OUTSIDE CALL:C329($_l_CallBackProcess)
									$_l_Retries:=0
									Repeat 
										GET PROCESS VARIABLE:C371($_l_CallBackProcess; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
										GET PROCESS VARIABLE:C371($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
										If (DB_l_ButtonClickedFunction#0) & (IP_t_MessageReplySTR="")
											$_l_Retries:=$_l_Retries+1
											DelayTicks(10*(1+$_l_Retries))
										End if 
									Until (DB_l_ButtonClickedFunction=0) | (IP_t_MessageReplySTR#"")
									COM_at_CompanyNames{$_l_Index}:=IP_t_MessageReplySTR
									COM_at_CompanyCodes{$_l_Index}:=[CONTACTS_COMPANIES:145]Company_Code:1
								End if 
							End if 
							
							
						End if 
						
					End if 
				End if 
				
				vComp_Name:=" "
			End if 
		End if 
		NEXT RECORD:C51([CONTACTS_COMPANIES:145])
	End for 
End if 
FIRST RECORD:C50([CONTACTS_COMPANIES:145])

If ($_l_RecordsinSelection>0)
	For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
		//vComp_Code:=[CONTACTS]Company Code
		$_l_ProcessRow:=Find in array:C230(COM_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
		If ($_l_ProcessRow<0)
			If ([CONTACTS_COMPANIES:145]Company_Code:1#[COMPANIES:2]Company_Code:1)  //& ($_bo_Failed)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1; *)
				QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Deleted:61=0)
			End if 
			If (Records in selection:C76([COMPANIES:2])>0)
				$_l_RecordCount:=$_l_RecordCount+1
				If ([CONTACTS_COMPANIES:145]Company_Code:1#<>CompCode)
					$_t_CompanyCode2:=[CONTACTS_COMPANIES:145]Company_Code:1
				End if 
				//RELATE ONE([CONTACTS]COMPANIES'Company Code)
				//RELATE MANY([CONTACTS]Company Code)
				vComp_Name:=[COMPANIES:2]Company_Name:2
				
				$_l_Index:=$_l_Index+1
				If ($_l_Index>Size of array:C274(COM_at_CompanyNames))
					INSERT IN ARRAY:C227(COM_at_CompanyNames; 9999; 10)
					INSERT IN ARRAY:C227(COM_at_CompanyCodes; 9999; 10)
					INSERT IN ARRAY:C227(COM_abo_isPrivateaddress; 9999; 10)
					//e
				End if 
				COM_abo_isPrivateaddress{$_l_Index}:=[COMPANIES:2]Private:37
				If ([COMPANIES:2]Company_Name:2#"") | ([COMPANIES:2]Address_Line_one:3#"")
					
					If ([COMPANIES:2]Company_Name:2="")
						COM_at_CompanyNames{$_l_Index}:="Home Address"
						
					Else 
						If ([CONTACTS_COMPANIES:145]Address_Type:2#"")
							COM_at_CompanyNames{$_l_Index}:=[COMPANIES:2]Company_Name:2+" "+"("+[CONTACTS_COMPANIES:145]Address_Type:2+")"
						Else 
							COM_at_CompanyNames{$_l_Index}:=[COMPANIES:2]Company_Name:2
						End if 
					End if 
					
					COM_at_CompanyCodes{$_l_Index}:=[CONTACTS_COMPANIES:145]Company_Code:1
				Else 
					$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; Current process:C322)
					If ($_l_ProcessRow>0)
						If (<>PRC_abo_FirstWindow{$_l_ProcessRow}=False:C215)
							For ($_l_WindowIndex; $_l_ProcessRow; 1; Size of array:C274(<>PRC_abo_FirstWindow))
								If (<>PRC_al_ProcessNum{$_l_WindowIndex}=Current process:C322) & (<>PRC_abo_FirstWindow{$_l_WindowIndex})
									$_l_ProcessRow:=$_l_WindowIndex
									$_l_WindowIndex:=Size of array:C274(<>PRC_abo_FirstWindow)
								End if 
							End for 
						End if 
						IP_t_MessageReplySTR:=""
						$_l_ButtonClickedFunction:=DB_GetButtonFunction("Get Company Name")
						$_l_CallBackProcess:=<>PRC_al_ProcessCalledBy{$_l_ProcessRow}
						If ($_l_CallBackProcess>0)
							SET PROCESS VARIABLE:C370($_l_CallBackProcess; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
							SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
							POST OUTSIDE CALL:C329($_l_CallBackProcess)
							$_l_Retries:=0
							Repeat 
								
								GET PROCESS VARIABLE:C371($_l_CallBackProcess; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
								GET PROCESS VARIABLE:C371($_l_CallBackProcess; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
								
								If ($_l_ButtonClickedFunction#0) & (IP_t_MessageReplySTR="")
									$_l_Retries:=$_l_Retries+1
									DelayTicks(10*(1+$_l_Retries))
								End if 
							Until ($_l_ButtonClickedFunction=0) | (IP_t_MessageReplySTR#"")
							COM_at_CompanyNames{$_l_Index}:=IP_t_MessageReplySTR
							COM_at_CompanyCodes{$_l_Index}:=[CONTACTS_COMPANIES:145]Company_Code:1
							COM_abo_isPrivateaddress{$_l_Index}:=False:C215
						End if 
						
					End if 
				End if 
				
				vComp_Name:=" "
			End if 
		End if 
		NEXT RECORD:C51([CONTACTS_COMPANIES:145])
	End for 
Else 
	REDUCE SELECTION:C351([COMPANIES:2]; 0)
End if 
If ($_t_CompanyCode2="")
	$_t_CompanyCode2:=[CONTACTS:1]Company_Code:1
End if 
<>CompCode:=$_t_CompanyCode2
If (COM_at_CompanyNames{1}#"Home Address") & (COM_at_CompanyNames{1}#"")
	ARRAY TEXT:C222(COM_at_CompanyNames; $_l_Index)
	ARRAY TEXT:C222(COM_at_CompanyCodes; $_l_Index)
	ARRAY BOOLEAN:C223(COM_abo_isPrivateaddress; $_l_Index)
	$_t_DashedLine:="-"
	$_l_Index:=$_l_Index+4
	If ($_l_Index>Size of array:C274(COM_at_CompanyNames))
		//INSERT IN ARRAY(COM_at_CompanyNames;9999;4)
		//INSERT IN ARRAY(COM_at_CompanyCodes;9999;4)
	End if 
	APPEND TO ARRAY:C911(COM_at_CompanyNames; $_t_DashedLine)
	APPEND TO ARRAY:C911(COM_at_CompanyNames; "Add Address")
	//APPEND TO ARRAY(COM_at_CompanyNames;"Edit Address")<--We wont add this when the first company is a company
	APPEND TO ARRAY:C911(COM_at_CompanyNames; "Remove Address")
	//COM_at_CompanyNames{$_l_Index-3}:=$_t_DashedLine
	//COM_at_CompanyNames{$_l_Index-2}:="Add Address"
	//COM_at_CompanyNames{$_l_Index-1}:="Edit address"
	//COM_at_CompanyNames{$_l_Index}:="Remove Company"
	//ARRAY TEXT(COM_at_CompanyNames;$_l_Index)
	ARRAY TEXT:C222(COM_at_CompanyCodes; Size of array:C274(COM_at_CompanyNames))
	ARRAY BOOLEAN:C223(COM_abo_isPrivateaddress; Size of array:C274(COM_at_CompanyNames))
Else 
	If ($_l_RecordCount>0)
		$_l_Index:=$_l_Index+4
		If ($_l_Index>Size of array:C274(COM_at_CompanyNames))
			//INSERT IN ARRAY(COM_at_CompanyNames;9999;4)
			//INSERT IN ARRAY(COM_at_CompanyCodes;9999;4)
		End if 
		APPEND TO ARRAY:C911(COM_at_CompanyNames; $_t_DashedLine)
		APPEND TO ARRAY:C911(COM_at_CompanyNames; "Add Address")
		APPEND TO ARRAY:C911(COM_at_CompanyNames; "Edit Address")
		APPEND TO ARRAY:C911(COM_at_CompanyNames; "Remove Address")
		
		//COM_at_CompanyNames{$_l_Index-3}:="-"
		//COM_at_CompanyNames{$_l_Index-2}:="Add Address"
		//COM_at_CompanyNames{$_l_Index-1}:="Edit Address"
		//COM_at_CompanyNames{$_l_Index}:="Remove Company"
		ARRAY TEXT:C222(COM_at_CompanyCodes; Size of array:C274(COM_at_CompanyNames))
		ARRAY BOOLEAN:C223(COM_abo_isPrivateaddress; Size of array:C274(COM_at_CompanyNames))
	End if 
	
	//ARRAY TEXT(COM_at_CompanyNames;$_l_Index)
	//ARRAY TEXT(COM_at_CompanyCodes;$_l_Index)
End if 

//COM_at_CompanyNames:=Find in array(COM_at_CompanyNames;[CONTACTS]Company Code)

If (CON_t_NewlyAddedCompCode#"")  //bsw 24/05/04
	$_t_CompanyName2:=Find in array:C230(COM_at_CompanyCodes; CON_t_NewlyAddedCompCode)
Else 
	
	If ($_t_CompanyReturn="")
		
		$_t_CompanyName2:=Find in array:C230(COM_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
	Else 
		$_t_CompanyName2:=Find in array:C230(COM_at_CompanyCodes; $_t_CompanyReturn)
	End if 
End if 

//vComp_Name2:=COM_at_CompanyNames
If ($_t_CompanyName2<=0)
	If (Size of array:C274(COM_at_CompanyNames)>0)
		COM_at_CompanyNames:=1  //Size of array(COM_at_CompanyNames)
	Else 
		COM_at_CompanyNames:=0
	End if 
Else 
	COM_at_CompanyNames:=$_t_CompanyName2
End if 
If (COM_at_CompanyCodes{COM_at_CompanyNames}#[COMPANIES:2]Company_Code:1)
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=COM_at_CompanyCodes{COM_at_CompanyNames})
End if 
If ([COMPANIES:2]Company_Name:2#"")
	CON_t_CompanyName:=[COMPANIES:2]Company_Name:2
	CON_t_SelectedCompanyCode:=[COMPANIES:2]Company_Code:1
Else 
	CON_t_CompanyName:=COM_at_CompanyNames{COM_at_CompanyNames}
	CON_t_SelectedCompanyCode:=COM_at_CompanyCodes{COM_at_CompanyNames}
End if 

If ([COMPANIES:2]ADDRESS:60="")
	
	[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS
	CON_t_CompanyAddress:=[COMPANIES:2]ADDRESS:60
	If ([COMPANIES:2]ADDRESS:60="")
		$_l_ProcessRow:=Find in array:C230(<>PRC_al_ProcessNum; Current process:C322)
		If ($_l_ProcessRow>0)
			If (<>PRC_abo_FirstWindow{$_l_ProcessRow}=False:C215)
				For ($_l_WindowIndex; $_l_ProcessRow; 1; Size of array:C274(<>PRC_abo_FirstWindow))
					If (<>PRC_al_ProcessNum{$_l_WindowIndex}=Current process:C322) & (<>PRC_abo_FirstWindow{$_l_WindowIndex})
						$_l_ProcessRow:=$_l_WindowIndex
						$_l_WindowIndex:=Size of array:C274(<>PRC_abo_FirstWindow)
					End if 
				End for 
			End if 
			IP_t_MessageReplyTXT:=""
			//DB_l_ButtonClickedFunction:=
			$_l_CallBackProcess:=<>PRC_al_ProcessCalledBy{$_l_ProcessRow}
			
			
			If ($_l_CallBackProcess>0) & ($_l_CallBackProcess#Current process:C322)
				IP_t_MessageReplyTXT:=""
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Get Address")
				
				
				//$_t_oldMethodName2:=ERR_MethodTracker (String($_l_CallBackProcess))
				$_t_ProcessName:=Process_Name($_l_CallBackProcess)
				//$_t_oldMethodName2:=ERR_MethodTracker (String($_l_CallBackProcess)+$_t_ProcessName)
				
				If (((Position:C15("Custom"; $_t_ProcessName)=0) & (Position:C15("Application process"; $_t_ProcessName)=0))) & (Position:C15("$"; $_t_ProcessName)=0)
					SET PROCESS VARIABLE:C370($_l_CallBackProcess; IP_t_MessageReplyTXT; IP_t_MessageReplyTXT)
					SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
					POST OUTSIDE CALL:C329($_l_CallBackProcess)
					Repeat 
						
						GET PROCESS VARIABLE:C371($_l_CallBackProcess; IP_t_MessageReplyTXT; IP_t_MessageReplyTXT)
						GET PROCESS VARIABLE:C371($_l_CallBackProcess; DB_l_ButtonClickedFunction; DB_l_ButtonClickedFunction)
						If (DB_l_ButtonClickedFunction#0) & (IP_t_MessageReplyTXT="")
							$_l_Retries:=$_l_Retries+1
							DelayTicks(10*(1+$_l_Retries))
						End if 
					Until (DB_l_ButtonClickedFunction=0) | (IP_t_MessageReplyTXT#"")
					CON_t_CompanyAddress:=IP_t_MessageReplyTXT
				Else 
					DB_l_ButtonClickedFunction:=0
				End if 
				
				
				
				
			Else 
				DB_l_ButtonClickedFunction:=0
			End if 
			
		End if 
	Else 
		CON_t_CompanyAddress:=[COMPANIES:2]ADDRESS:60
		
	End if 
Else 
	CON_t_CompanyAddress:=[COMPANIES:2]ADDRESS:60
End if 


CON_t_CompanyTel:=[COMPANIES:2]Telephone:9
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(*; "oCONCompanyTel"; "TEL: "+COM_t_TelephoneNumberFormat)
End if 
CON_t_CompanyFAX:=[COMPANIES:2]Fax:10
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(*; "oCONCompanyFAX"; "FAX: "+COM_t_TelephoneNumberFormat)
End if 

If ($_t_CompanyCode2#"") & ($_t_CompanyCode2#[COMPANIES:2]Company_Code:1)
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyReturn)
End if 
If (CON_t_CompanyName="Home address") & ($_l_RecordCount=0)
	//OBJECT SET VISIBLE(*;"Picture2";False)
	//OBJECT SET VISIBLE(*;"Rectangle3";False)
	OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; False:C215)
End if 
If (bAddComp2Contact=1)
	
	
	OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; (bAddComp2Contact=1))
	OBJECT SET VISIBLE:C603(*; "oCompanyName"; (bAddComp2Contact=1))
	OBJECT SET VISIBLE:C603(*; "oContactAddress"; (bAddComp2Contact=1))
	OBJECT SET VISIBLE:C603(*; "oCONCompanyTel"; (bAddComp2Contact=1))
	OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; (bAddComp2Contact=1))
	//SET VISIBLE(BDeleteCompany;True)
	CON_bo_CompanyDeletable:=True:C214
	OBJECT SET VISIBLE:C603(*; "oCON_Company@"; (Not:C34(bAddComp2Contact=1)))
	OBJECT SET VISIBLE:C603(*; "oCONCompany@"; (Not:C34(bAddComp2Contact=1)))
	OBJECT SET VISIBLE:C603(*; "oCON_Sub@"; (bAddComp2Contact=1))
	OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; (bAddComp2Contact=1))
	
Else 
	If (CON_t_CompanyName="")
		$_bo_NotNew:=False:C215
		If ([CONTACTS:1]Company_Code:1="")
			For ($_l_Recordsindex; 1; Size of array:C274(COM_at_CompanyCodes))
				If (COM_at_CompanyCodes{$_l_Recordsindex}#"")
					$_bo_NotNew:=True:C214
					$_l_Recordsindex:=Size of array:C274(COM_at_CompanyCodes)
				End if 
			End for 
			If ($_bo_NotNew=False:C215)
				//This is either a new contact with no company code
				//ie a 'PRIVATE'
				//so hide the pop-up
				DB_t_Address1Label:=<>DB_t_Address1Label
				DB_t_Address2Label:=<>DB_t_Address2Label
				DB_t_TownLabel:=<>DB_t_TownLabel
				DB_t_CountyLabel:=<>DB_t_CountyLabel
				DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
				DB_t_CountryLabel:=<>DB_t_CountryLabel
				//OBJECT SET VISIBLE(*;"Picture2";False)
				//OBJECT SET VISIBLE(*;"Rectangle3";False)
				OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; False:C215)
				//and display the address stuff
				ARRAY TEXT:C222(CON_at_AddressTypes; 0)
				CON_GetAdressTypes(->CON_at_AddressTypes)
				
				OBJECT SET VISIBLE:C603(*; "oCON_Company@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCONCompany@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCON_Sub@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oContactAddress"; False:C215)
				OBJECT SET ENTERABLE:C238(*; "oCONCompanyCode"; False:C215)
				OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; False:C215)
				CON_t_CompanyAdType:="HOME"
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyTel"; True:C214)
				OBJECT SET ENTERABLE:C238(*; "oCON_CompanyArea"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; True:C214)
				OBJECT SET ENTERABLE:C238(*; "oCONCompanyFAX"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCON_SubLab2"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab@"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab1"; (([COMPANIES:2]ADDRESS:60="") | (True:C214)) & (DB_t_Address1Label#""))
				OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab2"; (([COMPANIES:2]ADDRESS:60="") | (True:C214)) & (DB_t_Address2Label#""))
				OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab3"; (([COMPANIES:2]ADDRESS:60="") | (True:C214)) & (DB_t_TownLabel#""))
				OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab4"; (([COMPANIES:2]ADDRESS:60="") | (True:C214)) & (DB_t_CountyLabel#""))
				OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab5"; (([COMPANIES:2]ADDRESS:60="") | (True:C214)) & (DB_t_PostcodeLabel#""))
				OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab6"; (([COMPANIES:2]ADDRESS:60="") | (True:C214)) & (DB_t_CountryLabel#""))
				OBJECT SET VISIBLE:C603(*; "oCompanyName"; False:C215)
				Companies_vAT2(->COM_t_Country)
				If ($_l_RecordCount=0)
					OBJECT SET VISIBLE:C603(*; "oCON_CompanyButton1"; True:C214)
					OBJECT SET TITLE:C194(*; "oCON_CompanyButton1"; "Save Address")
				Else 
					OBJECT SET VISIBLE:C603(*; "oCON_CompanyButton1"; False:C215)
				End if 
				OBJECT SET ENTERABLE:C238(CON_t_CompanyAdType; False:C215)
				
			End if 
			//there is no company name.this
		End if 
	Else 
		$_bo_NotNew:=True:C214
	End if 
	If ($_bo_NotNew)
		//OBJECT SET VISIBLE(*;"Picture2";True)
		//OBJECT SET VISIBLE(*;"Rectangle3";True)
		OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; True:C214)
		//and display the address stuff
		OBJECT SET VISIBLE:C603(*; "oCON_Company@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCONCompany@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCON_Sub@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "OCON_COLABEL"; True:C214)
		
		OBJECT SET ENTERABLE:C238(CON_t_CompanyTelephone; False:C215)
		OBJECT SET ENTERABLE:C238(CON_t_CompanyArea; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; True:C214)
		OBJECT SET ENTERABLE:C238(*; "oCONCompanyFAX"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCON_SubLab2"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCON_CompanyAdLab@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCompanyName"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oContactAddress"; True:C214)
	End if 
	
End if 
ERR_MethodTrackerReturn("CustList_PopUp"; $_t_oldMethodName)
