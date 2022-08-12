//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_UpdateProjectionfromPV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SP_UpdateProjectionfromPV
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SP_ad_ExpectedDate;0)
	//ARRAY LONGINT(SP_al_CompanyID;0)
	//ARRAY LONGINT(SP_al_CurrencyID;0)
	//ARRAY LONGINT(SP_al_RelatedSaleTypeID;0)
	//ARRAY LONGINT(SP_al_SalesContactID;0)
	//ARRAY LONGINT(SP_al_SalesPipelineStatus;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_SalesRecordModified;0)
	//ARRAY LONGINT(SP_al_SalesRelatedRecordID;0)
	//ARRAY LONGINT(SP_al_SalesRelatedTableID;0)
	//ARRAY REAL(SP_ar_Probability;0)
	//ARRAY REAL(SP_ar_SalesActual;0)
	//ARRAY REAL(SP_ar_SalesActualCosts;0)
	//ARRAY REAL(SP_ar_SalesCosts;0)
	//ARRAY REAL(SP_ar_SalesMargin;0)
	//ARRAY REAL(SP_ar_SalesValue;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_RelatedSaleTypeNM;0)
	//ARRAY TEXT(SP_at_SalesCustomerName;0)
	//ARRAY TEXT(SP_at_SalesProjectionContact;0)
	//ARRAY TEXT(SP_at_SalesTitle;0)
	C_BOOLEAN:C305(<>NoUpdate)
	C_LONGINT:C283($1; SP_l_GroupID; SP_l_PersonelID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_UpdateProjectionfromPV")
READ WRITE:C146([SALES_PROJECTION:113])
If (SP_al_SalesProjectionID{$1}<0)
	CREATE RECORD:C68([SALES_PROJECTION:113])
	//create the record first
	If (SP_l_PersonelID>0)
		[SALES_PROJECTION:113]PersonnelOwnerID:4:=SP_l_PersonelID
		[SALES_PROJECTION:113]PersonnelGroupID:5:=SP_l_GroupID
	Else 
		[SALES_PROJECTION:113]PersonnelGroupID:5:=SP_l_GroupID
	End if 
	[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
Else 
	QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=SP_al_SalesProjectionID{$1})
End if 
[SALES_PROJECTION:113]Title:21:=SP_at_SalesTitle{$1}
[SALES_PROJECTION:113]Class_ID:2:=SP_al_RelatedSaleTypeID{$1}

[SALES_PROJECTION:113]CompanyID:6:=SP_al_CompanyID{$1}
[SALES_PROJECTION:113]ContactID:7:=SP_al_SalesContactID{$1}
[SALES_PROJECTION:113]RelatedSaleTableID:8:=SP_al_SalesRelatedTableID{$1}
[SALES_PROJECTION:113]RelatedSaleRecordID:9:=SP_al_SalesRelatedRecordID{$1}
//[SALES_PROJECTION]Description Not enterable from here
[SALES_PROJECTION:113]CurrencyID:12:=SP_al_CurrencyID{$1}
[SALES_PROJECTION:113]GrossValue:13:=SP_ar_SalesValue{$1}
[SALES_PROJECTION:113]GrossCosts:14:=SP_ar_SalesCosts{$1}
[SALES_PROJECTION:113]GrossMargin:15:=SP_ar_SalesMargin{$1}
[SALES_PROJECTION:113]Expected_date:16:=SP_ad_ExpectedDate{$1}
[SALES_PROJECTION:113]Probability:17:=SP_ar_Probability{$1}
[SALES_PROJECTION:113]CalculatedProbableValue:18:=SP_calcValue(SP_ar_SalesActual{$1}; SP_ar_Probability{$1})
[SALES_PROJECTION:113]ConvertedSaleValue:19:=SP_ar_SalesActual{$1}
[SALES_PROJECTION:113]Status:20:=SP_al_SalesPipelineStatus{$1}
[SALES_PROJECTION:113]ConvertedSaleCosts:28:=SP_ar_SalesActualCosts{$1}
If ([SALES_PROJECTION:113]x_ID:1=0)
	[SALES_PROJECTION:113]x_ID:1:=AA_GetNextIDinMethod(->[SALES_PROJECTION:113]x_ID:1)
End if 

DB_SaveRecord(->[SALES_PROJECTION:113])
AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
SP_al_SalesProjectionID{$1}:=[SALES_PROJECTION:113]x_ID:1
UNLOAD RECORD:C212([SALES_PROJECTION:113])
READ ONLY:C145([SALES_PROJECTION:113])
If ($1=Size of array:C274(SP_al_SalesPipelineStatus))
	ARRAY LONGINT:C221(SP_al_SalesProjectionID; 0)
	ARRAY TEXT:C222(SP_at_SalesTitle; 0)
	ARRAY LONGINT:C221(SP_al_CompanyID; 0)
	ARRAY TEXT:C222(SP_at_SalesCustomerName; 0)
	ARRAY LONGINT:C221(SP_al_CurrencyID; 0)
	ARRAY TEXT:C222(SP_at_CurrencyCode; 0)
	ARRAY REAL:C219(SP_ar_SalesValue; 0)
	ARRAY REAL:C219(SP_ar_SalesCosts; 0)
	ARRAY REAL:C219(SP_ar_SalesMargin; 0)
	ARRAY DATE:C224(SP_ad_ExpectedDate; 0)
	ARRAY REAL:C219(SP_ar_Probability; 0)
	ARRAY LONGINT:C221(SP_al_SalesPipelineStatus; 0)
	ARRAY TEXT:C222(SP_at_PipelineStatus; 0)
	ARRAY LONGINT:C221(SP_al_RelatedSaleTypeID; 0)
	ARRAY TEXT:C222(SP_at_RelatedSaleTypeNM; 0)
	ARRAY REAL:C219(SP_ar_SalesActual; 0)
	ARRAY TEXT:C222(SP_at_SalesProjectionContact; 0)
	ARRAY LONGINT:C221(SP_al_SalesContactID; 0)
	ARRAY LONGINT:C221(SP_al_SalesRelatedTableID; 0)
	ARRAY LONGINT:C221(SP_al_SalesRelatedRecordID; 0)
	ARRAY LONGINT:C221(SP_al_SalesRecordModified; 0)
	ARRAY REAL:C219(SP_ar_SalesActualCosts; 0)
	
	<>NoUpdate:=False:C215
End if 
ERR_MethodTrackerReturn("SP_UpdateProjectionfromPV"; $_t_oldMethodName)
