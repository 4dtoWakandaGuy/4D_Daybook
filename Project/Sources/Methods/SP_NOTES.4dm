//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_NOTES
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_NOTES")
// x_ID²• -(SP_l_LoadSalesProjectionID)
//this is not entered by the user-set by trigger when saving a record
// Class_ID²-(   SP_l_ProjectionClassID(SP_S55_SalesProjection))
//used to signify what type of sales project this is eg sales order/Job etc etc
//the list of Classes can be modified and related to the TYPE for JOB/ORDER etc
//the process of relating has not been done<------
// Forcast_LevelID-(SP_l_ProjectionLevelID-(SP_t_SalesProjectionLevel))-<-------

//Signifies at what level this is-this needs more work-
//the levels should be dynamic and the heirarchy definable
//each level can be made of projections at the level below
//with only the lowest level being directly relating to orders
//levels above that are can be based on lower projections and therby
//(even though several layers) relate back to orders.
//what else will need work here when we come to projections
//is the concept of filtering below
//this will need a change to personnel groups
//so that a person can be designated as the group owner
//and also the ability for GROUPS to not exist on the login
//e.g pseudo groups
//this will define what existing projections a user can pick up to
//base a projectiion on
//the discussion which is not resolved about that is
//how we properly control including the same projection in more than one higher pr
//PersonnelOwnerID-(SP_l_ProjectionPersonID(SP_t_SalesProjectionPerson))
//the person who this projection is belonging to
//a projection of grouped orders may not belong to one person

//PersonnelGroupID-(SP_l_ProjectionGroupID(SD_t_SalesProjectionGROUP))
//the personnel group of the owner of this projection
//or this may contain the group who ownes this if there is no person
//CompanyID-(SP_l_RelatedCompanyID(    SP_t_SalesProjectionCompany))
//the company to whom this sale relates-if it does relate to a sale
//ContactID-(  SP_l_RelatedContactID(SP_t_SalesProjectionContact))
//the contact at that company
//RelatedSaleTableID-(SP_l_relatedTableNUM)
//the table this projection is related to this is not the number of the table
//but rather the ID of the table listing in the list of tables used
// by table restriction

//RelatedSaleRecordID-(    SP_l_RelatedRecordID)
//the Numeric ID of the record(this requires adding a field to tables to accomdate
//the numeric ID is better that an alpha value as the length is not declared so
//there is compliance accross the tables
//once this has  been set and saved it cannot be changed
//Date_Entered-(SP_D_SalesEnteredDate)
//this is created when the record is created it is not User_Modifiable
//Description=(        SP_T_SalesProjectionDesc)
//the description(text) of the projection
//CurrencyID=( SP_l_CurrencyID(SP_t_SalesCurrency))
//the currency ID-displayed as the currency symbol from the related currency
//GrossValue=(       SP_R_SalesProjectionValue)
//the expected value of the sale
//GrossCosts(SP_R_SalesProjectionCosts)
//the expected costs of the sale
//the cost and value are modifiable until the sales projection has `
//been given a state which means it is not modifiable
//the states are related to the file states and so should obtain
//the properties of the file state and use those
//GrossMargin(Not DISPLAYED)

//this is calculated from the costs/value
//Expected_date(SP_D_SalesProjectionDate)
//the expected date for conversion -this can be modified
//Probability (SP_R_SalesProjectionPCT)
//the probability of this sale happening
//CalculatedProbableValue(NOT DISPLAYED)
//a calculated figure based on the (value*probability)/100
//ConvertedSaleValue(SP_R_SalesProjectionACTUAL)
//the actual value of the sale-comes from the order when it is converted
//Status(SP_l_SalesProjectionStatusID(SP_t_SalesProjectionState))
//the status this is updated automatically(trigger on other tables needed)

//Title
//the user entered title
//ProjectionFromDate
//Will be used for rolled up projections
//ProjectiontoDate
//will be used for rolled up projections
//ProjectionDatesSort
//a longint representation of the date that will be used for sorting
ERR_MethodTrackerReturn("SP_NOTES"; $_t_oldMethodName)