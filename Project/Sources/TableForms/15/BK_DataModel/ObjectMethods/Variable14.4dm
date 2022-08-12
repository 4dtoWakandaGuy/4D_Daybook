If (False:C215)
	//object Name: [USER]BK_DataModel.Variable14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(BK_al_ADBFIELDNUM;0)
	//ARRAY LONGINT(BK_al_aDBTableNum;0)
	//ARRAY LONGINT(BK_al_DestinationField;0)
	//ARRAY LONGINT(BK_al_DestinationTable;0)
	//ARRAY LONGINT(BK_al_PsuedoNumber;0)
	ARRAY TEXT:C222($_at_DBFieldName; 0)
	ARRAY TEXT:C222($_at_FieldName; 0)
	//ARRAY TEXT(BK_at_BKFieldName;0)
	//ARRAY TEXT(BK_at_DBFieldName;0)
	//ARRAY TEXT(BK_at_DestinationFieldName;0)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_FieldPosition; $_l_FieldPosition2; $_l_Index; BK_l_DayBookContext)
	C_TEXT:C284($_t_oldMethodName; BK_t_BKCONTEXT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Variable14"; Form event code:C388)
ARRAY TEXT:C222($_at_FieldName; 0)
ARRAY TEXT:C222($_at_DBFieldName; 0)

If (BK_l_DayBookContext>0) & (BK_t_BKCONTEXT#"")
	Case of 
		: (BK_l_DaybookContext=2)
			Case of 
				: (BK_t_BKCONTEXT="CUS")
					//this will need updating if we change the model
					//here define the defaults
					
				Else 
					Gen_Alert("No defaults are defined for receiving Contacts/Companies from "+BK_t_BKCONTEXT)
			End case 
		: (BK_l_DaybookContext=25)  //)`orders
			Case of 
				: (BK_t_BKCONTEXT="ODR")
					ARRAY TEXT:C222($_at_FieldName; 10)
					ARRAY TEXT:C222($_at_DBFieldName; 10)
					$_at_FieldName{1}:="CusCode"
					$_at_DBFieldName{1}:="Contact Code"
					$_at_FieldName{2}:="C01"
					$_at_DBFieldName{2}:="Product Code"
					$_at_FieldName{3}:="T01"
					$_at_DBFieldName{3}:="Product Name"
					$_at_FieldName{4}:="QtItem"
					$_at_DBFieldName{4}:="Quantity"
					$_at_FieldName{5}:="PrUnitEXV\t"
					$_at_DBFieldName{5}:="Sales Price"
					$_at_FieldName{6}:="PrFinalEXV"
					$_at_DBFieldName{6}:="Sales Amount\t"
					$_at_FieldName{7}:="PrFinalVAT"
					$_at_DBFieldName{7}:="Vat Amount"
					$_at_FieldName{8}:="PrFinalINV"
					$_at_DBFieldName{8}:="Total Amount"
					$_at_FieldName{9}:="DaComment"
					$_at_DBFieldName{9}:="Description"
					$_at_FieldName{10}:="PcVATByType1"
					
					$_at_DBFieldName{10}:="Tax Code"
					
				Else 
					Gen_Alert("No defaults are defined for receiving ORDERS from "+BK_t_BKCONTEXT)
			End case 
		: (BK_l_DaybookContext=Table:C252(->[PRODUCTS:9]))  //)`ITEMS
			Case of 
				: (BK_t_BKCONTEXT="ITM")
				Else 
					Gen_Alert("No defaults are defined for receiving Products from "+BK_t_BKCONTEXT)
			End case 
			
	End case 
	
	For ($_l_Index; 1; Size of array:C274(BK_at_BKFieldName))
		BK_al_aDBTableNum{$_l_Index}:=0
		BK_al_ADBFIELDNUM{$_l_Index}:=0
		BK_at_DBFieldName{$_l_Index}:="Unknown"
	End for 
	
	For ($_l_Index; 1; Size of array:C274($_at_FieldName))
		$_l_FieldPosition:=Find in array:C230(BK_at_BKFieldName; $_at_FieldName{$_l_Index})
		If ($_l_FieldPosition>0)  //it should be
			$_l_FieldPosition2:=Find in array:C230(BK_at_DestinationFieldName; $_at_DBFieldName{$_l_Index})
			If ($_l_FieldPosition2>0)  //it should be
				BK_al_aDBTableNum{$_l_FieldPosition}:=BK_al_DestinationTable{$_l_FieldPosition2}
				BK_al_ADBFIELDNUM{$_l_FieldPosition}:=BK_al_DestinationField{$_l_FieldPosition2}
				BK_at_DBFieldName{$_l_FieldPosition}:=BK_at_DestinationFieldName{$_l_FieldPosition2}
				If (BK_al_PsuedoNumber{$_l_FieldPosition}>0)
					BK_al_PsuedoNumber{$_l_FieldPosition}:=BK_al_PsuedoNumber{$_l_FieldPosition}+1000
				End if 
				DM_Bo_BKedit:=True:C214
			End if 
			
		End if 
		
	End for 
	
Else 
	Gen_Alert("You must select a Daybook and Business Kit context for defaults")
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Variable14"; $_t_oldMethodName)
