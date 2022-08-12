//%attributes = {}
If (False:C215)
	//Project Method Name:      Join_SelDV
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
	ARRAY BOOLEAN:C223($_abo_Boolean; 0)
	ARRAY DATE:C224($_ad_Date; 0)
	ARRAY INTEGER:C220($_ai_Integer; 0)
	ARRAY LONGINT:C221($_al_LongInteger; 0)
	ARRAY REAL:C219($_ar_Real; 0)
	ARRAY TEXT:C222($_at_array; 0)
	ARRAY TEXT:C222($_at_text; 0)
	ARRAY TIME:C1223($_ati_Time; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed)
	C_LONGINT:C283($_l_arraySIze; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_FieldType2; $_l_MaxLength; $_l_Parameters; $_l_Process; $_l_Progress; $_l_TableNumber; $_l_Units)
	C_LONGINT:C283($5; $j; $sets)
	C_POINTER:C301($_ptr_Field; $_ptr_FieldPointer2; $_ptr_table; $_ptr_Table2; $1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Join_SelDV")
//Join_SelDV
If (Count parameters:C259>=4)
	$_ptr_Table2:=$3
	$_ptr_table:=$1
	$_ptr_Field:=$2
	$_ptr_FieldPointer2:=$4
	If (Count parameters:C259>=5)
		$_l_MaxLength:=$5
	End if 
	
	$_l_TableNumber:=Table:C252($_ptr_table)
	$_l_FieldNumber:=Field:C253($_ptr_Field)
	$_l_Parameters:=Count parameters:C259
	GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType)
	GET FIELD PROPERTIES:C258($_ptr_FieldPointer2; $_l_FieldType2; $_l_FieldLength; $_bo_FieldIndexed)
	
	If ($_l_FieldType=7)
		//  Join_SelFastSub ($1;$2;$3;$4;Subfile) `Doesn't know the subfile
	Else 
		REDUCE SELECTION:C351($_ptr_Table2->; 0)
		If (Records in selection:C76($_ptr_table->)>0)
			DB_GetRelatedRecords(Table:C252($_ptr_table); Table:C252($_ptr_Table2))
			If (Records in selection:C76($_ptr_Table2->)=0)
				If (($_l_FieldType=8) | ($_l_FieldType=9))
					Join_SelFast($_ptr_table; $_ptr_Field; $_ptr_Table2; $_ptr_FieldPointer2)
				Else 
					Case of 
						: ($_l_FieldType2=0) & ($_l_FieldType=0) & ($_bo_FieldIndexed)  //Alpha Field indexed
							ARRAY TEXT:C222($_at_text; 0)
							SELECTION TO ARRAY:C260($_ptr_Field->; $_at_text)
							QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_at_text)
						: ($_l_FieldType2=2) & ($_l_FieldType=2) & ($_bo_FieldIndexed)  //text Field indexed
							ARRAY TEXT:C222($_at_text; 0)
							SELECTION TO ARRAY:C260($_ptr_Field->; $_at_text)
							QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_at_text)
						: ($_l_FieldType2=1) & ($_l_FieldType=1) & ($_bo_FieldIndexed)  //Real Field indexed
							ARRAY REAL:C219($_ar_Real; 0)
							SELECTION TO ARRAY:C260($_ptr_Field->; $_ar_Real)
							QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_ar_Real)
						: ($_l_FieldType2=8) & ($_l_FieldType=8) & ($_bo_FieldIndexed)  //integer Field indexed
							ARRAY INTEGER:C220($_ai_Integer; 0)
							SELECTION TO ARRAY:C260($_ptr_Field->; $_ai_Integer)
							QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_ai_Integer)
						: ($_l_FieldType2=9) & ($_l_FieldType=9) & ($_bo_FieldIndexed)  //longint Field indexed
							ARRAY LONGINT:C221($_al_LongInteger; 0)
							SELECTION TO ARRAY:C260($_ptr_Field->; $_al_LongInteger)
							QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_al_LongInteger)
						: ($_l_FieldType2=4) & ($_l_FieldType=4) & ($_bo_FieldIndexed)  //date Field indexed
							ARRAY DATE:C224($_ad_Date; 0)
							SELECTION TO ARRAY:C260($_ptr_Field->; $_ad_Date)
							QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_ad_Date)
						: ($_l_FieldType2=6) & ($_l_FieldType=6) & ($_bo_FieldIndexed)  //boolean Field indexed
							ARRAY BOOLEAN:C223($_abo_Boolean; 0)
							SELECTION TO ARRAY:C260($_ptr_Field->; $_abo_Boolean)
							QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_abo_Boolean)
						: ($_l_FieldType2=11) & ($_l_FieldType=11) & ($_bo_FieldIndexed)  //time Field indexed
							ARRAY TIME:C1223($_ati_Time; 0)
							SELECTION TO ARRAY:C260($_ptr_Field->; $_ati_Time)
							QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_ati_Time)
							
							
						Else 
							
							
							$_l_FieldNumber:=Records in selection:C76($_ptr_table->)
							If ($_l_FieldNumber>255)
								$_l_Progress:=Progress2_Start("Linking selections ...")
								If ($_l_Progress>0)
									$_l_Process:=$_l_Progress
								Else 
									$_l_Process:=Current process:C322
								End if 
							End if 
							///
							
							
							
							///
							ARRAY TEXT:C222($_at_array; 0)
							MESSAGES OFF:C175
							DISTINCT VALUES:C339($_ptr_Field->; $_at_array)
							//SELECTION TO ARRAY($2»;$_at_array)
							MESSAGES ON:C181
							$_l_arraySIze:=Size of array:C274($_at_array)
							$_l_Units:=Int:C8($_l_arraySIze/10)
							If ($_l_MaxLength>0)
								For ($_l_TableNumber; 1; $_l_arraySIze)
									$_at_array{$_l_TableNumber}:=Substring:C12($_at_array{$_l_TableNumber}; $_l_MaxLength+1)
								End for 
							End if 
							
							Case of 
								: ($_l_arraySIze=0)
									REDUCE SELECTION:C351($_ptr_Table2->; 0)
								: ($_l_arraySIze=1)
									QUERY:C277($_ptr_Table2->; $_ptr_FieldPointer2->=$_at_array{1})
								Else 
									QUERY WITH ARRAY:C644($_ptr_FieldPointer2->; $_at_array)
									
									
							End case 
							
							
							ARRAY TEXT:C222($_at_array; 0)
					End case 
				End if 
			End if 
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("Join_SelDV"; $_t_oldMethodName)