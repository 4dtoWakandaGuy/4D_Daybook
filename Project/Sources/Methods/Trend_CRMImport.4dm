//%attributes = {}

If (False:C215)
	//Project Method Name:      Trend_CRMImport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_QualityDeletions;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCOntacts; 0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	ARRAY TEXT:C222($_at_ImportDocument; 0)
	ARRAY TEXT:C222($_at_Records; 0)
	ARRAY TEXT:C222($_at_Records2D; 0; 0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	C_BOOLEAN:C305($_bo_noHL; QV_bo_AddAllowed; QV_bo_ForceNewList)
	C_DATE:C307($_D_CallDate; $_d_DemoDate; $_D_FollowDate; $_d_FollowUpDate; $_D_LastCommDate; $_d_LeadDate; $_D_NoteDate; $_d_PendingDate; $_d_QUotationDate; $_d_ThankYouDate)
	C_LONGINT:C283($_l_CallNum; $_l_CharacterPosition; $_l_GroupID; $_l_IMport; $_l_ListID; $_l_PersonID; $_l_Position; $_l_RecordNumber; $_l_SalutationRow; $_l_Save; $_l_SelectedOwnerFieldID)
	C_LONGINT:C283($_l_SPlittoColumns; $_l_SplitToRows; QV_l_DisplayedOwnerID)
	C_TEXT:C284($_t_Application; $_t_BusinessSector; $_t_BusinessType; $_t_CallAttempts; $_t_CallDateString; $_t_CompanyCode; $_t_CompanyName; $_t_DemoCompleted; $_t_DemoLocation; $_t_DocText; $_t_EmailAddress)
	C_TEXT:C284($_t_EmailAfter; $_t_EmailBefore; $_t_Finance; $_t_FinanceOffered; $_t_FirstCallContact; $_t_FirstCallDetails; $_t_FirstName; $_t_FollowUpFlag; $_t_LastCallComsSent; $_t_MadeFirstCall; $_t_NextActionDateString)
	C_TEXT:C284($_t_Notes; $_t_NotesDateString; $_t_oldMethodName; $_t_PendingDate; $_t_PendingReason; $_t_QuotationDone; $_t_QuoteFollowUp; $_t_RelatedCompany; $_t_RelatedContact; $_t_Remainder; $_t_RequestedDemo)
	C_TEXT:C284($_t_RespondedToFollowUp; $_t_ResultMessage; $_t_SalesOutcome; $_t_Salutation; $_t_Software; $_t_Soundex; $_t_Source; $_t_SOurceCode; $_t_Status; $_t_Surname; $_t_TelephoneNumber)
	C_TEXT:C284($_t_ThankYouDate; $_t_ThankYouFlag; $_t_Upgrades; $_t_WholeName; QV_t_QualitiesGroupName; QV_t_QualityName)
	C_TIME:C306($_ti_IMportDocument)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Trend_CRMImport")
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1="JT")
$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
$_ti_IMportDocument:=Open document:C264(""; "TEXT")
If ($_ti_IMportDocument#?00:00:00?)
	ARRAY TEXT:C222($_at_ImportDocument; 0)
	Repeat 
		RECEIVE PACKET:C104($_ti_IMportDocument; $_t_DocText; 32000)
		If ($_t_DocText#"")
			APPEND TO ARRAY:C911($_at_ImportDocument; $_t_DocText)
		End if 
	Until ($_t_DocText="")
	CLOSE DOCUMENT:C267($_ti_IMportDocument)
	$_t_Remainder:=""
	ARRAY TEXT:C222($_at_Records; 0)
	For ($_l_SplitToRows; 1; Size of array:C274($_at_ImportDocument))
		If ($_t_Remainder#"")
			$_at_ImportDocument{$_l_SplitToRows}:=$_t_Remainder+$_at_ImportDocument{$_l_SplitToRows}
			$_t_Remainder:=""
		End if 
		Repeat 
			$_l_Position:=Position:C15(Char:C90(13); $_at_ImportDocument{$_l_SplitToRows})
			If ($_l_Position=0)
				$_l_Position:=Position:C15(Char:C90(10); $_at_ImportDocument{$_l_SplitToRows})
			End if 
			If ($_l_Position>0)
				APPEND TO ARRAY:C911($_at_Records; Substring:C12($_at_ImportDocument{$_l_SplitToRows}; 1; $_l_Position-1))
				$_at_ImportDocument{$_l_SplitToRows}:=Substring:C12($_at_ImportDocument{$_l_SplitToRows}; $_l_Position+1)
			Else 
				If ($_at_ImportDocument{$_l_SplitToRows}#"")
					$_t_Remainder:=$_at_ImportDocument{$_l_SplitToRows}
					$_at_ImportDocument{$_l_SplitToRows}:=""
				End if 
			End if 
		Until ($_at_ImportDocument{$_l_SplitToRows}="")
	End for 
	ARRAY TEXT:C222($_at_Records2D; Size of array:C274($_at_Records); 0)
	For ($_l_SPlittoColumns; 1; Size of array:C274($_at_Records))
		Repeat 
			//$_l_Position:=Position(",";$_at_Records{$_l_SPlittoColumns})
			$_l_Position:=Position:C15(Char:C90(9); $_at_Records{$_l_SPlittoColumns})
			If ($_l_Position>0)
				APPEND TO ARRAY:C911($_at_Records2D{$_l_SPlittoColumns}; Substring:C12($_at_Records{$_l_SPlittoColumns}; 1; $_l_Position-1))
				$_at_Records{$_l_SPlittoColumns}:=Substring:C12($_at_Records{$_l_SPlittoColumns}; $_l_Position+1)
			Else 
				APPEND TO ARRAY:C911($_at_Records2D{$_l_SPlittoColumns}; $_at_Records{$_l_SPlittoColumns})
				$_at_Records{$_l_SPlittoColumns}:=""
			End if 
		Until ($_at_Records{$_l_SPlittoColumns}="")
	End for 
	//Column1 is source
	//TRACE
	QV_bo_AddAllowed:=True:C214
	QV_bo_ForceNewList:=True:C214
	//
	ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
	ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
	ARRAY TEXT:C222(QV_at_QualityGroups; 0)
	ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
	ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
	ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
	
	
	For ($_l_IMport; 2; Size of array:C274($_at_Records2D))
		
		$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
		SORT ARRAY:C229(QV_at_QualityGroupsNM; QV_al_QualityGroupsIDs; QV_at_QualityGroups; QV_at_QualityProperties; QV_al_QualityPropertiesNUM; QV_at_QualityPropertiesNAM)
		QV_l_DisplayedOwnerID:=0
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=1)
			
			$_t_Source:=Replace string:C233($_at_Records2D{$_l_IMport}{1}; Char:C90(9); "")
		Else 
			$_t_Source:=""
		End if 
		
		$_t_Source:=Replace string:C233($_t_Source; Char:C90(10); "")
		
		$_t_Source:=Uppers2($_t_Source; 1)  //²
		$_t_SOurceCode:=""
		$_bo_noHL:=True:C214
		
		QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Name:2=$_t_Source)
		If (Records in selection:C76([SOURCES:6])=0)
			CREATE RECORD:C68([SOURCES:6])
			[SOURCES:6]Source_Code:1:="S"+String:C10((Random:C100%100000)+2)
			//[SOURCES]Target_Leads
			[SOURCES:6]Source_Name:2:=$_t_Source
			[SOURCES:6]Source_Date:3:=Current date:C33(*)
			DB_SaveRecord(->[SOURCES:6])
		Else 
			$_t_SOurceCode:=[SOURCES:6]Source_Code:1
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=2)
			
			$_d_LeadDate:=Date:C102($_at_Records2D{$_l_IMport}{2})  //²
		Else 
			$_d_LeadDate:=!00-00-00!
			
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=3)
			
			$_t_Salutation:=$_at_Records2D{$_l_IMport}{3}  //²
		Else 
			$_t_Salutation:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=4)
			
			$_t_FirstName:=$_at_Records2D{$_l_IMport}{4}  //²
		Else 
			$_t_FirstName:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=5)
			
			$_t_Surname:=$_at_Records2D{$_l_IMport}{5}  //²
		Else 
			$_t_Surname:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=7)
			
			$_t_EmailAddress:=$_at_Records2D{$_l_IMport}{7}  //²
		Else 
			$_t_EmailAddress:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=6)
			
			$_t_CompanyName:=$_at_Records2D{$_l_IMport}{6}  //²
		Else 
			$_t_CompanyName:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=9)
			
			$_t_TelephoneNumber:=$_at_Records2D{$_l_IMport}{9}  //²
		Else 
			$_t_TelephoneNumber:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=8)
			
			$_t_BusinessType:=$_at_Records2D{$_l_IMport}{8}  //²
		Else 
			$_t_BusinessType:=""
		End if 
		If ($_t_BusinessType="Workshop Owener or Supervisor")
			$_t_BusinessType:="Workshop Owner or Supervisor"
		End if 
		If ($_t_BusinessType="Other (please try to specificy)")
			$_t_BusinessType:=""
		End if 
		If ($_t_BusinessType="carpenter_")
			$_t_BusinessType:="Carpenter"
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=10)
			
			$_t_BusinessSector:=$_at_Records2D{$_l_IMport}{10}  //²
		Else 
			$_t_BusinessSector:=""
		End if 
		If ($_t_BusinessSector="Other_")
			$_t_BusinessSector:=""
		End if 
		$_t_BusinessSector:=Replace string:C233($_t_BusinessSector; "Other - Please specify -"; "")
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=11)
			
			$_t_ThankYouFlag:=$_at_Records2D{$_l_IMport}{11}  //²
		Else 
			$_t_ThankYouFlag:=""
		End if 
		If ($_t_ThankYouFlag#"Y") & ($_t_ThankYouFlag#"N")
			//TRACE
		End if 
		$_at_Records2D{$_l_IMport}{12}:=Replace string:C233($_at_Records2D{$_l_IMport}{12}; "."; "/")
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=12)
			
			$_d_ThankYouDate:=Date:C102($_at_Records2D{$_l_IMport}{12})  //²
		Else 
			$_d_ThankYouDate:=!00-00-00!
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=13)
			
			$_t_MadeFirstCall:=$_at_Records2D{$_l_IMport}{13}  //Y or N²
		Else 
			$_t_MadeFirstCall:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=14)
			
			$_t_FirstCallContact:=$_at_Records2D{$_l_IMport}{14}  //Y or N²
		Else 
			$_t_FirstCallContact:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=15)
			
			$_t_CallAttempts:=$_at_Records2D{$_l_IMport}{15}  //Number²
		Else 
			$_t_CallAttempts:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=16)
			
			$_t_FirstCallDetails:=$_at_Records2D{$_l_IMport}{16}  //Details²
		Else 
			$_t_FirstCallDetails:=""
		End if 
		$_D_CallDate:=!00-00-00!  //²
		If ($_t_FirstCallDetails#"")
			$_t_CallDateString:=Substring:C12($_t_FirstCallDetails; 1; 10)
			$_D_CallDate:=Date:C102($_t_CallDateString)
			If ($_D_CallDate#!00-00-00!)
				$_t_FirstCallDetails:=Substring:C12($_t_FirstCallDetails; 10)
			Else 
				$_D_CallDate:=$_d_LeadDate+1
			End if 
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=17)
			
			$_t_FollowUpFlag:=$_at_Records2D{$_l_IMport}{17}  //²
		Else 
			$_t_FollowUpFlag:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=18)
			
			$_t_RespondedToFollowUp:=$_at_Records2D{$_l_IMport}{18}  //²
		Else 
			$_t_RespondedToFollowUp:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=19)
			
			$_t_LastCallComsSent:=$_at_Records2D{$_l_IMport}{19}  //²
		Else 
			$_t_LastCallComsSent:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=20)
			
			$_t_RequestedDemo:=$_at_Records2D{$_l_IMport}{20}  //²²
		Else 
			$_t_RequestedDemo:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=21)
			
			$_t_DemoLocation:=$_at_Records2D{$_l_IMport}{21}  //²
		Else 
			$_t_DemoLocation:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=22)
			
			$_d_DemoDate:=Date:C102($_at_Records2D{$_l_IMport}{22})  //²
		Else 
			$_d_DemoDate:=!00-00-00!
			
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=23)
			
			$_t_DemoCompleted:=$_at_Records2D{$_l_IMport}{23}  //²
		Else 
			$_t_DemoCompleted:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=24)
			
			$_t_QuotationDone:=$_at_Records2D{$_l_IMport}{24}
		Else 
			$_t_QuotationDone:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=25)
			
			$_t_FinanceOffered:=$_at_Records2D{$_l_IMport}{25}
		Else 
			$_t_FinanceOffered:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=26)
			
			$_t_QuoteFollowUp:=$_at_Records2D{$_l_IMport}{26}
		Else 
			$_t_QuoteFollowUp:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=27)
			
			$_t_SalesOutcome:=$_at_Records2D{$_l_IMport}{27}
		Else 
			$_t_SalesOutcome:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=28)
			
			$_t_Finance:=$_at_Records2D{$_l_IMport}{28}
		Else 
			$_t_Finance:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=29)
			
			$_t_Application:=$_at_Records2D{$_l_IMport}{29}
		Else 
			$_t_Application:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=30)
			
			$_t_PendingReason:=$_at_Records2D{$_l_IMport}{30}
		Else 
			$_t_PendingReason:=""
		End if 
		//$_d_PendingDate:=Date($_at_Records2D{$_l_IMport}{31})
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=31)
			
			$_t_Software:=$_at_Records2D{$_l_IMport}{31}
		Else 
			$_t_Software:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=32)
			
			$_t_Upgrades:=$_at_Records2D{$_l_IMport}{32}
		Else 
			$_t_Upgrades:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=33)
			$_t_Status:=$_at_Records2D{$_l_IMport}{33}
		Else 
			$_t_Status:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=34)
			
			$_t_NextActionDateString:=$_at_Records2D{$_l_IMport}{34}
		Else 
			$_t_NextActionDateString:=""
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>=35)
			$_t_Notes:=$_at_Records2D{$_l_IMport}{35}
		Else 
			$_t_Notes:=""
		End if 
		$_t_FirstCallDetails:=""
		If ($_t_Notes#"")
			
			//$_t_NotesDateString:=Substring($_t_Notes;1;10)
			
			//$_D_NoteDate:=Date($_t_NotesDateString)
			If ($_D_NoteDate#!00-00-00!)
				$_t_FirstCallDetails:=Substring:C12($_t_Notes; 10)
			Else 
				$_l_CallNum:=Num:C11(Substring:C12($_t_Notes; 1; 7))
				If ($_l_CallNum>0)
					$_t_NotesDateString:=Substring:C12($_t_Notes; 1; 2)+"/"+Substring:C12($_t_Notes; 3; 2)+"/"+Substring:C12($_t_Notes; 5; 2)
					$_t_FirstCallDetails:=Substring:C12($_t_Notes; 8)
				End if 
			End if 
			
		End if 
		If (Length:C16($_t_CompanyName)=1)
			$_t_CompanyName:=""
		End if 
		If ($_t_CompanyName="Sole Trader") | ($_t_CompanyName="Retired") | ($_t_CompanyName="carpenter_") | ($_t_CompanyName="None") | ($_t_CompanyName="Me") | ($_t_CompanyName="Trend")
			$_t_CompanyName:=""
		End if 
		If (Position:C15(" "; $_t_CompanyName)=0) & ($_t_CompanyName#"")
			//TRACE
			$_t_CompanyName:=Gen_RequestText("Confirm this company name"; $_t_CompanyName)
		End if 
		If (Size of array:C274($_at_Records2D{$_l_IMport})>35)
			//TRACE
		End if 
		$_t_RelatedCompany:=""
		$_t_RelatedContact:=""
		If ($_t_CompanyName#"")
			
			$_t_Soundex:=DB_BuildSoundex($_t_CompanyName)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_CompanyName)
			If (Records in selection:C76([COMPANIES:2])=0)
				//TRACE
				
				CREATE RECORD:C68([COMPANIES:2])
				[COMPANIES:2]Company_Name:2:=$_t_CompanyName
				[COMPANIES:2]Company_Abbreviated_Name:52:=Companies_Abbr([COMPANIES:2]Company_Name:2)
				Company_No
				[COMPANIES:2]Telephone:9:=$_t_TelephoneNumber
				[COMPANIES:2]Source:14:=$_t_SOurceCode
				[COMPANIES:2]Entry_Date:16:=$_d_LeadDate
				[COMPANIES:2]Phonetic_Name:64:=$_t_Soundex
				DB_SaveRecord(->[COMPANIES:2])
			End if 
			$_l_RecordNumber:=[COMPANIES:2]x_ID:63
			$_l_SelectedOwnerFieldID:=Field:C253(->[COMPANIES:2]x_ID:63)
			$_l_GroupID:=0
			QV_l_DisplayedOwnerID:=$_l_RecordNumber
			
			QV_ShowQualities($_l_RecordNumber; Table:C252(->[COMPANIES:2]); $_l_SelectedOwnerFieldID; 0; ->$_l_GroupID; False:C215)
			QV_t_QualitiesGroupName:="Campaign"
			QV_t_QualityName:="Yeti Campaign"
			QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
			If ($_t_Source#"")
				//TRACE
				QV_t_QualitiesGroupName:="Lead Source"
				QV_t_QualityName:=$_t_Source
				QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
			End if 
			
			If ($_t_BusinessType#"")
				//TRACE
				QV_t_QualitiesGroupName:="Business Type"
				QV_t_QualityName:=$_t_BusinessType
				QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
			End if 
			If ($_t_BusinessSector#"")
				//TRACE
				QV_t_QualitiesGroupName:="Business Sector"
				QV_t_QualityName:=$_t_BusinessSector
				QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
			End if 
			///
			If ($_t_Software#"")
				//TRACE
				QV_t_QualitiesGroupName:="Yeti Software"
				QV_t_QualityName:=$_t_Software
				QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
			End if 
			If ($_t_Upgrades#"")
				//TRACE
				QV_t_QualitiesGroupName:="Yeti Upgrades"
				QV_t_QualityName:=$_t_Upgrades
				QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
			End if 
			For ($_l_Save; 1; Size of array:C274(QV_al_QualityDeletions))
				QV_al_QualityDeletions{$_l_Save}:=-1
			End for 
			QV_SaveQualities($_l_RecordNumber; Table:C252(->[COMPANIES:2]); $_l_SelectedOwnerFieldID; False:C215)
			
			$_t_RelatedCompany:=[COMPANIES:2]Company_Code:1
			
			
			If ($_t_Surname#"") | ($_t_FirstName#"")
				$_t_WholeName:=""
				If ($_t_Salutation#"")
					$_t_WholeName:=$_t_Salutation
				End if 
				If ($_t_FirstName#"")
					If ($_t_WholeName="")
						$_t_WholeName:=$_t_FirstName
					Else 
						$_t_WholeName:=$_t_WholeName+" "+$_t_FirstName
					End if 
				End if 
				If ($_t_Surname#"")
					If ($_t_WholeName="")
						$_t_WholeName:=$_t_Surname
					Else 
						$_t_WholeName:=$_t_WholeName+" "+$_t_Surname
					End if 
				End if 
				AA_LoadNameArrays
				AA_ParseName($_t_WholeName; 0; ->$_t_Salutation; ->$_t_FirstName; ->$_t_Surname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
				If ($_t_Salutation#"")
					//to ensure capitalization is correct
					$_l_SalutationRow:=Find in array:C230(AA_at_Salutations; $_t_Salutation)
					If ($_l_SalutationRow>0)
						$_t_Salutation:=AA_at_Salutations{$_l_SalutationRow}
					End if 
				End if 
				
				QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1)
				SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_CompanyCOntacts)
				QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_CompanyCOntacts)
				
				If (Records in selection:C76([CONTACTS:1])>0)
					QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_Surname; *)
					QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_FirstName)
					//might have to use soundex
				End if 
				If (Records in selection:C76([CONTACTS:1])=0)
					CREATE RECORD:C68([CONTACTS:1])
					[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
					Contact_Code
					[CONTACTS:1]Entry_Date:17:=$_d_LeadDate
					[CONTACTS:1]Forename:4:=$_t_FirstName
					[CONTACTS:1]Salutation:7:=$_t_Salutation
					[CONTACTS:1]Surname:5:=$_t_Surname
					[CONTACTS:1]Soundex:37:=DB_BuildSoundex(DB_ContactNameClean([CONTACTS:1]Surname:5))
					
					If ($_t_EmailAddress#"")
						$_l_CharacterPosition:=Position:C15(Char:C90(64); $_t_EmailAddress)
						If ($_l_CharacterPosition>0)
							//it should be
							$_t_EmailBefore:=Substring:C12($_t_EmailAddress; 1; $_l_CharacterPosition-1)
							$_t_EmailAfter:=Substring:C12($_t_EmailAddress; $_l_CharacterPosition+1; Length:C16($_t_EmailAddress))
						End if 
						[CONTACTS:1]EMail_After_At:24:=$_t_EmailAfter
						[CONTACTS:1]Email_Before_At:30:=$_t_EmailBefore
						[CONTACTS:1]Email_Address:35:=$_t_EmailAddress
						DB_SaveRecord(->[CONTACTS:1])
						CREATE RECORD:C68([CONTACTS_COMPANIES:145])
						[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
						[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
						[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
						SAVE RECORD:C53([CONTACTS_COMPANIES:145])
					End if 
					$_t_RelatedContact:=[CONTACTS:1]Contact_Code:2
				End if 
			Else 
				
				If ($_t_EmailAddress#"")
					$_l_CharacterPosition:=Position:C15(Char:C90(64); $_t_EmailAddress)
					If ($_l_CharacterPosition>0)
						//it should be
						$_t_EmailBefore:=Substring:C12($_t_EmailAddress; 1; $_l_CharacterPosition-1)
						$_t_EmailAfter:=Substring:C12($_t_EmailAddress; $_l_CharacterPosition+1; Length:C16($_t_EmailAddress))
					End if 
					[COMPANIES:2]EMail_After_At:55:=$_t_EmailAfter
					[COMPANIES:2]Email_Before_At:58:=$_t_EmailBefore
					DB_SaveRecord(->[COMPANIES:2])
				End if 
			End if 
			
		Else 
			//might be a contact
			If ($_t_Surname#"") | ($_t_FirstName#"")
				$_t_WholeName:=""
				If ($_t_Salutation#"")
					$_t_WholeName:=$_t_Salutation
				End if 
				If ($_t_FirstName#"")
					If ($_t_WholeName="")
						$_t_WholeName:=$_t_FirstName
					Else 
						$_t_WholeName:=$_t_WholeName+" "+$_t_FirstName
					End if 
				End if 
				If ($_t_Surname#"")
					If ($_t_WholeName="")
						$_t_WholeName:=$_t_Surname
					Else 
						$_t_WholeName:=$_t_WholeName+" "+$_t_Surname
					End if 
				End if 
				AA_LoadNameArrays
				AA_ParseName($_t_WholeName; 0; ->$_t_Salutation; ->$_t_FirstName; ->$_t_Surname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
				If ($_t_Salutation#"")
					//to ensure capitalization is correct
					$_l_SalutationRow:=Find in array:C230(AA_at_Salutations; $_t_Salutation)
					If ($_l_SalutationRow>0)
						$_t_Salutation:=AA_at_Salutations{$_l_SalutationRow}
					End if 
				End if 
				
				//QUERY([CONTACTS_COMPANIES];[CONTACTS_COMPANIES]Company_Code=[COMPANIES]Company_Code)
				//SELECTION TO ARRAY([CONTACTS_COMPANIES]Contact_Code;$_at_CompanyCOntacts)
				//QUERY WITH ARRAY([CONTACTS]Contact_Code;$_at_CompanyCOntacts)
				
				If (Records in selection:C76([CONTACTS:1])>0)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_Surname; *)
					QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_FirstName)
					
					
					//might have to use soundex
					If (Records in selection:C76([CONTACTS:1])>0)
						SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
						QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
						SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Company_Code:1; $_at_CompanyCodes)
						QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37=True:C214)
						If (Records in selection:C76([COMPANIES:2])>0)
							$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_t_CompanyCode)
						End if 
					End if 
					If (Records in selection:C76([CONTACTS:1])=0)
						CREATE RECORD:C68([COMPANIES:2])
						Company_No
						[COMPANIES:2]Private:37:=True:C214
						[COMPANIES:2]Telephone:9:=$_t_TelephoneNumber
						DB_SaveRecord(->[COMPANIES:2])
						
						CREATE RECORD:C68([CONTACTS:1])
						[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
						Contact_Code
						[CONTACTS:1]Entry_Date:17:=$_d_LeadDate
						[CONTACTS:1]Forename:4:=$_t_FirstName
						[CONTACTS:1]Salutation:7:=$_t_Salutation
						[CONTACTS:1]Surname:5:=$_t_Surname
						[CONTACTS:1]Soundex:37:=DB_BuildSoundex(DB_ContactNameClean([CONTACTS:1]Surname:5))
						If ($_t_EmailAddress#"")
							$_l_CharacterPosition:=Position:C15(Char:C90(64); $_t_EmailAddress)
							If ($_l_CharacterPosition>0)
								//it should be
								$_t_EmailBefore:=Substring:C12($_t_EmailAddress; 1; $_l_CharacterPosition-1)
								$_t_EmailAfter:=Substring:C12($_t_EmailAddress; $_l_CharacterPosition+1; Length:C16($_t_EmailAddress))
							End if 
							[CONTACTS:1]EMail_After_At:24:=$_t_EmailAfter
							[CONTACTS:1]Email_Before_At:30:=$_t_EmailBefore
							[CONTACTS:1]Email_Address:35:=$_t_EmailAddress
							DB_SaveRecord(->[CONTACTS:1])
							CREATE RECORD:C68([CONTACTS_COMPANIES:145])
							[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
							[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
							[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
							SAVE RECORD:C53([CONTACTS_COMPANIES:145])
						End if 
						$_t_RelatedContact:=[CONTACTS:1]Contact_Code:2
						$_l_RecordNumber:=[CONTACTS:1]x_ID:33
						$_l_SelectedOwnerFieldID:=Field:C253(->[CONTACTS:1]x_ID:33)
						$_l_GroupID:=0
						QV_l_DisplayedOwnerID:=$_l_RecordNumber
						QV_ShowQualities($_l_RecordNumber; Table:C252(->[CONTACTS:1]); $_l_SelectedOwnerFieldID; 0; ->$_l_GroupID; False:C215)
						QV_t_QualitiesGroupName:="Campaign"
						QV_t_QualityName:="Yeti Campaign"
						QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
						
						If ($_t_Source#"")
							////TRACE
							QV_t_QualitiesGroupName:="Lead Source"
							QV_t_QualityName:=$_t_Source
							QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
						End if 
						
						If ($_t_BusinessType#"")
							////TRACE
							QV_t_QualitiesGroupName:="Business Type"
							QV_t_QualityName:=$_t_BusinessType
							QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
						End if 
						If ($_t_BusinessSector#"")
							//TRACE
							QV_t_QualitiesGroupName:="Business Sector"
							QV_t_QualityName:=$_t_BusinessSector
							QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
						End if 
						If ($_t_Software#"")
							//TRACE
							QV_t_QualitiesGroupName:="Yeti Software"
							QV_t_QualityName:=$_t_Software
							QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
						End if 
						If ($_t_Upgrades#"")
							//TRACE
							QV_t_QualitiesGroupName:="Yeti Upgrades"
							QV_t_QualityName:=$_t_Upgrades
							QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
						End if 
						//
						If ($_t_Status#"")
							Case of 
								: ($_t_Status="Active@")
									
									Case of 
										: ($_t_Status="@chase")
											QV_t_QualitiesGroupName:="Lead Funnel Status"
											QV_t_QualityName:="Yeti Campaign Active Chasing"
											QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
										: ($_t_Status="@Wait")
											QV_t_QualitiesGroupName:="Lead Funnel Status"
											QV_t_QualityName:="Yeti Campaign Active Waiting"
											QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
											
											
									End case 
								: ($_t_Status="Dead@")
									QV_t_QualitiesGroupName:="Lead Funnel Status"
									QV_t_QualityName:="Yeti Campaign Dead Lead"
									QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
									
								: ($_t_Status="Sold@")
									QV_t_QualitiesGroupName:="Lead Funnel Status"
									QV_t_QualityName:="Yeti Campaign Sale Made"
									QV_SaveCurrentQuality(False:C215; -1; $_bo_noHL)
									
								: ($_t_Status="")  //its dead??
									
							End case 
							
						End if 
						
						
						//
						For ($_l_Save; 1; Size of array:C274(QV_al_QualityDeletions))
							QV_al_QualityDeletions{$_l_Save}:=-1
						End for 
						QV_SaveQualities($_l_RecordNumber; Table:C252(->[CONTACTS:1]); $_l_SelectedOwnerFieldID; False:C215)
						
						
					End if 
					
					
					
				End if 
			End if 
		End if 
		///we now have a company or(and) a contact record...create the diary records.
		If (False:C215)
			If ($_t_ThankYouFlag="Y")
				CREATE RECORD:C68([DIARY:12])
				[DIARY:12]Company_Code:1:=$_t_RelatedCompany
				[DIARY:12]Contact_Code:2:=$_t_RelatedContact
				[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Email Reply")
				If (Records in selection:C76([ACTIONS:13])=0)
					CREATE RECORD:C68([ACTIONS:13])
					[ACTIONS:13]Action_Code:1:="EMR"
					[ACTIONS:13]Action_Name:2:="Email Reply"
					[ACTIONS:13]ActionRecordsCompletedEvent:37:=True:C214
					DB_SaveRecord(->[ACTIONS:13])
				End if 
				[DIARY:12]Action_Code:9:="EMR"
				[DIARY:12]Action_Details:10:="Thank you response email sent"
				[DIARY:12]Date_Do_From:4:=$_d_ThankYouDate
				[DIARY:12]Date_Do_To:33:=$_d_ThankYouDate
				[DIARY:12]Date_Done_From:5:=$_d_ThankYouDate
				[DIARY:12]Date_Done_To:34:=$_d_ThankYouDate
				DiaryCode
				[DIARY:12]Originator:23:="JT"
				[DIARY:12]Person:8:="JT"
				[DIARY:12]PersonID:56:=$_l_PersonID
				[DIARY:12]Done:14:=True:C214
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Name:2="Done")
				If (Records in selection:C76([RESULTS:14])=0)
					CREATE RECORD:C68([RESULTS:14])
					[RESULTS:14]Result_Code:1:="OK"
					[RESULTS:14]Result_Name:2:="Done"
					DB_SaveRecord(->[RESULTS:14])
				End if 
				[DIARY:12]Result_Code:11:="OK"
				[DIARY:12]Result_Description:12:=$_t_Notes
				DB_SaveRecord(->[DIARY:12])
			Else 
				If ($_t_ThankYouFlag#"")
					$_t_ResultMessage:=""
					If ($_t_thankyouFlag#"N")
						$_t_ResultMessage:=$_t_thankyouFlag
						$_t_thankyouFlag:="N"
					End if 
					CREATE RECORD:C68([DIARY:12])
					[DIARY:12]Company_Code:1:=$_t_RelatedCompany
					[DIARY:12]Contact_Code:2:=$_t_RelatedContact
					[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Email Reply")
					If (Records in selection:C76([ACTIONS:13])=0)
						CREATE RECORD:C68([ACTIONS:13])
						[ACTIONS:13]Action_Code:1:="EMR"
						[ACTIONS:13]Action_Name:2:="Email Reply"
						[ACTIONS:13]ActionRecordsCompletedEvent:37:=True:C214
						DB_SaveRecord(->[ACTIONS:13])
					End if 
					[DIARY:12]Action_Code:9:="EMR"
					[DIARY:12]Action_Details:10:="Thank you response email sent"
					[DIARY:12]Date_Do_From:4:=$_d_ThankYouDate
					[DIARY:12]Date_Do_To:33:=$_d_ThankYouDate
					[DIARY:12]Date_Done_From:5:=$_d_ThankYouDate
					[DIARY:12]Date_Done_To:34:=$_d_ThankYouDate
					DiaryCode
					[DIARY:12]Originator:23:="JT"
					[DIARY:12]Person:8:="JT"
					[DIARY:12]PersonID:56:=$_l_PersonID
					[DIARY:12]Done:14:=True:C214
					QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Name:2="Fail")
					If (Records in selection:C76([RESULTS:14])=0)
						CREATE RECORD:C68([RESULTS:14])
						[RESULTS:14]Result_Code:1:="NOK"
						[RESULTS:14]Result_Name:2:="Fail"
					End if 
					[DIARY:12]Result_Code:11:="NOK"
					[DIARY:12]Result_Description:12:=$_t_ResultMessage
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+",  "+$_t_Notes
					DB_SaveRecord(->[DIARY:12])
					
				End if 
			End if 
		End if   /////
		//$_t_MadeFirstCall:=$_at_Records2D{$_l_IMport}{13}  //Y or N
		//$_t_FirstCallContact:=$_at_Records2D{$_l_IMport}{14}  //Y or N
		//$_t_CallAttempts:=$_at_Records2D{$_l_IMport}{15}  //Number
		//$_t_FirstCallDetails:=$_at_Records2D{$_l_IMport}{16}  //Details
		//$_D_CallDate:=!00-00-00!
		If (False:C215)
			If ($_t_MadeFirstCall="Y")
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Phone Call")
				If (Records in selection:C76([ACTIONS:13])=0)
					CREATE RECORD:C68([ACTIONS:13])
					[ACTIONS:13]Action_Code:1:="CALL"
					[ACTIONS:13]Action_Name:2:="Phone Call"
					[ACTIONS:13]ActionRecordsCompletedEvent:37:=False:C215
					DB_SaveRecord(->[ACTIONS:13])
				End if 
				If ($_D_CallDate=!00-00-00!)
					
					$_D_CallDate:=$_d_LeadDate
				End if 
				If ($_t_FirstCallContact="Y")
					//successful contact
					
					CREATE RECORD:C68([DIARY:12])
					[DIARY:12]Company_Code:1:=$_t_RelatedCompany
					[DIARY:12]Contact_Code:2:=$_t_RelatedContact
					[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
					
					[DIARY:12]Action_Code:9:="CALL"
					If ($_t_CallAttempts#"")
						[DIARY:12]Action_Details:10:="Contact Made, "+"Number of calls: "+$_t_CallAttempts
					Else 
						[DIARY:12]Action_Details:10:="Contact Made"
					End if 
					[DIARY:12]Date_Do_From:4:=$_D_CallDate
					[DIARY:12]Date_Do_To:33:=$_D_CallDate
					[DIARY:12]Date_Done_From:5:=$_D_CallDate
					[DIARY:12]Date_Done_To:34:=$_D_CallDate
					DiaryCode
					[DIARY:12]Originator:23:="JT"
					[DIARY:12]Person:8:="JT"
					[DIARY:12]PersonID:56:=$_l_PersonID
					[DIARY:12]Done:14:=True:C214
					QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Name:2="OK")
					If (Records in selection:C76([RESULTS:14])=0)
						CREATE RECORD:C68([RESULTS:14])
						[RESULTS:14]Result_Code:1:="OK"
						[RESULTS:14]Result_Name:2:="Done"
					End if 
					[DIARY:12]Result_Code:11:="OK"
					[DIARY:12]Result_Description:12:=$_t_FirstCallDetails
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+",  "+$_t_Notes
					
					DB_SaveRecord(->[DIARY:12])
					
				Else 
					//unsuccessful contact(Still open then)
					
					CREATE RECORD:C68([DIARY:12])
					[DIARY:12]Company_Code:1:=$_t_RelatedCompany
					[DIARY:12]Contact_Code:2:=$_t_RelatedContact
					[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
					[DIARY:12]Action_Code:9:="CALL"
					If ($_t_CallAttempts#"")
						[DIARY:12]Action_Details:10:=$_t_FirstCallDetails+" ,"+"Number of calls:"+$_t_CallAttempts
						
					Else 
						[DIARY:12]Action_Details:10:=$_t_FirstCallDetails
					End if 
					[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+",  "+$_t_Notes
					
					[DIARY:12]Date_Do_From:4:=$_D_CallDate
					[DIARY:12]Date_Do_To:33:=$_D_CallDate
					[DIARY:12]Date_Done_From:5:=!00-00-00!
					[DIARY:12]Date_Done_To:34:=!00-00-00!
					
					DiaryCode
					[DIARY:12]Originator:23:="JT"
					[DIARY:12]Person:8:="JT"
					[DIARY:12]PersonID:56:=$_l_PersonID
					[DIARY:12]Done:14:=False:C215
					DB_SaveRecord(->[DIARY:12])
					
				End if 
				
			Else 
				If ($_D_CallDate=!00-00-00!)
					
					$_D_CallDate:=$_d_LeadDate
				End if 
				//not called yet
				CREATE RECORD:C68([DIARY:12])
				[DIARY:12]Company_Code:1:=$_t_RelatedCompany
				[DIARY:12]Contact_Code:2:=$_t_RelatedContact
				[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
				
				[DIARY:12]Action_Code:9:="COAD"
				If ($_t_CallAttempts#"")
					[DIARY:12]Action_Details:10:=$_t_FirstCallDetails+", "+"Number of calls:"+$_t_CallAttempts
				Else 
					[DIARY:12]Action_Details:10:=$_t_FirstCallDetails
				End if 
				[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+",  "+$_t_Notes
				
				[DIARY:12]Date_Do_From:4:=Current date:C33
				[DIARY:12]Date_Do_To:33:=Current date:C33
				[DIARY:12]Date_Done_From:5:=!00-00-00!
				[DIARY:12]Date_Done_To:34:=!00-00-00!
				
				DiaryCode
				[DIARY:12]Originator:23:="JT"
				[DIARY:12]Person:8:="JT"
				[DIARY:12]PersonID:56:=$_l_PersonID
				[DIARY:12]Done:14:=False:C215
				DB_SaveRecord(->[DIARY:12])
				
				
				
			End if 
		End if 
		////
		//$_t_FollowUpFlag:=$_at_Records2D{$_l_IMport}{17}
		//$_t_RespondedToFollowUp:=$_at_Records2D{$_l_IMport}{18}
		If ($_D_CallDate=!00-00-00!)
			
			$_D_FollowDate:=$_d_LeadDate+10
		Else 
			$_D_FollowDate:=$_D_CallDate+1
		End if 
		If (False:C215)
			If ($_t_FollowUpFlag="Y")
				If ($_t_RespondedToFollowUp#"")
				End if 
				CREATE RECORD:C68([DIARY:12])
				[DIARY:12]Company_Code:1:=$_t_RelatedCompany
				[DIARY:12]Contact_Code:2:=$_t_RelatedContact
				[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Email Reply")
				If (Records in selection:C76([ACTIONS:13])=0)
					CREATE RECORD:C68([ACTIONS:13])
					[ACTIONS:13]Action_Code:1:="EMR"
					[ACTIONS:13]Action_Name:2:="Email Reply"
					[ACTIONS:13]ActionRecordsCompletedEvent:37:=True:C214
					DB_SaveRecord(->[ACTIONS:13])
				End if 
				[DIARY:12]Action_Code:9:="EMR"
				[DIARY:12]Action_Details:10:="Follow Up email Sent"
				[DIARY:12]Date_Do_From:4:=$_D_FollowDate
				[DIARY:12]Date_Do_To:33:=$_D_FollowDate
				[DIARY:12]Date_Done_From:5:=$_D_FollowDate
				[DIARY:12]Date_Done_To:34:=$_D_FollowDate
				DiaryCode
				[DIARY:12]Originator:23:="JT"
				[DIARY:12]Person:8:="JT"
				[DIARY:12]PersonID:56:=$_l_PersonID
				[DIARY:12]Done:14:=True:C214
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Name:2="Done")
				If (Records in selection:C76([RESULTS:14])=0)
					CREATE RECORD:C68([RESULTS:14])
					[RESULTS:14]Result_Code:1:="OK"
					[RESULTS:14]Result_Name:2:="Done"
					
					
					DB_SaveRecord(->[RESULTS:14])
				End if 
				[DIARY:12]Result_Code:11:="OK"
				If ($_t_RespondedToFollowUp#"")
					[DIARY:12]Result_Description:12:="Responded to Follow up email"
				End if 
				[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+",  "+$_t_Notes
				
				DB_SaveRecord(->[DIARY:12])
				
			End if 
		End if   //$_t_LastCallComsSent:=$_at_Records2D{$_l_IMport}{19}
		$_D_LastCommDate:=$_D_FollowDate+10
		If (False:C215)
			If ($_t_LastCallComsSent="Y")
				
				CREATE RECORD:C68([DIARY:12])
				[DIARY:12]Company_Code:1:=$_t_RelatedCompany
				[DIARY:12]Contact_Code:2:=$_t_RelatedContact
				[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Email Reply")
				If (Records in selection:C76([ACTIONS:13])=0)
					CREATE RECORD:C68([ACTIONS:13])
					[ACTIONS:13]Action_Code:1:="EMR"
					[ACTIONS:13]Action_Name:2:="Email Reply"
					[ACTIONS:13]ActionRecordsCompletedEvent:37:=True:C214
					DB_SaveRecord(->[ACTIONS:13])
				End if 
				[DIARY:12]Action_Code:9:="EMR"
				[DIARY:12]Action_Details:10:="Last Email Comms Sent"
				[DIARY:12]Date_Do_From:4:=$_D_LastCommDate
				[DIARY:12]Date_Do_To:33:=$_D_LastCommDate
				[DIARY:12]Date_Done_From:5:=$_D_LastCommDate
				[DIARY:12]Date_Done_To:34:=$_D_LastCommDate
				DiaryCode
				[DIARY:12]Originator:23:="JT"
				[DIARY:12]Person:8:="JT"
				[DIARY:12]PersonID:56:=$_l_PersonID
				[DIARY:12]Done:14:=True:C214
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Name:2="Done")
				If (Records in selection:C76([RESULTS:14])=0)
					CREATE RECORD:C68([RESULTS:14])
					[RESULTS:14]Result_Code:1:="OK"
					[RESULTS:14]Result_Name:2:="Done"
					
					
					DB_SaveRecord(->[RESULTS:14])
				End if 
				[DIARY:12]Result_Code:11:="OK"
				[DIARY:12]Result_Description:12:=$_t_Notes
				
				DB_SaveRecord(->[DIARY:12])
				
			End if 
		End if 
		If ($_t_RequestedDemo="Y")
			
			CREATE RECORD:C68([DIARY:12])
			[DIARY:12]Company_Code:1:=$_t_RelatedCompany
			[DIARY:12]Contact_Code:2:=$_t_RelatedContact
			[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Product Demo")
			If (Records in selection:C76([ACTIONS:13])=0)
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:="DEMO"
				[ACTIONS:13]Action_Name:2:="Product Demo"
				DB_SaveRecord(->[ACTIONS:13])
			End if 
			[DIARY:12]Action_Code:9:="DEM"
			[DIARY:12]Action_Details:10:="Demo Requested, "+" Location : "+$_t_DemoLocation
			[DIARY:12]Date_Do_From:4:=$_d_DemoDate
			[DIARY:12]Date_Do_To:33:=$_d_DemoDate
			If ($_d_DemoDate<Current date:C33)
				If ($_t_DemoCompleted#"")
					[DIARY:12]Date_Done_From:5:=Date:C102($_t_DemoCompleted)
					[DIARY:12]Date_Done_To:34:=Date:C102($_t_DemoCompleted)
				Else 
					[DIARY:12]Date_Done_From:5:=($_d_DemoDate)
					[DIARY:12]Date_Done_To:34:=($_d_DemoDate)
					$_t_DemoCompleted:=String:C10($_d_DemoDate)
				End if 
				[DIARY:12]Done:14:=True:C214
			End if 
			DiaryCode
			[DIARY:12]Originator:23:="JT"
			[DIARY:12]Person:8:="JT"
			[DIARY:12]PersonID:56:=$_l_PersonID
			If ([DIARY:12]Done:14)
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Name:2="Done")
				If (Records in selection:C76([RESULTS:14])=0)
					CREATE RECORD:C68([RESULTS:14])
					[RESULTS:14]Result_Code:1:="OK"
					[RESULTS:14]Result_Name:2:="Done"
					
					
					DB_SaveRecord(->[RESULTS:14])
				End if 
				[DIARY:12]Result_Code:11:="OK"
				[DIARY:12]Result_Description:12:=$_t_Notes
				Case of 
					: ($_t_Status="Dead@")
						[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+", "+"Dead Lead"
					: ($_t_Status="Sold@")
						[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+", "+"Sold"
						
				End case 
			Else 
				[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+",  "+$_t_Notes
				
			End if 
			DB_SaveRecord(->[DIARY:12])
			
		End if 
		If ($_t_QuotationDone="Y")
			$_d_QUotationDate:=Date:C102($_t_DemoCompleted)+1
			CREATE RECORD:C68([DIARY:12])
			[DIARY:12]Company_Code:1:=$_t_RelatedCompany
			[DIARY:12]Contact_Code:2:=$_t_RelatedContact
			[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
			QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Quotation")
			If (Records in selection:C76([ACTIONS:13])=0)
				CREATE RECORD:C68([ACTIONS:13])
				[ACTIONS:13]Action_Code:1:="QUT"
				[ACTIONS:13]Action_Name:2:="Quotation"
				[ACTIONS:13]ActionRecordsCompletedEvent:37:=True:C214
				DB_SaveRecord(->[ACTIONS:13])
			End if 
			[DIARY:12]Action_Code:9:="QUT"
			[DIARY:12]Action_Details:10:="Quotation Sent"
			If ($_t_FinanceOffered="Y")
				[DIARY:12]Action_Details:10:=[DIARY:12]Action_Details:10+", "+"Finance Offering"
			End if 
			[DIARY:12]Date_Do_From:4:=$_d_QUotationDate
			[DIARY:12]Date_Do_To:33:=$_d_QUotationDate
			[DIARY:12]Date_Done_From:5:=$_d_QUotationDate
			[DIARY:12]Date_Done_To:34:=$_d_QUotationDate
			DiaryCode
			[DIARY:12]Originator:23:="JT"
			[DIARY:12]Person:8:="JT"
			[DIARY:12]PersonID:56:=$_l_PersonID
			[DIARY:12]Done:14:=True:C214
			QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Name:2="Done")
			If (Records in selection:C76([RESULTS:14])=0)
				CREATE RECORD:C68([RESULTS:14])
				[RESULTS:14]Result_Code:1:="OK"
				[RESULTS:14]Result_Name:2:="Done"
				
				
				DB_SaveRecord(->[RESULTS:14])
			End if 
			[DIARY:12]Result_Code:11:="OK"
			[DIARY:12]Result_Description:12:=$_t_Notes
			Case of 
				: ($_t_Status="Dead@")
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+", "+"Dead Lead"
				: ($_t_Status="Sold@")
					[DIARY:12]Result_Description:12:=[DIARY:12]Result_Description:12+", "+"Sold"
					
			End case 
			DB_SaveRecord(->[DIARY:12])
			
			
		End if 
		
		//
		If ($_t_Status#"")
			Case of 
				: ($_t_Status="Active@")
					Case of 
						: ($_t_Status="@chase")
							If ($_t_NextActionDateString#"")
								$_d_FollowUpDate:=Date:C102($_t_NextActionDateString)
								If ($_d_FollowUpDate=!00-00-00!)
									$_d_FollowUpDate:=Date:C102($_t_DemoCompleted)+1
								End if 
							Else 
								$_d_FollowUpDate:=Date:C102($_t_DemoCompleted)+1
							End if 
							CREATE RECORD:C68([DIARY:12])
							[DIARY:12]Company_Code:1:=$_t_RelatedCompany
							[DIARY:12]Contact_Code:2:=$_t_RelatedContact
							[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Send Email")
							If (Records in selection:C76([ACTIONS:13])=0)
								CREATE RECORD:C68([ACTIONS:13])
								[ACTIONS:13]Action_Code:1:="EMAIL"
								[ACTIONS:13]Action_Name:2:="Send Email"
								[ACTIONS:13]ActionRecordsCompletedEvent:37:=False:C215
								DB_SaveRecord(->[ACTIONS:13])
							End if 
							[DIARY:12]Action_Code:9:="EMAIL"
							[DIARY:12]Action_Details:10:="Send Follow up Yeti Campaign Email"
							
							
							[DIARY:12]Date_Do_From:4:=$_d_FollowUpDate
							[DIARY:12]Date_Do_To:33:=$_d_FollowUpDate
							
							DiaryCode
							[DIARY:12]Originator:23:="JT"
							[DIARY:12]Person:8:="JT"
							[DIARY:12]PersonID:56:=$_l_PersonID
							[DIARY:12]Done:14:=False:C215
							DB_SaveRecord(->[DIARY:12])
						: ($_t_Status="@Wait")
							If ($_t_NextActionDateString#"")
								$_d_FollowUpDate:=Date:C102($_t_NextActionDateString)
								If ($_d_FollowUpDate=!00-00-00!)
									$_d_FollowUpDate:=Date:C102($_t_DemoCompleted)+1
								End if 
							Else 
								$_d_FollowUpDate:=Date:C102($_t_DemoCompleted)+1
							End if 
							
							CREATE RECORD:C68([DIARY:12])
							[DIARY:12]Company_Code:1:=$_t_RelatedCompany
							[DIARY:12]Contact_Code:2:=$_t_RelatedContact
							[DIARY:12]Product_Code:13:="**CNC/YETI/SB1"
							QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2="Send Email")
							If (Records in selection:C76([ACTIONS:13])=0)
								CREATE RECORD:C68([ACTIONS:13])
								[ACTIONS:13]Action_Code:1:="EMAIL"
								[ACTIONS:13]Action_Name:2:="Send Email"
								[ACTIONS:13]ActionRecordsCompletedEvent:37:=False:C215
								DB_SaveRecord(->[ACTIONS:13])
							End if 
							[DIARY:12]Action_Code:9:="EMAIL"
							[DIARY:12]Action_Details:10:="Send Follow up Yeti Campaign Email"
							
							
							[DIARY:12]Date_Do_From:4:=$_d_FollowUpDate
							[DIARY:12]Date_Do_To:33:=$_d_FollowUpDate
							
							DiaryCode
							[DIARY:12]Originator:23:="JT"
							[DIARY:12]Person:8:="JT"
							[DIARY:12]PersonID:56:=$_l_PersonID
							[DIARY:12]Done:14:=False:C215
							DB_SaveRecord(->[DIARY:12])
							
					End case 
				: ($_t_Status="")  //its dead??
					
			End case 
			
		End if 
		
		
		
		
		
		
		
	End for 
End if 
ERR_MethodTrackerReturn("Trend_CRMImport"; $_t_oldMethodName)
