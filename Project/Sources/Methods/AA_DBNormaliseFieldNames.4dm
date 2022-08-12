//%attributes = {}
If (False:C215)
	//Project Method Name: 
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 07:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_FIeldName; $_t_oldMethodName; $_t_ReturnName; $_t_TableName; $0)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_DBNormaliseFieldNames")
//NG March 2008
//This method will return a default name to be presented when asking a user to assocciate a list with a field. It will be returned as the 'Field name' and also used as the default name for any list they create.
//Please add to this as required....

If (Count parameters:C259>=2)
	$_l_TableNumber:=$1
	$_l_FieldNumber:=$2
	If (Is table number valid:C999($_l_TableNumber))
		$_t_TableName:=Table name:C256($_l_TableNumber)
		$_t_FIeldName:=Field name:C257($_l_TableNumber; $_l_FieldNumber)
		$_t_ReturnName:=$_t_TableName+" "+$_t_FIeldName
		Case of 
			: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
				Case of 
					: ($_l_FieldNumber=Field:C253(->[COMPANIES:2]Area:11))
						$_t_ReturnName:="Company Areas"
					: ($_l_FieldNumber=Field:C253(->[COMPANIES:2]Company_Type:13))
						$_t_ReturnName:="Company Types"
					: ($_l_FieldNumber=Field:C253(->[COMPANIES:2]PL_Terms:53))
						$_t_ReturnName:="Purchase Terms"
					: ($_l_FieldNumber=Field:C253(->[COMPANIES:2]Record_State:62))
						$_t_ReturnName:="Company Record Stati"
					: ($_l_FieldNumber=Field:C253(->[COMPANIES:2]SL_Terms:40))
						$_t_ReturnName:="Sales Terms"
					: ($_l_FieldNumber=Field:C253(->[COMPANIES:2]x_Employees:73))
						$_t_ReturnName:="No of Employees"
						
				End case 
			: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			: ($_l_TableNumber=Table:C252(->[SALES_PROJECTION:113]))
				Case of 
					: ($_l_FieldNumber=Field:C253(->[SALES_PROJECTION:113]Status:20))
						$_t_ReturnName:="Sales Projection Status"
					: ($_l_FieldNumber=Field:C253(->[SALES_PROJECTION:113]Class_ID:2))
						$_t_ReturnName:="Sales Projection Type"
				End case 
			: ($_l_TableNumber=Table:C252(->[INFORMATION:55]))
				Case of 
					: ($_l_FieldNumber=Field:C253(->[INFORMATION:55]QualityID:14))
						$_t_ReturnName:="Qualitative Information Groups"
				End case 
			: ($_l_TableNumber=Table:C252(->[ACTIONS:13]))
			: ($_l_TableNumber=Table:C252(->[xCreditCardDetails:132]))
				Case of 
					: ($_l_FieldNumber=Field:C253(->[xCreditCardDetails:132]Card_TypeNUM:4))
						$_t_ReturnName:="Credit Card Types"
					: ($_l_FieldNumber=Field:C253(->[xCreditCardDetails:132]Card_Issuer:6))
						$_t_ReturnName:="Credit Card Issuer"
				End case 
			: ($_l_TableNumber=Table:C252(->[CATALOGUE:108]))
				Case of 
					: ($_l_FieldNumber=Field:C253(->[CATALOGUE:108]EW_Family:6))
						$_t_ReturnName:="Group Name"
				End case 
				
		End case 
	End if 
	$0:=$_t_ReturnName
End if 
ERR_MethodTrackerReturn("AA_DBNormaliseFieldNames"; $_t_oldMethodName)