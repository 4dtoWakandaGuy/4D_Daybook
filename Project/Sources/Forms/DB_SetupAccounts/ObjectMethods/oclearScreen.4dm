If (False:C215)
	//object Name: Object Name:      DB_SetupAccounts.oclearScreen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/08/2013 17:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	//ARRAY BOOLEAN(ACC_lb_Headings;0)
	//ARRAY BOOLEAN(DB_ab_LineEdit;0)
	//ARRAY BOOLEAN(DB_abo_AccountDefault;0)
	//ARRAY BOOLEAN(DB_abo_NoNominalLedgerPostings;0)
	//ARRAY INTEGER(DB_aI_ALLHeadingLevels;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel1;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel2;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel3;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel4;0)
	//ARRAY INTEGER(DB_aI_HeadingLevel5;0)
	//ARRAY INTEGER(DB_ai_RowLevel;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce1;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce2;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce3;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce4;0)
	//ARRAY LONGINT(DB_al_HeadingEnforce5;0)
	//ARRAY LONGINT(DB_al_MultiCurrencyValuation;0)
	//ARRAY PICTURE(DB_api_AddAccount;0)
	//ARRAY PICTURE(DB_api_AddSubHeading;0)
	//ARRAY PICTURE(DB_apic_AddAccount;0)
	//ARRAY PICTURE(DB_apic_AddSubHeading;0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(DB_at_ACCHHeadings1;0)
	//ARRAY TEXT(DB_at_ACCHHeadings2;0)
	//ARRAY TEXT(DB_at_ACCHHeadings3;0)
	//ARRAY TEXT(DB_at_ACCHHeadings4;0)
	//ARRAY TEXT(DB_at_ACCHHeadings5;0)
	//ARRAY TEXT(DB_at_AccountCodes;0)
	//ARRAY TEXT(DB_at_AccountHeadings;0)
	//ARRAY TEXT(DB_at_AccountIO;0)
	//ARRAY TEXT(DB_at_AccountNames;0)
	//ARRAY TEXT(DB_at_AccountPreferenceGroups;0)
	//ARRAY TEXT(DB_at_AnalysisCodes;0)
	//ARRAY TEXT(DB_at_Dummy;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom1;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom2;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom3;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom4;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeFrom5;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTO1;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTo2;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTo3;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTo4;0)
	//ARRAY TEXT(DB_at_HeadingAccCodeTo5;0)
	//ARRAY TEXT(DB_at_HeadingACCRange;0)
	//ARRAY TEXT(DB_at_HeadingGroup1;0)
	//ARRAY TEXT(DB_at_HeadingGroup2;0)
	//ARRAY TEXT(DB_at_HeadingGroup3;0)
	//ARRAY TEXT(DB_at_HeadingGroup4;0)
	//ARRAY TEXT(DB_at_HeadingGroup5;0)
	//ARRAY TEXT(DB_at_HeadingLevelup1;0)
	//ARRAY TEXT(DB_at_HeadingLevelup2;0)
	//ARRAY TEXT(DB_at_HeadingLevelup3;0)
	//ARRAY TEXT(DB_at_HeadingLevelup4;0)
	//ARRAY TEXT(DB_at_HeadingLevelup5;0)
	//ARRAY TEXT(DB_At_headingNames;0)
	//ARRAY TEXT(DB_at_HeadingNames1;0)
	//ARRAY TEXT(DB_at_HeadingNames2;0)
	//ARRAY TEXT(DB_at_HeadingNames3;0)
	//ARRAY TEXT(DB_at_HeadingNames4;0)
	//ARRAY TEXT(DB_at_HeadingNames5;0)
	//ARRAY TEXT(DB_at_Headings;0)
	//ARRAY TEXT(DB_at_LayerCodes;0)
	//ARRAY TEXT(DB_at_MultiCurrencyValuation;0)
	//ARRAY TEXT(DB_at_ProfitBalance;0)
	//ARRAY TEXT(DB_at_ReportHeadings;0)
	//ARRAY TEXT(DB_At_SubHeadingLevel;0)
	//ARRAY TEXT(DB_at_SubHeadings;0)
	C_PICTURE:C286($_pic_AddSubHeading)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oclearScreen"; Form event code:C388)
If (Size of array:C274(DB_ai_RowLevel)>0)
	
	Gen_Confirm("Are you sure you want to clear the current setup completely?"; "No"; "Yes")
	If (OK=0)
		OK:=1
		ARRAY INTEGER:C220(DB_ai_RowLevel; 0)
		
		ARRAY INTEGER:C220(DB_aI_HeadingLevel1; 0)  //[HEADINGS]Heading_Level
		ARRAY INTEGER:C220(DB_aI_HeadingLevel2; 0)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel3; 0)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel4; 0)
		ARRAY INTEGER:C220(DB_aI_HeadingLevel5; 0)
		
		ARRAY INTEGER:C220(DB_aI_ALLHeadingLevels; 0)
		
		ARRAY TEXT:C222(DB_at_ACCHHeadings1; 0)  //[HEADINGS]Heading_Code
		ARRAY TEXT:C222(DB_at_ACCHHeadings2; 0)
		ARRAY TEXT:C222(DB_at_ACCHHeadings3; 0)
		ARRAY TEXT:C222(DB_at_ACCHHeadings4; 0)
		ARRAY TEXT:C222(DB_at_ACCHHeadings5; 0)
		//```
		ARRAY TEXT:C222(DB_at_HeadingNames1; 0)  //[HEADINGS]Heading_Name
		ARRAY TEXT:C222(DB_at_HeadingNames2; 0)
		ARRAY TEXT:C222(DB_at_HeadingNames3; 0)
		ARRAY TEXT:C222(DB_at_HeadingNames4; 0)
		ARRAY TEXT:C222(DB_at_HeadingNames5; 0)
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom1; 0)  //[HEADINGS]AccCodeRangeFrom
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom2; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom3; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom4; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeFrom5; 0)
		
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTO1; 0)  //[HEADINGS][HEADINGS]AccCodeRangeTo
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo2; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo3; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo4; 0)
		ARRAY TEXT:C222(DB_at_HeadingAccCodeTo5; 0)
		
		ARRAY LONGINT:C221(DB_al_HeadingEnforce1; 0)  //[HEADINGS]EnforceRange
		ARRAY LONGINT:C221(DB_al_HeadingEnforce2; 0)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce3; 0)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce4; 0)
		ARRAY LONGINT:C221(DB_al_HeadingEnforce5; 0)
		
		ARRAY TEXT:C222(DB_at_HeadingGroup1; 0)  //[HEADINGS]Group_Code
		ARRAY TEXT:C222(DB_at_HeadingGroup2; 0)
		ARRAY TEXT:C222(DB_at_HeadingGroup3; 0)
		ARRAY TEXT:C222(DB_at_HeadingGroup4; 0)
		ARRAY TEXT:C222(DB_at_HeadingGroup5; 0)
		
		ARRAY TEXT:C222(DB_at_HeadingLevelup1; 0)  //[HEADINGS]Level_Up_Code
		ARRAY TEXT:C222(DB_at_HeadingLevelup2; 0)
		ARRAY TEXT:C222(DB_at_HeadingLevelup3; 0)
		ARRAY TEXT:C222(DB_at_HeadingLevelup4; 0)
		ARRAY TEXT:C222(DB_at_HeadingLevelup5; 0)
		
		
		ARRAY TEXT:C222(DB_at_SubHeadings; 0)
		
		ARRAY TEXT:C222(DB_at_Headings; 0)
		ARRAY TEXT:C222(DB_At_headingNames; 0)
		ARRAY TEXT:C222(DB_At_SubHeadingLevel; 0)
		ARRAY PICTURE:C279(DB_apic_AddSubHeading; 0)
		ARRAY PICTURE:C279(DB_apic_AddAccount; 0)
		ARRAY TEXT:C222(DB_at_HeadingACCRange; 0)
		
		ARRAY TEXT:C222(DB_at_AccountCodes; 0)  //[ACCOUNTS]Account_Code
		ARRAY TEXT:C222(DB_at_AccountNames; 0)  //[ACCOUNTS]Account_Name
		ARRAY TEXT:C222(DB_at_AccountHeadings; 0)  //[ACCOUNTS]Group_Heading
		ARRAY TEXT:C222(DB_at_ReportHeadings; 0)  //[ACCOUNTS]Report_Heading
		ARRAY TEXT:C222(DB_at_AccountPreferenceGroups; 0)  //[ACCOUNTS]xinternalAccountGroup
		ARRAY BOOLEAN:C223(DB_abo_AccountDefault; 0)  //[ACCOUNTS]xDefaultAccountWithinGroup<<<<
		ARRAY TEXT:C222(DB_at_AccountIO; 0)  //[ACCOUNTS]IO
		ARRAY LONGINT:C221(DB_al_MultiCurrencyValuation; 0)  //[ACCOUNTS]Multicurrency_Valuation
		ARRAY TEXT:C222(DB_at_MultiCurrencyValuation; 0)
		ARRAY BOOLEAN:C223(DB_abo_NoNominalLedgerPostings; 0)  //[ACCOUNTS]No_NL_Postings
		ARRAY TEXT:C222(DB_at_ProfitBalance; 0)  //[ACCOUNTS]PB
		ARRAY TEXT:C222(DB_at_AnalysisCodes; 0)  //Bssed on [ACCOUNTS]xAnalysisCodes
		ARRAY TEXT:C222(DB_at_LayerCodes; 0)  // based on [ACCOUNTS]xLayerCodes
		
		ARRAY TEXT:C222(DB_at_Dummy; 0)
		ARRAY BOOLEAN:C223(DB_ab_LineEdit; 0)
		//OBJECT SET TITLE(*;"oclearScreen";"Add Row")
		OBJECT SET VISIBLE:C603(*; "oClearScreen"; False:C215)
		
	End if 
Else 
	//GET PICTURE FROM LIBRARY(22563; $_pic_AddSubHeading)
	$_pic_AddSubHeading:=Get_Picture(22563)
	TRANSFORM PICTURE:C988($_pic_AddSubHeading; Translate:K61:3; 3; 3)
	
	LISTBOX INSERT ROWS:C913(*; "oAccountHeadings1"; 1; 1)
	DB_apic_AddSubHeading{Size of array:C274(DB_apic_AddSubHeading)}:=$_pic_AddSubHeading
	DB_apic_AddAccount{Size of array:C274(DB_apic_AddSubHeading)}:=$_pic_AddSubHeading
	
	LB_SetEnterable(->ACC_lb_Headings; True:C214; 2)
	//
	//OBJECT GOTO AREA
	GOTO OBJECT:C206(*; "oAccountHeadings1")
	LISTBOX SELECT ROW:C912(*; "oAccountHeadings1"; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	LISTBOX GET ARRAYS:C832(*; "oAccountHeadings1"; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
	
	EDIT ITEM:C870(*; $_at_ColumnNames{2}; 1)
	OBJECT SET TITLE:C194(*; "oclearScreen"; "Clear Screen")
	
	
	
End if 
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oclearScreen"; $_t_oldMethodName)
