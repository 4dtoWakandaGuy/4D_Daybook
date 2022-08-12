//%attributes = {}
If (False:C215)
	//Project Method Name:      Project_SelFast
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/04/2011 20:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_aBo_BooleanValues; 0)
	ARRAY DATE:C224($_ad_DateValues; 0)
	ARRAY INTEGER:C220($_ai_IntegerValues; 0)
	ARRAY LONGINT:C221($_al_LongintValues; 0)
	ARRAY REAL:C219($_ar_RealValues; 0)
	ARRAY TEXT:C222($_at_TextValues; 0)
	ARRAY TIME:C1223($_ati_TimeValues; 0)
	C_BOOLEAN:C305($_bo_AutoMany; $_bo_AutoOne)
	C_LONGINT:C283($_l_ArraySize; $_l_ChoiceField; $_l_FIeldNumber; $_l_FieldType; $_l_OneField; $_l_OneTable; $_l_TableNumber)
	C_POINTER:C301($_ptr_MasterRelatedField; $_ptr_MasterSetTable; $_Ptr_SourceKeyFie; $_Ptr_SourceKeyField; $_ptr_SourceTable; $1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Project_SelFast")
$_ptr_SourceTable:=$1
$_Ptr_SourceKeyField:=$2
$_ptr_MasterSetTable:=$3
$_ptr_MasterRelatedField:=$4
$_l_TableNumber:=Table:C252($_ptr_MasterSetTable)
$_l_FIeldNumber:=Field:C253($_ptr_MasterRelatedField)
GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FIeldNumber; $_l_FieldType)
$_l_FIeldNumber:=Records in selection:C76($_ptr_SourceTable->)
If ($_l_FIeldNumber>0)
	If ($_l_FIeldNumber>1)
		
		
		GET RELATION PROPERTIES:C686($_ptr_MasterRelatedField; $_l_OneTable; $_l_OneField; $_l_ChoiceField; $_bo_AutoOne; $_bo_AutoMany)
		If ($_l_OneTable#Table:C252($_ptr_SourceTable))
			//The relation does not exist
			GET FIELD PROPERTIES:C258($_Ptr_SourceKeyField; $_l_FieldType)
			
			Case of 
				: ($_l_FieldType=Is alpha field:K8:1) | ($_l_FieldType=Is text:K8:3)
					ARRAY TEXT:C222($_at_TextValues; 0)
					SELECTION TO ARRAY:C260($_Ptr_SourceKeyField->; $_at_TextValues)
					QUERY WITH ARRAY:C644($_ptr_MasterRelatedField->; $_at_TextValues)
				: ($_l_FieldType=Is longint:K8:6) | ($_l_FieldType=Is integer 64 bits:K8:25)
					ARRAY LONGINT:C221($_al_LongintValues; 0)
					SELECTION TO ARRAY:C260($_Ptr_SourceKeyField->; $_al_LongintValues)
					QUERY WITH ARRAY:C644($_ptr_MasterRelatedField->; $_al_LongintValues)
				: ($_l_FieldType=Is integer:K8:5) | ($_l_FieldType=Is integer:K8:5)
					ARRAY INTEGER:C220($_ai_IntegerValues; 0)
					SELECTION TO ARRAY:C260($_Ptr_SourceKeyField->; $_ai_IntegerValues)
					QUERY WITH ARRAY:C644($_ptr_MasterRelatedField->; $_ai_IntegerValues)
				: ($_l_FieldType=Is real:K8:4)
					ARRAY REAL:C219($_ar_RealValues; 0)
					
					SELECTION TO ARRAY:C260($_Ptr_SourceKeyField->; $_ar_RealValues)
					QUERY WITH ARRAY:C644($_ptr_MasterRelatedField->; $_ar_RealValues)
					
				: ($_l_FieldType=Is date:K8:7)
					ARRAY DATE:C224($_ad_DateValues; 0)
					SELECTION TO ARRAY:C260($_Ptr_SourceKeyField->; $_ad_DateValues)
					QUERY WITH ARRAY:C644($_ptr_MasterRelatedField->; $_ad_DateValues)
				: ($_l_FieldType=Is time:K8:8)
					ARRAY TIME:C1223($_ati_TimeValues; 0)
					SELECTION TO ARRAY:C260($_Ptr_SourceKeyField->; $_ati_TimeValues)
					QUERY WITH ARRAY:C644($_ptr_MasterRelatedField->; $_ati_TimeValues)
				: ($_l_FieldType=Is boolean:K8:9)
					ARRAY BOOLEAN:C223($_aBo_BooleanValues; 0)
					SELECTION TO ARRAY:C260($_Ptr_SourceKeyField->; $_aBo_BooleanValues)
					QUERY WITH ARRAY:C644($_ptr_MasterRelatedField->; $_aBo_BooleanValues)
			End case 
			
		Else 
			RELATE MANY SELECTION:C340($_ptr_MasterRelatedField->)
		End if 
		//GET FIELD RELATION ( manyField ; one ; many {; *} )
		
		
		
	Else 
		
		QUERY:C277($_ptr_MasterSetTable->; $_ptr_MasterRelatedField->=$_Ptr_SourceKeyField->)
	End if 
Else 
	REDUCE SELECTION:C351($_ptr_MasterSetTable->; 0)
End if 

ERR_MethodTrackerReturn("Project_SelFast"; $_t_oldMethodName)
