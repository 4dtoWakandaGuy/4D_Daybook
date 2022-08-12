//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_PP_InsertData
	//------------------ Method Notes ------------------
	// This method inserts data into the arrays associated with a transaction we are go
	
	// Parameters
	// Declarations
	// ----------------------------------------------------
	// Project method Amendments
	
	// Nigel Greenlee11/4/2012 17:32 v7.0.0/1
	// Added
	
	// Block of lines added from line 31to line 35
	// Block of lines added from line 37to line 40
	// Edited
	// (1)If (False) ` ----------------------------------------------------(Changed to)End if 
	//------------------ Revision Control ----------------
	//Date Created: 11/4/2012 17:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_RowIndexIDS;0)
	//ARRAY TEXT(CCM_at_PPFields;0)
	//ARRAY TEXT(CCM_at_SubmitData;0)
	C_LONGINT:C283($_l_Column; $_l_ParametersIndex; $_l_Row; $1)
	C_TEXT:C284($_t_Data; $_t_FieldName; $_t_oldMethodName; $2; $3; $4; $5; $6)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_PP_InsertData")

If (Count parameters:C259>=3)
	If ($1>0)
		$_l_Row:=Find in array:C230(CCM_al_RowIndexIDS; $1)
		If ($_l_Row>0)
			For ($_l_ParametersIndex; 2; Count parameters:C259; 2)  // parameters in pairs
				$_t_FieldName:=${$_l_ParametersIndex}
				$_t_Data:=${$_l_ParametersIndex+1}
				$_l_Column:=Find in array:C230(CCM_at_PPFields; $_t_FieldName)
				If ($_l_Column>0)
					CCM_at_SubmitData{$_l_Row}{$_l_Column}:=$_t_Data
					// Note that there is no validation of the data type here
				Else 
					Gen_Alert("There is no field called"+$_t_FieldName)
				End if 
			End for 
		Else 
			Gen_Alert("You are attempting to insert data into an array that does not exist")
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("CCM_PP_InsertData"; $_t_oldMethodName)

//Nigel Greenlee08/05/2012 14:35 v7.0.0/1
//Edited

//Block of lines edited from line 13to line 18
//Block of lines edited from line 22to line 25//(15) (Changed to) // Nigel Greenlee11/4/2012 17:32 v7.0.0/1
//(16)//Block of lines added from line 31to line 35 (Changed to) // Added

//Block of lines edited from line 35to line 38
//Block of lines edited from line 40to line 42//(35)$_t_Data:=${$_l_ParametersIndex+1} (Changed to) For ($_l_ParametersIndex;2;Count parameters;2)  // parameters in pairs
//(38)CCM_at_SubmitData{$_l_Row}{$_l_Column}:=$_t_Data (Changed to) $_l_Column:=Find in array(CCM_at_PPFields;$_t_FieldName)
//(41)Gen_Alert ("There is no field called"+$_t_FieldName) (Changed to) // Note that there is no validation of the data type here
ERR_MethodTrackerReturn("CCM_PP_InsertData"; $_t_oldMethodName)