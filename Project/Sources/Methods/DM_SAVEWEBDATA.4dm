//%attributes = {}

If (False:C215)
	//Project Method Name:      DM_SAVEWEBDATA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_SentFieldData; 0)
	ARRAY TEXT:C222($_at_SentFieldNames; 0)
	//ARRAY TEXT(DM_at_FieldData;0;0)
	C_BOOLEAN:C305($_bo_More)
	C_LONGINT:C283($_l_DMRecordCount; $_l_Index; $_l_offset; $_l_RecordCount; $1)
	C_POINTER:C301($2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_SourceName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DM_SAVEWEBDATA")


//THIS METHOD WILL PARSE THE RECEIVED DATA AN PASS IT THE VALIDATION METHODS

$_t_oldMethodName:=ERR_MethodTracker("DM_SAVEWEBDATA")



ARRAY TEXT:C222($_at_SentFieldNames; 0)
ARRAY TEXT:C222($_at_SentFieldData; 0)


If (Count parameters:C259>=4)  //1
	$_l_offset:=0
	$_l_DMRecordCount:=0  //because we know the first row is the field names we can now get them
	ARRAY TEXT:C222(DM_at_FieldData; 0; 0)
	//Size of array($3->);0)
	
	If (BLOB size:C605($2->)>$_l_offset)
		BLOB TO VARIABLE:C533($2->; $_t_SourceName; $_l_offset)
		If (BLOB size:C605($2->)>$_l_offset)
			
			BLOB TO VARIABLE:C533($2->; $_at_SentFieldNames; $_l_offset)
			$_bo_More:=False:C215
			$_l_RecordCount:=1
			Repeat 
				ARRAY TEXT:C222(DM_at_FieldData; $_l_RecordCount; Size of array:C274($3->))
				ARRAY TEXT:C222($_at_SentFieldData; 0)
				If (BLOB size:C605($2->)>$_l_offset)
					BLOB TO VARIABLE:C533($2->; $_at_SentFieldData; $_l_offset)
					
					If (BLOB size:C605($2->)>$_l_offset)
						$_bo_More:=True:C214
					Else 
						$_bo_More:=False:C215
					End if 
					//Now The data is in $SendFieldData we can process this record
					For ($_l_Index; 1; Size of array:C274($_at_SentFieldData))
						DM_at_FieldData{Size of array:C274(DM_at_FieldData)}{$_l_Index}:=$_at_SentFieldData{$_l_Index}
					End for 
					
				End if 
			Until ($_bo_More=False:C215)
		End if 
		//22 `
		//now we have all the data in field blocks
		For ($_l_Index; 1; Size of array:C274(DM_at_FieldData))  //26
			Case of   //27
				: ($1=Table:C252(->[DIARY:12]))
					Case of   //28
						: (Count parameters:C259>=4)
							DM_HandleWebDIAdata(1; $4; $3)
							
							//29
							
							
					End case   //31
					
					//````
			End case   //27
		End for   //26
		
	End if   //19` doc problem
	
	
	
End if   //3
//1
ERR_MethodTrackerReturn("DM_SAVEWEBDATA"; $_t_oldMethodName)