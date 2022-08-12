//%attributes = {"invisible":true,"shared":true}

If (False:C215)
	//Project Method Name:      CODE_GetTableInfo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/04/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FieldProperties; $_bo_Properties; $_bo_RelationProperties)
	C_LONGINT:C283($_l_FIeldNumber; $_l_FieldType; $_l_InfoNumber; $_l_LongintReturn; $_l_TableNumber; $0; $1; $2; $3)
	C_POINTER:C301($_Ptr_BooleanReturn1; $_Ptr_BooleanReturn2; $_Ptr_BooleanReturn3; $_Ptr_BooleanReturn4; $_ptr_LongintReturn; $_ptr_LongintReturn2; $_ptr_LongintReturn3; $_ptr_TextReturn; $10; $4; $5)
	C_POINTER:C301($6; $7; $8; $9)
	C_TEXT:C284($_txt_TableName)
End if 
//Code Starts Here

If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      CODE_GetTableInfo
	//Parameter Detail:
	
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	
	//Related Methods: 
	
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	
	//Date Created: 18/06/2017
	
	//Created BY: Nigel Greenlee
	////////Date Modified: 05/07/2017
	//Modified By: Nigel Greenlee
	
End if 

//---------- Type Parameters & Local Variables ----------
If (True:C214)
	C_LONGINT:C283($_l_LongintReturn)
	
	C_LONGINT:C283($0)
	C_BOOLEAN:C305($_bo_FieldProperties; $_bo_Properties; $_bo_RelationProperties)
	C_LONGINT:C283($_l_FIeldNumber; $_l_InfoNumber; $_l_LongintReturn; $_l_TableNumber; $1; $2; $3)
	C_POINTER:C301($_Ptr_BooleanReturn1; $_Ptr_BooleanReturn2; $_Ptr_BooleanReturn3; $_Ptr_BooleanReturn4; $_ptr_LongintReturn; $_ptr_LongintReturn2; $_ptr_LongintReturn3; $_ptr_TextReturn; $10; $4; $5)
	C_POINTER:C301($6; $7; $8; $9)
	C_TEXT:C284($_txt_TableName)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)  //must be at least on parameters
	$_l_TableNumber:=$1
	If (Count parameters:C259>=2)  //only  HAVE to pass a second paramter if field info or other table info
		$_l_FIeldNumber:=$2  //pass zero where not relevant
		If (Count parameters:C259>=3)  //if passed a function number
			$_l_InfoNumber:=$3
		Else   //no function number so either last field number or is field number valid
			$_l_InfoNumber:=4
			If ($_l_FIeldNumber>0)  //if a field number is passed and no function then it is is field number valid
				$_l_InfoNumber:=5
			End if 
		End if 
	Else 
		$_l_InfoNumber:=1  // get last table number
		If ($_l_TableNumber>0)  //if table number is passed then is table number valid
			$_l_InfoNumber:=2
		End if 
	End if 
Else 
	$_l_InfoNumber:=1  // get last table number
	If ($_l_TableNumber>0)  //if table number is passed then is table number valid
		$_l_InfoNumber:=2
	End if 
End if 
$_l_LongintReturn:=0
If (Count parameters:C259>=4)
	$_ptr_TextReturn:=$4
	If (Count parameters:C259>=8)
		$_bo_Properties:=True:C214
		$_Ptr_BooleanReturn1:=$5
		$_Ptr_BooleanReturn2:=$6
		$_Ptr_BooleanReturn3:=$7
		$_Ptr_BooleanReturn4:=$8
		If (Count parameters:C259>9)
			$_bo_FieldProperties:=True:C214
			$_ptr_LongintReturn2:=$9
			If (Count parameters:C259>10)
				$_bo_RelationProperties:=True:C214
				$_ptr_LongintReturn3:=$10
			End if 
		Else 
			
		End if 
	End if 
End if 


//-------------------- Main Method -------------------"
If ($_l_InfoNumber>0)
	Case of 
		: ($_l_InfoNumber=1)  // last table number
			$0:=Get last table number:C254
		: ($_l_InfoNumber=2)  // is table number valid
			$0:=Num:C11(Is table number valid:C999($_l_TableNumber))
		: ($_l_InfoNumber=4)  // Get last field number
			$0:=Get last field number:C255($_l_TableNumber)
		: ($_l_InfoNumber=5)  // is field number valid
			$0:=Num:C11(Is field number valid:C1000($_l_TableNumber; $_l_FIeldNumber))
		: ($_l_InfoNumber=5)  // table name
			$_ptr_TextReturn->:=Table name:C256($_l_TableNumber)
		: ($_l_InfoNumber=6)  // field name
			$_ptr_TextReturn->:=Field name:C257($_l_TableNumber; $_l_FIeldNumber)
		: ($_l_InfoNumber=7) & ($_bo_Properties)  //  table Propeteries
			GET TABLE PROPERTIES:C687($_l_TableNumber; $_Ptr_BooleanReturn1->; $_Ptr_BooleanReturn2->; $_Ptr_BooleanReturn3->; $_Ptr_BooleanReturn4->)
		: ($_l_InfoNumber=8)  //  Field Propteries
			GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FIeldNumber; $_l_FieldType; $_ptr_LongintReturn2->; $_Ptr_BooleanReturn1->; $_Ptr_BooleanReturn2->; $_Ptr_BooleanReturn3->)
			$0:=$_l_FieldType
		: ($_l_InfoNumber=9) & ($_bo_FieldProperties)  //  Entry Propteries
			GET FIELD ENTRY PROPERTIES:C685($_l_TableNumber; $_l_FIeldNumber; $_ptr_TextReturn->; $_Ptr_BooleanReturn1->; $_Ptr_BooleanReturn2->; $_Ptr_BooleanReturn3->)
			
		: ($_l_InfoNumber=10) & ($_bo_RelationProperties)
			//  relation Propteries
			//GET FIELD ENTRY PROPERTIES($_l_TableNumber;$_l_FIeldNumber;$_ptr_TextReturn->;$_Ptr_BooleanReturn1->;$_Ptr_BooleanReturn2->;$_Ptr_BooleanReturn3->)
			GET RELATION PROPERTIES:C686($_l_TableNumber; $_l_FIeldNumber; $_l_LongintReturn; $_ptr_LongintReturn2->; $_ptr_LongintReturn3->; $_Ptr_BooleanReturn1->; $_Ptr_BooleanReturn2->)
			
			$0:=$_l_LongintReturn  //one table
			
	End case 
	
	
	
	
End if 
