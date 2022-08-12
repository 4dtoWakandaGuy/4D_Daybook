//%attributes = {}
If (False:C215)
	//Project Method Name:      QR_GetFieldName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/08/2014 22:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY TEXT:C222($_at_TableNames; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharacterPosition2; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_TableNumber)
	C_POINTER:C301($_ptr_FieldPointer; $1)
	C_TEXT:C284($_t_Country; $_t_CountyLabel; $_t_FieldName; $_t_oldMethodName; $_t_PostalCodeLabel; $_t_TableName; $_t_TaxTermLabel; $_t_TownorCityLabel; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QR_GetFieldName")

ARRAY TEXT:C222($_at_TableNames; 0)
ARRAY LONGINT:C221($_al_TableNumbers; 0)

$_t_Country:=DB_GetOrganisationCountry
$_t_TaxTermLabel:=DB_GetTranslatedTerminology(Table:C252(->[ACCOUNTS:32]); "Sales & Use Tax Codes")
Case of 
	: ($_t_Country="U.S.A") | ($_t_Country="USA")
		$_t_CountyLabel:="State"
		$_t_TownorCityLabel:="City"
		$_t_PostalCodeLabel:="Zip"
		$_t_TaxTermLabel:="TAX"
		
		
	Else 
		$_t_CountyLabel:="County"
		$_t_TownorCityLabel:="Town"
		$_t_PostalCodeLabel:="Post Code"
		$_t_TaxTermLabel:="VAT"
		
		
End case 

$_l_TableNumber:=Table:C252($1)
$_l_FieldNumber:=Field:C253($1)




If (Is table number valid:C999($_l_TableNumber))
	$_t_TableName:=Table name:C256($_l_TableNumber)
	$_t_TableName:=Replace string:C233($_t_TableName; "_"; " ")
	$_l_CharacterPosition:=Position:C15("TAX "; $_t_TableName)
	If ($_l_CharacterPosition>0)
		$_t_TableName:=Replace string:C233($_t_TableName; "TAX"; $_t_TaxTermLabel+" ")
	End if 
	//APPEND TO ARRAY($_at_TableNames;$_t_TableName)
	//APPEND TO ARRAY($_al_TableNumbers;$_l_TableNumber)
	//ARRAY TEXT($aFieldNames;0)
	//ARRAY LONGINT($aFieldNumbers;0)
	If ($_l_TableNumber=15)
		
	End if 
	
	If (Is field number valid:C1000($_l_TableNumber; $_l_FieldNumber))
		$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldNumber)
		GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
		$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_FieldNumber)
		If (Position:C15("longi"; $_t_FieldName)>0)
			
		End if 
		
		If (Not:C34($_bo_FieldInvisible))
			
			If ($_t_FieldName[[1]]="X") & ($_t_FieldName[[2]]="_")
				$_t_FieldName:=Substring:C12($_t_FieldName; 3)
			End if 
			$_t_FieldName:=Replace string:C233($_t_FieldName; "_"; " ")
			
			
			$_l_CharacterPosition:=Position:C15("County"; $_t_FieldName)
			$_l_CharacterPosition2:=Position:C15("County"; $_t_FieldName)
			If ($_l_CharacterPosition>0)
				If ($_t_FieldName#"County")
					$_t_FieldName:=Replace string:C233($_t_FieldName; "County"; "CXC")
					$_t_FieldName:=Replace string:C233($_t_FieldName; "State"; "")
					$_t_FieldName:=Replace string:C233($_t_FieldName; "or"; "")
					$_t_FieldName:=Replace string:C233($_t_FieldName; "CXC"; $_t_CountyLabel)
				Else 
					$_t_FieldName:=Replace string:C233($_t_FieldName; "County"; $_t_CountyLabel)
				End if 
			End if 
			
			
			$_l_CharacterPosition:=Position:C15("Town"; $_t_FieldName)
			$_l_CharacterPosition2:=Position:C15("City"; $_t_FieldName)
			If ($_l_CharacterPosition>0)
				If ($_t_FieldName#"TOWN")
					If ($_l_CharacterPosition2>0)
						$_t_FieldName:=Replace string:C233($_t_FieldName; "city"; "CXC")
						$_t_FieldName:=Replace string:C233($_t_FieldName; "town"; "")
					Else 
						$_t_FieldName:=Replace string:C233($_t_FieldName; "town"; "CXC")
					End if 
					$_t_FieldName:=Replace string:C233($_t_FieldName; "or"; "")
					$_t_FieldName:=Replace string:C233($_t_FieldName; "CXC"; $_t_TownorCityLabel)
				Else 
					$_t_FieldName:=Replace string:C233($_t_FieldName; "Town"; $_t_TownorCityLabel)
				End if 
			End if 
			
			$_t_FieldName:=Replace string:C233($_t_FieldName; "TAX "; $_t_TaxTermLabel+" ")
			$_t_FieldName:=Replace string:C233($_t_FieldName; " TAX"; " "+$_t_TaxTermLabel)
			
			$_t_FieldName:=Replace string:C233($_t_FieldName; "Postal Code"; $_t_PostalCodeLabel)
			$_t_FieldName:=Replace string:C233($_t_FieldName; "PostCode"; $_t_PostalCodeLabel)
			Repeat 
				If ($_t_FieldName[[Length:C16($_t_FieldName)]]=" ")
					$_t_FieldName:=Substring:C12($_t_FieldName; 1; Length:C16($_t_FieldName)-1)
				End if 
			Until (($_t_FieldName[[Length:C16($_t_FieldName)]])#" ")
			Repeat 
				If ($_t_FieldName[[1]]=" ")
					$_t_FieldName:=Substring:C12($_t_FieldName; 2)
				End if 
			Until (($_t_FieldName[[1]])#" ")
		End if 
		//APPEND TO ARRAY($aFieldNames;$_t_FieldName)
		//APPEND TO ARRAY($aFIeldNumbers;$_l_FieldNumber)
	End if 
	$0:=$_t_FieldName
	
	//SORT ARRAY($aFieldNames;$aFIeldNumbers)
	//SET FIELD TITLES(Table($_l_TableNumber)->;$aFieldNames;$aFIeldNumbers;*)
End if 


SORT ARRAY:C229($_at_TableNames; $_al_TableNumbers)
SET TABLE TITLES:C601($_at_TableNames; $_al_TableNumbers; *)
ERR_MethodTrackerReturn("QR_GetFieldName"; $_t_oldMethodName)