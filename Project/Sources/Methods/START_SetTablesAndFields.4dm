//%attributes = {}
If (False:C215)
	//Project Method Name:      START_SetTablesAndFields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2014 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_TableNumbers; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_TableNames; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_Undo; $1)
	C_LONGINT:C283($_l_CityPosition; $_l_FIeldIndex; $_l_FieldLength; $_l_FieldType; $_l_TableIndex; $_l_TownPosition)
	C_POINTER:C301($_ptr_FieldPointer)
	C_TEXT:C284($_t_Country; $_t_County; $_t_FieldName; $_t_oldMethodName; $_t_PostalCode; $_t_TableName; $_t_TaxTerminology; $_t_TownorCity)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("START_SetTablesAndFields")


ARRAY TEXT:C222($_at_TableNames; 0)
ARRAY LONGINT:C221($_al_TableNumbers; 0)
$_bo_Undo:=False:C215
If (Count parameters:C259>=1)
	$_bo_Undo:=$1
End if 
$_t_Country:=DB_GetOrganisationCountry
$_t_TaxTerminology:=DB_GetTranslatedTerminology(Table:C252(->[ACCOUNTS:32]); "Sales & Use Tax Codes")
Case of 
	: ($_t_Country="U.S.A") | ($_t_Country="USA")
		$_t_County:="State"
		$_t_TownorCity:="City"
		$_t_PostalCode:="Zip"
		$_t_TaxTerminology:="TAX"
		
		
	Else 
		$_t_County:="County"
		$_t_TownorCity:="Town"
		$_t_PostalCode:="Post Code"
		$_t_TaxTerminology:="VAT"
		
		
End case 



For ($_l_TableIndex; 1; Get last table number:C254)
	
	If (Is table number valid:C999($_l_TableIndex))
		$_t_TableName:=Table name:C256($_l_TableIndex)
		If (Not:C34($_bo_Undo))
			$_t_TableName:=Replace string:C233($_t_TableName; "_"; " ")
			
			$_l_TownPosition:=Position:C15("TAX "; $_t_TableName)
			If ($_l_TownPosition>0)
				$_t_TableName:=Replace string:C233($_t_TableName; "TAX"; $_t_TaxTerminology+" ")
			End if 
		End if 
		APPEND TO ARRAY:C911($_at_TableNames; $_t_TableName)
		APPEND TO ARRAY:C911($_al_TableNumbers; $_l_TableIndex)
		ARRAY TEXT:C222($_at_FieldNames; 0)
		ARRAY LONGINT:C221($_al_FieldNumbers; 0)
		If ($_l_TableIndex=15)
			
		End if 
		For ($_l_FIeldIndex; 1; Get last field number:C255($_l_TableIndex))
			If (Is field number valid:C1000($_l_TableIndex; $_l_FIeldIndex))
				$_ptr_FieldPointer:=Field:C253($_l_TableIndex; $_l_FIeldIndex)
				GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				$_t_FieldName:=Field name:C257($_l_TableIndex; $_l_FIeldIndex)
				If (Position:C15("longi"; $_t_FieldName)>0)
					
				End if 
				
				If (Not:C34($_bo_FieldInvisible))
					If (Not:C34($_bo_Undo))
						If ($_t_FieldName[[1]]="X") & ($_t_FieldName[[2]]="_")
							$_t_FieldName:=Substring:C12($_t_FieldName; 3)
						End if 
						$_t_FieldName:=Replace string:C233($_t_FieldName; "_"; " ")
						
						
						$_l_TownPosition:=Position:C15("County"; $_t_FieldName)
						$_l_CityPosition:=Position:C15("County"; $_t_FieldName)
						If ($_l_TownPosition>0)
							If ($_t_FieldName#"County")
								$_t_FieldName:=Replace string:C233($_t_FieldName; "County"; "CXC")
								$_t_FieldName:=Replace string:C233($_t_FieldName; "State"; "")
								$_t_FieldName:=Replace string:C233($_t_FieldName; "or"; "")
								$_t_FieldName:=Replace string:C233($_t_FieldName; "CXC"; $_t_County)
							Else 
								$_t_FieldName:=Replace string:C233($_t_FieldName; "County"; $_t_County)
							End if 
						End if 
						
						
						$_l_TownPosition:=Position:C15("Town"; $_t_FieldName)
						$_l_CityPosition:=Position:C15("City"; $_t_FieldName)
						If ($_l_TownPosition>0)
							If ($_t_FieldName#"TOWN")
								If ($_l_CityPosition>0)
									$_t_FieldName:=Replace string:C233($_t_FieldName; "city"; "CXC")
									$_t_FieldName:=Replace string:C233($_t_FieldName; "town"; "")
								Else 
									$_t_FieldName:=Replace string:C233($_t_FieldName; "town"; "CXC")
								End if 
								$_t_FieldName:=Replace string:C233($_t_FieldName; "or"; "")
								$_t_FieldName:=Replace string:C233($_t_FieldName; "CXC"; $_t_TownorCity)
							Else 
								$_t_FieldName:=Replace string:C233($_t_FieldName; "Town"; $_t_TownorCity)
							End if 
						End if 
						
						$_t_FieldName:=Replace string:C233($_t_FieldName; "TAX "; $_t_TaxTerminology+" ")
						$_t_FieldName:=Replace string:C233($_t_FieldName; " TAX"; " "+$_t_TaxTerminology)
						
						$_t_FieldName:=Replace string:C233($_t_FieldName; "Postal Code"; $_t_PostalCode)
						$_t_FieldName:=Replace string:C233($_t_FieldName; "PostCode"; $_t_PostalCode)
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
				End if 
				APPEND TO ARRAY:C911($_at_FieldNames; $_t_FieldName)
				APPEND TO ARRAY:C911($_al_FieldNumbers; $_l_FIeldIndex)
			End if 
			
		End for 
		SORT ARRAY:C229($_at_FieldNames; $_al_FieldNumbers)
		SET FIELD TITLES:C602(Table:C252($_l_TableIndex)->; $_at_FieldNames; $_al_FieldNumbers; *)
	End if 
	
End for 
SORT ARRAY:C229($_at_TableNames; $_al_TableNumbers)
SET TABLE TITLES:C601($_at_TableNames; $_al_TableNumbers; *)
ERR_MethodTrackerReturn("START_SetTablesAndFields"; $_t_oldMethodName)