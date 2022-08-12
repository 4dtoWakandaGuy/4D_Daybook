//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_AN_INSERTDATA
	//------------------ Method Notes ------------------
	//This method will put additional data into a transaction for AN prior to us submitting it to them.. this emulates the way it was done in the deep sky plug in
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 15:49`Method: CCM_AN_INSERTDATA
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CCM_al_RowIndexIDS;0)
	//ARRAY TEXT(CCM_at_ANFields;0)
	//ARRAY TEXT(CCM_at_SubmitData;0)
	C_LONGINT:C283($_l_Column; $_l_ParameterIndex; $_l_Row; $1)
	C_TEXT:C284($_t_FieldData; $_t_FieldName; $_t_oldMethodName; $2; $3; $4; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_AN_INSERTDATA")
If (Count parameters:C259>=3)
	If ($1>0)
		$_l_Row:=Find in array:C230(CCM_al_RowIndexIDS; $1)
		If ($_l_Row>0)
			For ($_l_ParameterIndex; 2; Count parameters:C259; 2)  //parameters in pairs
				$_t_FieldName:=${$_l_ParameterIndex}
				$_t_FieldData:=${$_l_ParameterIndex+1}
				$_l_Column:=Find in array:C230(CCM_at_ANFields; $_t_FieldName)
				If ($_l_Column>0)
					CCM_at_SubmitData{$_l_Row}{$_l_Column}:=$_t_FieldData
					//Note that there is no validation of the data type here
				Else 
					Gen_Alert("There is no field called"+$_t_FieldName)
				End if 
			End for 
		Else 
			Gen_Alert("You are attempting to insert data into an array that does not exist")
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("CCM_AN_INSERTDATA"; $_t_oldMethodName)